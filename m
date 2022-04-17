Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54D504927
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:04:13 +0200 (CEST)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngABx-0007sa-20
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fR-0000RX-B7
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0001md-8B
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c12so10789185plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dg7CjWS8KKLFIwp/8vvP9chwY22ZIq4AeXhGZgPR9KE=;
 b=uIDXQHSbxTU3wfam5fRbRmxq30nC0NnJsYV1xQTkQq79X2MQ/oQqcGe6ngs+eksL8T
 UasqcZbBjQDPnApeap4l3gLaLYiYMCKVYkBwA2F4OlXugEPrYCeJpo0j7RdHImUt0Grh
 GAhUa0Ryx/TX6XYeSEHR0KGVJ8BI0rcnuenJK8SQxTB7p/9PnnCoNYiczKXX4PrA9N8R
 3OYtGeexogUGjaGHcqmojwUtZ51DCjooJ3nf1SfGIape2hiSwrKEOkmq3wBpDl2u25BU
 zvh7az0mrdORtuAaICjqXy4UhV+vtb1/8W3KXsRWRfeTtyRal8zaK4Y1tV4E8LoXm7P/
 9ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dg7CjWS8KKLFIwp/8vvP9chwY22ZIq4AeXhGZgPR9KE=;
 b=pSvrxF/5Lyj2BavjN9X92sVyr+0T1NNBHGqm5Aw3lL8vUMfDafk44mXTVkXAy+EcK3
 3w1UQlanJ1ZKgyg70FK9kqYdjCWaJ9nhuRIF5Z1jpAHsipKDvvEJ68KCa9Y2VpIWE1zg
 l6Jou2koCBnF9bpD2YF2iB7FmODNn+cNrZ5QPqN0uXxi+/gVSvjSrtfgf6CQClUh5OZu
 71wiXYPYCRV0xxt4366yv7TiZF56faqZC29qtS517h7z0/GSi+RjC1lNhO4U9xnc2z+7
 UDwq3QF+54ZcsBb1EwTKGxevPaFORklAR88y8vOMPiET76Nmv22sYaxOPSdfR4HoiFog
 dwCg==
X-Gm-Message-State: AOAM533hxr2RLBmBE3BWIgv1H5Mj/ea09hic18GNfm/qplZrwaFvxSpW
 ca6IdDkIAGDsDc4qlRpoCx/ZxFq4zPmBUw==
X-Google-Smtp-Source: ABdhPJw1p+LWYRTHLb7/atxkZfm0WhFwaY1NgIIlvnxcvc7EYDKPIWdOkSk5Hpxyo3kHpqUbll5eNw==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a338:c568 with SMTP id
 nu3-20020a17090b1b0300b001d2a338c568mr634157pjb.129.1650220233216; 
 Sun, 17 Apr 2022 11:30:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/39] target/nios2: Remove log_cpu_state from reset
Date: Sun, 17 Apr 2022 11:29:55 -0700
Message-Id: <20220417183019.755276-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is redundant with the logging done in cpu_common_reset.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..b0877cb39e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -46,11 +46,6 @@ static void nios2_cpu_reset(DeviceState *dev)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    if (qemu_loglevel_mask(CPU_LOG_RESET)) {
-        qemu_log("CPU Reset (CPU %d)\n", cs->cpu_index);
-        log_cpu_state(cs, 0);
-    }
-
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-- 
2.25.1


