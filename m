Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827014BB713
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:41:51 +0100 (CET)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0hy-00049F-6s
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fM-00010q-RX; Fri, 18 Feb 2022 05:39:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23204
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0f0-0005fJ-Vo; Fri, 18 Feb 2022 05:39:05 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I8b5Mx022300; 
 Fri, 18 Feb 2022 10:38:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:35 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAcZ3O027490;
 Fri, 18 Feb 2022 10:38:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbt6c011073;
 Fri, 18 Feb 2022 10:38:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645khcd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcVxA49021350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 419C942074;
 Fri, 18 Feb 2022 10:38:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F108042077;
 Fri, 18 Feb 2022 10:38:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 390C1220294;
 Fri, 18 Feb 2022 11:38:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 01/39] nvdimm: Add realize,
 unrealize callbacks to NVDIMMDevice class
Date: Fri, 18 Feb 2022 11:37:49 +0100
Message-Id: <20220218103827.682032-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hJqbyIdWIFlJtLZfa1n3QLb061PLElSs
X-Proofpoint-ORIG-GUID: CDfjdiYPBoPlOeq5eNbdUXIstHK-Upxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=975
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

A new subclass inheriting NVDIMMDevice is going to be introduced in
subsequent patches. The new subclass uses the realize and unrealize
callbacks. Add them on NVDIMMClass to appropriately call them as part
of plug-unplug.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <164396253158.109112.1926755104259023743.stgit@ltczzess4.aus.=
stglabs.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/mem/nvdimm.h  |  2 ++
 include/hw/mem/pc-dimm.h |  1 +
 hw/mem/nvdimm.c          | 16 ++++++++++++++++
 hw/mem/pc-dimm.c         |  5 +++++
 4 files changed, 24 insertions(+)

diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c74..cf8f59be44f9 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -103,6 +103,8 @@ struct NVDIMMClass {
     /* write @size bytes from @buf to NVDIMM label data at @offset. */
     void (*write_label_data)(NVDIMMDevice *nvdimm, const void *buf,
                              uint64_t size, uint64_t offset);
+    void (*realize)(NVDIMMDevice *nvdimm, Error **errp);
+    void (*unrealize)(NVDIMMDevice *nvdimm);
 };
=20
 #define NVDIMM_DSM_MEM_FILE     "etc/acpi/nvdimm-mem"
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 1473e6db6254..322bebe555b5 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -63,6 +63,7 @@ struct PCDIMMDeviceClass {
=20
     /* public */
     void (*realize)(PCDIMMDevice *dimm, Error **errp);
+    void (*unrealize)(PCDIMMDevice *dimm);
 };
=20
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b6715652..59959d556337 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -181,10 +181,25 @@ static MemoryRegion *nvdimm_md_get_memory_region(Me=
moryDeviceState *md,
 static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
 {
     NVDIMMDevice *nvdimm =3D NVDIMM(dimm);
+    NVDIMMClass *ndc =3D NVDIMM_GET_CLASS(nvdimm);
=20
     if (!nvdimm->nvdimm_mr) {
         nvdimm_prepare_memory_region(nvdimm, errp);
     }
+
+    if (ndc->realize) {
+        ndc->realize(nvdimm, errp);
+    }
+}
+
+static void nvdimm_unrealize(PCDIMMDevice *dimm)
+{
+    NVDIMMDevice *nvdimm =3D NVDIMM(dimm);
+    NVDIMMClass *ndc =3D NVDIMM_GET_CLASS(nvdimm);
+
+    if (ndc->unrealize) {
+        ndc->unrealize(nvdimm);
+    }
 }
=20
 /*
@@ -240,6 +255,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *=
data)
     DeviceClass *dc =3D DEVICE_CLASS(oc);
=20
     ddc->realize =3D nvdimm_realize;
+    ddc->unrealize =3D nvdimm_unrealize;
     mdc->get_memory_region =3D nvdimm_md_get_memory_region;
     device_class_set_props(dc, nvdimm_properties);
=20
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 48b913aba677..03bd0dd60e5c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -216,6 +216,11 @@ static void pc_dimm_realize(DeviceState *dev, Error =
**errp)
 static void pc_dimm_unrealize(DeviceState *dev)
 {
     PCDIMMDevice *dimm =3D PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
+
+    if (ddc->unrealize) {
+        ddc->unrealize(dimm);
+    }
=20
     host_memory_backend_set_mapped(dimm->hostmem, false);
 }
--=20
2.34.1


