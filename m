Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C11552467
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:10:49 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MnQ-0000Ou-8U
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdG-0002rv-Bn
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdE-00021w-Rq
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id f65so10894109pgc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=MECwVpZBF9Mx5nA2rel6uputE+EqXe27JdgLG5u01KAj5naGsQw0tloXaygg+UsoP8
 NTLUeu4GxSv983exZm8AAlZF33CJEjqqq7MRVLWehVFr7MYD8MfOAnoIUCWgGpdU7g3n
 fTP4nDmhEUuGfTLfpLdASS+J9iPHAELNcXMBacfXCPjCXdgYFvB2BVXHS25xOKITpgvE
 L5JtTs0YzRc5pMK3wCudA++Hdbt5oFVlbYfCzEH3EphTNMY86JisieJsTn7w6yR1/Vro
 hJIV5daMRR6bFjSvEI9Zbufz2ErV03QhoIshP5gQoifblji4kr8dpgehUAukgJ7AcD4S
 8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=OX0JoywWwX47Pn14x5zABvp+hNiwzdsjNkWS7cEpyP9geaLpo/F9umZskiJ/BDMrPe
 OpRwgvW68iDU+Bi5i3b3MbRFDw5IwxPbSdgllNRUIuFehJ1IPRtLQJWaTBTvv12lbgtf
 h5J42qAp21bRKc4xYpD57PzTv15jxDw2g1HGG9V9dgco4HtSubnv3Od5sosjADlbHotu
 Q2gPjQ6s8Eh9jTVxnNtZ2m78HTN5PL7oEosV8tJ4yPjbachLTIYevrAgWWhQ6Nm8D92w
 76KeC/avU72MxqGcdo7Ym9AkJvRNXuTKYbpIfLGrAsWvrlY8nBChfJKJGl6EL1GkTjwk
 rwmw==
X-Gm-Message-State: AJIora/idmz4UHvlzL3oLgAVL09JWqqDXDmu/DE5bRh/TnHGxLSU0zTO
 4Zd94IXPvorzag8K654B2V5Eg3r/0Ewc2w==
X-Google-Smtp-Source: AGRyM1v6BNbnU8ZToPrSIuuuphz8tJn86CLb653EltKyerqaHShpQ1hkQxp8aImJ46rLRI/3Q1Br9Q==
X-Received: by 2002:a05:6a02:28d:b0:408:8cbf:2a0c with SMTP id
 bk13-20020a056a02028d00b004088cbf2a0cmr22779162pgb.422.1655747771261; 
 Mon, 20 Jun 2022 10:56:11 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 40/51] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Mon, 20 Jun 2022 10:52:24 -0700
Message-Id: <20220620175235.60881-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
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


