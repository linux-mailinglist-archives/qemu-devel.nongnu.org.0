Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28781870CE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:02:08 +0100 (CET)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDt7v-0004kw-QN
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqlb-0000cN-Dk
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqlZ-00074U-Q1
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:55 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDqlQ-0003sJ-V0; Mon, 16 Mar 2020 10:30:45 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 34A52BFA96;
 Mon, 16 Mar 2020 14:29:54 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 37/42] nvme: refactor identify active namespace id list
Date: Mon, 16 Mar 2020 07:29:23 -0700
Message-Id: <20200316142928.153431-38-its@irrelevant.dk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316142928.153431-1-its@irrelevant.dk>
References: <20200316142928.153431-1-its@irrelevant.dk>
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prepare to support inactive namespaces.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b89b96990f52..bf9fb500842a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1505,16 +1505,16 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n,=
 NvmeIdentify *c,
     uint32_t min_nsid =3D le32_to_cpu(c->nsid);
     uint32_t *list;
     uint16_t ret;
-    int i, j =3D 0;
+    int j =3D 0;
=20
     trace_nvme_dev_identify_nslist(min_nsid);
=20
     list =3D g_malloc0(data_len);
-    for (i =3D 0; i < n->num_namespaces; i++) {
-        if (i < min_nsid) {
+    for (int i =3D 1; i <=3D n->num_namespaces; i++) {
+        if (i <=3D min_nsid) {
             continue;
         }
-        list[j++] =3D cpu_to_le32(i + 1);
+        list[j++] =3D cpu_to_le32(i);
         if (j =3D=3D data_len / sizeof(uint32_t)) {
             break;
         }
--=20
2.25.1


