Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45B50FA3E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:23:18 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njILl-0006cb-F0
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njIAd-0003dq-Nt; Tue, 26 Apr 2022 06:11:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njIAZ-00041f-Vp; Tue, 26 Apr 2022 06:11:46 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q9RLp2029798;
 Tue, 26 Apr 2022 10:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rDHtx0U86BqP6S+TggnsaQoKx1TCAOXFQ1hQVEuAhDQ=;
 b=e58gp+qMk5dDZYaIz5pR5WZEkPFj/cUjOGmTIIrFg+xORlp6QPs7DMis4Nzq/18hCRaI
 bHJMpDgfcxMfCBZH32jSN0x8Ux/SRARFvF9YUgg1yapByrqvfksSoAaduwRMF29/18Dd
 CrkP0VDEveSeKyWUqXChGpKpCLLPHM43+DH7IYQXd7IZingXDq9b+LyP+MBb1xd+VooY
 4P2pCCmfpKFxp7ecR4Qp02vMZ4xkEXHnht1+fsx6YbNMMuBPKiYcRF/n1sq17bV4GKQG
 L/b81IJhvQRhWcZJhJGsvX3+aEuCJR+aICcoKbxZHe4BZW1r2YE8DXDlC+AMAWy+2ZtE RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpbcev7vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:11:31 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23QA8SPp014045;
 Tue, 26 Apr 2022 10:11:31 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpbcev7ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:11:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23QA8bDI015451;
 Tue, 26 Apr 2022 10:11:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3fm8qhk97e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 10:11:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23Q9wPVv49480076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 09:58:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B36DAE045;
 Tue, 26 Apr 2022 10:11:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 321E6AE051;
 Tue, 26 Apr 2022 10:11:26 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.148.40])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 10:11:26 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] ppc/xive: Save/restore state of the External interrupt
Date: Tue, 26 Apr 2022 12:11:25 +0200
Message-Id: <20220426101125.297064-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0frC_zvjA8ghKBnaVF7QoMXYtzrOGdrD
X-Proofpoint-ORIG-GUID: 6aT0KVgpotYySD5TMLBZg5-XnEljKsTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204260062
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When pulling an OS context from a vcpu, we should lower the External
interrupt if it is pending. Otherwise, it may be delivered in the
hypervisor context, which is unexpected. It can lead to an infinite
loop where the hypervisor catches the External exception, looks for an
interrupt, doesn't find any, exits the exception handler, repeat...

It also means that when pushing a new OS context on a vcpu, we need to
always check the restored Interrupt Pending Buffer (IPB), potentially
merge it with any escalation interrupt, and re-apply the External
interrupt signal if needed.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---

Cedric: I'm wondering the reason behind commit
8256870ada9379abfd1f5b2c209ad01092dd0904, which makes the PIPR field
of the OS context read-only. The comment says it is re-evaluated from
the IPB when pushing a context, but I don't think it's true on P9
if there's no escalation. It's not a problem on P10 because we always
re-evaluate the PIPR if CPPR>0.
In any case, it's no longer an issue with this patch, but I'm
curious as to why restoring the PIPR was a problem in the first place.


 hw/intc/xive.c        | 26 +++++++++++++++++++++++---
 hw/intc/xive2.c       | 14 ++++++++------
 include/hw/ppc/xive.h |  1 +
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b8e4c7294d..8430db687f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -114,6 +114,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
     }
 }
 
+void xive_tctx_eval_ext_signal(XiveTCTX *tctx)
+{
+    uint8_t *regs = &tctx->regs[TM_QW1_OS];
+
+    /*
+     * Used when pulling an OS context.
+     * Lower the External interrupt if it's pending. It is necessary
+     * to avoid catching it in the hypervisor context. It should be
+     * raised again when re-pushing the OS context.
+     */
+    if (regs[TM_PIPR] < regs[TM_CPPR]) {
+        qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
+    }
+}
+
 static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
 {
     uint8_t *regs = &tctx->regs[ring];
@@ -388,6 +403,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
     /* Invalidate CAM line */
     qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
     xive_tctx_set_os_cam(tctx, qw1w2_new);
+
+    xive_tctx_eval_ext_signal(tctx);
     return qw1w2;
 }
 
@@ -413,10 +430,13 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
         /* Reset the NVT value */
         nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
         xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
-
-        /* Merge in current context */
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
     }
+    /*
+     * Always merge in current context. Even if there's no escalation,
+     * it will check with the IPB value restored before pushing the OS
+     * context and set the External interrupt signal if needed.
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 3aff42a69e..b7f1917cd2 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
         xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
     }
 
+    xive_tctx_eval_ext_signal(tctx);
     return qw1w2;
 }
 
@@ -316,7 +317,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
 {
     Xive2Nvp nvp;
     uint8_t ipb;
-    uint8_t cppr = 0;
 
     /*
      * Grab the associated thread interrupt context registers in the
@@ -337,7 +337,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
     /* Automatically restore thread context registers */
     if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
         do_restore) {
-        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
+        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
     }
 
     ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
@@ -346,10 +346,12 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
         xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
     }
 
-    /* An IPB or CPPR change can trigger a resend */
-    if (ipb || cppr) {
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
-    }
+    /*
+     * Always merge in current context. Even if there's no escalation,
+     * it will check with the IPB value restored and set the External
+     * interrupt signal if needed.
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 126e4e2c3a..91512ed5e6 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
 void xive_tctx_reset(XiveTCTX *tctx);
 void xive_tctx_destroy(XiveTCTX *tctx);
 void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
+void xive_tctx_eval_ext_signal(XiveTCTX *tctx);
 
 /*
  * KVM XIVE device helpers
-- 
2.35.1


