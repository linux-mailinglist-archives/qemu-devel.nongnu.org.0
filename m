Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94033A4BAF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:19:02 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrMb-0005r3-HE
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqsG-0006mx-2I; Fri, 11 Jun 2021 19:47:40 -0400
Received: from mout.gmx.net ([212.227.15.19]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqsC-0006Gr-Rg; Fri, 11 Jun 2021 19:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623455242;
 bh=TckBcnluvGI0xnHFdWf6WQQJZQLaxHvdBufay4UL8j0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U4rjtr7bFPK6xg0W3bjNrrKgLnmXmfejP+bdNluJBbdy6jNsDblYUXEfy5nBuYxaT
 PvR4RowNnL95oSQVndpBvGr1LFH/9T1diJVajP4BnbH8SJzzxybYFmOVKFQmvT/ceh
 N/uiPp+FQAhOghYY3YxAUx2zY29vucQ4ILKA7ir8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M7sDg-1lvgMK0bUw-0052qX; Sat, 12
 Jun 2021 01:47:22 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/3] hw/nvme: namespace parameter for EUI-64
Date: Sat, 12 Jun 2021 01:46:30 +0200
Message-Id: <20210611234631.81314-3-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611234631.81314-1-xypron.glpk@gmx.de>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ikaJTrTbwerfsh1W0TiLvneShuKJ+um29MmJDJ0X95a2Gl432a3
 CPMnBzi+I8Glb2KKbCEE6tcgMo8+sXHClq6ttapLixwBYz3PC5RYhgE4jxVQshmLWZNryHL
 eXSsVBg8JZma7djiJawiNDj4ZBLPPABAEb24g8JKJ0U4y9z6N+JXts2rIoIMWGfrG4fQGnl
 3gtwa6BpGP7Mexk3d4QTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/TLvCGgWK98=:D9dzfg/Da/7YgWF3QYaxIg
 Wc3zxG1pC+CMnIN1AObhgVLt4yJusATqh0XtoDe0EPmEimMvGyq7TE6MNzDTkboBS6BTo09Z8
 H+LzAPbCjWb20S0wn2M4ux7tiToIeHsjQEOdl1EbGwTpaFXzXTgdIdQXgM/YE+eiQ7AZh4GQC
 jXlCjnGG6vafqGkdFQT81xSNSRhXNJz2LrmK6vum51RK7UFHaKp1YJ4dir8ZHS0Qmv+JnwRUO
 x74ULdcpKs3V+StIEa/x0bSG2SlTdf8Y69Mh2mmvjUVHmSJT2Q3O0qxkqCRxHPP8VgLNkAGKo
 bp02Mp1BE05/ZDk3bZ1F7I2ILvbh+zA+Y6X1G2GQRtiGF3ubGl1Wl9y9YblPc9v+idXSiGV3Q
 3HOjMr5jmYrEorYDS/BG3RXU+pZS1/QrdAWUjKYmrMQxFgVBN0mpn+P5VXfZOdJ+jt2jMeo+s
 i8e5w79pTIwup8TXW96zsvIyINkx2fU7+nSFMeUNKAQBlRhkHehm7I1IuYBnMJrjjl3jKqLyA
 PtuQHBAGHuHJ1Orn8YmzeD59NJyTl8/XwqW4s4PfznjXqAUeZwXlVFyCw7j3ZC1bLLjc5WaW6
 C6I67vvPCPAK60+unZmqmhkbkev07unWSsPbyAQDWO19jG9yLcXPqwGfq041VB8kbwd/+Qw/f
 FhIMvXnH6fqflH95w74L7D0COhAsPTHijMFAqDJ6pxZuxctxlmMXlWsg6aLDjpgaO3WKKsR8b
 H8FoDV2VDR2s3PhKpWqVePg5Sc0qEv9Eav2BjUEqHJWLWOw7XicdBtNAbbDNIk4xa8g5YDMNp
 O8c9JZaYBGR01ojbFGW2COIu5Gq/1IO7O0VXehG/qn0roiUnCXg9gZRsMH8kLtQ7PshhdZ6zG
 fizuOjzDqyINoGE38vpF7pcTFuWFCmo5VhElJ+feiyq82HJf+i8opI+iE/RvU2+Hxp58fioEr
 o3R3hcJQyMaWq727oPpWiw2aeBa6qtHYZ3NZPlVHBdikzOOt4oR2gm5BK50hFojDCSwLcBCLW
 GVkVRmj3KxSURw3dhfvWicGZxWO1209FzGnRE7hPoJgXJoQYS4sWHZKjWkJ6n4zHMuH1w5nyZ
 Eyar9XD7Hsh95kgy/F78dwNFznhlOTz5U3e
Received-SPF: pass client-ip=212.227.15.19; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI-64.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
=2D--
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


