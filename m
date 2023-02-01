Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1E6867C4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDcY-0006Jm-DD; Wed, 01 Feb 2023 08:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNDcV-0006HH-Kb
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:57:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNDcT-0002yT-Mi
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:57:51 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311DIjMU014184; Wed, 1 Feb 2023 13:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eKUDeRCjXW8Qjk+VJNQ5UFlsrXOAiAo4mRg1VLET+O0=;
 b=LoMpumpe1eSVp4j09J3gIuYDOubVGa2z58tO0u3SWjlgRrWlRVD0aJRX2PnnxyoGknes
 R9L3w/l4byN74x8h8Optw7cXoMxhKDS45mS+FCpzCYtTLhj3h2ICckztx/7BkRXjpcbS
 k22AHuRsB6htIy9NM3TkGn0RNrX08XJAlt+8IscG/caKz8Cn0we86dZ/Gp5do4cazX0E
 UnpogNfDq/YqfFaMzFxfFkeufRQb0Az37Ve418R1clkmfh3c+3m1uFmcSer+WdlmibCm
 /kc0hIR4nX/KoSBIh2mlL4kwLI2pG6+wUkQUGUIpyKCkzjO33yukrsrJTWCg7IC9Xxuh ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfruvs4bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:57:46 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311DIt0x015596;
 Wed, 1 Feb 2023 13:57:45 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfruvs4bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:57:45 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DlRZA005050;
 Wed, 1 Feb 2023 13:57:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv1x0he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:57:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311Dvg9l5505708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 13:57:43 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 985766E050;
 Wed,  1 Feb 2023 13:59:51 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37286E04E;
 Wed,  1 Feb 2023 13:59:50 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 13:59:50 +0000 (GMT)
Message-ID: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
Subject: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 01 Feb 2023 08:57:10 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LG_h6-70_Nx5x6hHFbrst0KcH5W4F0Ns
X-Proofpoint-ORIG-GUID: W7zYISXAO5Cvcd1o-n6LpEWl95V3QLpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=847 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG seed
via setup_data entry") modifies the kernel image file to append a
random seed.  Obviously this makes the hash of the kernel file
non-deterministic and so breaks both measured and some signed boots.
The commit notes it's only for non-EFI (because EFI has a different
RNG seeding mechanism) so, since there are no non-EFI q35 systems, this
should be disabled for the whole of the q35 machine type to bring back
deterministic kernel file hashes.

Obviously this still leaves the legacy bios case broken for at least
measured boot, but I don't think anyone cares about that now.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
---
 hw/i386/pc_q35.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 83c57c6eb1..11e8dd7ca7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -357,6 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
     pcmc->default_nic_model = "e1000e";
     pcmc->pci_root_uid = 0;
     pcmc->default_cpu_version = 1;
+    pcmc->legacy_no_rng_seed = true;
 
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
@@ -394,9 +395,7 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
-    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1,
hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1,
pc_compat_7_1_len);
 }
-- 
2.35.3



