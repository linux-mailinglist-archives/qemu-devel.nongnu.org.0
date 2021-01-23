Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F6F3017EB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:58:34 +0100 (CET)
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O7F-0005AF-IW
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzb-0005EM-Hl
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:39 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzW-0008Gu-3K
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:39 -0500
Received: by mail-pg1-x52e.google.com with SMTP id c132so6149643pga.3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbLvVOyBGJCgR+9BKQ86TGBEl8Sy1NrA6kmq+fGB0H4=;
 b=yT9zLh3gAuz/1TdGh9RkLWHr2FhmHzPGbzYEsVT49Ls/CkcksNhWt4Dj2mF2aA5pVa
 +jRaTI3FRPSQ9jW39WclGDpRh7zgv2f5EJSv0TYtMxmcRTcjcqOWeSn3Oi/TWLAP6w1K
 9S1Dv00bQMku/4X2HBzfi80oOhRJIUeAhoNX8sWkzU04EzoDmsIrLQuLpPOU0lzVKRaS
 O9q7YY27JiModOI5XpJmjDE9UasIXUN1EBoK+VTAOfP2Xx0s4EJX+RHfLMp8U94htgey
 NyaVAQBeVSU2FfoUuA8M4wK7n3u+Ta5IdBY027BUBG1AXlODIF/iLNqxacaVNndg1fqs
 TaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xbLvVOyBGJCgR+9BKQ86TGBEl8Sy1NrA6kmq+fGB0H4=;
 b=Nr63nnZyCMwCKrr5I52xncesboEgvk5zYwOa7E5yZ6hC7tsWailPS/MfsLHHNkTzkS
 Cib0D27vJQGzsRLsdQpuwi9UYCJ8OqcrIh2z9T2YtGZK95/DoDq8LcCJzyE28tFekQMo
 2StKoiKh3eWts/5KJGJx5DgMmlI3eZ+WjGLotMWC0ANebKMGZa5/w+HDN8ssFzRMMpnn
 5LR/eazvg4qcN4mTyseJtAI/OADYom8PwsXaV2lwNBqICnAwEKJv4+7pkztwcgvKuIg9
 LpVQEu2RZjLtsT4aGZZC2WPf56vysg5usEXuub3lXPdm6actyT3YmpkAebi9YT2j0SjF
 uyHQ==
X-Gm-Message-State: AOAM531hutzuG7hkxsaNjiYAgq8cC00YTleUam51JxKr01B3Qm9zbTeN
 LX7SdwL+oUS1K1M4aDyyWLzn2Sigv22zQw==
X-Google-Smtp-Source: ABdhPJxtFxforCEA7Zpo0PiBRIkOBAArwPA3+Hnn0hm5JLlc1oJK7HLvDYDH6n0RcOcsmMEEWF1CAA==
X-Received: by 2002:a63:b4a:: with SMTP id a10mr10398524pgl.112.1611427832336; 
 Sat, 23 Jan 2021 10:50:32 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] accel/tcg: Make cpu_gen_init() static
Date: Sat, 23 Jan 2021 08:50:15 -1000
Message-Id: <20210123185020.1766324-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_gen_init() is TCG specific, only used in tcg/translate-all.c.
No need to export it to other accelerators, declare it statically.

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210117164813.4101761-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 2 --
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 2e5b4bba48..516013e735 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -47,8 +47,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
                           target_ulong *data);
 
-void cpu_gen_init(void);
-
 /**
  * cpu_restore_state:
  * @cpu: the vCPU state is to be restore to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9de6ff9dd..ca7ef6aa17 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -243,7 +243,7 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-void cpu_gen_init(void)
+static void cpu_gen_init(void)
 {
     tcg_context_init(&tcg_init_ctx);
 }
-- 
2.25.1


