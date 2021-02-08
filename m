Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B403135A1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 15:51:05 +0100 (CET)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l97sV-0004xy-MF
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 09:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l90Ha-0003pT-9b; Mon, 08 Feb 2021 01:44:26 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l90HX-0000tK-5K; Mon, 08 Feb 2021 01:44:25 -0500
Received: by mail-ed1-x52c.google.com with SMTP id z22so16747581edb.9;
 Sun, 07 Feb 2021 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QtNuY0KCojVjT0I/t46B3F2x/WpcH9nSiaFuf68AXEQ=;
 b=c3RpnRjxGl6xDctrmeTPOCHvX7yIKW2/rL9J6oo5wn3NtWwjGYl/co/FXYpkTvROgF
 roXGzSzXm9d8b5uf3n11XYgFS+UM0x3nWDareOa6Wjis31B8jmSCIUED2o3KgBOAJmjN
 bJr0CkZFCPC9G2n01DOQ1mFqajmIG730ZKXlM4Zt2mYDv3wqhGWhCcy7FPZFV2KSWwXP
 aGi0JKn/jjQL26G2CKQM6dm4hgeUz3pcf54tUAarX75Q/Oyg11hDd2o4KPnnYcVoWoSB
 cKJjsd+6vtEMoyUstWfviiWaaZnZ5fUtkHt/w+GrzKnXZt4x5emAZVW5OZDtE+60HLMn
 aTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QtNuY0KCojVjT0I/t46B3F2x/WpcH9nSiaFuf68AXEQ=;
 b=Mrhtng9/viRhN+ic+FQ2o3Q0vKmcYdc+A5Yn7SQEt/WUnXxDWxu3DPChqXsTTT6PL9
 Yutge7zYDIfx57YqCaeMuEfAGV9mkavnR5P6siQ9o3dHO71HBK4pXMk9IMgXqjILmC/5
 qeh0MTlihflSjj2zK4Gc2onpn9iaLVSOexC99BvbwAbG60C+kZQboryeeuv+PxraLjF2
 UAKMKAWdroPn0CpUc1IP4r0HILnGtD39m1Db1Iba73fgBF9DYwdPb6xO8SOzd/DFgH9V
 0mNumMC73QEFuHgc1+GbU2O94sAxlJu6tFR4a7kKzro6jJjY1sHEG/MUAM8OmC3289oD
 NY6g==
X-Gm-Message-State: AOAM532ZsYV25ACgERYgb58dRHZ/Cmk5msRmjFnlAsp0apkgJJUKVham
 oYSSoTuxnVH8LiV7kDWG/VU=
X-Google-Smtp-Source: ABdhPJyN9KInvyXsgNTSx8ZleI9sSOXNscYmeJXY9KgXgXEfDJmeywq+9TkSTOT3114tmYLVuyAZGA==
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr15589842edw.279.1612766585504; 
 Sun, 07 Feb 2021 22:43:05 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n2sm8366752ejl.1.2021.02.07.22.43.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Feb 2021 22:43:04 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH RESEND] hw/net: fsl_etsec: Do not reject short frames
Date: Mon,  8 Feb 2021 14:42:56 +0800
Message-Id: <1612766576-7792-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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

RESEND using correct email address

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


