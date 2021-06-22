Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF813B07E8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:49:07 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhi6-0002D5-LA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvhhJ-0001MP-J1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:48:17 -0400
Received: from mx12.kaspersky-labs.com ([91.103.66.155]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvhhG-0001FQ-S4
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:48:16 -0400
Received: from relay12.kaspersky-labs.com (unknown [127.0.0.10])
 by relay12.kaspersky-labs.com (Postfix) with ESMTP id E700475D1C;
 Tue, 22 Jun 2021 17:48:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202102; t=1624373283;
 bh=CIlULtbrFp6FbzQ5A+jSFLM6eN2BQaEUQiMtpeuCvtk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=7Pq6iS1WwncQmMN8vvZgBPk2lE43oE+rr7Qk0BCjyXTnS1ZZbpr7lbCO9DowBVz2z
 HZ1xAR3nPN6SXfhzBvW8NibyFFnHicmuDT6A7qsVnz9Gqa9Yb+AviIjrU1iItNUpyE
 f9B75rO6PRiKcYQ9e214G5TVjloCOjeBuZtD01SwzgR5MzR/BcYS6ET9q5wnqeFHkx
 2d29rwadV6xwOGNzsk2Pbz6m6MtqqaV7C0rhrieHfPkcne0SuKiw58IIs//iOeyK26
 bq2Gxzor59Xcyq9Wc7K8SA6f3+urnj1abcXnnO1KLx4PTGntZ1BHGYRYTPmkg1p5gE
 1K/EHXlqYnxIQ==
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 8D24075D21;
 Tue, 22 Jun 2021 17:48:02 +0300 (MSK)
Received: from arseniy-pc.avp.ru (10.64.68.128) by hqmailmbx3.avp.ru
 (10.64.67.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 22
 Jun 2021 17:48:02 +0300
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: <sgarzare@redhat.com>, <arseny.krasnov@kaspersky.com>, <oxffffaa@gmail.com>
Subject: [PATCH v3] vhost-vsock: SOCK_SEQPACKET feature bit support
Date: Tue, 22 Jun 2021 17:47:47 +0300
Message-ID: <20210622144747.2949134-1-arseny.krasnov@kaspersky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.68.128]
X-ClientProxiedBy: hqmailmbx1.avp.ru (10.64.67.241) To hqmailmbx3.avp.ru
 (10.64.67.243)
X-KSE-ServerInfo: hqmailmbx3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/22/2021 14:26:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164541 [Jun 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: arseny.krasnov@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: arseniy-pc.avp.ru:7.1.1; kaspersky.com:7.1.1;
 127.0.0.199:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/22/2021 14:29:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.06.2021 12:16:00
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KLMS-Rule-ID: 52
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2021/06/22 08:28:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2021/06/22 05:48:00 #16781513
X-KLMS-AntiVirus-Status: Clean, skipped
Received-SPF: pass client-ip=91.103.66.155;
 envelope-from=Arseny.Krasnov@kaspersky.com; helo=mx12.kaspersky-labs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
negotiates it with vhost, thus both will know that SOCK_SEQPACKET
supported by peer.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 hw/virtio/vhost-vsock.c                       | 12 ++++++++++--
 include/standard-headers/linux/virtio_vsock.h |  3 +++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index c8f0699b4f..e6339747b3 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -20,6 +20,11 @@
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
 
+const int feature_bits[] = {
+    VIRTIO_VSOCK_F_SEQPACKET,
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vhost_vsock_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostVSock *vsock = VHOST_VSOCK(vdev);
@@ -107,8 +112,11 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    return vhost_get_features(&vvc->vhost_dev, feature_bits,
+                                requested_features);
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index be443211ce..5eac522ee2 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -38,6 +38,9 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_config.h"
 
+/* The feature bitmap for virtio vsock */
+#define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET supported */
+
 struct virtio_vsock_config {
 	uint64_t guest_cid;
 } QEMU_PACKED;
-- 
2.25.1


