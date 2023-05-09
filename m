Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76B6FC430
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKsq-00032A-0W; Tue, 09 May 2023 06:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nnmlinux@linux.ibm.com>)
 id 1pwKsn-00030p-FE; Tue, 09 May 2023 06:47:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nnmlinux@linux.ibm.com>)
 id 1pwKsl-0007gA-8L; Tue, 09 May 2023 06:47:49 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349AZgDa023783; Tue, 9 May 2023 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=TNoMvkStpnUkUWeDnoBEph8ejxZ5p5UJrEPGMlFcP34=;
 b=sWGS1at3QXiZvn4T1gV0lMq6zkY1XRSGrXFP8PD1G7HZMXNXIlGU2Wl88OX+rIK+EVLx
 qWLhcO6KvFkmzR1g9QdAd7h7uR+n0BzQ3nC4WiZkEfzXVg2yhi/grxINZz4npJswqqzj
 oBvtclbv2og6i0SdOOwhMGOgb6RFptRV1AaChXatVqxamDkXsFSqRKytd/cExwnvTNp9
 uR0qoke8peBzaJwQCKKxxenqf+Z+7zC2PNuCjA+Lf5losncN3gMYFo9u/WUvxAI2eAQ5
 B3vrpa+20SkUVFC1pZ4hA1fzxyOrygQrHm1yU1rprAMQuzMm2W9nHVTw6Qe3eP++jKWd AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfkesa7n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:47:34 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349AZpQC025128;
 Tue, 9 May 2023 10:47:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfkesa7mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:47:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 348KRADS015025;
 Tue, 9 May 2023 10:47:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e8ch3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 10:47:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349AlSZP34341382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 10:47:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 669DE20040;
 Tue,  9 May 2023 10:47:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B3EB20043;
 Tue,  9 May 2023 10:47:26 +0000 (GMT)
Received: from ltc-wspoon17.aus.stglabs.ibm.com (unknown [9.3.101.49])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 10:47:26 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de,
 npiggin@linux.ibm.com, vaibhav@linux.ibm.com, harshpb@linux.ibm.com,
 sbhat@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: [PATCH v2] target: ppc: Use MSR_HVB bit to get the target endianness
 for memory dump
Date: Tue,  9 May 2023 06:47:01 -0400
Message-Id: <20230509104701.12473-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OQPIhE0E6f2mix3qRp4vVW0ug23wuyZh
X-Proofpoint-GUID: 5f3DmyJK-cyGeLJ2odm8t1jfTJUTS6Me
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=706 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090083
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=nnmlinux@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently on PPC64 qemu always dumps the guest memory in
Big Endian (BE) format even though the guest running in Little Endian
(LE) mode. So crash tool fails to load the dump as illustrated below:

Log :
$ virsh dump DOMAIN --memory-only dump.file

Domain 'DOMAIN' dumped to dump.file

$ crash vmlinux dump.file

<snip>
crash 8.0.2-1.el9

WARNING: endian mismatch:
          crash utility: little-endian
          dump.file: big-endian

WARNING: machine type mismatch:
          crash utility: PPC64
          dump.file: (unknown)

crash: dump.file: not a supported file format
<snip>

This happens because cpu_get_dump_info() passes cpu->env->has_hv_mode
to function ppc_interrupts_little_endian(), the cpu->env->has_hv_mode
always set for powerNV even though the guest is not running in hv mode.
The hv mode should be taken from msr_mask MSR_HVB bit
(cpu->env.msr_mask & MSR_HVB). This patch fixes the issue by passing
MSR_HVB value to ppc_interrupts_little_endian() in order to determine
the guest endianness.

The patch was tested on POWER9 box booted with Linux as host in
following cases:
case I: powerNV booted with BigEndian host, LittleEndian guest
case II: powerNV booted with BigEndian host, BigEndian guest
case III: powerNV booted with LittleEndian host, LittleEndian guest
with -enable-kvm
case IV: powerNV booted with LittleEndian host, BigEndian guest
with -enable-kvm
The results are tabulated below, Endianess of the dump file against
the Host and guest Endianess.

|----------------|----------------|
|Host-Endianess  |Guest-Endianness|
|                |-------|--------|
|                | BE    | LE     |
|----------------|-------|--------|
|BE              | BE    | LE     |
|----------------|-------|--------|
|LE              | BE    | LE	  |
|----------------|-------|--------|

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
Changes since V1:
https://lore.kernel.org/qemu-devel/20230420145055.10196-1-nnmlinux@linux.ibm.com/
The approach to solve the issue was changed based on feedback from
Fabiano Rosas on patch V1.
---
 target/ppc/arch_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index f58e6359d5..a8315659d9 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
+    if (ppc_interrupts_little_endian(cpu, !!(cpu->env.msr_mask & MSR_HVB))) {
         info->d_endian = ELFDATA2LSB;
     } else {
         info->d_endian = ELFDATA2MSB;
-- 
2.39.2


