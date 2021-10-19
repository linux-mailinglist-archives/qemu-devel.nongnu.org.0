Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C36432B14
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:10:05 +0200 (CEST)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcchh-0002hj-1N
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZO-0004su-8t
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:31 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZD-0001kL-GY
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id o133so16038325pfg.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=R7qxaeBsIX1on9YaubihiUsdFKU5s4m5VHATXWnawa6mtoHiWPjo1PZWHhdUkTdk2M
 4n4JA4K723xeMyrw8Ih2uwPfwqzkKuTxKJIMUdOPy3lSbNugJAbQA7qgiH3upGV5Kl3g
 fMXnT+LuTxjfc8MW3NR1ggx1hSPW1QuMSPTLpPo+rZXxg8ud2plBgmY7/uO398lRbeQr
 VapxWghOPZ8sBNq4CkdRQBiIYArno46Mpbyu+7jKHYiqYdKmZYwaD9HgOlIq6LT8wWxJ
 Xob0wQSRHMdJLXWar3KY39pEzHYgVOqr3NozxKkj8DJ/pjDsGQXaKlRGOEnRss6r01tb
 EaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=IHFxwlsP2HIVl7ZTpxREbpVOC8Iz4LqsIXcxJdpCnRxg3kTjs+VK75jt90H+b4ZA75
 pwWNDNpOBQVhWrpPNJtxicw44KeP30rXyMQF/6uSnD1eovLukxcDWWvff8i8YG6SuDOL
 xzT+XWw/I7N+C7e1QR7+7q9Dqt8Nbgl2LQkZIPkDuJ9s8q06YQtFkY7HqBLI08tNcqKY
 nKkprQ5zGTM5l9GhfHhtRzQU9NzXJWQc3/RKVvLcsENJ1JTohgTBWavJtAOHh2CDNx4l
 sauxjAvYv1QG8HY4CgnM+rFP0/uZ27ry0jfbThd3tRQq1xTa7TPjh7XMbr60A5VGDe7r
 +S1Q==
X-Gm-Message-State: AOAM531NjcP3m0miQYoLP2+oZeXPujI2buZQvQRLGO6A643VEi8lSstW
 0e2p6K58fkVuwXF7AAgB1tK6TKnClVR3Tg==
X-Google-Smtp-Source: ABdhPJz49dTBzRQMIMgftSZg7wIDS2gKl+nMTEX3FvRzIsUmyMudaXhW7tt5W16VhOGQdnoEGfcl4Q==
X-Received: by 2002:a63:5453:: with SMTP id e19mr25953496pgm.178.1634601678001; 
 Mon, 18 Oct 2021 17:01:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/16] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Mon, 18 Oct 2021 17:01:03 -0700
Message-Id: <20211019000108.3678724-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
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


