Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB71FA93C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 08:55:35 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5VO-0005VV-4b
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 02:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5MK-0001XR-71
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49239
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5MI-0005Zm-Jk
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592289970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=IrRHq6c/PBljh/hY/OA4vCzS6LmOXYyyOlamB2myE30=;
 b=LSkd9uZ89vXKSX589N6AQCyhH5mRHMv9rixZnHPlUKvpkzEceldPc7MyzeU1AhdoDzHrpA
 DaYDLOgetGCSE/e0ek+hgHuxHFN4UgabXizoLek/q5zl9f9j0zOzWxhLG8pIvYXPeP2FKU
 Q6PKrqU4Fte84rwZAjYX091me7kIhgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-kTnDtF6sMLe25DlcvXPsKg-1; Tue, 16 Jun 2020 02:46:07 -0400
X-MC-Unique: kTnDtF6sMLe25DlcvXPsKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4178118585A1;
 Tue, 16 Jun 2020 06:46:06 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD1A8202D;
 Tue, 16 Jun 2020 06:46:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/33] virtio-net: add migration support for RSS and hash report
Date: Tue, 16 Jun 2020 14:45:17 +0800
Message-Id: <1592289944-13727-7-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

Save and restore RSS/hash report configuration.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6ff3cc3..2a5da29 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2777,6 +2777,13 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
         }
     }
 
+    if (n->rss_data.enabled) {
+        trace_virtio_net_rss_enable(n->rss_data.hash_types,
+                                    n->rss_data.indirections_len,
+                                    sizeof(n->rss_data.key));
+    } else {
+        trace_virtio_net_rss_disable();
+    }
     return 0;
 }
 
@@ -2954,6 +2961,32 @@ static const VMStateDescription vmstate_virtio_net_has_vnet = {
     },
 };
 
+static bool virtio_net_rss_needed(void *opaque)
+{
+    return VIRTIO_NET(opaque)->rss_data.enabled;
+}
+
+static const VMStateDescription vmstate_virtio_net_rss = {
+    .name      = "virtio-net-device/rss",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = virtio_net_rss_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(rss_data.enabled, VirtIONet),
+        VMSTATE_BOOL(rss_data.redirect, VirtIONet),
+        VMSTATE_BOOL(rss_data.populate_hash, VirtIONet),
+        VMSTATE_UINT32(rss_data.hash_types, VirtIONet),
+        VMSTATE_UINT16(rss_data.indirections_len, VirtIONet),
+        VMSTATE_UINT16(rss_data.default_queue, VirtIONet),
+        VMSTATE_UINT8_ARRAY(rss_data.key, VirtIONet,
+                            VIRTIO_NET_RSS_MAX_KEY_SIZE),
+        VMSTATE_VARRAY_UINT16_ALLOC(rss_data.indirections_table, VirtIONet,
+                                    rss_data.indirections_len, 0,
+                                    vmstate_info_uint16, uint16_t),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_virtio_net_device = {
     .name = "virtio-net-device",
     .version_id = VIRTIO_NET_VM_VERSION,
@@ -3004,6 +3037,10 @@ static const VMStateDescription vmstate_virtio_net_device = {
                             has_ctrl_guest_offloads),
         VMSTATE_END_OF_LIST()
    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_virtio_net_rss,
+        NULL
+    }
 };
 
 static NetClientInfo net_virtio_info = {
-- 
2.5.0


