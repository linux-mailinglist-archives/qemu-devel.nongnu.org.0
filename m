Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B763732FC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 02:14:02 +0200 (CEST)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le5Av-00023O-53
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 20:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58m-0000LJ-No; Tue, 04 May 2021 20:11:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58j-0002wg-AJ; Tue, 04 May 2021 20:11:48 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145034Sf004860; Tue, 4 May 2021 20:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=NFsCN57MdtiR9sFj8r5MDj996ziNq0VcpfxcGX3vx+w=;
 b=qNgdabPR/7gxfLdYthmS6p0R3FJRXHYCoNVquRMRrVwbVV8odPFIBEIz0H6is9f2Oo55
 f0rHCDYIB9iChrO/K8OLx8pihxYapOU9tMXzKOCDJq4f+l1GAmLVvCgyVnr+ifobP38E
 LPXg8+KfeWdO0LBiZe+VZm2rnrdRUQCFt6RgJrE80ZOtiBvjQtCFdO+U8z2lv5MiQouY
 BONRtgpW3LyAgs5Fo/OgiW/4xDg7xQlZFkHU57hPegeKj4ZjlXUG3X8RftS6i/Bbowwr
 CaOxU/ECrP3e73EqXVsil4k4d1mpD83QI8+0OACuycI/MSlklPw2jNv/qDIbZnmfyAFK mw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38begsjnnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 20:11:40 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1450BcL6025323;
 Wed, 5 May 2021 00:11:38 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 38bedtrnq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 00:11:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1450Bba737552558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 00:11:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D69E9C6057;
 Wed,  5 May 2021 00:11:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E620AC605A;
 Wed,  5 May 2021 00:11:36 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.49.100])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 00:11:36 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ppc/spapr.c: Make sure the host supports the selected
 MMU mode
Date: Tue,  4 May 2021 21:11:30 -0300
Message-Id: <20210505001130.3999968-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505001130.3999968-1-farosas@linux.ibm.com>
References: <20210505001130.3999968-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nEmgGyPbTSOEvLRO0AwZsAC5L4NGf8G0
X-Proofpoint-ORIG-GUID: nEmgGyPbTSOEvLRO0AwZsAC5L4NGf8G0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_15:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040166
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting with Linux kernel v5.12 we dropped support[1] in KVM for
hosts that can't have their threads running in different MMU modes
(POWER9 < DD2.2). In these hosts, KVM will no longer report the
KVM_CAP_PPC_MMU_HASH_V3 capability[2] when the host is running Radix.

For guests that support both MMU modes, the negotiation during CAS
will make sure it selects the correct one.

For guests that only support Hash, such as P8 compat mode guests, the
following error is currently thrown:

  $ ~/qemu-system-ppc64 -machine pseries,accel=kvm,max-cpu-compat=power8 ...
  error: kvm run failed Invalid argument
  NIP 0000000000000100   LR 0000000000000000 CTR 0000000000000000 XER 0000000000000000 CPU#0
  MSR 8000000000001000 HID0 0000000000000000  HF 8000000000000000 iidx 3 didx 3
  TB 00000000 00000000 DECR 0
  GPR00 0000000000000000 0000000000000000 0000000000000000 000000007ff00000
  GPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  CR 00000000  [ -  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
   SRR0 0000000000000000  SRR1 0000000000000000    PVR 00000000004e1201 VRSAVE 0000000000000000
  SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG3 0000000000000000
  SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
  HSRR0 0000000000000000 HSRR1 0000000000000000
   CFAR 0000000000000000
   LPCR 000000000004f01f
   PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

This patch adds a verification during the writing of the platform
support vector so that we error out as soon as we determine this guest
only supports Hash and the host doesn't.

  ~/qemu-system-ppc64 -machine pseries,accel=kvm,max-cpu-compat=power8 ...
  qemu-system-ppc64: Guest requested unavailable MMU mode (hash).

1- https://git.kernel.org/torvalds/p/b1b1697ae0cc8
2- https://git.kernel.org/torvalds/p/a722076e94702

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4fd226b15b..69201399eb 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -981,6 +981,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
          */
         val[1] = SPAPR_OV5_XIVE_LEGACY; /* XICS */
         val[3] = 0x00; /* Hash */
+        spapr_check_mmu_mode(false);
     } else if (kvm_enabled()) {
         if (kvmppc_has_cap_mmu_radix() && kvmppc_has_cap_mmu_hash_v3()) {
             val[3] = 0x80; /* OV5_MMU_BOTH */
-- 
2.29.2


