Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285BA51434C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:29:46 +0200 (CEST)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkL4T-0006hT-8X
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKrk-0003KY-0f; Fri, 29 Apr 2022 03:16:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKrf-0001l2-Ov; Fri, 29 Apr 2022 03:16:34 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23T70EdA023434;
 Fri, 29 Apr 2022 07:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T2HD+XhNdZr2Zy0B8B1SOp47CP2eTwvetqGN0xi9D7o=;
 b=Y0E9lWEPui0Mg0SKSaEjTOM7Hd8q0KEp5e4e5UhjMMqA3ePHO6p3GKzLIl18ViW8sIVV
 nMeR66vP0j72r3GPNb3CPjymRtXRYLr48QQTLzsd+LQqIFhOuT08JAmctg1e7fqW3jb/
 mt7dwH7qP8Y90VxIDIBtZA6ljq0nfH39kh+LSAa2vyJrMCwp0zWqm3MnSYGfzqdK2T2Q
 pGfQjk660ZSe9xLDL0uDfPY1zZBJCLZwuD7tPRsOADXTE84aZEKQPiPeYPKXtJJnQgok
 fZfWdbBfOTU8GSXxfjO8+3Jincvod4Y696dZtwFDeA8mvKRTpoVvCjP+sxAPGzytbFQ5 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqt9e5kfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23T71Qlh030824;
 Fri, 29 Apr 2022 07:16:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqt9e5kew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23T77BbW032263;
 Fri, 29 Apr 2022 07:16:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3fm8qj8pm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23T73D5053608882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 07:03:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E624611C04A;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEC8A11C052;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.32.10])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] ppc/xive: Always recompute the PIPR when pushing an OS
 context
Date: Fri, 29 Apr 2022 09:16:19 +0200
Message-Id: <20220429071620.177142-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429071620.177142-1-fbarrat@linux.ibm.com>
References: <20220429071620.177142-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0qPEWgcDC0OubIR0WDg9fjSUqr1MTSZC
X-Proofpoint-ORIG-GUID: VWgqvzytPSXFiWh-5Lf0kQTmbZafoJIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_05,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204290039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Post Interrupt Priority Register (PIPR) is not restored like the
other OS-context related fields of the TIMA when pushing an OS context
on the CPU. It's not needed because it can be calculated from the
Interrupt Pending Buffer (IPB), which is saved and restored. The PIPR
must therefore always be recomputed when pushing an OS context.

This patch fixes a path on P9 and P10 where it was not done. If there
was a pending interrupt when the OS context was pulled, the IPB was
saved correctly. When pushing back the context, the code in
xive_tctx_need_resend() was checking for a interrupt raised while the
context was not on the CPU, saved in the NVT. If one was found, then
it was merged with the saved IPB and the PIPR updated and everything
was fine. However, if there was no interrupt found in the NVT, then
xive_tctx_ipb_update() was not being called and the PIPR was not
updated. This patch fixes it by always calling xive_tctx_ipb_update().

Note that on P10 (xive2.c) and because of the above, there's no longer
any need to check the CPPR value so it can go away.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/intc/xive.c  | 11 ++++++++---
 hw/intc/xive2.c | 16 +++++++++-------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b8e4c7294d..c729f6a478 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -413,10 +413,15 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
         /* Reset the NVT value */
         nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
         xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
-
-        /* Merge in current context */
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
     }
+    /*
+     * Always call xive_tctx_ipb_update(). Even if there were no
+     * escalation triggered, there could be a pending interrupt which
+     * was saved when the context was pulled and that we need to take
+     * into account by recalculating the PIPR (which is not
+     * saved/restored).
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 3aff42a69e..400fd70aa8 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -316,7 +316,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
 {
     Xive2Nvp nvp;
     uint8_t ipb;
-    uint8_t cppr = 0;
 
     /*
      * Grab the associated thread interrupt context registers in the
@@ -337,7 +336,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
     /* Automatically restore thread context registers */
     if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
         do_restore) {
-        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
+        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
     }
 
     ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
@@ -345,11 +344,14 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
         nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
         xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
     }
-
-    /* An IPB or CPPR change can trigger a resend */
-    if (ipb || cppr) {
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
-    }
+    /*
+     * Always call xive_tctx_ipb_update(). Even if there were no
+     * escalation triggered, there could be a pending interrupt which
+     * was saved when the context was pulled and that we need to take
+     * into account by recalculating the PIPR (which is not
+     * saved/restored).
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
-- 
2.35.1


