Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7C42CC89
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:08:48 +0200 (CEST)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malUV-0006kL-Ji
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDk-0007eQ-U3
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDb-0008Ba-5Y
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id y7so3543454pfg.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQFOShy9YY1DJepfHOqgY9HuwdDNt5MEpkLMhh7pnt4=;
 b=mUOn2z/jepdSdSYWlT1WRRQ+azV1Pbd53yQlH1Lfw5IR3zvl/uLdtKHxtu1lqz+itn
 oCFd8Umq+XGuJsnDfkqkmKh9FsmX01CHIqW46sKKWOHMsG1ttEwGMIxgzDb3ivZBi5lW
 hFEvIc93s9O5bkx74S8AeI3/1h5eCJDsuKah3kw+qVCBzgjShZTXhAgJzpqzfhn6D5oW
 Tr0haP85h8VyBfdmnfYpWe+2d7OgBA3ghoVnZW0xKD7Eq5yMp7kjssq9WKYHbAyzYrpP
 PQoWzNtv7Xoxavxdo4DsRdRNi1Jmh+RraLnOWKMnL2621lb6zS/A9ST5QpEjWmLDthUm
 +A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQFOShy9YY1DJepfHOqgY9HuwdDNt5MEpkLMhh7pnt4=;
 b=Gq1oTViS9Qb0Xy7Pen1CU5xIXbGaYey9VZU1VFco4qWGIc3PPEYBL4FORHm3r4Vmhc
 VTk/XDPatQUuiiLbT3H12tOSjBNG/dZNWEKaaTlRXLByWhfxyVLOzgTuWe+s6YxouMJs
 WQy6QV1nt25MWgYLG1pcYwem0MUjVZVhItrBemNqhiv6PBlUOfvIRh2R2PSCgl65GERm
 JPkQt0gSm4S4+SfRxhRx/voaBKeP4WG42n6ugMLDjVnakNZPgHBnRdLmCxK6S5AJKcYI
 8olZhfMaNpIOXfkXofx8q3DKj23FJrD7KosaJGvqTBvhWztxopgTAuHh/K0JqtbW+VbG
 wU9g==
X-Gm-Message-State: AOAM533hW0gAWCX4UMgey8G6enNhfZJpp0WerttcixdPipHvIEiHMAl0
 LcjnNmDpCmg6MykNZgj1OjkBux6gu1+Pdw==
X-Google-Smtp-Source: ABdhPJx4MFGixDAjQlcD/hF6DCDI66FxlptO4U0Fc9etDGu6LUuIhy34MlFfKxplx//E0ag1Q/ZzwQ==
X-Received: by 2002:a63:1125:: with SMTP id g37mr1098471pgl.403.1634158276844; 
 Wed, 13 Oct 2021 13:51:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Wed, 13 Oct 2021 13:51:02 -0700
Message-Id: <20211013205104.1031679-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

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


