Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF1A314590
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:24:11 +0100 (CET)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HlC-0003ay-Ii
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Hk5-00038A-Jv; Mon, 08 Feb 2021 20:23:03 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Hk1-0007qK-I3; Mon, 08 Feb 2021 20:23:01 -0500
Received: by mail-ej1-x633.google.com with SMTP id p20so28753937ejb.6;
 Mon, 08 Feb 2021 17:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lj6uPPP+pjUnJIqIb/sUXhKH4snLqv5hUA8CC0Ep8/w=;
 b=FFChucfSherVfe91Lh+SyVeDuiJWIOwxXwE1iZh8sTzzIDCGzI/TnDBnIquPVjEOS2
 5lzPe4KEole5zSFGjntV8LAi/dUlFG69TBclFKBMhpP2gtk9uxz3uD9z710Iq6bANF9q
 tI+3TSQZk4ajrJR4fOvu8YS7Dap2cPnSAqnhKzF3IiaxPq+qv4POsme5XxkbaV/HIX3S
 Mf3yWLJJyVMWzgfnmJxFaa9uvcGGE0WfGzStsAZIAYfdjRJAWjYzRPCwlPhlEhnBgKZ2
 6C4/OG1Fr53iVDvN4QR7afH4HMR2rja7xNCi1K6hhoQJIlswY3uNAZ0pAXBzKuK092jH
 /DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lj6uPPP+pjUnJIqIb/sUXhKH4snLqv5hUA8CC0Ep8/w=;
 b=L3rnwqHoWlXM9NEVwkYoOOfogba7IqwsiVl9vy++kqaqm1G/WBvHcjcsLmvWe4Q9rK
 K3dxIu6t+3j+UwdX0txnD08PR3DvuK6TOZnZ4S87hMGHDELJ1za+0xLYACg7R7YOkmrB
 AWn/jHTk4FN7z3Mfpr3p52fcZZ8LMgLBBPYxI+L5sZCbLSxa7erbRMyN1DlJCWa28mZM
 2hio6eCOQmNhVsjNuBP89HCH/mmoaUEsBxCk3g7/gwiivZIhZqDcaU2g+9L+GY7R81tY
 BLw7z3gL9UNDfuy7pAxBX0XeJlOJBeMPts+XTtCzJA+tzdBLIa8/FviMvpkSQN99/gFu
 hldw==
X-Gm-Message-State: AOAM532WrX36VYzSrtM3afXRiQJnxvWVbW/2t614QhpmSSZT+8n77ojB
 +mnNLjM3Q/O0LWgahYcUVEo=
X-Google-Smtp-Source: ABdhPJyaCLuBTCeeX3Ri88AszUzjuOXW3ZPrrapRMqTyAS/kSGugnlj6QkR57dVgNR43GZ8vvMuCpg==
X-Received: by 2002:a17:906:b284:: with SMTP id
 q4mr19454307ejz.507.1612833775566; 
 Mon, 08 Feb 2021 17:22:55 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id hb24sm8406408ejb.16.2021.02.08.17.22.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 17:22:55 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Date: Tue,  9 Feb 2021 09:22:41 +0800
Message-Id: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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
a DA match. But currently QEMU does the opposite.

When RCTRL.RSF is 0, short frames are silently dropped, however
we cannot drop such frames in QEMU as of today, due to both slirp
and tap networking do not pad short frames (e.g.: an ARP packet)
to the minimum frame size of 60 bytes.

If eTSEC is programmed to reject short frames, ARP requests will be
dropped, preventing the guest from becoming visible on the network.

The same issue was reported on e1000 and vmxenet3 before, see:

commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Ideally this should be fixed on the slirp/tap networking side to
pad short frames to the minimum frame length, but I am not sure
whether that's doable.

This commit reverses the RCTRL.RSF testing logic to match the spec.
The log message is updated to mention the reject short frames
functionality is unimplemented.

[1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf

Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC)")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- rewrite the commit message and reverse the RCTRL.RSF test logic

 hw/net/fsl_etsec/rings.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 121415a..f89aa7f 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
+    /*
+     * Both slirp and tap networking do not pad short frames
+     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
+     *
+     * If eTSEC is programmed to reject short frames, ARP requests
+     * will be dropped, preventing the guest from becoming visible
+     * on the network.
+     */
+    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
         /* CRC is not in the packet yet, so short frame is below 60 bytes */
-        RING_DEBUG("%s: Drop short frame\n", __func__);
-        return -1;
+        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
     }
 
     rx_init_frame(etsec, buf, size);
-- 
2.7.4


