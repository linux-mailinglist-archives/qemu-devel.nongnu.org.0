Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EBB4E7B06
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:34:39 +0100 (CET)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsVx-0003Oc-TM
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:34:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXsUo-0002Xx-Or; Fri, 25 Mar 2022 18:33:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXsUn-0006Gb-4h; Fri, 25 Mar 2022 18:33:26 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PKAhRq022380; 
 Fri, 25 Mar 2022 22:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BAU7nj3rEkJ0SX0O7cBSnY8seFUo2qe6j+gKBWxxY+k=;
 b=nSs/bRS9nfQfzrC1AWXnLsboG5uaCgJlSgU0Sv8H7Q42F1C9ZEUHJmBXxrCwagwbabXb
 7NNDr8XPqOT5LY0ayXo9h/BbVHW0eiFc27LGVbWX6tZqk5uiSHjPBTNZ/RsDAsvtJ0Rv
 +pUkzHhYhq2kzOeVFfMTg3hxniBLQZUe4abv2ZNXi2huZwIUprtCx7qJrxU4c32uGlUd
 cpbNJGcnvGOEtBwPNfTtkT6v85o1ill7QnQve6Pnq22m7ssswyXdIvgHAqY3FIvyaEd5
 IHn2bYZxWikQNRz3QtdVX8CNNrc63hn2HgmF8ozXLPivIogTnytqihGI/g8zvqaazoAy Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0rqbx3t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:33:21 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PMUgY4002098;
 Fri, 25 Mar 2022 22:33:21 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0rqbx3sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:33:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PMWNXJ031927;
 Fri, 25 Mar 2022 22:33:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3exd3k4ybe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:33:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PMXJMZ30540074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 22:33:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E439FBE05D;
 Fri, 25 Mar 2022 22:33:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 927E8BE07F;
 Fri, 25 Mar 2022 22:33:18 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.77.145.9])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 22:33:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Improve KVM hypercall trace
Date: Fri, 25 Mar 2022 19:33:16 -0300
Message-Id: <20220325223316.276494-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Bw0iuNDNhYg6NZIQHwDhk_yBVq8N4_P3
X-Proofpoint-ORIG-GUID: DRkv1qAah4SxarwFwrSF5zBuiDVd9Tup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=497
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203250124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before:

  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall
  kvm_handle_papr_hcall handle PAPR hypercall

After:

  kvm_handle_papr_hcall 0x3a8
  kvm_handle_papr_hcall 0x3ac
  kvm_handle_papr_hcall 0x108
  kvm_handle_papr_hcall 0x104
  kvm_handle_papr_hcall 0x104
  kvm_handle_papr_hcall 0x108

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/kvm.c        | 2 +-
 target/ppc/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..a490e886ea 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1681,7 +1681,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         break;
 #if defined(TARGET_PPC64)
     case KVM_EXIT_PAPR_HCALL:
-        trace_kvm_handle_papr_hcall();
+        trace_kvm_handle_papr_hcall(run->papr_hcall.nr);
         run->papr_hcall.ret = spapr_hypercall(cpu,
                                               run->papr_hcall.nr,
                                               run->papr_hcall.args);
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 53b107f56e..a79f1b4370 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -23,7 +23,7 @@ kvm_failed_get_vpa(void) "Warning: Unable to get VPA information from KVM"
 kvm_handle_dcr_write(void) "handle dcr write"
 kvm_handle_dcr_read(void) "handle dcr read"
 kvm_handle_halt(void) "handle halt"
-kvm_handle_papr_hcall(void) "handle PAPR hypercall"
+kvm_handle_papr_hcall(uint64_t hcall) "0x%" PRIx64
 kvm_handle_epr(void) "handle epr"
 kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
 kvm_handle_debug_exception(void) "handle debug exception"
-- 
2.35.1


