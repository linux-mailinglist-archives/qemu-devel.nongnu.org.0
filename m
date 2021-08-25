Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254793F759A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:08:13 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsdY-0002E5-7p
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZ6-0000xc-8s
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZ4-0002d5-HP
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id u15so14938448wmj.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arPvzh3iW0F/Uf15lZO6UZYU48dZFD0o6Wha+B+WyfM=;
 b=LkC0mXOrLaOkw8d8z84SDyqEV+3k7eZrIEyaEy6J8V9ZxSWe/tnfcBHOviwWjJcTet
 OcVvPBEZP2x1hZRwTHih+Kw8YexhqDgZs4VlZpBr0j2YBHBhquX6NE53wxm2gKIy6cys
 az9cPPmYfQVUvM+vz34doQrGauEcetdoBdlOWAhZlm1hRWNYoBJECaQIaLaddlKOV7dP
 XpweDaGohzslh1X8DT6oTMdaz8lllnf9Yo19FRAHo5/YsjerhmX18YHWtsXZTAyBdsnP
 62vCP8VUkXdgHYCoYyWBcYGxbxVjTT1vLm7rLIQVSaODpwuZEceh0WdXw46wmQ8ordB+
 rRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=arPvzh3iW0F/Uf15lZO6UZYU48dZFD0o6Wha+B+WyfM=;
 b=q18PTeNHSdOva07QknzmJ8glUtvmGVAoWDG34Foqux2VIZ/Z1bK+q0WQC+y+W57UI9
 bMOhDPfCiyCtODxcEDU4IpWrZ7BEEreit38Nmu4ExQmIATklemnGlMjzJ2peWCsndXry
 99VeG0jNDSkSGukmUeXE8nnUArp2mTrfjUSQI+r9r9+RpCly2McYO4eFqmQbpw4oREDK
 N4a6eiz8t2elN+Xn7TN3WVScbb6CjSCey68t2JWgk310hjnY9arlbQDc1BJWp05JZ0gS
 i1kPEj0j1OCsc1kHhKr+pMjttRjOF0vdAvieSH68o59rN0bp+FUBahE5SnDHpxFG2pbH
 gQMQ==
X-Gm-Message-State: AOAM533BQHxPgEsFfLlkOZ1lQmsqt1K1WhtT2cuqRfFOBlNxN4TxEXun
 Jg3LMBHNAlsDmzl+P5uF5ld6b8BN9zQ=
X-Google-Smtp-Source: ABdhPJyBX3cSiaAhnct3voQlF+HMWBkjiwdwwRUlsXc1y133uhnxQA6/fmAeAMzjhRuQP2TZbLif1Q==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr9128086wmc.23.1629896612608; 
 Wed, 25 Aug 2021 06:03:32 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q11sm5255569wmc.41.2021.08.25.06.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/28] target/mips: Remove gen_helper_1e2i()
Date: Wed, 25 Aug 2021 15:02:00 +0200
Message-Id: <20210825130211.1542338-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_1e2i() is unused since commit 33a07fa2db6
("target/mips: reimplement SC instruction emulation
and use cmpxchg"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-3-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c0f8a04b472..4b689a54abb 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1243,12 +1243,6 @@ TCGv_i64 fpu_f64[32];
     tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
-#define gen_helper_1e2i(name, ret, arg1, arg2, arg3) do {         \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg3);                    \
-    gen_helper_##name(ret, cpu_env, arg1, arg2, helper_tmp);      \
-    tcg_temp_free_i32(helper_tmp);                                \
-    } while (0)
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


