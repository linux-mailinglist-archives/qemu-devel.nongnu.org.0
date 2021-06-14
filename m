Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9950B3A702C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:21:35 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lst5S-0002tr-MR
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3S-0000Zc-N9; Mon, 14 Jun 2021 16:19:30 -0400
Received: from mout.gmx.net ([212.227.17.20]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lst3Q-0008Pr-Gn; Mon, 14 Jun 2021 16:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623701954;
 bh=HjhYv27Yc1iGJfdXqReonBAeugYYlc1E5JsgqVHcBwc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gQGT6/WJk9O9oERxgPkRVLu7Kk7yjO8CKdE32xrWanegTsEN75HiQU0Pf0wRGzGFg
 pLoybkmqwG01+5ukUPybdqR8mY8qZaSlWSkYU7JdddmCQgEtGfaXvJeZW880n9r8Lo
 MjycxYxDtYGKgD17z8gLHTTaCWabPSkHalVZZ0Dg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N0XD2-1l5J8o1Q1s-00wVco; Mon, 14
 Jun 2021 22:19:14 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>
Subject: [PATCH v3 1/2] hw/nvme: namespace parameter for EUI-64
Date: Mon, 14 Jun 2021 22:19:00 +0200
Message-Id: <20210614201901.17871-2-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210614201901.17871-1-xypron.glpk@gmx.de>
References: <20210614201901.17871-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u+/i30LAmUcN6WXx1XRa/xvaYhB3es61zcXPLLsDjgP2oPrLTAs
 wNlS/+QM6YRjuikW0laDh2ePhuIafvNGjwEuXpX+oPy8zPd64kSO6dsI8uuGgZL+PHTNZpf
 93YgACopBPXPogYDMXCIRqS+gu6fzYrTU78vkeqUZXl4slQbD5jBoDBigxPj7Iho0qQkuq7
 IMaYRWApSworGbQSwf/Ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nc2awnlzvDo=:kf7GAkfvx3S5XEs1HJSHWa
 HN4IcdLOeLnJMCIIBty1lcSvAad37LQw7dnkZS+o3UO3TByEpiNYtd52WwmUdvxzsLZIfOD21
 ghcz7IJi/ZqkCjs97GhTqpDwajCXMNqJ1Dz3mbRNgIlzM768ekMdAHDj0oWN+lLnMtVtl8Iyw
 zC16BZTZUe7pBw7OOn/p0u8JJxrTkcjTDyuwcaLOQhTHnzfAgG/I3/PFP59AFw90CFztXEA2W
 ylspJ1b0CAJiSkXOfp3Fcgv9e6zstIM99JTWApYQH7V7QdD6IasUqECf/0rSBkYTMF+MCVYGw
 2Sz1WzFHqMEx/e8cB7OR63nRoBY6KdHVfjJtH8g7J1NnOiVadKx1Gtx4oFF4TLUXw5S/lvASI
 tLIz0ruwoErKCQ8mMPM63JfQhjWinkDcj7RbmUtTyK5/UY3i22ts5d/twbgXSnVbbyiPBeBwf
 IkMMgWZ0MmkgjYIFIGhVGfN73ZVv2a0FZCHh+PaZjGc0uKZybU2EmxMS3nUs0DGsTqNSi4CXA
 3ZQw/VLM09QrACScs+qK6yorboVfQFHKANhKiA04zzETND/8ILYGnhpII20NqIdjCzOBl7kpi
 Eu1jA568bkBpqBrZID4ZtFOADtlpKb2BSyUaVfDaF/FOubdc3YD30nGduAGwcDjKtqpLTySJj
 aHp2wyfc7hAWs7sjDHlJaEq1plriaO1eEDSCQ0geI4H1krbXnV14X03dXbtdfiFqUf6GLGxIY
 LjBD2sn3On6dgOIC3OALRwkLZaVOkbtCyMGbNlJn6LVHAKNlu1PBir6v0aRewF5i3O9grhQlB
 Anjq1BR88wB0YrfUQJF14dnUCT3S4rWaQBg4H6rXJ47xeg0gn0fHYMD9HO0repsGDvhcBQvWZ
 AO4zBD5HWtoe750GZ+FqWaJ6M/0XN206kjh6yMfyrceDl8/bwTsTETGoLz5T9A8A6oYN8eLvI
 +gQqD3dXoWkd/D69syNS60IazF/HhXh0SXqH9YFgQHVqv0L5ZdlE1Pmq7rhSH422HB/YboOvM
 8jz0uwEggpAYBx0V48oHcnt4W8j3Jhq2sx4HIGLDMPhic9Dk8EI0vkblQDO+YP9BCMORtsjsZ
 649vth/iwqhfYY3WJxkVdU/CLSBxKhKGuVY
Received-SPF: pass client-ip=212.227.17.20; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-devel@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI-64.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
=2D--
v3:
	no change
v2:
	fix typo %s/EUI64/EUI-64/
=2D--
 docs/system/nvme.rst |  4 +++
 hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
 hw/nvme/ns.c         |  2 ++
 hw/nvme/nvme.h       |  1 +
 4 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index f7f63d6bf6..b5f8288d7c 100644
=2D-- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -81,6 +81,10 @@ There are a number of parameters available:
   Set the UUID of the namespace. This will be reported as a "Namespace UU=
ID"
   descriptor in the Namespace Identification Descriptor List.

+``eui64``
+  Set the EUI-64 of the namespace. This will be reported as a "IEEE Exten=
ded
+  Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
+
 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used =
to
   attach the namespace to a specific ``nvme`` device (identified by an ``=
id``
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8dd9cb2ccb..f37c4fd635 100644
=2D-- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4436,19 +4436,19 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
     uint32_t nsid =3D le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
-
-    struct data {
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v[NVME_NIDL_UUID];
-        } uuid;
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v;
-        } csi;
-    };
-
-    struct data *ns_descrs =3D (struct data *)list;
+    uint8_t *pos =3D list;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v[NVME_NIDL_UUID];
+    } QEMU_PACKED uuid;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint64_t v;
+    } QEMU_PACKED eui64;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v;
+    } QEMU_PACKED csi;

     trace_pci_nvme_identify_ns_descr_list(nsid);

@@ -4462,17 +4462,29 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
     }

     /*
-     * Because the NGUID and EUI64 fields are 0 in the Identify Namespace=
 data
-     * structure, a Namespace UUID (nidt =3D 3h) must be reported in the
-     * Namespace Identification Descriptor. Add the namespace UUID here.
+     * If the EUI-64 field is 0 and the NGUID field is 0, the namespace m=
ust
+     * provide a valid Namespace UUID in the Namespace Identification Des=
criptor
+     * data structure. QEMU does not yet support setting NGUID.
      */
-    ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
-    ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
-    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
-
-    ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
-    ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
-    ns_descrs->csi.v =3D ns->csi;
+    uuid.hdr.nidt =3D NVME_NIDT_UUID;
+    uuid.hdr.nidl =3D NVME_NIDL_UUID;
+    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+    memcpy(pos, &uuid, sizeof(uuid));
+    pos +=3D sizeof(uuid);
+
+    if (ns->params.eui64) {
+        eui64.hdr.nidt =3D NVME_NIDT_EUI64;
+        eui64.hdr.nidl =3D NVME_NIDL_EUI64;
+        eui64.v =3D cpu_to_be64(ns->params.eui64);
+        memcpy(pos, &eui64, sizeof(eui64));
+        pos +=3D sizeof(eui64);
+    }
+
+    csi.hdr.nidt =3D NVME_NIDT_CSI;
+    csi.hdr.nidl =3D NVME_NIDL_CSI;
+    csi.v =3D ns->csi;
+    memcpy(pos, &csi, sizeof(csi));
+    pos +=3D sizeof(csi);

     return nvme_c2h(n, list, sizeof(list), req);
 }
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3fec9c6273..45e457de6a 100644
=2D-- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
     id_ns->msrc =3D ns->params.msrc;
+    id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);

     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
     ms =3D ns->params.ms;
@@ -511,6 +512,7 @@ static Property nvme_ns_props[] =3D {
     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 93a7e0e538..ac90e13d7b 100644
=2D-- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
     bool     shared;
     uint32_t nsid;
     QemuUUID uuid;
+    uint64_t eui64;

     uint16_t ms;
     uint8_t  mset;
=2D-
2.30.2


