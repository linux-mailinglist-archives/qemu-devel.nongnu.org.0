Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B7480EFC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:43:33 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Ow8-0000wP-VG
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:43:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnD-0003Zj-18
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:19 -0500
Received: from [2607:f8b0:4864:20::530] (port=41619
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnB-0004dF-HX
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:18 -0500
Received: by mail-pg1-x530.google.com with SMTP id f8so7268471pgf.8
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63Y4BCN3lQXD6KqJW3XIboe0KMpiBnXkS6TapXO/9NA=;
 b=CUdgsu97NPEUVVeKcUndM7xnEW3vxt7u4uTECsQAWozZFbzD0j1e4wkemg05kvAjBx
 1C03/pP7ji4mNWDAZraA4RK1o0A9cfF45Cpd7AwzNuc+Mb+SvnpQ/Kz7buRH5NBNEGBp
 tECoMAQBgkO+zpxQcrSlghPCbHEuGfVwSE+F7cZCDWwGe6OjEdDfROXQNqj5fjc+aChl
 S/PrlG5ZivXcjdSfbUd/ULxzDnGK9Fu+oNGJ57qL1+yPU4eaURuuQJs1iXAbnXVupSbk
 h/SfMbpuAnHug1OpzRiVupOJZVCx4Z0ut0NNOgcxjI53w+b1+UEdQPfq6prelIHfW5CN
 F+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63Y4BCN3lQXD6KqJW3XIboe0KMpiBnXkS6TapXO/9NA=;
 b=z4DPnajoLdXuIlAWnEApL4Z4iTULQ+XUuxmr+9U4zOfcIiL46N9rgTlXmq0Mb15FKX
 lV4PKL6LXmH8h+UXKNz5V8tl/mwxiN43XFzRwbL0CbfJudvpeKxiwpEGll1DK3OjKS9P
 PcweQ4kf/uukKraeKOnsloUZdRKlWtPQE5Zsaleaubj7h9e6NpK98EaMbPTKqMmdk+XJ
 E/p2OyGXE1HZYOsz2m5W6zIRiYDUViYFI8hjlXvfTS9LJ5lUJ8b4ydFtyadRf09Z8B+r
 U9pQYwwdzyigsP5ePp+8aHj+O7sKflz4qs7p47oABkzfC21nLVPSMIHdrk5VPOM5vMWl
 8PSg==
X-Gm-Message-State: AOAM530G4pxxWERguQG+VuqnFOx812FPvAZ8r6cC0mKwqcV5k8sIqqBP
 4c4/ga5XyDUFriA5Zb2+TyGPFzsT9Hof5RL6
X-Google-Smtp-Source: ABdhPJy+iLzEDa1qDqa1f4ZqNkUV3zzFmECXd6NkcT6eEemVzhBGlKo65PFMg4g/qyF8LT15ENPMRw==
X-Received: by 2002:a63:2c8e:: with SMTP id
 s136mr21729045pgs.431.1640745256133; 
 Tue, 28 Dec 2021 18:34:16 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] target/riscv: rvv-1.0: Add Zve64f support for
 single-width fp reduction insns
Date: Wed, 29 Dec 2021 10:33:34 +0800
Message-Id: <20211229023348.12606-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0aa8b7918f..d7e288b87f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2935,7 +2935,8 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
-- 
2.31.1


