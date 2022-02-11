Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E44B1BF0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:09:29 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILNI-00039P-Kq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:09:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo8-0005bk-3c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:08 -0500
Received: from [2607:f8b0:4864:20::432] (port=40612
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007UX-7m
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:07 -0500
Received: by mail-pf1-x432.google.com with SMTP id a39so12647135pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3FHMimKJDAjCiqHF0GBMwwzERJvWjLvoPgPfQf5aE2U=;
 b=RiK+VUYBfa5MQUdW/sVybmNEcSNE+5IcPnASLfpYooEY+CKhLOoMUvDZ/d7UBcY8Ck
 NTD5Bw3VDizz48EgQ7HYeopV8SHYVOz5KJHZTIAWJLm/rWHnvCuOFZpA5AbDe1OzeI6b
 UQJSxwkmdTuzrZnkojL7TbMPw+p5a0AzAGnTCcT+83U/Jh36YeO1pfsEfUgYEwFA5fIF
 2f4BvXAutGXbUGkdICTQLnr1h4c7Qh4P22dO5Paurq4nh3Ts/Fzujhd85TytsSY9wb62
 09iNvYytI91BzdE+51mZ/WKW401KHv6ZDvKS3JUfWsHQG5tP2ul5qP0mmErLJebrkEpE
 KspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3FHMimKJDAjCiqHF0GBMwwzERJvWjLvoPgPfQf5aE2U=;
 b=8HyamBUf3cIk3XCCTxszY6X3hOYHPKvH/1nF1TED2Tdkwj5/OoRjAN/exsNswMvGQk
 vrjwEVgcKDSnsC8QZIgDup6FgKLfuAyQ51OZDOMEfwQEiC2R2C5VKW+ESyDT7Z3twy1W
 NFM5Vj/UCC7U7ru1zsv7kg7H1cW7eDS3ACwqa/clpo8oE+7ye/GvraCyQdTEp9K88TIi
 CLjdHBttzMF2+tl2bv/hbSfYVs4/3UgFTKa6pucjuGDsA/ipQ9Z5R/XO/ywcTSafTa46
 WQXRlJBwhISuLaLVsT5UdMYnypF7NXZxZcNXnTGfMBczzYEBAu8igI0BGuUB1nvpVfI7
 0hQA==
X-Gm-Message-State: AOAM532v+QblUD2d6Dy1Bicklb5YU+6bgFgU8I30HrbLt/gQIvBEYs1z
 LzVVS5QRIKEhLA/ixgimZt1ji0G8j92kBGxO
X-Google-Smtp-Source: ABdhPJxWxKjErDO5S7xGrHLCLYzc8QDNYuxdLKx1RDod02Q0L3vaAadFT2MapYU8y38zvznaBzdr2g==
X-Received: by 2002:a05:6a00:198f:: with SMTP id
 d15mr10261245pfl.78.1644543170839; 
 Thu, 10 Feb 2022 17:32:50 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/34] tcg/sparc: Convert patch_reloc to return bool
Date: Fri, 11 Feb 2022 12:30:55 +1100
Message-Id: <20220211013059.17994-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 7ecd02a06f8, if patch_reloc fails we restart translation
with a smaller TB.  SPARC had its function signature changed,
but not the logic.  Replace assert with return false.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index ed2f4ecc40..213aba4be6 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -323,12 +323,16 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
 
     switch (type) {
     case R_SPARC_WDISP16:
-        assert(check_fit_ptr(pcrel >> 2, 16));
+        if (!check_fit_ptr(pcrel >> 2, 16)) {
+            return false;
+        }
         insn &= ~INSN_OFF16(-1);
         insn |= INSN_OFF16(pcrel);
         break;
     case R_SPARC_WDISP19:
-        assert(check_fit_ptr(pcrel >> 2, 19));
+        if (!check_fit_ptr(pcrel >> 2, 19)) {
+            return false;
+        }
         insn &= ~INSN_OFF19(-1);
         insn |= INSN_OFF19(pcrel);
         break;
-- 
2.25.1


