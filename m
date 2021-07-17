Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A163CC6A6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:29:11 +0200 (CEST)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4so2-0002v8-HL
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seD-0006xI-Nb
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seC-00021I-7X
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id m83so12650949pfd.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vJFTwgrLYV+L/7QAHTqeXEOD1JYdbKVZbtwn9ca/8k=;
 b=bEdI9q8n47BduQgIUqtwsZKqDjwEvmJ71M0zy4w6Loh9szTjokvoFekdoLzn/257Rj
 qrNcQk+bvHi0DflfAP+IcNYVlYVW9S3ARcgCwlMpSvC3722Le+s431zDoeIybXSG4I0T
 oCfDjUjoS2F6s834ncYV42efNvaFgHRWySfRfoJQw71a9sbteprchfIsaazF2dNAi/A+
 owzHfq6oWfpLB6eNu0JX/dzYNMP4bNhvbo/f18q4iuJN2WRlUgPbTrkxP+S1Ol3USjTe
 AvJMJTYbScjP0Mj6J8999Vu7ZdTtz2tCb49axMAf8AMo8ZwbM5g7miNR+qu6VqoaRM0b
 WhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vJFTwgrLYV+L/7QAHTqeXEOD1JYdbKVZbtwn9ca/8k=;
 b=MVatzp7CVogJRWDDuWFmwUAYk8BgQdB8nDdZewrnrx5bk4Fy723hBJCB0hPx4yeSOE
 7p2IBU3q8Q5BGfM4/8/WdywOMtUYgDKaq6g6jUxQsRd99JkXxszHJYtltqTk9oQzrjRZ
 zegsAjL3Gy1hQ2cLM6QQOFx4fXQmg52/8w8Kbjzp8L7om9GrjwPsIk5U6sN/mndUj5Od
 yiMMHrSKHGuPlAFrE9cQTIltOL8GzVwFvw1peh2CVqEO2YzPYmzdeb8Iuv0NknkH0z2q
 KqUvNB3g4OX415WJRrLYrL4wquxX2eFJUrrkWTMYT20h1DP9l3BfDbXbXfUspyg5ZZPX
 xYIQ==
X-Gm-Message-State: AOAM530yqbQAhN/t7JSkE/QjB6mCoyKbODxxhb4zjhfYgowh76pM8juT
 si7YL9Zjr+MerZoH79sSqdoixtZWxONihw==
X-Google-Smtp-Source: ABdhPJwD6GB3yWWA7GN71U1YjnzcVjy7wIQ+6dJUPyR4kyD5c4UVmAY1eBc3wxFytlW6cnywsaop6g==
X-Received: by 2002:a05:6a00:2ac:b029:331:690d:7f26 with SMTP id
 q12-20020a056a0002acb0290331690d7f26mr17387355pfs.78.1626560338979; 
 Sat, 17 Jul 2021 15:18:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] target/riscv: Reduce riscv_tr_breakpoint_check pc
 advance to 2
Date: Sat, 17 Jul 2021 15:18:48 -0700
Message-Id: <20210717221851.2124573-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The actual number of bytes advanced need not be 100% exact,
but we should not cross a page when the insn would not.

If rvc is enabled, the minimum insn size is 2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index deda0c8a44..5527f37ada 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -973,7 +973,7 @@ static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
        [tb->pc, tb->pc + tb->size) in order to for it to be
        properly cleared -- thus we increment the PC here so that
        the logic setting tb->size below does the right thing.  */
-    ctx->base.pc_next += 4;
+    ctx->base.pc_next += 2;
     return true;
 }
 
-- 
2.25.1


