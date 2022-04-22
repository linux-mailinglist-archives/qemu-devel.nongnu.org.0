Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0750BDC2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:58:26 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwbx-0000hQ-3A
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWa-00007Y-50
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:52 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWY-0007Dn-Kf
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:51 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b7so12098992plh.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cz85jXXNTXB185MIdFgmydKGclnlgZjRARJ6+y2fc4Y=;
 b=X+2ySwRtDHvKdewvEQc5EeuOUJXBUeaNWAR3WuSmmX+2WMyBQAAGtmWbmrOJ4jOFGd
 Xd0rWY7XtQpgdlieMqA5Bmico69M7orv0N+AMweEiAMrUSK57Q5cZSr5KU97y5DA0GyZ
 jkcrlOeZQe76qo5y/RM07U6ynFJcxoX+YCCj1I6Yy38bhE6iz5CS1iPHIPUBy2owANaq
 7P/htl+pCNrBaa2j8wWuO+/kH44ClwLigsQHhT0D4+bT0K/2MZIbzc4+8rdjJn6faTOv
 ZDvewe/6v8CQARtYd3ufapGSYZTOvkEh25BOshEeAIS/23ZyTot0cbA6mzeymKXtA9Cd
 9w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cz85jXXNTXB185MIdFgmydKGclnlgZjRARJ6+y2fc4Y=;
 b=GzbceIozLmO1DCa4rQfFu5+pDO2C05vDMin6kxC9QseLKCsteO6WFv82bfoD4XzxEs
 ZtCoGgk2iN27PRbmtbabEXX3tVTtOckR0QLso/8ljzllw6L4L8Bh2F/h7oH3nkf/37Ye
 7E/5vPOggb14cEqMztFpAw7DX6gaO7ieBWJMeu7dxl+fL31MOTlL+jRWM4y2CKSnCSC0
 xbCBTXoheIjHMIMde2WjheMu9H7M1dcUmpnePgUWFAGRxHKi8m6UkfNtvqhOB+F2M/Nq
 x8OrDlJPEE6/zgbxIXzTc0Dy3bZSRl5Qai2mJrM5ngeTrYay2VRsgburBZcgu23iTnnC
 ff1g==
X-Gm-Message-State: AOAM531XkrBc9fGMWqvtiPGtWEls9luhEE18LA+GYbSGGBc+O/fgp/LQ
 yKzrBxGSfPOGknnBHA1Eb1S6RDmf/foetqrY
X-Google-Smtp-Source: ABdhPJyWliwcSR0Z8inJcG+LBFBGWjj6m+srQDM1HhoZ6jQcGNRqnz7COsqZ2LxbF0LBWn5SXKvcoQ==
X-Received: by 2002:a17:902:ea53:b0:15b:1bb8:ac9e with SMTP id
 r19-20020a170902ea5300b0015b1bb8ac9emr5325922plg.45.1650646369350; 
 Fri, 22 Apr 2022 09:52:49 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/68] linux-user/nios2: Adjust error return
Date: Fri, 22 Apr 2022 09:51:34 -0700
Message-Id: <20220422165238.1971496-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


