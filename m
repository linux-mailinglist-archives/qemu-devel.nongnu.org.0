Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959E2D59DE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:59:42 +0100 (CET)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKbk-0003eC-Um
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQs-0001PJ-Le
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:28 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQb-00070J-1x
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id y23so5005486wmi.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dpThmaMoogi/5GyS9PRoz+06UyOQ4dJ+IrOLxiQU3vE=;
 b=SCH4N21yuypemMdFsIi94E0a4TicFHyCsEYw1Rw+PyzF1LHQJErwFz+yUp0kAjmrdo
 7nBkdwBkvJAdJx/NH45hIQSl3zn6G5TUfzQPkOnr32cC31j+MesYNh+HuLf68UInH/9C
 jxHw9myWX/pE3Uo4o5FUJoamvLmeT6XADyDNz85tG8ywbbJXAwJbdrjaeBLR6Ftea6fX
 DBuSl0orDHzIZvjeZaBQaiuGY1smGULWRm2Gjkmi3ZxgGvpBRZeklj4j/K8+cfvHF9fu
 9YvfgwjyaDHPXwz4DKoGfyc5EYMIsKyKMHMEcyWScBPsGG+qWXtBfyXsvct5rMVIxZhT
 4OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dpThmaMoogi/5GyS9PRoz+06UyOQ4dJ+IrOLxiQU3vE=;
 b=Px24IdTDSEIKyb8R0zOaR9LzRUIby1YS4M9v7VvAM/pTsIaERGK6nGjJg8mlJSlc6Z
 wIruFby2mcxMFSg51tvarQDe65Nl8a4EaDHZowm2kzNFZQPFq4j1p85VlsYY+Hc1d7AO
 toNkuRoPtZ5DtCfdtJwX9E5MnIT+8mpsBewZ3mxsak5Yo5vAUU5XWby9TOgbRd6b7niI
 c9QP56y1IQ27nt2pS3OzL6YQKwzqhsLoK3V8bcFxbpBpsVlcEU9DcK93nCCtYRuMOsCo
 sjE4rW7yU8NGwBdHaDCOzaXIj82DYc8/m2043JYsX+ABFn8XnzUS7EZ31mA93FLJbv9J
 tsKQ==
X-Gm-Message-State: AOAM532xPRmI/3KjeGOJkEX1JYdBhjslnvZ4hBmfbqm1CBxtBFc9WTxn
 J4Ac1DGfQrUqce2NBk1MJAKi5iWqT9ohmg==
X-Google-Smtp-Source: ABdhPJzxR7OBEjBtycWt/Pa3ITe4Nm15/USiRjjB7wWQPre7HOsHA9xGepFWKgKSCZdmv9o+/0qSlQ==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr7692056wme.44.1607600887601;
 Thu, 10 Dec 2020 03:48:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/36] tests/qtest/npcm7xx_rng-test: dump random data on failure
Date: Thu, 10 Dec 2020 11:47:27 +0000
Message-Id: <20201210114756.16501-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Havard Skinnemoen <hskinnemoen@google.com>

Dump the collected random data after a randomness test failure.

Note that this relies on the test having called
g_test_set_nonfatal_assertions() so we don't abort immediately on the
assertion failure.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: minor commit message tweak]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_rng-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index c614968ffcd..797f832e53a 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -20,6 +20,7 @@
 
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
+#include "qemu-common.h"
 
 #define RNG_BASE_ADDR   0xf000b000
 
@@ -36,6 +37,13 @@
 /* Number of bits to collect for randomness tests. */
 #define TEST_INPUT_BITS  (128)
 
+static void dump_buf_if_failed(const uint8_t *buf, size_t size)
+{
+    if (g_test_failed()) {
+        qemu_hexdump(stderr, "", buf, size);
+    }
+}
+
 static void rng_writeb(unsigned int offset, uint8_t value)
 {
     writeb(RNG_BASE_ADDR + offset, value);
@@ -188,6 +196,7 @@ static void test_continuous_monobit(void)
     }
 
     g_assert_cmpfloat(calc_monobit_p(buf, sizeof(buf)), >, 0.01);
+    dump_buf_if_failed(buf, sizeof(buf));
 }
 
 /*
@@ -209,6 +218,7 @@ static void test_continuous_runs(void)
     }
 
     g_assert_cmpfloat(calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE), >, 0.01);
+    dump_buf_if_failed(buf.c, sizeof(buf));
 }
 
 /*
@@ -230,6 +240,7 @@ static void test_first_byte_monobit(void)
     }
 
     g_assert_cmpfloat(calc_monobit_p(buf, sizeof(buf)), >, 0.01);
+    dump_buf_if_failed(buf, sizeof(buf));
 }
 
 /*
@@ -254,6 +265,7 @@ static void test_first_byte_runs(void)
     }
 
     g_assert_cmpfloat(calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE), >, 0.01);
+    dump_buf_if_failed(buf.c, sizeof(buf));
 }
 
 int main(int argc, char **argv)
-- 
2.20.1


