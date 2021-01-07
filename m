Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0E2EE98F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:06:15 +0100 (CET)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeMA-0007WM-8k
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlI-0005Mr-He
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlH-0006aR-60
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id r3so7146654wrt.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3otSOREwspFZTGVmnwaLoO3N9uKJi1c7L45V7c+1Mcw=;
 b=HT9D+afyPYopDhOH8xG1yMnVMl2R5yK8GjRTe7gP0CD+O/KURKNF3XELfGkuu+BszE
 HXttADITpCa74d+4/2TzIJtS27kpebkg7PEvXIAJvgCmsm3rULxeNFPDN9IkIc2OKA5l
 vu99Vo01PsCL3DPJEruDzh6k9Rdu08Dy7NApOWJ7HpvBBFUIdj/niEN8v6ySrjhScUV2
 udCkWMHIyteQ3ewxG0k8s/F1R3V5BnO9/v5ZawlqXZrCWdyDfnVZbJ30/7WRxbFMnNSl
 qTcj3qmfoi3g16iLrF5bfmqAXcMKfQrwXjOizVJJ/vV5t8EgF64X9j/iQm38zOg+cNcl
 NJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3otSOREwspFZTGVmnwaLoO3N9uKJi1c7L45V7c+1Mcw=;
 b=aHIUTGCcaGORfOXdgohC8FVHoiDnJoCjRraKT2rZwRf3Fb0yXFl0nN8z3dOzqCix2r
 pN1d6g92i4jkmKj+ic6mUw8hmg1DyHvW76pxVkrb8+SWT2oq65Kbn9Q1323DtUVj+v80
 3tAx82lxTY5GHRPHBpT8pGBg7zmFObtKtwitK/+Il/Qvm770UWgTZzNGDcQu4OHxiHW2
 GEAbPvPPEkoFNwcG0Myg7wN2ZixoxPnup4WJ+bMpbX0RReFBceJ+fLFXRYPg0YwnvaFF
 W3szJXbX+0Fxdn4SNurKTc9k6+MfkCCyiMFGKKBnI20TrQyR+qTdNH2R3vf6dio5eRFf
 8CCw==
X-Gm-Message-State: AOAM5307/X+Z0BaEpPFuk945pj16PTJF/5I0e0V4jQpZ2zP8ot5B0iNp
 EbrMoPTML3yyQA1BPyyFy9wU/5XTl7E=
X-Google-Smtp-Source: ABdhPJxtW3I/nOKsLXx6mQmay0VzhVUHJw1O3mSe8PkgVEl0dPlY1zMTbBvNRkTAatGVNp2b5SssbA==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr667882wrq.75.1610058485483;
 Thu, 07 Jan 2021 14:28:05 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r20sm9154498wmh.15.2021.01.07.14.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 60/66] target/mips: Convert Rel6 CACHE/PREF opcodes to
 decodetree
Date: Thu,  7 Jan 2021 23:22:47 +0100
Message-Id: <20210107222253.20382-61-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CACHE/PREF opcodes have been removed from the Release 6.

Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-9-f4bug@amsat.org>
---
 target/mips/mips32r6.decode | 3 +++
 target/mips/translate.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index 7b12a1bff25..e3b3934539a 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -19,3 +19,6 @@ LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
+
+REMOVED             101111 ----- ----- ----------------     # CACHE
+REMOVED             110011 ----- ----- ----------------     # PREF
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 52397bce84b..e8389738c57 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28620,7 +28620,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_st_cond(ctx, rt, rs, imm, MO_TESL, false);
         break;
     case OPC_CACHE:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         check_cp0_enabled(ctx);
         check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
         if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
@@ -28629,7 +28628,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         /* Treat as NOP. */
         break;
     case OPC_PREF:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         if (ctx->insn_flags & INSN_R5900) {
             /* Treat as NOP. */
         } else {
-- 
2.26.2


