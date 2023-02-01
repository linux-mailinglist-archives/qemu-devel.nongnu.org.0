Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946576867D2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:00:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDeh-0001J3-Ug; Wed, 01 Feb 2023 09:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNDed-0001IW-Ez
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:00:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNDeb-0003HJ-JW
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:00:03 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311DhFSB015665; Wed, 1 Feb 2023 14:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ge/P2Zij3S1fwvFhy5Vn+k4swb8XP9PRCgMMnU8rGZ8=;
 b=RO1FTdNL4IX53/o/nWH7YKZ8QNGImG5eYUyyZj6ywbr/922n5GVLYKkv5l/zA3/Rpkv/
 ggknY060LUs8BvEJBdqtgodZA1knbHaE6UKuuxjg/cDPvWiVoYxwLnmCCT1PqjxXyJzY
 ikeVuHKDMELjKFmzEckf5LpDgTJpcouNjXvVQAoaXUp6OvOhJFpTT+ABl5nCcheYSUJT
 u+neLGqdQX5FtmaYf5A8dOcUUMOd/ZKMKpLFPRDKxmrrlF/M/ADbEAVDxiYvgDwOsarX
 BeiOCLhnP60Y7WnKvmQP07WJEPY8Hvryuzu9cnCRFDoFiBe8pgq6nteC/Hc926+B8EhZ tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfs71ren0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:00:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311Dhx3J017614;
 Wed, 1 Feb 2023 13:59:59 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfs71remn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:59:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DIEZ5006508;
 Wed, 1 Feb 2023 13:59:58 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtmkdnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:59:58 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311Dxvxs32440776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 13:59:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 403986E052;
 Wed,  1 Feb 2023 14:02:06 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A6FD6E050;
 Wed,  1 Feb 2023 14:02:05 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 14:02:05 +0000 (GMT)
Message-ID: <021cdbae51767e5e9d7d91ce152b50439959b9df.camel@linux.ibm.com>
Subject: [PATCH v2] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 01 Feb 2023 08:59:25 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bAjn1rPJFcJyAtod8M7h8Wppf7mQstGF
X-Proofpoint-ORIG-GUID: 9fKB3qSwhFZSGSVd-emhT6yhK2vRH-0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=856 priorityscore=1501
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302010116
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
random seed.  Obviously this makes the hash of the kernel file
non-deterministic and so breaks both measured and some signed boots.
The commit notes it's only for non-EFI (because EFI has a different
RNG seeding mechanism) so, since there are no non-EFI q35 systems, this
should be disabled for the whole of the q35 machine type to bring back
deterministic kernel file hashes.

Obviously this still leaves the legacy bios case broken for at least
measured boot, but I don't think anyone cares about that now.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
---
v2: with non wrapped lines this time

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
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
-- 
2.35.3



