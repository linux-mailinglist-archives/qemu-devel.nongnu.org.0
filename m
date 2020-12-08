Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5795B2D350E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:21:53 +0100 (CET)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkQ4-0005D5-L6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDr-0002Ga-6r; Tue, 08 Dec 2020 15:04:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDp-00063N-4K; Tue, 08 Dec 2020 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458839; x=1638994839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieXWxlmMiIpuZg8igJhMo3iCP4Zg9qx00ZOT4/8XGT4=;
 b=N1oafuPWGkuK0ASsKOWtOZSIvm4gsB6BW52ddHP4WhftxnDiBvXKIARo
 cq+UfmiPqeOfMRvErflE1GF6L1uolJ6ajUANNGyoJj6M8smHOX5YbbjZB
 edjWPLwSF2m1RmVcfTV+/pnRVStkJOMrCRFxGhbNdeMkvqjMMulXeM3cL
 RqRaKjM9T3luhQOxF857d5xuE/c6KHBYI70dJaLpffbMmBYnL8pAN13EX
 2nET4g2fe2jwb+ajPyED6O/cq5ae1gzmonJSJk5O6jV+0NEWrRC5h+9AE
 UPw9sSLgLEfHJa/lQHHwqRfH3mDakGyeON9JTHXnXZFXrj64lOB7UzFnw w==;
IronPort-SDR: ovQPYQ/sJB1HWUFGJBExr/BNvtLLnnBN7P2ocIqKm0uPBUzwXNc/2heo+r1hDQ4g1lPFGW1QLQ
 O7eRMYSIrKidpKb3nEASJPdK6akEivhbgGINVaTKj7w4Liqv+HVmGwrAyNzi4iCfXubFWorHY+
 QzfuJ8MkWeZE+0kGKZHoSct0VyKMnnogMdFKwZ63FyR0L3YoaWnWTXtmBBAMcuouI/txqalkYK
 YkN09KSrAqVwwfUcuX2RKfXV1EBY9dN1jcsn9H2XYfFI5AZJ5C7scg9BekP1C72RmTqRvOy5Qj
 B4w=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433445"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:22 +0800
IronPort-SDR: 54btB6mII4N9VP/QHDDz7YlHm8/028CwHS6UBMrsBqt7uFe9SFlHH8q60JjZ7yRrci/7G4dA9Y
 ohkWmHx1J/nPR4z9kTWp/xctbvaJXpvcs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:18 -0800
IronPort-SDR: JuvUoaiz8+DhCwkNYoD1vxd8/PUUAEsnYflsBmzx9XUecLxIEQAqMNc45goYjCCpuKJd8e6DMv
 Qm8wfMB0oSPw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:16 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 02/13] hw/block/nvme: Generate namespace UUIDs
Date: Wed,  9 Dec 2020 05:03:59 +0900
Message-Id: <20201208200410.27900-3-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In NVMe 1.4, a namespace must report an ID descriptor of UUID type
if it doesn't support EUI64 or NGUID. Add a new namespace property,
"uuid", that provides the user the option to either specify the UUID
explicitly or have a UUID generated automatically every time a
namespace is initialized.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme-ns.h | 1 +
 hw/block/nvme-ns.c | 1 +
 hw/block/nvme.c    | 9 +++++----
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index ed3d7e65d5..aeca810fc7 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,7 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    QemuUUID uuid;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 9b95e2ed33..6349aa30be 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -152,6 +152,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 10acb7e7f0..a30fe75620 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1662,6 +1662,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE];
@@ -1681,7 +1682,8 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    if (unlikely(!nvme_ns(n, nsid))) {
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -1690,12 +1692,11 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     /*
      * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
      * structure, a Namespace UUID (nidt = 0x3) must be reported in the
-     * Namespace Identification Descriptor. Add a very basic Namespace UUID
-     * here.
+     * Namespace Identification Descriptor. Add the namespace UUID here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
     ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
-    stl_be_p(&ns_descrs->uuid.v, nsid);
+    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDT_UUID_LEN);
 
     return nvme_dma(n, list, NVME_IDENTIFY_DATA_SIZE,
                     DMA_DIRECTION_FROM_DEVICE, req);
-- 
2.28.0


