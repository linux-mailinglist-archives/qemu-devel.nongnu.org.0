Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8D2EE99D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:11:24 +0100 (CET)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeR4-0005RP-0m
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlc-0005iG-IM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlb-0006fk-0y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:28 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q75so6844980wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdYSuYQvqNKVpq92aM/7Wd5ow52H+eR0/gXxomb4sjQ=;
 b=p1pIzZixnJJdVf3tNQtie+BS/J9X6mCCyj5oom4aY6rxUcdFR87nVvnNZxj3/d6AO5
 +sNJy7DbIn38NuGPBAawa3G83YzTRF8eR4XWGg3sdoEkaGhKStegzMKZf27WgeVyAA/w
 X+Esuf7b+chUIP8OTLp6wNCNuQhZIFgggjlH5mSgYwQpAG8r8DGTnoiulIDD2EsNYkcy
 WMD2VK/d4+AfT417dztTwV9dZIFxX1guExgmLZrKXKQBbzAhmuVA1UPH35tM1rPdyno1
 +zSDdxO8II4oA8Jswe7FjtDcjPzY1uNyYVTnYsSEFF7Zqecnu1rPlgF1lQFwjb6VaapS
 zNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fdYSuYQvqNKVpq92aM/7Wd5ow52H+eR0/gXxomb4sjQ=;
 b=h5ulNERzY8Egd+AYIx6xZpb6WcdQPNJ4gDCZKDxR0GlJDQkBo4Ug6/EuG+HNC66F4W
 NZExhMFGalcjoBhHW3ig29B0iw1yrZvdNsaRk0Ca4EzA4s9JvbVs40iyyPHjObhMgtx3
 erdtQM2uTIog8tDPB12/C1M09/Dzp0eIQ+4MO/iDKHaRe4Tzyy12naTJxR7LOxvOu25Y
 5EQbGkjNu3aHZ4x5/P62N+mbzNnMBXFqdqc1+178Mm+fWXr94l0hxlsLJKNFFReFknH+
 oQE49RsvkafL/D6DwjT4hlZ8CsQSQyeV5h/tkVAqO3qv+B7xEiCWgjGw9E4yRUuvxRpx
 qr0Q==
X-Gm-Message-State: AOAM531tPmZP8lZFCxFvp1vPkRzwnrbdBSptnCY+lN53dx3VA1VHR1Uo
 5tZyOvszNsnL10tX1N9UJhR7UfBASWU=
X-Google-Smtp-Source: ABdhPJws5xak3FcT1HkGs0Ly6rut//3AP/lYHP4MA74T0CtSIKncybZuO1pBYPc0CUfac9oScLTv7A==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr537869wmc.102.1610058505516; 
 Thu, 07 Jan 2021 14:28:25 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id v20sm11076739wra.19.2021.01.07.14.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 64/66] target/mips: Convert Rel6 LLD/SCD opcodes to decodetree
Date: Thu,  7 Jan 2021 23:22:51 +0100
Message-Id: <20210107222253.20382-65-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

LLD/SCD opcodes have been removed from the Release 6.

Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-13-f4bug@amsat.org>
---
 target/mips/mips64r6.decode | 3 +++
 target/mips/translate.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips64r6.decode b/target/mips/mips64r6.decode
index 8c3fc5dae9c..609b8958d25 100644
--- a/target/mips/mips64r6.decode
+++ b/target/mips/mips64r6.decode
@@ -21,3 +21,6 @@ REMOVED             011010 ----- ----- ----------------     # LDL
 REMOVED             011011 ----- ----- ----------------     # LDR
 REMOVED             101100 ----- ----- ----------------     # SDL
 REMOVED             101101 ----- ----- ----------------     # SDR
+
+REMOVED             110100 ----- ----- ----------------     # LLD
+REMOVED             111100 ----- ----- ----------------     # SCD
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f46d7c5f80b..9f717aab287 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28871,7 +28871,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         /* fall through */
     case OPC_LDL:
     case OPC_LDR:
@@ -28889,7 +28888,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_st(ctx, op, rt, rs, imm);
         break;
     case OPC_SCD:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         check_insn(ctx, ISA_MIPS3);
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
-- 
2.26.2


