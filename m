Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7774E1C7A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:06:04 +0100 (CET)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy4B-0008VU-57
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:06:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyi-0005Kw-IH
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:33 -0400
Received: from [2607:f8b0:4864:20::634] (port=43661
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyf-00066B-UV
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:24 -0400
Received: by mail-pl1-x634.google.com with SMTP id w8so10782041pll.10
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vRQUrPXATR+Gi9ECEWVdt6AMeM9dbVbhXfJgx7mHpE=;
 b=agP66jAeZwb9JxcRFnxSYUConelWk2rHu6N9AJ65hMtSLWeeyM113SxJW9QtSlDBC6
 0/7qalmflCiwDji3qp49WecSGg6gX2gYsPAf8+kFCoDYp1lNZTuMEwo0mVj0CpfOKvlK
 UDB2VV1/bKCeDLM1RPYJWxj748p9WBbmfpNNUUF/zejoUplZx8WZHJAqacp+XjlZQ0PF
 lOCHA3WyLYGq8TtHthi3f6W5yYJ4XM0CGXt8Nma7yUmH9Dhwu9b/F9wN6n7daQUKV523
 jcG9rfdWc/NWUcK87u/STNYDLjL21SGgbV0HFt/3s6vAq6552rhTO6dnZXjU2X7JFfu4
 SKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vRQUrPXATR+Gi9ECEWVdt6AMeM9dbVbhXfJgx7mHpE=;
 b=ye+q9gqfzHuqCSoNcWywl/Gy5W+FOy+PtGMiOaMUqIREcMGcUOzO0zpicIFFOWCgxS
 8yDG1S2mFrOjCvI6OtT1Xp6wMr9Xtfoo8yzSOTuDJ5DhPisjh+CdRRa7HkD4ot28LssL
 AisdJwt99iislfZLJNeXaKwxjorFYud34tAfH8TUPqpjlh2vsFiXBofQAsHeZhgO7s6v
 jtGIopM8kPrXvWGlLkp+AURE5QMVzIzQTV/R3MFcBzaVsIKDrwdHQ1+PqFL4FXfv+yWR
 BaqirTMq8QkKULG7yY2qGTPHN5TOQDwSsZNsuOKeVQuGyr/377XxhUdTms+XPkkkVHwp
 mrGQ==
X-Gm-Message-State: AOAM532R46cfn68cGhY4WrQnq/CqTPXGc7UgW9tvO8mFUp5Znff7EbID
 Le69ZzQcliPfaTCyks3lsdwgennp9HngEQ==
X-Google-Smtp-Source: ABdhPJwtfT8nqxfsm4Z7ZrPHDNMH38Bl84G7xbKNtpHaIIbqYAhnc/IYIofRnkCaZjBDypuvKJCn3g==
X-Received: by 2002:a17:90a:66c3:b0:1bc:cfab:86ec with SMTP id
 z3-20020a17090a66c300b001bccfab86ecmr32462181pjl.74.1647792016092; 
 Sun, 20 Mar 2022 09:00:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] linux-user/nios2: Adjust error return
Date: Sun, 20 Mar 2022 09:00:05 -0700
Message-Id: <20220320160009.2665152-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow syscall_set_return_value rather than the kernel assembly
in setting the syscall return values.  Only negate ret on error.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index ac71f4ee47..2ae94f4a95 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -48,9 +48,18 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                env->regs[2] = abs(ret);
-                /* Return value is 0..4096 */
-                env->regs[7] = ret > 0xfffff000u;
+                /*
+                 * See syscall_set_return_value.
+                 * Use the QEMU traditional -515 error indication in
+                 * preference to the < 0 indication used in entry.S.
+                 */
+                if (ret > (abi_ulong)-515) {
+                    env->regs[2] = -ret;
+                    env->regs[7] = 1;
+                } else {
+                    env->regs[2] = ret;
+                    env->regs[7] = 0;
+                }
                 break;
 
             case 1:
-- 
2.25.1


