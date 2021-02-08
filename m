Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95AC31309F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:22:22 +0100 (CET)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l94cX-0005hk-MG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l90GB-0003fl-5S; Mon, 08 Feb 2021 01:43:01 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l90Fi-0000XL-O5; Mon, 08 Feb 2021 01:42:46 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so16809410edd.5;
 Sun, 07 Feb 2021 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vfyGIVBLh46WHUXmpy8/GIwWAOX2AIpZ5UzYaoUuAEQ=;
 b=Ks2PXtH4rkJPalqPrzzIO3fnv80Bm6CS/cHkqZOmocsU/OQTL1NsOUbU4rY2yO7g9+
 tuPsayX/rOts3PyTOifReRr2J/3NsnqJjHHHTLaqsXW3itq24z4WQnV8aztGumx66ifK
 OA1UZDwKiKikPay2w3yLnuUziPXtyXwk0Zew8s6Xal9VMdjMj15iMTkV/W3ZlVVgE6AX
 t5GZMzaddl8LqOlSWlyNVGYrU7I+MwpZXeGITLiCg0UUkEzKaCf69J+XzM1QL/8IgN9y
 /y5efwUVSYsPUA8CssGOq5NPuA8LmTFceITbsDLSe3wYl9+GjMgnm2qjiS9cFnrX7Daf
 I0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vfyGIVBLh46WHUXmpy8/GIwWAOX2AIpZ5UzYaoUuAEQ=;
 b=ZtA6YW7/xnU1jbjdr7IByEMZueU9BxLePbPEtrI8N8+WbPkwhjNze5v/NbeidTRu8R
 Ls4V9dKMtlosiLe/N7X5wg6kxA8hoJHprf0ptn2JyTo+aY4uOcw4aI4d20ISGnzEniKg
 yhNnj5O/UJ+ZSAwsTWYM/TA+hHhimkNuglUW4vw+rnqe9swOSocW1wqPabd0v89vxY1L
 8nYrnevmGSScXkQGUofMbLAbuuusGQlgKIn+2VNHIlTHUopnNgZZJRa+SUaywM4TD8Xj
 bDxVfumSMQKMH81Ej4eHwpa/fpfx3Qubg9xvr6NkGFCGXGhdt91ZY+txFaDLMovexps7
 q0iA==
X-Gm-Message-State: AOAM530vyUjakh5rzF7yq4pZDgp8wbvdAHpj4MzIV+YkultCkTa/km15
 o6f5PR8bk6WbwH/awSoz/KA=
X-Google-Smtp-Source: ABdhPJy0lZBHtVESecesvXy1CvlEW/39/dx4sADNHV5ezd1y9J6buK2bW06iAcqiy36KCbxlb2IaAw==
X-Received: by 2002:aa7:d98f:: with SMTP id u15mr15806198eds.267.1612766476719; 
 Sun, 07 Feb 2021 22:41:16 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b4sm3222734edh.40.2021.02.07.22.41.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Feb 2021 22:41:16 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net: fsl_etsec: Do not reject short frames
Date: Mon,  8 Feb 2021 14:41:05 +0800
Message-Id: <1612766465-7639-1-git-send-email-bin.meng@windriver.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today both slirp and tap networking do not pad short frames
(e.g.: an ARP packet) to the minimum frame size of 60 bytes.

If eTSEC is programmed to reject short frames, ARP requests will be
dropped, preventing the guest from becoming visible on the network.

The same issue was reported on e1000 and vmxenet3 before, see:

commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Ideally this should be fixed on the slirp/tap networking side to
pad short frames to the minimum frame length, but I am not sure
whether that's doable.

This commit changes to codes to ignore the RCTRL_RSF setting and
still allow receiving the short frame. The log message is updated
to mention the reject short frames functionality is unimplemented.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/net/fsl_etsec/rings.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 121415a..503b4d3 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
         return -1;
     }
 
+    /*
+     * Both slirp and tap networking do not pad short frames
+     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
+     *
+     * If eTSEC is programmed to reject short frames, ARP requests
+     * will be dropped, preventing the guest from becoming visible
+     * on the network.
+     */
     if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
         /* CRC is not in the packet yet, so short frame is below 60 bytes */
-        RING_DEBUG("%s: Drop short frame\n", __func__);
-        return -1;
+        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
     }
 
     rx_init_frame(etsec, buf, size);
-- 
2.7.4


