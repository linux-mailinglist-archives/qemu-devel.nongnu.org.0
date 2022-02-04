Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A914A95DC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:17:36 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuil-00053U-Rt
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtlE-0003Pb-VK; Fri, 04 Feb 2022 03:16:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtl9-0004bi-O3; Fri, 04 Feb 2022 03:16:04 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21468A32007858; 
 Fri, 4 Feb 2022 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YCSNDDeQhoWa23xDFTvJwuKtGpwFr4tkRf4S+dgP0Jc=;
 b=lUXQ68J4n/IYBbcoOGpTmcjD+YcR10AA9xgXTfbNgIzSIO4y2yuwgylb8hXo6Mle/u+5
 OkzNSy81CjFQ8aj3IsOOFyK9c9hkqUYaIq7nLOLCE0bORr8cpv6I0x55jjNL/oDr4UBJ
 AgauCZsPalY447dBuOoLXXyAaVdGDPxvvixLPpWMDRbvTCHnLR1Z2JwyzxKcl8lFUgea
 DysxuoNEUnlySIL9y45vu+JR7LpVGlwBWzc8hvz9qVdH/C4ogNalaShtAeXdh9HOWpI5
 thYvR7a9P+MFZea3vNJHCBboBjw5+3rW//b2aTe926g9O3SUTB2/x4uN6cyfZyq+adNO Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx2fv85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:48 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2148AVuH012513;
 Fri, 4 Feb 2022 08:15:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx2fv76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:48 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21488nWn009465;
 Fri, 4 Feb 2022 08:15:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3e0r0n2gfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21485m9u29426044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 08:05:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 688C211C069;
 Fri,  4 Feb 2022 08:15:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A006F11C04C;
 Fri,  4 Feb 2022 08:15:41 +0000 (GMT)
Received: from ltczzess4.aus.stglabs.ibm.com (unknown [9.40.194.150])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 08:15:41 +0000 (GMT)
Subject: [PATCH v7 1/3] nvdimm: Add realize,
 unrealize callbacks to NVDIMMDevice class
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, ani@anisinha.ca, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org
Date: Fri, 04 Feb 2022 08:15:41 +0000
Message-ID: <164396253158.109112.1926755104259023743.stgit@ltczzess4.aus.stglabs.ibm.com>
In-Reply-To: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
References: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FTn_GEAKGRn2JviMVNUxD0M1Ovk7t1VL
X-Proofpoint-GUID: KHCQnqJ6KheW7OsuPa3t8TCmqmjqvV3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040041
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new subclass inheriting NVDIMMDevice is going to be introduced in
subsequent patches. The new subclass uses the realize and unrealize
callbacks. Add them on NVDIMMClass to appropriately call them as part
of plug-unplug.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/mem/nvdimm.c          |   16 ++++++++++++++++
 hw/mem/pc-dimm.c         |    5 +++++
 include/hw/mem/nvdimm.h  |    2 ++
 include/hw/mem/pc-dimm.h |    1 +
 4 files changed, 24 insertions(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b67156..59959d5563 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -181,10 +181,25 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
 static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
 {
     NVDIMMDevice *nvdimm = NVDIMM(dimm);
+    NVDIMMClass *ndc = NVDIMM_GET_CLASS(nvdimm);
 
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
+    NVDIMMDevice *nvdimm = NVDIMM(dimm);
+    NVDIMMClass *ndc = NVDIMM_GET_CLASS(nvdimm);
+
+    if (ndc->unrealize) {
+        ndc->unrealize(nvdimm);
+    }
 }
 
 /*
@@ -240,6 +255,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     ddc->realize = nvdimm_realize;
+    ddc->unrealize = nvdimm_unrealize;
     mdc->get_memory_region = nvdimm_md_get_memory_region;
     device_class_set_props(dc, nvdimm_properties);
 
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 48b913aba6..03bd0dd60e 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -216,6 +216,11 @@ static void pc_dimm_realize(DeviceState *dev, Error **errp)
 static void pc_dimm_unrealize(DeviceState *dev)
 {
     PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+
+    if (ddc->unrealize) {
+        ddc->unrealize(dimm);
+    }
 
     host_memory_backend_set_mapped(dimm->hostmem, false);
 }
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..cf8f59be44 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -103,6 +103,8 @@ struct NVDIMMClass {
     /* write @size bytes from @buf to NVDIMM label data at @offset. */
     void (*write_label_data)(NVDIMMDevice *nvdimm, const void *buf,
                              uint64_t size, uint64_t offset);
+    void (*realize)(NVDIMMDevice *nvdimm, Error **errp);
+    void (*unrealize)(NVDIMMDevice *nvdimm);
 };
 
 #define NVDIMM_DSM_MEM_FILE     "etc/acpi/nvdimm-mem"
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 1473e6db62..322bebe555 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -63,6 +63,7 @@ struct PCDIMMDeviceClass {
 
     /* public */
     void (*realize)(PCDIMMDevice *dimm, Error **errp);
+    void (*unrealize)(PCDIMMDevice *dimm);
 };
 
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,



