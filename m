Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9C2D34CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:05:31 +0100 (CET)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkAs-0007qK-Mr
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDx-0002R0-RK; Tue, 08 Dec 2020 15:04:37 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDv-000629-Iv; Tue, 08 Dec 2020 15:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458849; x=1638994849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zkUdrCfjJq4A0ejq53u0yiqE5z8aP+1Lipkloowanw=;
 b=rF4c9GXZdcG1w2UAIkeLxnOin3KXTYAA1b+okyuxfB7end+qU+cMwgD7
 5ToUnP6NVwi9tk5XrkmRILVWXA9MigI6x0HAfZUNk8mJVE8VwrrJoQ6xm
 GyyKj4o8AzBzz9pV0QdvTcd1eBT9PhAjxOrxKzuUnhsQ0+tZWm/nwnjfH
 eLFe+qx5EXIgoRMk4g7KrY1v6CZ+bcQ5b51kjKklfJN4HXElEe5jhJ/Eo
 hOad5t39tRM8T360QSnVRGnSZWfwvSm/se8bodZIs9zCcCLXoUVb0oQE4
 +VIr6w6GmsMl8KAOkhTR7fRkJOSwY4RQ/XP60Iaj4uEA2FID6ScV3tcqi Q==;
IronPort-SDR: XI3YJkJnygOTsWzJJ5d0kc/TIh4Fzzsh6cLxV3pcuT4E1W+DUtkFXJulDCsfErrXaYHZhImXxd
 eL9L6GCfqYPM3lhgRUxOlrSjEcceia0OAmWvIohNH5jTsBiWn95Sn6UXBCx2KNxM6AwOtoJDOI
 Ag0x8Q7n7NwzYYGaMVUvoitLu+q8OIArO6vSrYAdT+kjNy5UYFJWJ+c7jnvJZ94D0p6zFbDWOR
 E+9m8ReBWuzxEioBUSGGH3rJkGEiGDV6dqu94nHEl3pQ3vjRgG6490qnQiWFHEM1UF7BZW/8Iw
 TgU=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433460"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:40 +0800
IronPort-SDR: ThQHFExGLNtUVcJaIgalxUuYRQdlM5siBYztQ5v1I/QSfxuQ0mSR2P+YlicyPnVB1DvRn38ErN
 gYECzIZLjL2FTOEzZ336FQ4/F77U+DCk0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:30 -0800
IronPort-SDR: R8d887QAVYE6J1eLgZNwbgE8yaa3gAV9hGFwSVbcCJIswSJQYuxE39GEbqW1G3AhlElQ52psYr
 APZ9r9ZZ228A==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:28 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 07/13] hw/block/nvme: Support allocated CNS command
 variants
Date: Wed,  9 Dec 2020 05:04:04 +0900
Message-Id: <20201208200410.27900-8-dmitry.fomichev@wdc.com>
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Many CNS commands have "allocated" command variants. These include
a namespace as long as it is allocated, that is a namespace is
included regardless if it is active (attached) or not.

While these commands are optional (they are mandatory for controllers
supporting the namespace attachment command), our QEMU implementation
is more complete by actually providing support for these CNS values.

However, since our QEMU model currently does not support the namespace
attachment command, these new allocated CNS commands will return the
same result as the active CNS command variants.

The reason for not hooking up this command completely is because the
NVMe specification requires the namespace management command to be
supported if the namespace attachment command is supported.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 include/block/nvme.h | 20 ++++++++++++--------
 hw/block/nvme.c      |  8 ++++++++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 890977db4b..29d826ab19 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -807,14 +807,18 @@ typedef struct QEMU_PACKED NvmePSD {
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
 enum NvmeIdCns {
-    NVME_ID_CNS_NS                = 0x00,
-    NVME_ID_CNS_CTRL              = 0x01,
-    NVME_ID_CNS_NS_ACTIVE_LIST    = 0x02,
-    NVME_ID_CNS_NS_DESCR_LIST     = 0x03,
-    NVME_ID_CNS_CS_NS             = 0x05,
-    NVME_ID_CNS_CS_CTRL           = 0x06,
-    NVME_ID_CNS_CS_NS_ACTIVE_LIST = 0x07,
-    NVME_ID_CNS_IO_COMMAND_SET    = 0x1c,
+    NVME_ID_CNS_NS                    = 0x00,
+    NVME_ID_CNS_CTRL                  = 0x01,
+    NVME_ID_CNS_NS_ACTIVE_LIST        = 0x02,
+    NVME_ID_CNS_NS_DESCR_LIST         = 0x03,
+    NVME_ID_CNS_CS_NS                 = 0x05,
+    NVME_ID_CNS_CS_CTRL               = 0x06,
+    NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
+    NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
+    NVME_ID_CNS_NS_PRESENT            = 0x11,
+    NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
+    NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
+    NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
 };
 
 typedef struct QEMU_PACKED NvmeIdCtrl {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 16eed37533..7035896649 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1901,16 +1901,24 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
     switch (le32_to_cpu(c->cns)) {
     case NVME_ID_CNS_NS:
+         /* fall through */
+    case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req);
     case NVME_ID_CNS_CS_NS:
+         /* fall through */
+    case NVME_ID_CNS_CS_NS_PRESENT:
         return nvme_identify_ns_csi(n, req);
     case NVME_ID_CNS_CTRL:
         return nvme_identify_ctrl(n, req);
     case NVME_ID_CNS_CS_CTRL:
         return nvme_identify_ctrl_csi(n, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
+         /* fall through */
+    case NVME_ID_CNS_NS_PRESENT_LIST:
         return nvme_identify_nslist(n, req);
     case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
+         /* fall through */
+    case NVME_ID_CNS_CS_NS_PRESENT_LIST:
         return nvme_identify_nslist_csi(n, req);
     case NVME_ID_CNS_NS_DESCR_LIST:
         return nvme_identify_ns_descr_list(n, req);
-- 
2.28.0


