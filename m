Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C752D2AF1FB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:22:40 +0100 (CET)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq59-0008NU-Ng
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpv5-00073w-PE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpv4-0002DA-3a
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=CCBnQxSPNmWrzyAXDox3vQPolmJ77+1UKIkYeXOFivc=;
 b=LLR5UI+jwlwUyJIC95SaEVBc4pJrZ1X1b2s6TqiFEWA79td4BcCOs38SVe4zQsaonFdiN1
 6wxLR+tdk0R8wLKctlnYKonsMSL5dgHGiaWmoxU+8utfeuW0TIM80E+aSCjplltLZXGj/c
 0qZtq2DGerWyma3axwvckUNJUbGBScM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-CAaVCbX3M4i9Oh8Xvo82qQ-1; Wed, 11 Nov 2020 08:12:11 -0500
X-MC-Unique: CAaVCbX3M4i9Oh8Xvo82qQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E161087D7C;
 Wed, 11 Nov 2020 13:12:10 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B036855760;
 Wed, 11 Nov 2020 13:12:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 10/17] net/colo-compare.c: Add secondary old packet detection
Date: Wed, 11 Nov 2020 21:11:34 +0800
Message-Id: <1605100301-11317-11-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Detect queued secondary packet to sync VM state in time.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 1263203..0c87fd9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -636,19 +636,26 @@ void colo_compare_unregister_notifier(Notifier *notify)
 static int colo_old_packet_check_one_conn(Connection *conn,
                                           CompareState *s)
 {
-    GList *result = NULL;
-
-    result = g_queue_find_custom(&conn->primary_list,
-                                 &s->compare_timeout,
-                                 (GCompareFunc)colo_old_packet_check_one);
+    if (!g_queue_is_empty(&conn->primary_list)) {
+        if (g_queue_find_custom(&conn->primary_list,
+                                &s->compare_timeout,
+                                (GCompareFunc)colo_old_packet_check_one))
+            goto out;
+    }
 
-    if (result) {
-        /* Do checkpoint will flush old packet */
-        colo_compare_inconsistency_notify(s);
-        return 0;
+    if (!g_queue_is_empty(&conn->secondary_list)) {
+        if (g_queue_find_custom(&conn->secondary_list,
+                                &s->compare_timeout,
+                                (GCompareFunc)colo_old_packet_check_one))
+            goto out;
     }
 
     return 1;
+
+out:
+    /* Do checkpoint will flush old packet */
+    colo_compare_inconsistency_notify(s);
+    return 0;
 }
 
 /*
-- 
2.7.4


