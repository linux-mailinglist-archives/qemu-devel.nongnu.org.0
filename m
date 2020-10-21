Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B782B2953D2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 23:04:28 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVLHX-0003u5-PW
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 17:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLB2-0005hj-3c
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAx-0006iS-BF
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603313857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xB+pW8wMlRiDeT88aB17Knd4JTsxOyNUrcHOEWW+0Ws=;
 b=fSy2OgmHUdJuqIjK47lSZQoHHR1hsrIpIUu1b0Ts13ar8QVI1Z7zgi4+8gWtrcKeMau9xO
 IR3gbTTXi+teRxOSKCD8Rlr+XQbu0dNbrtZRqObFidrNkzn9kv8wUDMvQNFvjAy1rZYzru
 h27l2W87ZhCFfzlKJK2iLD4Tmr7Ijh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-y3KvK72wPGu7IwKAyxJ-Nw-1; Wed, 21 Oct 2020 16:57:35 -0400
X-MC-Unique: y3KvK72wPGu7IwKAyxJ-Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401B91005E77
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 20:57:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C326F6EF62;
 Wed, 21 Oct 2020 20:57:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] vl: move CHECKPOINT_INIT after preconfig
Date: Wed, 21 Oct 2020 16:57:14 -0400
Message-Id: <20201021205716.2359430-21-pbonzini@redhat.com>
In-Reply-To: <20201021205716.2359430-1-pbonzini@redhat.com>
References: <20201021205716.2359430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jsnow@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move CHECKPOINT_INIT right before the machine initialization is
completed.  Everything before is essentially an extension of
command line parsing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0a6f47e7d6..e9391929f6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3194,6 +3194,11 @@ void qemu_finish_machine_init(void)
         exit(1);
     }
 
+    /* This checkpoint is required by replay to separate prior clock
+       reading from the other reads, because timer polling functions query
+       clock values from the log. */
+    replay_checkpoint(CHECKPOINT_INIT);
+
     machine_run_board_init(current_machine);
 
     /*
@@ -4424,11 +4429,6 @@ void qemu_init(int argc, char **argv, char **envp)
     if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
         exit(1);
 
-    /* This checkpoint is required by replay to separate prior clock
-       reading from the other reads, because timer polling functions query
-       clock values from the log. */
-    replay_checkpoint(CHECKPOINT_INIT);
-
     current_machine->boot_order = boot_order;
 
     /* parse features once if machine provides default cpu_type */
-- 
2.26.2



