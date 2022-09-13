Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953115B6B6E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:13:01 +0200 (CEST)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2ua-0007Rk-Mn
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oY2sU-0005wH-Iv
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oY2sS-0002lp-OQ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663063848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bGI0+ilnDQLjyddWzSMLvKpl9AwuAItOQ2fV85MCokU=;
 b=O5dXEI9q4Thad0AkboYLNO8oqbduL458MtR6NwxjavD4FXiPUYyHxqp+xMpDg3t2XD0Ic7
 cv+2qioVl4j9bLKluyHWLuG3JM5FsnMTdE6yktTctzkk0lt6yfqBpAOzA8DiRwv6FctY2b
 h+3x06C7108P2W57mCTDD08adXnc9Gc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-j4OU1qaRPc6vr36qyIMWhg-1; Tue, 13 Sep 2022 06:10:46 -0400
X-MC-Unique: j4OU1qaRPc6vr36qyIMWhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EBC31010369
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 10:10:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1487540C6EC2;
 Tue, 13 Sep 2022 10:10:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: [PATCH] hmp: Fix ordering of text
Date: Tue, 13 Sep 2022 11:10:41 +0100
Message-Id: <20220913101041.99869-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fix the ordering of the help text so it's always after the commands
being defined.  A few had got out of order.  Keep 'info' at the end.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands.hx | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 182e639d14..8ab8000acd 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1742,23 +1742,6 @@ SRST
   *icount* for the reference may be observed with ``info replay`` command.
 ERST
 
-    {
-        .name       = "info",
-        .args_type  = "item:s?",
-        .params     = "[subcommand]",
-        .help       = "show various information about the system state",
-        .cmd        = hmp_info_help,
-        .sub_table  = hmp_info_cmds,
-        .flags      = "p",
-    },
-
-SRST
-``calc_dirty_rate`` *second*
-  Start a round of dirty rate measurement with the period specified in *second*.
-  The result of the dirty rate measurement may be observed with ``info
-  dirty_rate`` command.
-ERST
-
     {
         .name       = "calc_dirty_rate",
         .args_type  = "dirty_ring:-r,dirty_bitmap:-b,second:l,sample_pages_per_GB:l?",
@@ -1770,10 +1753,10 @@ ERST
     },
 
 SRST
-``set_vcpu_dirty_limit``
-  Set dirty page rate limit on virtual CPU, the information about all the
-  virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
-  command.
+``calc_dirty_rate`` *second*
+  Start a round of dirty rate measurement with the period specified in *second*.
+  The result of the dirty rate measurement may be observed with ``info
+  dirty_rate`` command.
 ERST
 
     {
@@ -1786,8 +1769,8 @@ ERST
     },
 
 SRST
-``cancel_vcpu_dirty_limit``
-  Cancel dirty page rate limit on virtual CPU, the information about all the
+``set_vcpu_dirty_limit``
+  Set dirty page rate limit on virtual CPU, the information about all the
   virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
   command.
 ERST
@@ -1800,3 +1783,20 @@ ERST
                       "\n\t\t\t\t\t limit on a specified virtual cpu",
         .cmd        = hmp_cancel_vcpu_dirty_limit,
     },
+
+SRST
+``cancel_vcpu_dirty_limit``
+  Cancel dirty page rate limit on virtual CPU, the information about all the
+  virtual CPU dirty limit status can be observed with ``info vcpu_dirty_limit``
+  command.
+ERST
+
+    {
+        .name       = "info",
+        .args_type  = "item:s?",
+        .params     = "[subcommand]",
+        .help       = "show various information about the system state",
+        .cmd        = hmp_info_help,
+        .sub_table  = hmp_info_cmds,
+        .flags      = "p",
+    },
-- 
2.37.3


