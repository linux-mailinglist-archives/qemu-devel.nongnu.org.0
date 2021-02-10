Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D4315F7D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:31:27 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j26-0007SP-8Z
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipA-0001mA-T7; Wed, 10 Feb 2021 01:18:04 -0500
Received: from ozlabs.org ([203.11.71.1]:54317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip8-0000RH-Ov; Wed, 10 Feb 2021 01:18:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gp66BVz9sWR; Wed, 10 Feb 2021 17:17:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937862;
 bh=Bgpe4aC+zoDeTjF042sb4U31A2n/HLVGDsuxydIAZmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FCHV5znx8DiQV9FvWKUN1eG++QAOQONxqyiq63Sp+3HXumTC3jcWGN06xo7pEWuvh
 gvaWBFoHGzBPylHu1kWPYmvuKIPs4aFHEJHmST9cWuncwMyUAaIJORtzRGvcUEso58
 mKO27dwTE98Qiyvn/KxSn3uphV8wQ4HGOviwQfOo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/19] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Date: Wed, 10 Feb 2021 17:17:34 +1100
Message-Id: <20210210061735.304384-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per MPC8548ERM [1] chapter 14.5.3.4.1:

When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
a DA match. But currently QEMU does the opposite. This commit
reverses the RCTRL.RSF testing logic to match the manual.

Due to the reverse of the logic, certain guests may potentially
break if they don't program eTSEC to have RCTRL.RSF bit set.
When RCTRL.RSF is 0, short frames are silently dropped, however
as of today both slirp and tap networking do not pad short frames
(e.g.: an ARP packet) to the minimum frame size of 60 bytes. So
ARP requests will be dropped, preventing the guest from becoming
visible on the network.

The same issue was reported on e1000 and vmxenet3 before, see:

commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

[1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf

Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC)")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

Message-Id: <1612923021-19746-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/net/fsl_etsec/rings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 121415abfe..fe055d3381 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -502,7 +502,7 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
+    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
         /* CRC is not in the packet yet, so short frame is below 60 bytes */
         RING_DEBUG("%s: Drop short frame\n", __func__);
         return -1;
-- 
2.29.2


