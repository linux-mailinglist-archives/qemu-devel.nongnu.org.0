Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEAC1454DA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 14:12:15 +0100 (CET)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuFnq-0002Kp-8e
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 08:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iuFmz-0001uS-6K
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iuFmx-0003Lq-IU
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:11:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iuFmx-0003Kt-Ba
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:11:19 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MCw6gh050597
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 08:11:17 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp1jh14js-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 08:11:16 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Wed, 22 Jan 2020 13:11:14 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 Jan 2020 13:11:13 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00MDBCrF47841426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 13:11:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A989C4C059;
 Wed, 22 Jan 2020 13:11:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80CD64C046;
 Wed, 22 Jan 2020 13:11:12 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.182.163])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jan 2020 13:11:12 +0000 (GMT)
Subject: [PATCH] spapr: Don't allow multiple active vCPUs at CAS
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 22 Jan 2020 14:11:12 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012213-0016-0000-0000-000002DFB0CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012213-0017-0000-0000-000033425C41
Message-Id: <157969867170.571404.12117797348882189656.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1034 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxlogscore=681 mlxscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001220119
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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

According to the description of "ibm,client-architecture-support" that
can found in LoPAPR "B.6.2.3 Root Node Methods":

If multiple partition processors or threads are active at the time of
the ibm,client-architecture-support method call, or an error is detected
in the format of the ibm,architecture.vec structure, the err? boolean
shall be TRUE; else FALSE.

We certainly don't want to temper with the platform or with the PCR of
the other vCPUs if they happen to be active. Ensure we have only one
active vCPU and fail CAS otherwise. This is just for conformance and
robustness, it doesn't fix any known bugs.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_hcall.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ffb14641f9d3..b8bb66b5c0d4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1676,6 +1676,18 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
     Error *local_err = NULL;
     bool raw_mode_supported = false;
     bool guest_xive;
+    CPUState *cs;
+
+    /* CAS is supposed to be called early when only the boot vCPU is active. */
+    CPU_FOREACH(cs) {
+        if (cs == CPU(cpu)) {
+            continue;
+        }
+        if (!cs->halted) {
+            warn_report("guest has multiple active vCPUs at CAS, which is not allowed");
+            return H_MULTI_THREADS_ACTIVE;
+        }
+    }
 
     cas_pvr = cas_check_pvr(spapr, cpu, &addr, &raw_mode_supported, &local_err);
     if (local_err) {


