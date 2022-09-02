Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4F5AA871
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 09:02:07 +0200 (CEST)
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0go-0008EI-B5
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 03:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0Nk-0007Tf-Mg
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0Nh-0004sW-A4
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9saPVCh8T4IehUtQlv1O2OGfG92vvOC962JAEJaw0kg=;
 b=QEcf8vl2Ln2Z6+XlUDsZFmxTvJ3bic7UBZwDO4OV/SAFojaYSc5uaWQnNHLPlhMRAmx5K8
 TRNU3j8j3+ii9L9AsnzyDH13otW7QaBk+nQ4LRIZM5W5WSJD1RQnJKA0is3Nma34kZ9NcZ
 5cv4EQMpLP5kFVWx/nCNIrUsI1hhFXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-2nhEZQ5QPsiiR-Iun5PYAg-1; Fri, 02 Sep 2022 02:42:17 -0400
X-MC-Unique: 2nhEZQ5QPsiiR-Iun5PYAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886AF2919EB3;
 Fri,  2 Sep 2022 06:42:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5481415137;
 Fri,  2 Sep 2022 06:42:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 11/21] vhost: Do not depend on !NULL VirtQueueElement on
 vhost_svq_flush
Date: Fri,  2 Sep 2022 14:41:28 +0800
Message-Id: <20220902064138.56468-12-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

Since QEMU will be able to inject new elements on CVQ to restore the
state, we need not to depend on a VirtQueueElement to know if a new
element has been used by the device or not. Instead of check that, check
if there are new elements only using used idx on vhost_svq_flush.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8df5296..e8e5bbc 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -499,17 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
 {
     int64_t start_us = g_get_monotonic_time();
+    uint32_t len;
+
     do {
-        uint32_t len;
-        VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-        if (elem) {
-            return len;
+        if (vhost_svq_more_used(svq)) {
+            break;
         }
 
         if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
             return 0;
         }
     } while (true);
+
+    vhost_svq_get_buf(svq, &len);
+    return len;
 }
 
 /**
-- 
2.7.4


