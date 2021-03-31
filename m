Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AAE34F8D8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:36:48 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUT9-00057I-Sk
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIO-0004cl-3L; Wed, 31 Mar 2021 02:25:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIM-0000tF-B5; Wed, 31 Mar 2021 02:25:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX726ygz9sWk; Wed, 31 Mar 2021 17:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171927;
 bh=0kiOf+g2tFsDfVG8GlftgnZyqsTTnUDCv93HiqL9+k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E0TpAACthjehmHt6dBgc26napsE8ySNwszxPeFBocmBzk87gQjvLBe9lIeZ+uPHID
 Esq+kERPodExxgEUNjdPY4vIcV+lFohgObL8xtrnZptk7T1el0BaiuKJDJUmC8Pwog
 zD9U13dMEPwjCAar+2HmzYy5u1n6iUUryC86aA10=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 5/5] hw/net: fsl_etsec: Tx padding length should exclude CRC
Date: Wed, 31 Mar 2021 17:25:24 +1100
Message-Id: <20210331062524.335749-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
min_frame_len should excluce CRC, so it should be 60 instead of 64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210316081505.72898-1-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/net/fsl_etsec/rings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index d6be0d7d18..8f08446415 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -259,7 +259,7 @@ static void process_tx_bd(eTSEC         *etsec,
                 || etsec->regs[MACCFG2].value & MACCFG2_PADCRC) {
 
                 /* Padding and CRC (Padding implies CRC) */
-                tx_padding_and_crc(etsec, 64);
+                tx_padding_and_crc(etsec, 60);
 
             } else if (etsec->first_bd.flags & BD_TX_TC
                        || etsec->regs[MACCFG2].value & MACCFG2_CRC_EN) {
-- 
2.30.2


