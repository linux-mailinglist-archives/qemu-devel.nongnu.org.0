Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD450A44F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:34:01 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYoi-0001Cl-Kx
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ1-0006mk-Uq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ0-0006Cu-Ap
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so2968235pfe.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaaXZ26vJ/J580k0oNw8HgY94fKNXkF1jnEzhxfmRJs=;
 b=gHjUymsJQsjbYqIpp9EstcEJ2EYosUpEiV8t+OmJb+wQG8Y3WD582UVpMExpql6Yzz
 Q2x2oJemhuQzLeUsvcePFLUbbSA//Cja60cBSxfcR8Ai/dHH3l3JJ7BPWGnACCnBdMFM
 jgiBcgru1NiMq4xu5oQPluYk3fpRJ9DJ30trRsW1UnA2hjUcdsI+Y6SDmteyAY6gzyPt
 NMOUJLGZb7CLdT0/2PtjJC7j8Pl09XXheHqMFwzSvzo0PZl+Zuk0jeIH53Qj40npgc5l
 9YUQa4BtABbhBa/UTeTnJ427U9T1ZBGJKIkgvSLtu429ZlFwKOwOpqyu4bktg2d+pj34
 Kufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaaXZ26vJ/J580k0oNw8HgY94fKNXkF1jnEzhxfmRJs=;
 b=cOJxnAQX16X2u4pa2nHd79epZT3NYRwow1+/ZzFg2tXE0kGYCbUu2UXJ770u7rUiE7
 7Mj3nZ2sWjYLMMtrKb7usFftCYRNVRX611yr5jIKwToI5w9YMrFQV/G6XWR4NOdu7e32
 BUJkBeuZ4FLiDxBCsnU3fc7mr7bpsnJNhBXPZzL9jOYjP8euFFKO5cvSTrRUdSIg5gVC
 uU92NXMbEqh60B6jWQ+W0qqlgP0nS4CzAsXkpf1g1KFnFLJG4P2UEDcySikKkmT+oKEK
 Y54JjTIzuWkWGH3bpnsSP39iz/Y88R5aMr4RPZlpbbapd+vlGjQmbal1o1pukCtNGVGw
 E/Gw==
X-Gm-Message-State: AOAM530htFZTC0TUws/WbWo51SgyEiscS24FWDaXRfwxp9cL9OQGDzY5
 wugpiJJckF2QlX4ic9nOeixTRrVDly35TA==
X-Google-Smtp-Source: ABdhPJyVdiD5pz7w0hgSbo7b6RXhGuiLpzoPtK3Y9NgZ3muYNJMeEspnsN8LHEy8wt3MkVBfv15KjQ==
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr110717pfv.65.1650554264875; 
 Thu, 21 Apr 2022 08:17:44 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/64] linux-user/nios2: Adjust error return
Date: Thu, 21 Apr 2022 08:16:35 -0700
Message-Id: <20220421151735.31996-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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


