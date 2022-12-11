Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0B6494E2
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OGD-0006pn-FY; Sun, 11 Dec 2022 10:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OG1-0006XW-BF
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:50 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFn-0007Vx-E2
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:39 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so5831058otp.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnKVNWuy81wpLO8ctWZ75eeyyzKWmrB6j7VstOEmj/M=;
 b=LFVMmBrptS9d+LuQp5JU+rmkEzlEYy8oZj7nmZ8kNN5bh2IQWy0Rl83UkrCmflHO/d
 lkX3NLymrTXdD/lAxeWkJtj8sA+R9dp88VwSmYGJJuQhG+kcrk3uR3VZM63Z+sWktPwT
 OGe6kzlubAfaLUc7pcO+kgwW9JyKz2jmV3NOUqIupkOgeeQdT+Yb4VR6KkR1dvPARCXQ
 qiRXrzxiaswUbesa+wc418iFb51hdDrPyJ/c/R5D+3vXjSZcq0g/KJCrpNjUUm4KLGdb
 bcsXjYDOLJEvT6r3cwOGiCvOplhvKHvYvOWwmswEZyD7Ea0yX0xKeTmQsqMqawlw7cdx
 jqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PnKVNWuy81wpLO8ctWZ75eeyyzKWmrB6j7VstOEmj/M=;
 b=gt1R84ZK7u7JOnkizmATBRjrCV/d9M2R1J1RzMVo6JbBrdDk32q0SnoJhhIyLWPnoW
 GGfPiGsAnveIa/WAl7JUvZS/8vDzAJ7f1kJVV4i9F6yLS+7cEeVUzFBvrFYiR++xgGCM
 vFGCT+vIVpEthhUcQ8pnmZ5pFpyFb6HKY237o59jaIOMRDoTOpJ+4PmUmSZoxNq0Cert
 jUGBRBT/AriTqyfmyixtCQ4dWteB6MGK4rt2Ewvyk9WQ39KBbRncmDbF5N9oCgFKTS5Y
 hXHGlxQnwfByq1/aenppKnEiJNddLJSSLl5pS4qH/+DL7oSJupDqx9++AhN6X0+hG6Ij
 4Nag==
X-Gm-Message-State: ANoB5pmE8svAZaWkBRhzStsxb8umppql15HO40Y9hF0YdpW5cguMHH8z
 zs9vFGchwCP4yfl6KuXzIAZrUJ/XYhRYke98RBw=
X-Google-Smtp-Source: AA0mqf4hVWe5y/CtJOwODQ/BWx6UxIaMyAtlwNVnP9YoxW8KZ8xH7ydnHxyYXQsZGOrMk7MeHFghhw==
X-Received: by 2002:a9d:64c3:0:b0:66c:43b0:5667 with SMTP id
 n3-20020a9d64c3000000b0066c43b05667mr4820953otl.38.1670772513156; 
 Sun, 11 Dec 2022 07:28:33 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 24/27] target/s390x: Fix successful-branch PER events
Date: Sun, 11 Dec 2022 09:27:59 -0600
Message-Id: <20221211152802.923900-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

The branching code sets per_perc_atmid, but afterwards it does
goto_tb/exit_tb, so per_check_exception() added by translate_one() is
not reached.

Fix by raising PER exception in per_branch().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/misc_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 71388a7119..b7220cef44 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -619,6 +619,7 @@ void HELPER(per_branch)(CPUS390XState *env, uint64_t from, uint64_t to)
             || get_per_in_range(env, to)) {
             env->per_address = from;
             env->per_perc_atmid = PER_CODE_EVENT_BRANCH | get_per_atmid(env);
+            tcg_s390_program_interrupt(env, PGM_PER, GETPC());
         }
     }
 }
-- 
2.34.1


