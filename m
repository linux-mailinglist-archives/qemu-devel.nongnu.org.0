Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F723303D0
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:10:20 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIxr9-0000I2-8C
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lIxp2-0007bs-KW
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:08:10 -0500
Received: from mx13.kaspersky-labs.com ([91.103.66.164]:52940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lIxoy-0001lR-Tu
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:08:08 -0500
Received: from relay13.kaspersky-labs.com (unknown [127.0.0.10])
 by relay13.kaspersky-labs.com (Postfix) with ESMTP id CB1EF5212FD;
 Sun,  7 Mar 2021 21:07:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202102; t=1615140471;
 bh=9NEh81ppzJ6BAefxXpIv4ZU6Wf/xKkDuUjSSSqUUbC4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=wyv1gBdpUOIX3bFO8DcL5X8M8F/7A4kVHLMpfHsoxzHwG5G04y/NMTfUcLyHb+7xm
 FTcZuLHEphoBV2Dxoz8U163AQGEK/aeuYLPAuB++ReWp7pc1VaA8UqJPui4hRjqDHE
 +81ZIDSiwlRG7nwlYc2AJoAW95DrZAhZ6HLvMzD2lRQPmz7RwRKQ0uaB9F6CYqwtfv
 NZfIR4cQSl32Z48Wnyqcq0Hs3Ky+kl0NDSIMXzq2Z9XljOxzBH7aLIZP/mBpnUtqmr
 tXWAp7QZ0DfaprHxB4xdaMbaJdwFBZ4EhYdSVY0QrWMFMDaEq+NPm6DScPupQBwv/2
 2XBgrGemJr71A==
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 521765212BF;
 Sun,  7 Mar 2021 21:07:51 +0300 (MSK)
Received: from arseniy-pc.avp.ru (10.64.68.128) by hqmailmbx3.avp.ru
 (10.64.67.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 7 Mar
 2021 21:07:50 +0300
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <arseny.krasnov@kaspersky.com>, <oxffffaa@gmail.com>,
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH] vhost-vsock: SOCK_SEQPACKET feature bit support
Date: Sun, 7 Mar 2021 21:07:36 +0300
Message-ID: <20210307180736.3467825-1-arseny.krasnov@kaspersky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.68.128]
X-ClientProxiedBy: hqmailmbx3.avp.ru (10.64.67.243) To hqmailmbx3.avp.ru
 (10.64.67.243)
X-KSE-ServerInfo: hqmailmbx3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 03/07/2021 17:55:05
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 162254 [Mar 07 2021]
X-KSE-AntiSpam-Info: LuaCore: 431 431 6af1f0c9661e70e28927a654c0fea10ff13ade05
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: arseny.krasnov@kaspersky.com
X-KSE-AntiSpam-Info: {Prob_from_in_msgid}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Macro_CONTENT_TYPE_ENCODING_NOT_JAPANESE}
X-KSE-AntiSpam-Info: {Macro_CONTENT_TYPE_ENCODING_NOT_RUS}
X-KSE-AntiSpam-Info: {Macro_CONTENT_TYPE_MISSED}
X-KSE-AntiSpam-Info: {Macro_DATE_DOUBLE_SPACE}
X-KSE-AntiSpam-Info: {Macro_DATE_MOSCOW}
X-KSE-AntiSpam-Info: {Macro_FROM_DOUBLE_ENG_NAME}
X-KSE-AntiSpam-Info: {Macro_FROM_LOWCAPS_DOUBLE_ENG_NAME_IN_EMAIL}
X-KSE-AntiSpam-Info: {Macro_FROM_NOT_RU}
X-KSE-AntiSpam-Info: {Macro_FROM_NOT_RUS_CHARSET}
X-KSE-AntiSpam-Info: {Macro_FROM_REAL_NAME_MATCHES_ALL_USERNAME_PROB}
X-KSE-AntiSpam-Info: {Macro_HEADERS_NOT_LIST}
X-KSE-AntiSpam-Info: {Macro_MAILER_OTHER}
X-KSE-AntiSpam-Info: {Macro_MISC_X_PRIORITY_MISSED}
X-KSE-AntiSpam-Info: {Macro_NO_DKIM}
X-KSE-AntiSpam-Info: {Macro_REPLY_TO_MISSED}
X-KSE-AntiSpam-Info: {Macro_SUBJECT_AT_LEAST_2_WORDS}
X-KSE-AntiSpam-Info: {Macro_SUBJECT_LONG_TEXT}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; kaspersky.com:7.1.1; arseniy-pc.avp.ru:7.1.1
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/07/2021 17:57:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 07.03.2021 15:50:00
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KLMS-Rule-ID: 52
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2021/03/07 17:11:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2021/03/07 15:50:00 #16360637
X-KLMS-AntiVirus-Status: Clean, skipped
Received-SPF: pass client-ip=91.103.66.164;
 envelope-from=Arseny.Krasnov@kaspersky.com; helo=mx13.kaspersky-labs.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds processing of VIRTIO_VSOCK_F_SEQPACKET feature bit. Guest
negotiates it with vhost, thus both will know that SOCK_SEQPACKET
supported by peer.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 hw/virtio/vhost-vsock.c                       | 16 +++++++++++++++-
 include/standard-headers/linux/virtio_vsock.h |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index c8f0699b4f..06eb73f086 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -107,10 +107,23 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    /* No feature bits used yet */
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    if (vvc->vhost_dev.features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET)) {
+        requested_features |= (1ULL << VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
     return requested_features;
 }
 
+static void vhost_vsock_set_features(VirtIODevice *vdev, uint64_t features)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    const VhostOps *vhost_ops = vvc->vhost_dev.vhost_ops;
+
+    vhost_ops->vhost_set_features(&vvc->vhost_dev, features);
+}
+
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
     .name = "virtio-vhost_vsock",
     .minimum_version_id = VHOST_VSOCK_SAVEVM_VERSION,
@@ -214,6 +227,7 @@ static void vhost_vsock_class_init(ObjectClass *klass, void *data)
     vdc->realize = vhost_vsock_device_realize;
     vdc->unrealize = vhost_vsock_device_unrealize;
     vdc->get_features = vhost_vsock_get_features;
+    vdc->set_features = vhost_vsock_set_features;
     vdc->get_config = vhost_vsock_get_config;
     vdc->set_status = vhost_vsock_set_status;
 }
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index be443211ce..e0d7db4328 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -38,6 +38,9 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_config.h"
 
+/* The feature bitmap for virtio vsock */
+#define VIRTIO_VSOCK_F_SEQPACKET       0       /* SOCK_SEQPACKET supported */
+
 struct virtio_vsock_config {
 	uint64_t guest_cid;
 } QEMU_PACKED;
-- 
2.25.1


