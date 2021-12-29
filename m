Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D200480EF8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:40:09 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Osq-00037g-9T
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:40:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On3-0002zL-Eo
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:09 -0500
Received: from [2607:f8b0:4864:20::636] (port=44788
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On1-0004bD-Pp
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:09 -0500
Received: by mail-pl1-x636.google.com with SMTP id h1so11610804pls.11
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5BjYN/Qmz8BZog3r8YldBNpOG88WmJHhnqNdxU3htQ0=;
 b=BDP7yl4xphrcJGao37+LWZsGa1Z/zq+du+snSK61nLcUid5UGOuXDRSk+HRLJuCyow
 qnaCXlAfHa6VvOHu9EfCeoIp0OLO3PLona6Tw1nvYX3UC60FMKGnINTBTz6LR6Qv9IHm
 FNCgI+oFv0DFXIbG8acIhxPrRzFVZzu3jShHPivN5IpBw2jitTNrtszXxJuuqejHg8TI
 BE+qM8Nrv4sttOi6Y7aazM94cI9HJjKa3z9kHYHtpe9MLt93t1KUwJy5F+bbulHrOJKf
 cRaJ8oJPKBQ5xtIzDU9i2i8zg1wNcjs+njBRC+HBxFnBLeDHtgR9P4DpLumNC/zBYtnb
 Ic4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5BjYN/Qmz8BZog3r8YldBNpOG88WmJHhnqNdxU3htQ0=;
 b=NLpU0PXVhtanJkZjB0asX3yuza6qXtQMorSbkT5tUBWmoxO0cEw19vWvv9gkPh9EaK
 eAMCrzeeCnWTmbuIkTNTe7ZMTJOzPe/y1+alDP37prY2DZEoFjC42EFqw/kHMejAPJTj
 kprKiYBv19zX/TrbTsVkrvF4M5kALWT/khEu+bBmW1PlFGe7ZxusP/hb7FZ7RYuY/29f
 RpgkZElPM3YIZnKczk/9ZJ0nF3do+5NkczvuZ4Ei1QzkvNQ/Uw/gh2IwIfq8Mtgz7Stn
 jQ89xuea7TU+BKRz4TUbMPaiOgmbP4bvZimG8KW/pfj5hf/Qhdw0dOgladKAelkpWiIi
 W6JQ==
X-Gm-Message-State: AOAM532bA2U11J7SFwTr9+ArpVSbWeMd4UYAHnJ977iqKa9PBbkTFUe+
 dxVAMw4sgPLeNo6ZaA+196NfzvLVlLlH7J74
X-Google-Smtp-Source: ABdhPJywqCFp0hqFW16bCXf51g/LVJgveRAcNZ0DkzIW9gzaNPgGQuiwdi+qQGq+xpAN1mWHCB5rdg==
X-Received: by 2002:a17:90a:207:: with SMTP id
 c7mr30077491pjc.58.1640745246345; 
 Tue, 28 Dec 2021 18:34:06 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] target/riscv: rvv-1.0: Add Zve64f support for vmulh
 variant insns
Date: Wed, 29 Dec 2021 10:33:31 +0800
Message-Id: <20211229023348.12606-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector integer instructions,
except that the vmulh integer multiply variants that return the
high word of the product (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx,
vmulhsu.vv, vmulhsu.vx) are not included for EEW=64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 820a3387db..658cfbe10e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1906,14 +1906,41 @@ GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
 
 /* Vector Single-Width Integer Multiply Instructions */
+
+static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
-GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulh_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhu_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhsu_vv, vmulh_vv_check)
 GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
-GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulh_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhu_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhsu_vx, vmulh_vx_check)
 
 /* Vector Integer Divide Instructions */
 GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
-- 
2.31.1


