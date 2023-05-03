Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A36F51F8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6q9-0001sZ-Lu; Wed, 03 May 2023 03:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q1-0001AR-2R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6py-0001dN-Ed
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315735514so11238775e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098620; x=1685690620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tD1Kg9az3SEYAT8uhbHJ/nDc4/WVCLBzcTbsj3/miow=;
 b=HbwzaClk89oMhcT+nW23AfFWmjg3s9D4eZUj457wk2GO3aXx8/MFJBcW+SoPbxwcDP
 uNJ04//moHihN4hsSAQYNEizwAhPdEZ2WAnMdoDIC28urKZf3VCOD3M/pqBKxZtKlSUk
 JkwgAymj+Xx7MA5igWBY0amlUSoc3kxGx5hgMTh9+/rTJnQLzN9vl8IT6jlxVK80bQbz
 Xy2Pg5opvcVACz4J9ycX9g4XxNxK8LFQrNCBSYjQvmoNvwUpYZtMDm3OGGMVm3edUwlH
 J+qtcH2Z952lp5YsRaXYzIi1/DEGqjCR4Ivw7uHe64iVDdiW7vzr/HYORPO1+jiE6HXo
 Tx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098620; x=1685690620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tD1Kg9az3SEYAT8uhbHJ/nDc4/WVCLBzcTbsj3/miow=;
 b=kE8lans+OmmPLqNijssRUNZrGzxbseq+4L8CzalA4xYKgH34S0etF4z/9WOk/Ir1cd
 ctzCKCKzkYdKw/wPAZkmkusjvxpCopYEC2iHy7ESn9sNw36YkFt6h73ZltjzPRso5M2W
 Hc/pOZ56ZJFKedXm2CtZxhmq6Jz45hXmCDAjw/2VkDP8R8KaPD4qRPS5Xzli1vTwoTG6
 TFPkm443wdU1W32fE1hWt/hmAhMaF/A+DKtHkpz3Ady826YD1wrlpwz1AOu2GUJ30LTq
 gsi/clKQg+fOtu7aqvxDf9xWJsz2hOx8rcU9uMKdO46vfgod6UyekXQxAOBd4ehkqyH7
 rYAA==
X-Gm-Message-State: AC+VfDw7vHWjIjC+MR5eMuShJcaxFz8oD+i23wmNeKrCrDMEksiiicbh
 wlCyxclERqqtpRu/ptZqPDhGo/U91ixilcnQyyGcjA==
X-Google-Smtp-Source: ACHHUZ5C/bYzMpdW0EoHnShZb1SSAcD1l78zvPK/xDs/rWZYiIiV9usvjQGOGftuiLoJ6eOPAZgGTA==
X-Received: by 2002:a5d:4c83:0:b0:2fe:e455:666c with SMTP id
 z3-20020a5d4c83000000b002fee455666cmr561916wrs.33.1683098620159; 
 Wed, 03 May 2023 00:23:40 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 06/84] tcg: Widen tcg_gen_code pc_start argument to uint64_t
Date: Wed,  3 May 2023 08:22:13 +0100
Message-Id: <20230503072331.1747057-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7c6a613364..7d6df5eabe 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -852,7 +852,7 @@ void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start);
 
 void tb_target_set_jmp_target(const TranslationBlock *, int,
                               uintptr_t, uintptr_t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 685e555754..b4e1e0e612 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5808,7 +5808,7 @@ int64_t tcg_cpu_exec_time(void)
 #endif
 
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
 {
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &s->prof;
-- 
2.34.1


