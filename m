Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCA4D466C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:04:07 +0100 (CET)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHWY-0004XS-No
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxl-0006Gy-B6
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:10 -0500
Received: from [2607:f8b0:4864:20::435] (port=36601
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxj-00081p-Rx
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id z16so4860814pfh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q//3kePGgY2lzpncF0BtSDXigvkTy7INMFgUKN7BKXk=;
 b=TJ6zZ/qsnRY/oDfupoqzP27kParNBnJekeH6TmOs+t2BijfY5Yy/U+cN8QjXbTIOSN
 tzo0lI1nO8GiwpdYGJIRIbEQ1h/LqRTFXui4QVjgD6hAXfxpzqX1BA1GWjomYmFgf9UN
 g9KK6KnNpbGBu6hTzhz+uzfMU28CqrFnMmKcMngVWYQIzabZAt3w2/nx3PIrJ7vM054Z
 vfBew+O4c63rDg/9YS7ScLfdqL54mgD0VBQBvwFl5V6gUDdij1mMlPNVApzsDLpIayeO
 tsQat+gcn2LKJ7ijgvLk1BokcIHVA92NAmoEhlfvSGccyXSc31ExDthNUQMnGG4+LvV5
 lLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q//3kePGgY2lzpncF0BtSDXigvkTy7INMFgUKN7BKXk=;
 b=KA3pS8/oWTYQdbuQ2GpOpnkc7NJywV7zPeZxgOjBehUUIIOBLf9JreqkveKZ1Rrrja
 g01CpL9Yq+Z9Zux+KZTENczpWTnykK+e2mon6hd+cJXn3V23Fb2XOGq7fOnprqMS8dCN
 gwQ3oGgTUAQMezUBo5/5UvVdJlW5HfekbGf8cV/0eLPIdYJSpsyIRbTHtuj9+dMGHLzF
 AmjBUdqC4U1q1Q7GjP8skvftBo9kGXCcurbquGJCUtxXU+rvmpfwD6GgSFWhMjRJybUy
 T8X5AYgp5TpC2sxCXen5Pn9EC7RcDi8w604yTVkrXW98zedYmsPaQ0utoQrFGPAItXbJ
 HdPw==
X-Gm-Message-State: AOAM531QQEhPOBeyZo8J257qLPkVOnlV+UumiZaWa1eJ8HTFeCCMe7BJ
 LyS3wzxJfukSDIcNHhUEYZx2qkjrnKUSEw==
X-Google-Smtp-Source: ABdhPJwmrRFQNO+TZRhszHG+k+9EKwqhUIAbI6dSW65ZV/176tj+CiIc/4njQptmQEU1nT9evK8rBw==
X-Received: by 2002:a05:6a00:2166:b0:4f6:67fe:a336 with SMTP id
 r6-20020a056a00216600b004f667fea336mr4533678pff.17.1646911686072; 
 Thu, 10 Mar 2022 03:28:06 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 34/48] target/nios2: Enable unaligned traps for system mode
Date: Thu, 10 Mar 2022 03:27:11 -0800
Message-Id: <20220310112725.570053-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unaligned traps are optional, but required with an mmu.
Turn them on always, because the fallback behaviour is not
documented (though presumably it discards low bits).

Enable alignment checks in the config file.
Unwind the guest pc properly from do_unaligned_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/nios2-softmmu.mak | 1 +
 target/nios2/helper.c             | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 9a372f0717..1e93b54cd1 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1 +1,2 @@
 TARGET_ARCH=nios2
+TARGET_ALIGNED_ONLY=y
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 460032adc0..bf40cff779 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -264,8 +264,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
-    helper_raise_exception(env, EXCP_UNALIGN);
+    cs->exception_index = EXCP_UNALIGN;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.25.1


