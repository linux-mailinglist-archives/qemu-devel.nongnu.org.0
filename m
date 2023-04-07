Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9D6DB3DB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:02:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkrLc-0000AK-1H; Fri, 07 Apr 2023 15:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrLZ-0000A7-Te
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:02:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrLY-00046F-5m
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:02:05 -0400
Received: by mail-pj1-x102e.google.com with SMTP id l7so40433064pjg.5
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680894122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=rMblbD2odMTUnuW8jivPu+nH+4U7J73whYaNk7FMLX5QFvV+O3v6PX3WahZa8y17jd
 xXM4FYdCL+QINKXvFce9yFsjFKnYhbkfh67wIR1SZn5O9zhOGhGniqMiDmXSVriDgvrD
 ISnvsfFFu9hw/AqxOWX5mXr0AnIF7mo9wv4pp9XxFhqVY9Ytbc2bUaeDXGsIK+SZpfd+
 F5YJFnPZgRgHOYUZcl6VbF6lvxmoItl8zmeXayUlcwidIxqcJ63CFjopjUc7XKF6nYH6
 6ZCs34CudW5z51ELAvtzL/ZyhgS4zzEIW945p4UK8KkqG0rC2zsJSfmHtwyjfgRYnOy0
 34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680894122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=uwZqTe9N3dwgznAdYQYqkhozY896ZFnNvF1Ob0VXoJsmaBWu40qsukxmLXOxrz16V7
 FTckUSFZ2zx0vlKH96w/uxi2FeDohTm/Nhzx3donMJX0479vI74XLadHuTWbQrvIHUwQ
 wfO538TLA+8oaaUa9gSoh9/gMsNaf2Mm9iWg/Uzk4BqjMoav36dtFgv2DkVXncK4Pyre
 mkOwZHhwdv4OTyDLcA1elD9/E2qzk3HqpN03L6orioub80+WoPz99sWp0zH7vCko8S53
 go5JIrqjGCvp8MfkpuIDXUzgZMCDp8UCc5J1inikxv8nDSubTBHdsJJCcdJnRjj5DwDt
 SJig==
X-Gm-Message-State: AAQBX9eXu9dmkX9wQ4X6l/NTBXbP7KONUhChZXyz55La1fWoA7+3LCjF
 obJigABVOks/eOi+jfx7E47EtEPoTCfBvTZLdGg=
X-Google-Smtp-Source: AKy350YI3IYRqur3PHBsOBxf4FgCInbRjsA6kiFsXGJouRJfPtIYetDfBAACsrLyrV/d+8EpW805Sw==
X-Received: by 2002:a05:6a20:cb47:b0:cb:af96:ace7 with SMTP id
 hd7-20020a056a20cb4700b000cbaf96ace7mr2712196pzb.46.1680894122151; 
 Fri, 07 Apr 2023 12:02:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a63cc4b000000b0050bc4ca9024sm2951221pgi.65.2023.04.07.12.02.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 12:02:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0] tcg/i386: Adjust assert in tcg_out_addi_ptr
Date: Fri,  7 Apr 2023 12:02:00 -0700
Message-Id: <20230407190200.3259312-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

We can arrive here on _WIN64 because Int128 is passed by reference.
Change the assert to check that the immediate is in range,
instead of attempting to check the host ABI.

Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..5a151fe64a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1082,7 +1082,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
     /* This function is only used for passing structs by reference. */
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(imm == (int32_t)imm);
     tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
 }
 
-- 
2.34.1


