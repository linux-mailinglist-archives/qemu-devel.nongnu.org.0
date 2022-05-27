Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7344536657
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:07:33 +0200 (CEST)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudQz-0003MK-1W
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8Y-0001qm-9U
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8W-0005Qe-F9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:29 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q4so4586788plr.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPe9v04jpSOnM1YqKXysVjOVagzaKcyYJ8pPspoxKJ4=;
 b=cc3NKSUyf68C+FpOY+vt/bLGq6/KfQZLXny3CuQf21xgPgg11P27E0nqf1nwugHWqo
 EEA2bhl4UQr/wJ1TUf3kPeEC4hpFXaFErMvN+eVu/KTTby4EP5JaWkRyRKMAwSlP3uVw
 6ZweaDVI1WQxIKlDQF7qlQRETZE2lcnOxLKIgFGROB+Y339ABe+lgKf9xy9V4TBfU5zw
 IAdQRCdtUotLoUQXwFF1ev6bEewGgRJN60gPkNx96Bw5fAMnaIZYXM4vLAmEXd8xfy56
 hjnpv7P3ep244J0isxOoWACcgjP3NciMJXBEg9H9PpGyrK7reegZzgJIcGRtw+8cPk+u
 mtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPe9v04jpSOnM1YqKXysVjOVagzaKcyYJ8pPspoxKJ4=;
 b=aWMrQrBVarFDu9proDnapAEHURQcdDZK41HAmvndst55OWuceWOeCVdZ9XRfNvv7kx
 49TPz0tj9UBtSHxfN/slPNoHYixXKY2ontYUUUFOrpaaHeUDcXbBTtWrv4pTtYjhBYkV
 g2VZDsKl6/hgGr6YMyQ6UCZiPCkCKCJqTv7ES/sE/Ea/0P7irkY9VYjgB7N4bZ/9yCUt
 nYVp0BSrYK9Oowp+xQvP9FkAsqG5k7Rjc+dhWfYgRmoqYdG1nzwBxYEkP28mQANOE/o8
 JaEsIqjIRa5BqO2fww+BxE8MNiKdIcjg+7gBRjinWl2iBQ4S7AMG9oRdo4CCEMwIhnM4
 6Olw==
X-Gm-Message-State: AOAM531RSqA+61ztzg2Nii+WKaF/K8jw+bYxZDv5ECS0tFnR7RDrRF0p
 XKmKRhK2IEx8UUl9bTFgR9ck5FaWRpWcUw==
X-Google-Smtp-Source: ABdhPJxA8QHNzfD0y2RwPDBEjLOqjeWMJHnjr/yjTsmr6dqsd7mqL5TPGPhtBFNGuKkS14kuRT4SMA==
X-Received: by 2002:a17:90a:a385:b0:1cb:bfa8:ae01 with SMTP id
 x5-20020a17090aa38500b001cbbfa8ae01mr9239774pjp.116.1653670106834; 
 Fri, 27 May 2022 09:48:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 17/17] target/m68k: Mark helper_raise_exception as noreturn
Date: Fri, 27 May 2022 09:48:07 -0700
Message-Id: <20220527164807.135038-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Also mark raise_exception_ra and raise_exception, lest we
generate a warning about helper_raise_exception returning.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/helper.h    | 2 +-
 target/m68k/op_helper.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index f016c4c1c2..c9bed2b884 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -109,7 +109,7 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 61948d92bb..d9937ca8dc 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+G_NORETURN static void
+raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
     cpu_loop_exit_restore(cs, raddr);
 }
 
-static void raise_exception(CPUM68KState *env, int tt)
+G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
 {
     raise_exception_ra(env, tt, 0);
 }
-- 
2.34.1


