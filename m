Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1C510739
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:37:38 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ46-00046G-AI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0002Tr-TW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:23 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004Kx-Bg
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id b15so18710559pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zx3qhK8H+v+NAZcjuR7FBLrFsz8zqhmn66xWRsawstk=;
 b=Los2CCnr84gMnsbx+7Z6MXkKYQZnXI4qcJAWwDYAa65uaXudqwT3/4PgLxUpWzKEWn
 1Q3h5FAIBUbTpHJc4mmtSKvSoen3x7vvIg4JZJnIYLVGGafVhKvkwkiTUpRYt4jO9YiG
 Y+oPSOvAbYNfQ4siD9IwPcagaNu4equQGSJLLzOdA3F3wmmwrVK14+VSdU/P0mNQBN53
 bjttXxpopAD9mODhguUS/n2M1tK0QSB/CxpNkMMvLbBpKu0heWDroRZLp+d1/mjfhmw+
 pgaoIbJoYpOMBOrMzhGPNjFSqjeEcttCdKYTRagfdfXgJFhJjoCD0kvwQHiaRIVSQhc6
 PS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zx3qhK8H+v+NAZcjuR7FBLrFsz8zqhmn66xWRsawstk=;
 b=0Jdq6XsbD9+WyFTyqUTo++Aqx+k9wEBynZb5MP+fTna8J5vdT7utwscLtjcgre2z2N
 sP5EAr02PuwbNHW0CqeDsnrkicY/aidLESdEMmcP4iSRkKbCPyYctd8z2HKXeQXuaDO3
 avdc3yA1eF8VjU3vrmdti55/qcU363k5tB52Yu1YRPZpgi7wyhW9w+CtGO+Xe//v24g+
 4JRxrMpG1i3INUjRfi2Cdzn/Y5PanN0Q/6nIRg69bw5chLo/FShpcEEymCKam9fTMbR0
 VP+nV33QOz3TTeG1e3FL4oT20u3AX5j7/PPoWDkEkeI+EdDEuxEIYYlNuDrBG4cBQ52N
 NJfQ==
X-Gm-Message-State: AOAM530LV8HHjADq0D+J0UhHXNwx2xgwXVfOaQ0UitMCHq+Wjee3Txuo
 KS/Y9H6D1cnVgwSmNClBMGqFBuY2FIlhLA==
X-Google-Smtp-Source: ABdhPJy/THLIjUD9+/Ta5K6QC3RkLQKYak6VLbOtGHDlgX56oiZlV6GbdY2DhtxHMEqiBeSBVGod1w==
X-Received: by 2002:a05:6a00:1ad0:b0:50a:906b:807c with SMTP id
 f16-20020a056a001ad000b0050a906b807cmr25808498pfv.42.1650997151525; 
 Tue, 26 Apr 2022 11:19:11 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/68] linux-user/nios2: Drop syscall 0 "workaround"
Date: Tue, 26 Apr 2022 11:18:02 -0700
Message-Id: <20220426181907.103691-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall 0 is __NR_io_setup for this target; there is nothing
to work around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-4-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2e9296750d..91737c568f 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,10 +55,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.34.1


