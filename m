Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07113DE50
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:11:41 +0100 (CET)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is6o8-0003bO-7L
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1is6mN-00016F-Jo
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:09:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1is6mM-0007pz-Dq
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:09:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35026
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1is6mM-0007p9-9m
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:09:50 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GF9hFM088839
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 10:09:49 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xhbptajx9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 10:09:45 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Thu, 16 Jan 2020 15:06:05 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Jan 2020 15:05:58 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GF5v1Q55509098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 15:05:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E41311C0A7;
 Thu, 16 Jan 2020 15:05:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1AA111C088;
 Thu, 16 Jan 2020 15:05:56 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.1.176])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 15:05:56 +0000 (GMT)
Subject: [PATCH] spapr: Fail CAS if option vector table cannot be parsed
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 16 Jan 2020 16:05:56 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20011615-4275-0000-0000-000003982212
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011615-4276-0000-0000-000038AC2154
Message-Id: <157918715618.376249.7891210201270364781.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_04:2020-01-16,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1034 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160126
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the option vector helpers have assertions to check their
arguments aren't null. The guest can provide an arbitrary address
for the CAS structure that would result in such null arguments.
Fail CAS with H_PARAMETER instead of aborting QEMU.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_hcall.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 84e1612595bb..051869ae20ec 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1701,9 +1701,18 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
 
     /* For the future use: here @ov_table points to the first option vector */
     ov_table = addr;
+    if (!ov_table) {
+        return H_PARAMETER;
+    }
 
     ov1_guest = spapr_ovec_parse_vector(ov_table, 1);
+    if (!ov1_guest) {
+        return H_PARAMETER;
+    }
     ov5_guest = spapr_ovec_parse_vector(ov_table, 5);
+    if (!ov5_guest) {
+        return H_PARAMETER;
+    }
     if (spapr_ovec_test(ov5_guest, OV5_MMU_BOTH)) {
         error_report("guest requested hash and radix MMU, which is invalid.");
         exit(EXIT_FAILURE);


