Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350012CC5D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:48:30 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXAz-0001K3-9P
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7K-000537-LW
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:42 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:42412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7J-0002bt-8T
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:42 -0500
Received: by mail-ej1-x644.google.com with SMTP id d17so5900055ejy.9
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfZKBB7TEk79ikaLZVaA0qdMSWTD8SEXSh/4GRS42BA=;
 b=P95A6tbhEC27Gb2iNPVIYBHFIIvucWz+VR+a4ybKvU3EiTnVdOdYajv6KzVoLOw1vi
 A5V1AmZVeBhnxduxA8gceXaEvcuEIXVge8O1e4n1GovoLkYDGjTiuil+mktQHpL9YvAA
 /BUVrienxo7FMO0jf4z1LVzfH49eNkNd8CTbt+APgo340yoKP77xI0/WAXuY39ujR0W+
 inWBo6IXm1A3Qwr5oxXmVJeFB/481K9L+0E5jiJ/j1DVjBfJFy7uLyjpVfKD+fmVNXJg
 q26FGfDnStuNY7oJYTSdkNTZ1f9UxxxdYRtnCK+Mitu15gS/DMkF21uwmDPDYy4xFL4a
 G+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EfZKBB7TEk79ikaLZVaA0qdMSWTD8SEXSh/4GRS42BA=;
 b=GYAyvmBJ1xtOwUussnxnUET+EWL74iyVRuatGsuR4SYRSs7J363efoIUGKteyhpjVt
 p7MLT++o0jbBe6ZsSYSKZwpy7GUnwfTSmkNmQtmMZcmgZSgsDiNpPalbXwy+8Iak8jvv
 wDwJrVNnJ0yaTjTsZk6l5wkZs65h2SBsTUa/zulAnr0yu2Azra5s9X+3g76o2nKLXfkx
 zcmUMhAWp9x7A6FpFITswaOJD5oSxZhjACkbMfyG/7ETeTYonklqNsSYSmoqo/0XJNOS
 WLpWyO/7NmWcpEvaXqGinJStnCi6VIqdJkTD9ZbaIW7C4kEx9Gg/L+vJORmP157HH5UM
 Msyg==
X-Gm-Message-State: AOAM532cPSCDYoXzXcJr3k3U4O1+76Rnshl6NBgN+alFkdupb48t31DJ
 U4iAlCZ0qHrRjqQh8BBTRJXVZsYxa1k=
X-Google-Smtp-Source: ABdhPJy49hwDReaOMfO3lnaEZQ3M3+pPQZ3B7DhL9efpAUnk5pW2RtqwkM/bDuoXEOF/WQE/LJCZXA==
X-Received: by 2002:a17:906:2a19:: with SMTP id
 j25mr1082013eje.506.1606934679580; 
 Wed, 02 Dec 2020 10:44:39 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j20sm426900ejy.124.2020.12.02.10.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] target/mips: Simplify MSA TCG logic
Date: Wed,  2 Dec 2020 19:44:10 +0100
Message-Id: <20201202184415.1434484-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only decode MSA opcodes if MSA is present (implemented).

Now than check_msa_access() will only be called if MSA is
present, the only way to have MIPS_HFLAG_MSA unset is if
MSA is disabled (bit CP0C5_MSAEn cleared, see previous
commit). Therefore we can remove the 'reserved instruction'
exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 803ffefba2c..a05c25e50b8 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28697,13 +28697,8 @@ static inline int check_msa_access(DisasContext *ctx)
     }
 
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
-        if (ctx->insn_flags & ASE_MSA) {
-            generate_exception_end(ctx, EXCP_MSADIS);
-            return 0;
-        } else {
-            generate_exception_end(ctx, EXCP_RI);
-            return 0;
-        }
+        generate_exception_end(ctx, EXCP_MSADIS);
+        return 0;
     }
     return 1;
 }
@@ -30547,7 +30542,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
 static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
-    check_insn(ctx, ASE_MSA);
+
     check_msa_access(ctx);
 
     switch (MASK_MSA_MINOR(opcode)) {
@@ -31194,9 +31189,10 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         case OPC_BNZ_H:
         case OPC_BNZ_W:
         case OPC_BNZ_D:
-            check_insn(ctx, ASE_MSA);
-            gen_msa_branch(env, ctx, op1);
-            break;
+            if (ase_msa_available(env)) {
+                gen_msa_branch(env, ctx, op1);
+                break;
+            }
         default:
             MIPS_INVAL("cp1");
             generate_exception_end(ctx, EXCP_RI);
@@ -31385,7 +31381,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 #endif
         } else {
             /* MDMX: Not implemented. */
-            gen_msa(env, ctx);
+            if (ase_msa_available(env)) {
+                gen_msa(env, ctx);
+            }
         }
         break;
     case OPC_PCREL:
-- 
2.26.2


