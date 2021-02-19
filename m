Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0431F91F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:13:24 +0100 (CET)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4ex-0007gM-LR
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WO-0007MQ-PX
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WM-0001zm-CN
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQXV9bdm8mCY6Q1k2zWVI0Esa0ws70XsLAjsKpmIQ1g=;
 b=O4G29J9GlxwvULCo/EKMevHWkUrhqK6KXd6XBEus/tM9h0gRD70Johl+C02iCKiA+lzeTj
 DQQz5GBfmif7xUuO7Kfzrmzmg4m6VfoF3ZZ8AU3m1rF8pzkmRmVcGkwaTW6V65g1+Af5MS
 PFEp6eQzE8R8Kjm9It0hX+5zfpPunsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-_8hyuRafMRGEEGIb1na0hw-1; Fri, 19 Feb 2021 07:04:27 -0500
X-MC-Unique: _8hyuRafMRGEEGIb1na0hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 729E1107ACE8;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4287D63B8C;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F1CC1132BCE; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/18] qapi/introspect.py: Always define all 'extra' dict keys
Date: Fri, 19 Feb 2021 13:04:12 +0100
Message-Id: <20210219120422.600850-9-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This mimics how a typed object works, where 'if' and 'comment' are
always set, regardless of if they have a value set or not.

It is safe to do this because of the way that _tree_to_qlit processes
these values (using dict.get with a default of None), resulting in no
change of output from _tree_to_qlit. There are no other users of this
data.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-9-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index c4326d42cb..88af5383d5 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -27,11 +27,10 @@
 
 
 def _make_tree(obj, ifcond, comment=None):
-    extra = {}
-    if ifcond:
-        extra['if'] = ifcond
-    if comment:
-        extra['comment'] = comment
+    extra = {
+        'if': ifcond,
+        'comment': comment
+    }
     return (obj, extra)
 
 
-- 
2.26.2


