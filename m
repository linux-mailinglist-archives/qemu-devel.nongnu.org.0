Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97E2D9083
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:28:16 +0100 (CET)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXyZ-0005TY-LA
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrB-0001ri-ES
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:37 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXr9-0005Nt-J5
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:37 -0500
Received: by mail-wm1-x344.google.com with SMTP id a3so13416477wmb.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiRxwMOsvHMX7da84kOf25+ipqu85MeG7Znceh6cVl0=;
 b=KsQv3qbOe+LI/cP5EbRVc/SVzgzrUF2ZAG/DrKk9RxDzkO0u6E03MnxQWFY+mGEd9D
 /hvwr8carDz8ZIbGZ+BIEDf5/jGNRzqNUIkp0H8jOyVxRKJh068pHSaZlm6rLALMF4fo
 pq6k7mFzjPpMPDe5j73MXeYWB8PQ/ceA/TP8EctzpGirpk+N0nD9ZDZ08IsLJ/gendvX
 7VczUnp/wZk8oQU9W5qWER5e//1av8L5t+znrnIBpuCNRkR+PFBpPERulsbIWmY6ZvTj
 Ld0VBislp5Cwde6JQiZ0cub52eYHa7l27ShjMOwudC2wbeHIraeP6bg2JoTS568jpp2x
 TvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SiRxwMOsvHMX7da84kOf25+ipqu85MeG7Znceh6cVl0=;
 b=VB3tN/VDi6+FMQBahd1AdcQNtcdmnQ0IurbL15hNtpw217BP3rEkqhBHfgvMQFx/g0
 qiayi03YrpEH2TXTDa8I9S7XARz1j5+DECx/IuI2ohOzY5SHgu3rpSSaMHfRc3zS0aJl
 n+28Pq8ivkXc8mQjXhAfZss5tf/BFuzWGxxGFHZcTjivpLoOzdvdmwzdbR6w2bHBXALX
 n0mkqiRRsqdj00mq2oRigVTDSM2PaXcv/76odVBsXOXfVyJAV9FTVPkxTHCB3/n5DU8l
 MP5QwA1sqnqVrzpwGvNA86pKJamxttCMSL6NCPDN3ySTClDI79YTxAk9mJQnRyvBamsz
 gx8g==
X-Gm-Message-State: AOAM531NehJyBncJ8QHw/ibzVgRO8Uq29009ygoRH+XFGLPQlYLDUS5o
 7mEkwrKIHTORHysR5GYtjWRKhD/3RE4=
X-Google-Smtp-Source: ABdhPJxDuA+DFk/Zc3/I9RhXui88zg7XTIi8CvF9r8p0+haLdCa3xW3ioiFyX+skKOBc1htwpOepaw==
X-Received: by 2002:a1c:b657:: with SMTP id g84mr24544929wmf.181.1607890833832; 
 Sun, 13 Dec 2020 12:20:33 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w3sm27387242wma.3.2020.12.13.12.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] target/mips: Allow executing MSA instructions on
 Loongson-3A4000
Date: Sun, 13 Dec 2020 21:19:29 +0100
Message-Id: <20201213201946.236123-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Loongson-3A4000 is a GS464V-based processor with MIPS MSA ASE:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg763059.html

Commit af868995e1b correctly set the 'MSA present' bit of Config3
register, but forgot to allow the MSA instructions decoding in
insn_flags, so executing them triggers a 'Reserved Instruction'.

Fix by adding the ASE_MSA mask to insn_flags.

Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
Message-Id: <20201130102228.2395100-1-f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index ea85d5c6a79..79f75ed863c 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -832,7 +832,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A4000",
+        .name = "Loongson-3A4000", /* GS464V-based */
         .CP0_PRid = 0x14C000,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
@@ -885,7 +885,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A,
+        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


