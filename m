Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B925108D6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:19:41 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQiq-0000pN-3r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq2-0001s9-2v
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq0-0005Tx-HE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2870420pju.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUgiA6Oi5P+ooqWxIlZ6MCSz3k6th6h8Ep/asqMDiZk=;
 b=TQK5iG/7ibfodsiCXURCfUt9stc1W0OW4XjYHTX5F8y+6Log2X23qnlT9OECpO3c0G
 dE4JKq3p88YmMIAspLqQdTPK0ikWsY0MTGTRcL5VWiyRVcjf0q99vp6K+a1SUyg553hm
 g4w23YTJcobsN7sR+JlvRb035j6aV6HlbGX2Zdc6lVy3KJm0KCt1ir9Ii4DkhyV1twKK
 vrw8vwrfHE3V05DzQFby8eawuTsUGP1/SssDxThdFkPmOwoLqiOjLQVjnkMAsAra9oF1
 aEweWPi7EfxrVpfUcHTaqqV0Bk1z/97FwfYXF92C4HH4HrLJvrdwspbJ3z5XUaV+deKY
 /lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUgiA6Oi5P+ooqWxIlZ6MCSz3k6th6h8Ep/asqMDiZk=;
 b=wiGuPN85xpHtnOtxcECPGGmkTcVoXQBl0k9txsbXeO60QkROtUiLCpnI1vIbhkSYRJ
 MnWX3ghPmg3UNLU7K7/UwqHU07HAWN5tmls0+vzvUBM60ZJGTLLxgWNcVYs0NeGZ70M0
 NRNUeNYSSaEM1/KkkAHrtXdSlDcbP2WSkL6BuOng9guePdXtA+vifqmYFDiUxF/5m7VA
 MadHMaIQkfhanigup55OUF31ZyMn+wMK0j0mdLBv/fFzbfPSoWVWNSIDeoqroc37jEPa
 hnKGvK0VVwWoWEnXJ+yeRLlNsLFn5+WUU0D65Ov4ceDK3F5X0/ERQxM4N8BzweOuoZ/K
 RlpQ==
X-Gm-Message-State: AOAM530t2xkkuTsPZ/Mwf3Th+bTtk9s/2ghvwydmd9tBWI6NBZ25sYbw
 UVEXtgSC1lt+K1M2roREd5nI/esDn2Pkfg==
X-Google-Smtp-Source: ABdhPJxBWfDWYSasqy/+xlTVzxVzp0+ePG7yF2hk9doNrK3b1cK4g95WlD9nlIjb5SNqs4cQQVQY9Q==
X-Received: by 2002:a17:902:768c:b0:155:e4a2:1f09 with SMTP id
 m12-20020a170902768c00b00155e4a21f09mr24065967pll.43.1650997378805; 
 Tue, 26 Apr 2022 11:22:58 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/68] target/nios2: Use tcg_gen_lookup_and_goto_ptr
Date: Tue, 26 Apr 2022 11:18:54 -0700
Message-Id: <20220426181907.103691-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lookup_and_goto_ptr for indirect chaining between TBs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-52-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 87f3e57d4c..a3e87beba4 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -190,7 +190,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -201,7 +201,7 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
-    tcg_gen_exit_tb(NULL, 0);
+    tcg_gen_lookup_and_goto_ptr();
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


