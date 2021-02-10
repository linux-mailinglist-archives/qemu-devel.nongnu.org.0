Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D592315CF7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 03:13:13 +0100 (CET)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9f0C-00088a-EL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 21:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9exi-00075z-NF; Tue, 09 Feb 2021 21:10:38 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9exg-00065q-L4; Tue, 09 Feb 2021 21:10:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id w2so1113840ejk.13;
 Tue, 09 Feb 2021 18:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hk7SbIVq3HLAUxsoyvpqvtLNtaWG6GL+HECVB72xKF4=;
 b=mGmLCEfBQHNMlkasGFumYx1GCExceMA3zIMnuBDC4VAxBvTuUAGQVLHXnq6nrBnZ22
 JRuNHo30mDzF73VAsN37mQCRGoSaXP9BptbtJSIzVvlJda4uYa79S+ljNtoed7BvyymB
 /mApXCK7W+Y3+olIcfmMNlhOilPogBxI8AIGHo/lOUkXRSyIX6OwNF6m0lAWDKn+gm/e
 ABtHzFtT5Mx2w9rxs0Z0vNoqm4BVeYD+90vg1bH2Pe6rSiOZ3YdurnFMUuupU2GLcH3n
 le/TN+BgIvMgbQKHFmqy/Ry8DTd4kjupfbgkD7PGOXJcNLhGPYZjZh9VINATsM2XQhEA
 HI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hk7SbIVq3HLAUxsoyvpqvtLNtaWG6GL+HECVB72xKF4=;
 b=UeN2+gWi2crMLAMpCoRloGqFc2Y5BfZkKgyfFJTmE3ttvrjZDs/Ox2uvkUSbhLptuh
 sgx7mT98xFhi8KNJZ5zCg5SPBHr/pLKE4v4Eijao61zTOR0UX+TETGkVLIdc3dxp5hzs
 iY5+Xt6U4Cxpq9vA2UfvAYARM4JDrGUIeEJr2aDfjl4/4B5dPJU5OUUyxny9YJt3Jhvw
 NGbz+ZMYXA1gHXGHuRKSjtDEr6pmnQyEcFVxkm/M0Pkbg/rpNKMvMNHtP3k4hcd9NPCR
 /AHb6SjTSNyFYSMDsehH0ZdU5PYo10vpi0rx2ZZ2WR+h6xt6L4AF/ywaTL5PziG1gIu6
 K3pA==
X-Gm-Message-State: AOAM5313sDLldkNfQrtjvf2z7+BcCkBmlMHPBUWUEe8pKUMHkwDMKnMP
 01BGG/kKDcmsdPy6quTQ418=
X-Google-Smtp-Source: ABdhPJwPmJRbMTJ0iRusQ41RqxnGQAaVr59jGyhk58PTnEuIBNBY2zsUGiwOzigQuSA8/nWoJNFBVQ==
X-Received: by 2002:a17:907:9626:: with SMTP id
 gb38mr615428ejc.301.1612923034042; 
 Tue, 09 Feb 2021 18:10:34 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id ks16sm251101ejb.30.2021.02.09.18.10.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 18:10:33 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Date: Wed, 10 Feb 2021 10:10:21 +0800
Message-Id: <1612923021-19746-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
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

---

Changes in v3:
- remove the slirp/tap networking workaround and only do the reverse

Changes in v2:
- rewrite the commit message and reverse the RCTRL.RSF test logic

 hw/net/fsl_etsec/rings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 121415a..fe055d3 100644
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
2.7.4


