Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF733D0277
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:02:41 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vwt-0001Kb-QE
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpI-00074e-Gh
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpG-0007xI-Ke
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso2428215pjt.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8NOqQ/0TvCdkNluzWUj4pUQUbt/7JktmnpikxlNXDw=;
 b=M8E/XhGGriSeEIT9gObm3UvaTPMbnwEQ6dT02NqBIcA5GWt3fDamkWTkKkgB4njD9V
 VQlVQelzb4Pr09bFZRjHiW0T8/gwEsPGinj9LNUMz/WeqFmTvmjRmdOVuPNAdx2gBOuD
 Eay4Vd9QoaZSm7Lsk+9BsJ3sexxw3Xod3hQW567UgtIAIzd3kptEy4icKW3Q1r4v1Vz0
 Q7yj/ARfimZINaQJ9JhW5RH4x80wkuq8Q4ExEr+mN+jX1I+0a+MH6yxKgQPRPiIPM0/Q
 3kb8h+XIV7KfF6jpPxbjAkFqknxlmIXMzfnR1gdX438gplHkghbqcDo6F9zJySHoplgx
 zemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8NOqQ/0TvCdkNluzWUj4pUQUbt/7JktmnpikxlNXDw=;
 b=tJ0zii+qnqPG9cWTECM6EAKO4SoYRLHKhCOG5rBz/9YEHuZsThu9i6uV9VTksdhfjs
 U3INpBk3KhYWwB5LaU/sdxplDyeEcBuAaFR9XANhmjw9OdgEFSZUpRxQSmJaOg3yNCpu
 fM0Rq+QXK5NLlP92UC14ArvVLFPcDjcewY5IzDzDeImnykh/VTq90iEI7nIf64jttGUw
 90p3/Gdx7xDT5tiWPOO5thIkI2pXdRZ5ri+GG4/Ht0W/5rCf93+51qHCdGvm9S9E7R+p
 Y3wPZeZcMWRRLuYs8c+1HXd82grq8TF9YTCpjdJYMNIygMb6PvlvaOcDDBBL3aHc5iTG
 Pr6w==
X-Gm-Message-State: AOAM532fH1tl6Wh/bizrR0zvmZKFGk91RtSZ8rZHwJOFfWWwhmBWuwhT
 7/zSSNhFVqxENW3UIwXBV4smNu4qzS0Bgw==
X-Google-Smtp-Source: ABdhPJxOSSULQxJ2pGv3521iqHwL/d0ZjKryzwqcgVgbbfUSFmqHuOb/wBudUbzBztOEC1nvyus3tg==
X-Received: by 2002:a17:90a:9b03:: with SMTP id
 f3mr30158335pjp.184.1626810885286; 
 Tue, 20 Jul 2021 12:54:45 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 02/17] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Tue, 20 Jul 2021 09:54:24 -1000
Message-Id: <20210720195439.626594-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210717221851.2124573-3-richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 5 +----
 accel/tcg/cpu-exec.c    | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dfe82ed19c..ae7603ca75 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -565,10 +565,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(CPUState *cpu)
-{
-    return cpu->tcg_cflags;
-}
+uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..ef4214d893 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,6 +145,11 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+uint32_t curr_cflags(CPUState *cpu)
+{
+    return cpu->tcg_cflags;
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
-- 
2.25.1


