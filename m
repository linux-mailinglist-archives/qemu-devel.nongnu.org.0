Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399F6510729
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:35:58 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ2X-0001Cg-3U
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0002Tp-SH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004L7-B9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:20 -0400
Received: by mail-pf1-x432.google.com with SMTP id j6so16380094pfe.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cz85jXXNTXB185MIdFgmydKGclnlgZjRARJ6+y2fc4Y=;
 b=FP1MY99p6xmAdx+EPVzcnZ4AoJgvPHtHs5o6Ra846zjDuq9HdM3shz3u971zdt/ImU
 VQyNf2d9ycGiQq8KOn7E6fRQGELzjA7QV9/Yh5fNNstJ49dBz9PO5e/FawvWHZjwsqKr
 hMgcYD5S61oWcVXQsMsULrlxzbpXOmkJF4obYn9QAb0WuHiHX2bUERpm70CHucW2mWt6
 G7QFiqbp2j+d1lLeNLwMRLR5XnTAlQuONFN2W+fKrLuA5oe03EaI3ROvqP5DWQ5hpRpr
 2cL/imdMWJq5u/qMRF3sYyGHE4SFxH5yjGhv7GUiXL+6QwjFpI8kF7L8HdHjwmqjXBUX
 zjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cz85jXXNTXB185MIdFgmydKGclnlgZjRARJ6+y2fc4Y=;
 b=TOULU6JWzBTBnenv1CuIeEefdYW7Niy6yn7/w2BDMiX2AD0jbygCfYIHkYKcs611Ju
 mb/skhpCLeQ0D3Wfz4hFUG1S21K+md7ljzDcxPWHTbgjJ8ZTVlfoQzlBRlVSfFmAPK45
 ZsFhOAxzhAFfElp2OWRM/q1VkDtcq3d0eMev5m2Eb8CJxA7gheDuGxh6mg4mZ6DNMsMx
 /SGhw026E0VUjbeDdGFhf/NA6TZWJ6kcssQeZuni4fC8uzGKe067v6eT3FAU6c3a/BFR
 uMXl9qNgiAo8z79rvvXHZTClMUhP9O0JK7rdG3twTJG5BWYR2iEgYOLqkR/LBylXvwSw
 u8Hg==
X-Gm-Message-State: AOAM533JI712Z59SFFvsEhYijbmwvhE0jNz7vPZ7SBkoWZZx0U4hMuHC
 51EW0ZByjis7kQUsu9LQ8EyXcIhuJtfSpw==
X-Google-Smtp-Source: ABdhPJyFzcP9f33jtk7j2o3tqv8JSSkVNm24AAaJUqfs4/tUvXcgENGSjVbNFsD3llEDhdHz/dhzxw==
X-Received: by 2002:a05:6a00:1903:b0:4fa:fa9e:42e6 with SMTP id
 y3-20020a056a00190300b004fafa9e42e6mr25683929pfi.1.1650997152488; 
 Tue, 26 Apr 2022 11:19:12 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/68] linux-user/nios2: Adjust error return
Date: Tue, 26 Apr 2022 11:18:03 -0700
Message-Id: <20220426181907.103691-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Follow the kernel assembly, which considers all negative
return values to be errors.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-5-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 91737c568f..63afba5862 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,9 +55,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                /*
+                 * See the code after translate_rc_and_ret: all negative
+                 * values are errors (aided by userspace restricted to 2G),
+                 * errno is returned positive in r2, and error indication
+                 * is a boolean in r7.
+                 */
                 env->regs[2] = abs(ret);
-                /* Return value is 0..4096 */
-                env->regs[7] = ret > 0xfffff000u;
+                env->regs[7] = ret < 0;
                 break;
 
             case 1:
-- 
2.34.1


