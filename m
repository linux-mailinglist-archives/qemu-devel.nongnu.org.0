Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEF511C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:11:12 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkFz-00075v-5x
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njk7i-0007qv-9l; Wed, 27 Apr 2022 12:02:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njk7f-0005e2-Jv; Wed, 27 Apr 2022 12:02:37 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RFMlcL011540;
 Wed, 27 Apr 2022 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UV9L1OiB1A9MsUskrWals3aG86ZipzQxh0dm95hOUVI=;
 b=K7g5JSJqrhnqSGoY006Y+dG1HWBY4RDOlA3t0o28/g1PJ1V2Xbh+Es7dqwCrmphjpbKp
 JCWh0+rUPIcUHIJR+mDjKesMjO+AwhqjJ6JCVGw+uMv11r1QxCp7L0W5ZBVF9WM9ePcr
 XNo7z9dFJWhk8DAvQK+J3iBq2GI5cbMeWgWD4g9FPH0xtjqVbtf8MmQLkOWYzK0zYhGz
 +NYNIzctrJwuEYTi8DqNLbeKFU8UnAci65NE8VsQqKnMaZlg28Nfpj0u28HclRQ1CzCb
 6r7hIYYMs0H2LWuSVjsT9KZlT9EegaLEVyZHqqOH7dq1Zvd0NaUz/r6wLEUGJscimUkP VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fq8dwrtv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:30 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23RFnYu0017112;
 Wed, 27 Apr 2022 16:02:29 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fq8dwrtu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:29 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23RFwXAp010037;
 Wed, 27 Apr 2022 16:02:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fm938vxmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 16:02:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23RG2bGu2753120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 16:02:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5675AE053;
 Wed, 27 Apr 2022 16:02:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88DBEAE051;
 Wed, 27 Apr 2022 16:02:24 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.79.152])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Apr 2022 16:02:24 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] ppc/xive: Update the state of the External interrupt
 signal
Date: Wed, 27 Apr 2022 18:02:23 +0200
Message-Id: <20220427160223.96758-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427160223.96758-1-fbarrat@linux.ibm.com>
References: <20220427160223.96758-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CDacrBWk9YLVWOC_3UoGHpBspe1x2jZY
X-Proofpoint-ORIG-GUID: gR9KCF7QOJFghcna6iDS5kNtxPsqbaay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270101
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

When pulling or pushing an OS context from/to a CPU, we should
re-evaluate the state of the External interrupt signal. Otherwise, we
can end up catching the External interrupt exception in hypervisor
mode, which is unexpected.

The problem is best illustrated with the following scenario:

1. an External interrupt is raised while the guest is on the CPU.

2. before the guest can ack the External interrupt, an hypervisor
interrupt is raised, for example the Hypervisor Decrementer or
Hypervisor Virtualization interrupt. The hypervisor interrupt forces
the guest to exit while the External interrupt is still pending.

3. the hypervisor handles the hypervisor interrupt. At this point, the
External interrupt is still pending. So it's very likely to be
delivered while the hypervisor is running. That's unexpected and can
result in an infinite loop where the hypervisor catches the External
interrupt, looks for an interrupt in its hypervisor queue, doesn't
find any, exits the interrupt handler with the External interrupt
still raised, repeat...

The fix is simply to always lower the External interrupt signal when
pulling an OS context. It means it needs to be raised again when
re-pushing the OS context. Fortunately, it's already the case, as we
now always call xive_tctx_ipb_update(), which will raise the signal if
needed.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/intc/xive.c        | 14 ++++++++++++++
 hw/intc/xive2.c       |  2 ++
 include/hw/ppc/xive.h |  1 +
 3 files changed, 17 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 6b62918ea7..e230b14e94 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -114,6 +114,17 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
     }
 }
 
+void xive_tctx_reset_os_signal(XiveTCTX *tctx)
+{
+    /*
+     * Lower the External interrupt. Used when pulling an OS
+     * context. It is necessary to avoid catching it in the hypervisor
+     * context. It should be raised again when re-pushing the OS
+     * context.
+     */
+    qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
+}
+
 static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
 {
     uint8_t *regs = &tctx->regs[ring];
@@ -388,6 +399,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
     /* Invalidate CAM line */
     qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
     xive_tctx_set_os_cam(tctx, qw1w2_new);
+
+    xive_tctx_reset_os_signal(tctx);
     return qw1w2;
 }
 
@@ -419,6 +432,7 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
      * escalation found in the NVT above, there could be a pending
      * interrupt which was saved when the context was pulled and we
      * need the recalculate the PIPR (which is not saved/restored).
+     * It will also raise the External interrupt signal if needed.
      */
     xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 2c62f68444..173e0120f8 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
         xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
     }
 
+    xive_tctx_reset_os_signal(tctx);
     return qw1w2;
 }
 
@@ -349,6 +350,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
      * escalation found in the NVT above, there could be a pending
      * interrupt which was saved when the context was pulled and we
      * need the recalculate the PIPR (which is not saved/restored).
+     * It will also raise the External interrupt signal if needed.
      */
     xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 126e4e2c3a..f7eea4ca81 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
 void xive_tctx_reset(XiveTCTX *tctx);
 void xive_tctx_destroy(XiveTCTX *tctx);
 void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
+void xive_tctx_reset_os_signal(XiveTCTX *tctx);
 
 /*
  * KVM XIVE device helpers
-- 
2.35.1


