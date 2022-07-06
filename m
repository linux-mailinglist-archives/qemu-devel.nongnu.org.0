Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D338568418
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:53:14 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91ib-0002Q3-M1
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M5-0006oP-OE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:53 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M3-0000nB-5o
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id 128so13704299pfv.12
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=vLH8u/YI6xNxYEqgir1ZeiCndQwgdBo+q/o9gvHh83VvtPfjnuOFng5j5qZUlVptkO
 zC9ZtRT0OUKcaK5BtjJxZcqIDLjNDpYzOo4Yrogu8y3X8BezJzHfiMYDQjq5xQG6m9Cd
 kYSJXJfqUrA3pdoHUL6cy/1ZOtUKMUbeRBGKfHU705kU/n+e/wmIJu2gMv0NJ6jRGeMe
 GDHqpvAszlmFK8TjSzYTDSehB3TnmZd1uVpaQ/pdvOXWcYdPydqFwODtDfLQMP6Z7pzc
 4+t/Jfgg41865AqcYK+zFqbgu0ev40xlhFeWZbsOC474WV1Z7eAsDNe8hqq2xROBAF08
 M+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=It0Uhe6qKcGMHK5K9uwmo9o7YGiLuNrGDcv7nqDGDvkaRHvvQFtaCMnn0SM8tWZVDY
 j/VarQqucO1CjNcLXHYsVIFMiTFcqDGOOpFblpkgl+VzMEMMS9OWG7ctHQXinKrYR5lU
 o50y/AyYJBzEWWvhz5uIVlqO7mTRvwpvhib69i/Z1zgSfkSR+MvlunwuWDtpiXDwJwga
 Agub6HqN2wcMbh3IeFshVpK+OehgxQdTFM8T+jnWh0iEyMGHz6nqhOUpOIillYxjN9oC
 mNk7QXX90u9aQ8OFXouY2nOMpY57n5jACADlehUIrPkoDx5LXa0Amla7OsdYoxVygN8p
 Rxpg==
X-Gm-Message-State: AJIora++N65W4JzXwNNbffYBuu9QhShQLkV4cUk18ZuMkpLruK+NK5pW
 ne/KxzyZl7InrsXHD8GBIJxg48xr7sIigXKX
X-Google-Smtp-Source: AGRyM1vSGECh3yoNDU0okya744TCBNzfEohiMq8Bez7O1S9Etj+n9Fn499+sYw3TUqL/z9+n6y4Cvw==
X-Received: by 2002:a05:6a00:1901:b0:4fa:fa9e:42e6 with SMTP id
 y1-20020a056a00190100b004fafa9e42e6mr45598933pfi.1.1657095949999; 
 Wed, 06 Jul 2022 01:25:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Wed,  6 Jul 2022 13:54:00 +0530
Message-Id: <20220706082411.1664825-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index f7ef36cd9f..9875d609a9 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1


