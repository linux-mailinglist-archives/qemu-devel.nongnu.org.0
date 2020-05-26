Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA41A9318
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 08:19:08 +0200 (CEST)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jObO7-0006K9-Br
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 02:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOaz1-0002rq-74
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOayz-0002rL-WF
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:11 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47586)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOayw-0002bG-Gq; Wed, 15 Apr 2020 01:53:06 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id A2633BFDC7;
 Wed, 15 Apr 2020 05:52:31 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 37/48] nvme: add nvme_check_rw helper
Date: Wed, 15 Apr 2020 07:51:29 +0200
Message-Id: <20200415055140.466900-38-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c123be10fd0d..ffc49985321b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -651,6 +651,25 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *n=
, uint64_t slba,
     return NVME_SUCCESS;
 }
=20
+static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns =3D req->ns;
+    size_t len =3D req->nlb << nvme_ns_lbads(ns);
+    uint16_t status;
+
+    status =3D nvme_check_mdts(n, len, req);
+    if (status) {
+        return status;
+    }
+
+    status =3D nvme_check_bounds(n, req->slba, req->nlb, req);
+    if (status) {
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_rw_cb(NvmeRequest *req, void *opaque)
 {
     NvmeSQueue *sq =3D req->sq;
@@ -810,12 +829,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *re=
q)
     trace_nvme_dev_rw(nvme_req_is_write(req) ? "write" : "read", req->nl=
b,
                       req->nlb << nvme_ns_lbads(req->ns), req->slba);
=20
-    status =3D nvme_check_mdts(n, len, req);
-    if (status) {
-        goto invalid;
-    }
-
-    status =3D nvme_check_bounds(n, req->slba, req->nlb, req);
+    status =3D nvme_check_rw(n, req);
     if (status) {
         goto invalid;
     }
--=20
2.26.0


