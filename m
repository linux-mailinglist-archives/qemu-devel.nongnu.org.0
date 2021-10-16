Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB24303F2
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:29:37 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnV3-0004WI-0E
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGO-00017a-Dp
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-0006Gl-Jr
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id g184so11679179pgc.6
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=vqN5B88gt4UxlDLREu1jcSDEbUOGA2R6NktQT7Pt4xW+PBm7gMFevvzSH39AyUEUaW
 HRcIkCPayRz718iOu36b7wkj61s95TqWfb0zcCF4SX0udn5WyubeeRwckE9+IBaynMNh
 o77/rxL/ySA7FVn+LVn+9rS0jsUbjovAcNGGopa42pkoOeWRBywNo7ypnBtskEWkXDUs
 VSf9mnMxOw6OD7pGz1/a+sKBvrudfCVpB+Bt7Mkv0JcDBZkJKp/nDi9B7IVAw6aiQBN7
 rEXyYtpN/yKjC2SXqX6oYH4SyyppYcgdxevBGv5dpSlbmRGRt2vG8g44wdCis9gmgn2j
 IxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=iKDiLfdUXK8L+9cbjKSYskuqjpXpTqRj9hLZ8nEM3E8beBUmiAmAY0D/bUU8LRmt0Y
 tuGvNJ/UmxdisU4J8OHOGEzFGYIx3RGnB7E1UejKbrKc6NlylGRqrkrEKcgeffcanPBe
 6uEDMNIXd5XskgX3RetsiHA0+2axMDanblPKTQZQK/Nmj3A519ock2I7rfdHDkaTwdnn
 Lpk3Gsh7C0Us4YQjBj0r82IirzNRAhyERidDahMT2zamr2U3iaZpfs0WX0Jf7uEAb4+7
 rLVuSGOkMMx1YbE3V+C+C9agaTEvyqgNb7bmv4bKn6tvoj28TVLfMMSF9QSiJ6hkCG5f
 mSCg==
X-Gm-Message-State: AOAM532OCToXs1NRd8WrhftZ2XQCxo1lS/N+EZVBPDD0TdkXKlNrolnr
 EOfUL+5jKYWwM8BP5Knyts0UVtUX8Mr/PQ==
X-Google-Smtp-Source: ABdhPJwfq3uSsS1sBvbwMGIDdH1h7UHr9gkp5F+2YE6Xu+lkmIUdzqtW0CocWBlq77twn4HLr7bn5g==
X-Received: by 2002:a62:7bd5:0:b0:44c:72f5:5da4 with SMTP id
 w204-20020a627bd5000000b0044c72f55da4mr18755681pfc.48.1634404465337; 
 Sat, 16 Oct 2021 10:14:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/14] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Sat, 16 Oct 2021 10:14:09 -0700
Message-Id: <20211016171412.3163784-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-riscv@nongnu.org, frank.chang@sifive.com, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org, frederic.petrot@univ-grenoble-alpes.fr,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 66dd51de49..c62eea433a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
-- 
2.25.1


