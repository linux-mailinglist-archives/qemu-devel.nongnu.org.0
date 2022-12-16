Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF564F3F7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IqU-0000RQ-Q3; Fri, 16 Dec 2022 17:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqQ-0000NX-RZ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqP-0005eT-7Q
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:18 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk9so9305446ejc.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PsKnVXEUFtle2sBljg3GOYibf5GE3DbmvaOh7ghHHi0=;
 b=SaHJd9A4VDZlslJV3RgBgsdMQtyCPmvC/H7J1wtW9neQsb8tqHigvVMGtPJ7SzZj1u
 h/tRBNl3ORng14Ede7NZubaB0Lv11EqZK3Cr1SiVasnX/rkh68TjB23btbC+0EnBUa1M
 LsYfELPINBRP+Bk65l9cQNZx4q0dfUAEYYkYvYQBhowqK0grQ9L1zY4jP3rGKGRp7gDe
 pxujFnQsZ+alERakUZZFfVWKRX1CIt+wRSc3K39cqhbBgycf2q+7yXxQ2Z5bILKexc1r
 t1csA3PaTuJTQ8F5lAGZP+1smlp5FJ4qBZ9vvabgGi+NAi2UPe8eQl+yhHYbcltsZf1Q
 j5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PsKnVXEUFtle2sBljg3GOYibf5GE3DbmvaOh7ghHHi0=;
 b=acRHyc7VnV5hmU83BMO58wX8jHBRCtEMRLKzgIbBMz6cYPwZHhAT1i6WedMKr9sUM2
 pDWJj7XCloRUrOT+Azp7cl68h2USqWJM8DMK0o+dVv32SE7sQ3GcyCMwMT5/2jOVEJK/
 A0Co7Y2qwmz1smlXEQ54kCcgD/iGo0r6hcRjzAJ7oVxdRQE1BUdwxy1+nEFqcNkblo08
 WdtAkkrvsH//2zuQFaBsdj/tVSKU8D8Zcl4TIdNWyfCFJG9B0mDITOe0xniMkMEoDYVZ
 iTh0hgu2Xa6fkcDMLF4EOVJHC2qARr9WyZx7Yr/0RygCcViFSHncQssHbKQlEM0YUf7F
 e5Cg==
X-Gm-Message-State: ANoB5pkbKPBNNJNaWdHk7QAuGxkSr9xdDXERAhRNZe5otgWBawT6eK21
 j0T2GR/V7ugw3ovAK8k4d5xfTacnDyCLzL+M17M=
X-Google-Smtp-Source: AA0mqf4DBZ8NZJkv8tXTiNxf3jZypbI40DgyEO+yHGyk3RwSlPCjhaRf7/Q9CeC4AaI9q+amXrhWbQ==
X-Received: by 2002:a17:906:3810:b0:7bc:bf29:c58 with SMTP id
 v16-20020a170906381000b007bcbf290c58mr28222249ejc.2.1671228376255; 
 Fri, 16 Dec 2022 14:06:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fr33-20020a170906892100b007c09da0d773sm1289223ejc.100.2022.12.16.14.06.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/10] target/m68k/helper: Include missing "cpu.h" header
Date: Fri, 16 Dec 2022 23:05:34 +0100
Message-Id: <20221216220539.7065-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

'dh_ctype_fp' is defined as 'FPReg *', itself declared in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index c9bed2b884..aaf0e1668e 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -1,3 +1,5 @@
+#include "cpu.h"
+
 DEF_HELPER_1(bitrev, i32, i32)
 DEF_HELPER_1(ff1, i32, i32)
 DEF_HELPER_FLAGS_2(sats, TCG_CALL_NO_RWG_SE, i32, i32, i32)
-- 
2.38.1


