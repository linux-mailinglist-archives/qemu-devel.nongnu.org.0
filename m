Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DF7678DE8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:07:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gm-0008RC-LE; Mon, 23 Jan 2023 21:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gg-0008Q7-Nu
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:27 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gf-0003ut-9X
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:26 -0500
Received: by mail-pj1-x102a.google.com with SMTP id dw9so13412844pjb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZ0R7Dq38BbYtuszwNBcRlA+IEjeNWX33fjdLIAJGTI=;
 b=BUvfGklQqtb0GyNMzDOZa8igbc9eH7ijUQWkoQRyeMczT1ILwRpwTZZjOmOWADFCIZ
 ds7FI8LGrOdVatU9j3Q3vqJU73N0vZfQYRTRgak1Q+8p8IDqHmC+qY8PQuuDAngZkbFR
 r4K5fWhVDYq9HZQTuFUvA0fOYmJ+gOhZZIGRGiK7jLyf1fba1zdx5TaQm2ghVoZDdNJu
 wUoErab5xjxfFgvgfirGEncHlgvunOGXW+NdDOr1QdHLU5oymgbU8QMwk0xxHpQi6Dnn
 xt1npSD/eGE6KluuEvOROUs6Z6TEJqt1ooQXUVvKLn8qSp254FWnis6LJeBCZeovlIX2
 amiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZ0R7Dq38BbYtuszwNBcRlA+IEjeNWX33fjdLIAJGTI=;
 b=jZp3G4TWxWY//JI0v9FsdqhzcMocWOx7ulXxYikfttutEWiGkC46WA2txy9iclpWgu
 HQrMJ3/oLJ6u7UanW56a/jfA+1Ml1LYEuBIoxKYwi6BVbGwD0a3KsCqYr0yHVXfN47H4
 hcM5uZXurknZJUqjYt8ErMn+kJReOG8RiqLdONW1dCHcMvUAaZwwwPvQcIpuuw0tvYqK
 2R4bJcC948UdXKDa4WYNBZx9yKivZU9Bu+NG+Zr7RF9qdSEhw7DuqNx/KppP2GUb8DWk
 ympdjWRijfFm2JpaqIvGUY6DO0QZgs2Q0kR8JQXx02fcWSH2nnnPoaIO38HBcTjcXruY
 ySjw==
X-Gm-Message-State: AFqh2kownE2kJ/FX5w6Q5WveL+c8GzQ4ZU6iaCeIKtw8tXCftfNfDaYw
 qUZoFgm+PxpNhlP0Dvg8+tUlvOIBToMr8m3g
X-Google-Smtp-Source: AMrXdXuA4kGVpdQGzzlp2Pg+WAZKB9m/90E5sxpza/CpXwdd/ivMyABkiCg/CAC17wOMPmzxTF7hkA==
X-Received: by 2002:a17:90b:3b45:b0:22b:b6c5:fa7e with SMTP id
 ot5-20020a17090b3b4500b0022bb6c5fa7emr13588174pjb.35.1674525923849; 
 Mon, 23 Jan 2023 18:05:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PULL v2 08/15] target/loongarch: Disassemble pcadd* addresses
Date: Mon, 23 Jan 2023 16:05:00 -1000
Message-Id: <20230124020507.3732200-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Print both the raw field and the resolved pc-relative
address, as we do for branches.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/disas.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 7cffd853ec..2e93e77e0d 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -519,10 +519,6 @@ INSN(fsel,         fffc)
 INSN(addu16i_d,    rr_i)
 INSN(lu12i_w,      r_i)
 INSN(lu32i_d,      r_i)
-INSN(pcaddi,       r_i)
-INSN(pcalau12i,    r_i)
-INSN(pcaddu12i,    r_i)
-INSN(pcaddu18i,    r_i)
 INSN(ll_w,         rr_i)
 INSN(sc_w,         rr_i)
 INSN(ll_d,         rr_i)
@@ -755,3 +751,36 @@ static bool trans_fcmp_cond_##suffix(DisasContext *ctx, \
 
 FCMP_INSN(s)
 FCMP_INSN(d)
+
+#define PCADD_INSN(name)                                        \
+static bool trans_##name(DisasContext *ctx, arg_##name *a)      \
+{                                                               \
+    output(ctx, #name, "r%d, %d # 0x%" PRIx64,                  \
+           a->rd, a->imm, gen_##name(ctx->pc, a->imm));         \
+    return true;                                                \
+}
+
+static uint64_t gen_pcaddi(uint64_t pc, int imm)
+{
+    return pc + (imm << 2);
+}
+
+static uint64_t gen_pcalau12i(uint64_t pc, int imm)
+{
+    return (pc + (imm << 12)) & ~0xfff;
+}
+
+static uint64_t gen_pcaddu12i(uint64_t pc, int imm)
+{
+    return pc + (imm << 12);
+}
+
+static uint64_t gen_pcaddu18i(uint64_t pc, int imm)
+{
+    return pc + ((uint64_t)(imm) << 18);
+}
+
+PCADD_INSN(pcaddi)
+PCADD_INSN(pcalau12i)
+PCADD_INSN(pcaddu12i)
+PCADD_INSN(pcaddu18i)
-- 
2.34.1


