Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD05108F1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:26:51 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQpm-0005XT-6Z
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq8-00021S-1S
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:08 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq6-0005Xy-Ds
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:07 -0400
Received: by mail-pg1-x52e.google.com with SMTP id z21so9090297pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOjXySDL0Ufzbbr9M/xH36yPYqmTAVv3+nLLoSnWdKg=;
 b=UJrMN+YN2G5/nZwMajwxxBO6zBQd1IPosswxAj7XsHP4Az4kKQSyReHKlw6bMUeWE1
 Cp/5fJDCI0x4OERPYD9ZSw6XHBEYaBbYgrERFJ9bz858/3qnxteZaUguMAHMBvWt055e
 yPR/vVG7qRD9CItnLap0rwDei7dmSIK3T2wAXvSvDiJWr0fHZgyFGv8CFAkWtND9deRB
 CSrcLhd/g7D/ES63+VAHFyvAPaFL71cOYaWrMOgr+0cBr7O9gGcCa9VGqfclpr4gX7TJ
 pnAZFuBBG3X1LC2WzwfmmMhE+yoqXCubweJKT23ctVJMc4keSH4gUfeSM3e6OHHdAsUt
 6ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOjXySDL0Ufzbbr9M/xH36yPYqmTAVv3+nLLoSnWdKg=;
 b=Ubw1iLb+GReCK78Q0SnndVZevw8Fn7vE4CV3XQzLdCOWdD5UbVFr5tGJhu7tByQ65f
 A5JulSsqq7Sxh6qjehnqj6lIfbMX7ZQ7QCJ4TgJ0M3mBd5SMK19qD/4l4aR9Dhl5dlAD
 j2fEommYZFgSonl8xKOUlOpzFtiw8u9Ly8pi5EiGkA+PvGZ5zxn2gmFNQxkAhV/pZpBU
 R875oNHSbE6blFZTBZ3xSV8g8tEQ4yYOp+f5JMN6CHHp90jinNgULIyoKur01N5zHXwT
 tQu/+/kJX249y6gHiilRQ5cccgFlYuc/TqeX4qJGfEiauXe2MHsFvJ/slSuHi77DPcm9
 hEYQ==
X-Gm-Message-State: AOAM5316it3vHLGnJqzp/oT9WmwXVhVd2S8zuAslfsEuwUsDwp/nmgjk
 kUivO35EWtalcab7RprQuRMzSMQAcSML4g==
X-Google-Smtp-Source: ABdhPJxt3K8YaVZqJ2+pV+S1LLVWC9U1i08SEvmvPWSOkx5wKAeHqPefu1gwXozxbzP+ndwjFWBTow==
X-Received: by 2002:a05:6a00:1494:b0:50d:4b12:8dfa with SMTP id
 v20-20020a056a00149400b0050d4b128dfamr8225749pfu.43.1650997384932; 
 Tue, 26 Apr 2022 11:23:04 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 62/68] linux-user/nios2: Handle various SIGILL exceptions
Date: Tue, 26 Apr 2022 11:19:01 -0700
Message-Id: <20220426181907.103691-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

We missed out on a couple of exception types that may
legitimately be raised by a userland program.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-59-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index a5e86990e2..da77ede76b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -50,6 +50,18 @@ void cpu_loop(CPUNios2State *env)
                             env->ctrl[CR_BADADDR]);
             break;
 
+        case EXCP_ILLEGAL:
+        case EXCP_UNIMPL:
+            /* Match kernel's handle_illegal_c(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
+            break;
+        case EXCP_SUPERI:
+            /* Match kernel's handle_supervisor_instr(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-- 
2.34.1


