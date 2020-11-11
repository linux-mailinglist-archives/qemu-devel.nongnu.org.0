Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B72AF1EA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:20:01 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq2a-0004l2-Re
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpv1-0006tJ-TI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpv0-0002By-1O
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qF+MAzyFctk1dpZM1XrBLzLNo0t5v/fqTXkbfkxrVuo=;
 b=ivBGZK2V5s2Yo+pfM+QZuhX7E8mQIaBpx/fbkp8TfODBs0N2sJMFL+JAC05geLkoijJPlp
 hv1evoGDa1msYvMfuN8vfg+If16/qC7EcG0L6L0H5yDqrvc6rIXxfUiDd8mSxV8KOQeYP7
 NceYNdKXpyXvRWPuRTRCyDxwBultgDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-eeeXiN3BMnSq9cndSWP9AA-1; Wed, 11 Nov 2020 08:12:07 -0500
X-MC-Unique: eeeXiN3BMnSq9cndSWP9AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 127171882FB3;
 Wed, 11 Nov 2020 13:12:06 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 735A855760;
 Wed, 11 Nov 2020 13:12:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/17] net/colo-compare.c: Fix compare_timeout format issue
Date: Wed, 11 Nov 2020 21:11:32 +0800
Message-Id: <1605100301-11317-9-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This parameter need compare with the return of qemu_clock_get_ms(),
it is uint64_t. So we need fix this issue here.

Fixes: 9cc43c94b31 ("net/colo-compare.c: Expose "compare_timeout" to users")

Reported-by: Derek Su <dereksu@qnap.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 8d476bb..76b83a9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -120,7 +120,7 @@ struct CompareState {
     SendCo out_sendco;
     SendCo notify_sendco;
     bool vnet_hdr;
-    uint32_t compare_timeout;
+    uint64_t compare_timeout;
     uint32_t expired_scan_cycle;
 
     /*
@@ -1076,9 +1076,9 @@ static void compare_get_timeout(Object *obj, Visitor *v,
                                 Error **errp)
 {
     CompareState *s = COLO_COMPARE(obj);
-    uint32_t value = s->compare_timeout;
+    uint64_t value = s->compare_timeout;
 
-    visit_type_uint32(v, name, &value, errp);
+    visit_type_uint64(v, name, &value, errp);
 }
 
 static void compare_set_timeout(Object *obj, Visitor *v,
@@ -1141,9 +1141,9 @@ static void set_max_queue_size(Object *obj, Visitor *v,
                                Error **errp)
 {
     Error *local_err = NULL;
-    uint32_t value;
+    uint64_t value;
 
-    visit_type_uint32(v, name, &value, &local_err);
+    visit_type_uint64(v, name, &value, &local_err);
     if (local_err) {
         goto out;
     }
@@ -1391,7 +1391,7 @@ static void colo_compare_init(Object *obj)
     object_property_add_str(obj, "notify_dev",
                             compare_get_notify_dev, compare_set_notify_dev);
 
-    object_property_add(obj, "compare_timeout", "uint32",
+    object_property_add(obj, "compare_timeout", "uint64",
                         compare_get_timeout,
                         compare_set_timeout, NULL, NULL);
 
-- 
2.7.4


