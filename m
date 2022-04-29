Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080B514330
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:21:45 +0200 (CEST)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkKwi-0006Gf-9v
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKrk-0003Ki-1e; Fri, 29 Apr 2022 03:16:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nkKrf-0001l0-VA; Fri, 29 Apr 2022 03:16:35 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23T5UFVs027185;
 Fri, 29 Apr 2022 07:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=SBNaD07ubmcPx5G+LErOBvKs53ECEu6GVgG5wvLhm00=;
 b=I1XdVHmhA//PJ8zYOIdKYHI0E2kTfTLiDM+xCgQJFJedKRxDM3cSYO2EHTGHmC/V4CRG
 /eVT9Z/rs6MNissDYmEiVtp3JT7kln7hZB0+B4Mh53/GdcznbKNzWF+vByAKODzzw8HD
 gTIBMP5Pjz/t9FNTRxhTp+JpODS1u47+rD6pfpYcQwq93AixC74ybDEcRF16ejSxOnP8
 MXh1r89pQ1LsK5O1Z1qjtNwT2BcXfKmTUDGgk56Pzv7gam+hjsQRnyQj7L6A0bUA+Q74
 c1gq3OZr8+MmqTmhjfHCnKVFHU0GHLeskM30XIjxxR6Q35ZEjI+b1NMcX1gbJMu6CeCR YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqundkreg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:26 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23T7GQ2x006945;
 Fri, 29 Apr 2022 07:16:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqundkrdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23T77Hmk032310;
 Fri, 29 Apr 2022 07:16:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3fm8qj8pm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 07:16:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23T7GLCf53805482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 07:16:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 365F511C04A;
 Fri, 29 Apr 2022 07:16:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F35B611C04C;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.32.10])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 07:16:20 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ppc/xive: Update the state of the External interrupt
 signal
Date: Fri, 29 Apr 2022 09:16:20 +0200
Message-Id: <20220429071620.177142-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429071620.177142-1-fbarrat@linux.ibm.com>
References: <20220429071620.177142-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iPrrM9r5JzswErrpz70z2M8CgZmKN2V2
X-Proofpoint-GUID: ca3XkWx3eGrb8e4qKM5Wxk-hfWpWHDo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_05,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290039
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/intc/xive.c        | 14 ++++++++++++++
 hw/intc/xive2.c       |  2 ++
 include/hw/ppc/xive.h |  1 +
 3 files changed, 17 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index c729f6a478..ae221fed73 100644
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
 
@@ -420,6 +433,7 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
      * was saved when the context was pulled and that we need to take
      * into account by recalculating the PIPR (which is not
      * saved/restored).
+     * It will also raise the External interrupt signal if needed.
      */
     xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 400fd70aa8..4d9ff41956 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
         xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
     }
 
+    xive_tctx_reset_os_signal(tctx);
     return qw1w2;
 }
 
@@ -350,6 +351,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
      * was saved when the context was pulled and that we need to take
      * into account by recalculating the PIPR (which is not
      * saved/restored).
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


