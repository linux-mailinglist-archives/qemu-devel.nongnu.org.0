Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2441B8C6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 22:56:57 +0200 (CEST)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVK9o-0007h1-0m
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 16:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVK7w-0006I2-NE
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:55:01 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVK7t-0003jq-NO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:55:00 -0400
Received: by mail-lf1-x12b.google.com with SMTP id i25so1458760lfg.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 13:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7NwyCsKPg2tcKPnQR9UCjBUtzzDWMcHY9Hzri/9k5g=;
 b=RMI/7ux6jw6mliUVMWEajoun6rOyeVM8RMxvuqljNJkYATsEyIq41agKma9UeNvOD2
 Ip81Uxu/P6UXIkViWzGwBPLTm+8wYKd2Ob2TBgrZOUlD0+jQckXGPcPiz/eSc490J3ki
 ww4vgpTVny7jxCAiK2Ebl+azPLOMzYoAoOmze7LXJ9N9yFm6rbT6cWLou5iTv/fql7Ys
 lIOH7ajORqjArcvTKZylzxBvSVH5IDc9Qz/IKdZf9797onc0LnV5TXBYKQxZ04kP7r4V
 D0C4aATKlf43UzU/p4GhcMYowA6juXs44z9q2TX1rqvSRuoUotYRhCA4x4CCOJfgFDJA
 z7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7NwyCsKPg2tcKPnQR9UCjBUtzzDWMcHY9Hzri/9k5g=;
 b=zKhJy+Z8Pt3Tw97hMinmxNlI4LFsC7ZK3CLa169Em00OgWPTZglg6eO7xJ12g/eWBV
 Vkf67uBzZBWJeI3iSLt0fd3fAp8npF3zyZScs0Da4E12d65i81z/kj3chsjiuE6KLsPL
 Ar21O5xBhSIHjiuyudiSaKdScB+/XMHVW5FqTosCAmsp6NqUHm2DqKdJH1qXyICJJTLs
 ExsEU8vP0DKkgZmH+1N2IzlRQYLchmWJd+9IxDJjo0O1QVRmpOk6UXuwwMs8n/QR0413
 I99ARgErXj9Zm6i9LB+rhJleId6mh/hJoMax0NeW4GI3fFRX0BhxZRJwVA9Q2B/9WX6m
 BPgA==
X-Gm-Message-State: AOAM530YuOd0zdAYMDRhe9FD2+tvUlow/3Z3HgRJ5ogwy8SHE2hQ2zEV
 9QhyspA+W9MlvmuWss4uqxRgGW4hAewPBf97
X-Google-Smtp-Source: ABdhPJxNS+1PoloHoudw53QSAfrcv99nLGSoJ/XrNPN1kIxuQeOYbogODc2Xxc7ZZ0WyRqMoaPBc3g==
X-Received: by 2002:a2e:b707:: with SMTP id j7mr1946889ljo.297.1632862494715; 
 Tue, 28 Sep 2021 13:54:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id l14sm24061lji.137.2021.09.28.13.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:54:54 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/riscv: Use dup_const_tl in orc.b to legalise
 truncation of constant
Date: Tue, 28 Sep 2021 22:54:50 +0200
Message-Id: <20210928205450.4121269-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
References: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to use the newly introduced dup_const_tl in orc.b to legalise
the truncation (to target_long) of the constant generated with dup_const.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

 target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2927353d9b..185c3e9a60 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,7 +249,7 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
-    TCGv  ones = tcg_constant_tl(dup_const(MO_8, 0x01));
+    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
 
     /* Set lsb in each byte if the byte was zero. */
     tcg_gen_sub_tl(tmp, source1, ones);
-- 
2.25.1


