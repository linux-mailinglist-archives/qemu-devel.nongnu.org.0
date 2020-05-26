Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFC1A930D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 08:16:58 +0200 (CEST)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jObM1-0003HT-NM
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 02:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOaz2-0002uO-6H
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOaz0-0002s0-LX
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:12 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47578)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOayw-0002aj-4p; Wed, 15 Apr 2020 01:53:06 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 23845BFDAD;
 Wed, 15 Apr 2020 05:52:30 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 33/48] nvme: be consistent about zeros vs zeroes
Date: Wed, 15 Apr 2020 07:51:25 +0200
Message-Id: <20200415055140.466900-34-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415055140.466900-1-its@irrelevant.dk>
References: <20200415055140.466900-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The spec in general uses 'zeroes' and not 'zeros'.

Now, according to the Oxford dictionary, 'zeroes' is the action of
zeroing something, i.e. "he zeroes the range" and 'zeros' is the plural
of zero. Thus, Write Zeroes should actually be called Write Zeros, but
alas, let us align with the spec.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 block/nvme.c         | 4 ++--
 hw/block/nvme.c      | 8 ++++----
 include/block/nvme.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 7302cc19ade4..304e975e0270 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -465,7 +465,7 @@ static void nvme_identify(BlockDriverState *bs, int n=
amespace, Error **errp)
                           s->page_size / sizeof(uint64_t) * s->page_size=
);
=20
     oncs =3D le16_to_cpu(idctrl->oncs);
-    s->supports_write_zeroes =3D !!(oncs & NVME_ONCS_WRITE_ZEROS);
+    s->supports_write_zeroes =3D !!(oncs & NVME_ONCS_WRITE_ZEROES);
     s->supports_discard =3D !!(oncs & NVME_ONCS_DSM);
=20
     memset(resp, 0, 4096);
@@ -1119,7 +1119,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(Block=
DriverState *bs,
     }
=20
     NvmeCmd cmd =3D {
-        .opcode =3D NVME_CMD_WRITE_ZEROS,
+        .opcode =3D NVME_CMD_WRITE_ZEROES,
         .nsid =3D cpu_to_le32(s->nsid),
         .cdw10 =3D cpu_to_le32((offset >> s->blkshift) & 0xFFFFFFFF),
         .cdw11 =3D cpu_to_le32(((offset >> s->blkshift) >> 32) & 0xFFFFF=
FFF),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d8edd071b261..94d42046149e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -564,7 +564,7 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace=
 *ns, NvmeCmd *cmd,
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd=
 *cmd,
+static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeNamespace *ns, NvmeCm=
d *cmd,
     NvmeRequest *req)
 {
     NvmeRwCmd *rw =3D (NvmeRwCmd *)cmd;
@@ -662,8 +662,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
     switch (cmd->opcode) {
     case NVME_CMD_FLUSH:
         return nvme_flush(n, ns, cmd, req);
-    case NVME_CMD_WRITE_ZEROS:
-        return nvme_write_zeros(n, ns, cmd, req);
+    case NVME_CMD_WRITE_ZEROES:
+        return nvme_write_zeroes(n, ns, cmd, req);
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
         return nvme_rw(n, ns, cmd, req);
@@ -2086,7 +2086,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->sqes =3D (0x6 << 4) | 0x6;
     id->cqes =3D (0x4 << 4) | 0x4;
     id->nn =3D cpu_to_le32(n->num_namespaces);
-    id->oncs =3D cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP=
);
+    id->oncs =3D cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAM=
P);
=20
     pstrcpy((char *) id->subnqn, sizeof(id->subnqn), "nqn.2019-08.org.qe=
mu:");
     pstrcat((char *) id->subnqn, sizeof(id->subnqn), n->params.serial);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 88e5385a9d3f..c4c669e32fc4 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -287,7 +287,7 @@ enum NvmeIoCommands {
     NVME_CMD_READ               =3D 0x02,
     NVME_CMD_WRITE_UNCOR        =3D 0x04,
     NVME_CMD_COMPARE            =3D 0x05,
-    NVME_CMD_WRITE_ZEROS        =3D 0x08,
+    NVME_CMD_WRITE_ZEROES       =3D 0x08,
     NVME_CMD_DSM                =3D 0x09,
 };
=20
@@ -665,7 +665,7 @@ enum NvmeIdCtrlOncs {
     NVME_ONCS_COMPARE       =3D 1 << 0,
     NVME_ONCS_WRITE_UNCORR  =3D 1 << 1,
     NVME_ONCS_DSM           =3D 1 << 2,
-    NVME_ONCS_WRITE_ZEROS   =3D 1 << 3,
+    NVME_ONCS_WRITE_ZEROES  =3D 1 << 3,
     NVME_ONCS_FEATURES      =3D 1 << 4,
     NVME_ONCS_RESRVATIONS   =3D 1 << 5,
     NVME_ONCS_TIMESTAMP     =3D 1 << 6,
--=20
2.26.0


