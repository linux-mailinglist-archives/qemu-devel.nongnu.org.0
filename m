Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239AC391BFF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:29:48 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvTe-0002RS-Ve
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1llvRo-0000pZ-QQ; Wed, 26 May 2021 11:27:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1llvRi-0008Jf-MW; Wed, 26 May 2021 11:27:52 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QF4GKv124325; Wed, 26 May 2021 11:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=CWkSzCTP7KHishIlWZEHZbVXHEKF0RcJj82EkBvgvQs=;
 b=Qw1AY/V3IpicJBXqCC0z8JXppWdx1HMTgKnQPTLSMk2InyJzQrrLa0ic4INQliP0Ps3l
 FMAwPu/youaz1Sg8VJnJYHCKXIgClTFT7ipbhYswdePFYuV2UCjSJjnX1u8GZ3gTT/YN
 7H0dD2yxhMTGGObyVcq4f1CSH3fTsQSlh7qwOc+whNyPdhWsfhyGCL3RBnDYQG0r/uTw
 rTEpatBhhplUtOufPmEMplWFWM2ngdrgDVbH4zbvKD1MvWTBxYnnXI2aQZkMtgliZv+L
 S6mYLalZebfssYlWRijVsJnc/8GhShYruk1sbrrT6QRHyvjsDdo4/0bC6OhkNs9eAlmE Ew== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38spv8my4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 11:27:22 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14QFD0Ii009344;
 Wed, 26 May 2021 15:27:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 38s1r50cwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 15:27:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14QFQlZf21954992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 15:26:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22C6B42042;
 Wed, 26 May 2021 15:27:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4143742041;
 Wed, 26 May 2021 15:27:16 +0000 (GMT)
Received: from [172.17.0.4] (unknown [9.40.192.207])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 May 2021 15:27:16 +0000 (GMT)
Subject: [PATCH] spapr: nvdimm: Fix the persistent-memory root node name in
 device tree
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Date: Wed, 26 May 2021 11:27:15 -0400
Message-ID: <162204278956.219.9061511386011411578.stgit@cc493db1e665>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: csjGxA3AkIXG2GNhbhRDYYLZmxKDHanm
X-Proofpoint-ORIG-GUID: csjGxA3AkIXG2GNhbhRDYYLZmxKDHanm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_09:2021-05-26,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FDT code is adding the pmem root node by name "persistent-memory"
which should have been "ibm,persistent-memory".

The linux fetches the device tree nodes by type and it has been working
correctly as the type is correct. If someone searches by its intended
name it would fail, so fix that.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/ppc/spapr_nvdimm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 252204e25f..d7a4a0a051 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -163,11 +163,11 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 
 void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt)
 {
-    int offset = fdt_subnode_offset(fdt, 0, "persistent-memory");
+    int offset = fdt_subnode_offset(fdt, 0, "ibm,persistent-memory");
     GSList *iter, *nvdimms = nvdimm_get_device_list();
 
     if (offset < 0) {
-        offset = fdt_add_subnode(fdt, 0, "persistent-memory");
+        offset = fdt_add_subnode(fdt, 0, "ibm,persistent-memory");
         _FDT(offset);
         _FDT((fdt_setprop_cell(fdt, offset, "#address-cells", 0x1)));
         _FDT((fdt_setprop_cell(fdt, offset, "#size-cells", 0x0)));



