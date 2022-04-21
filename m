Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31B50A47F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:41:05 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYvY-0007lV-Vb
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ3-0006qE-8A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:49 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ1-0006DF-NB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q1so3995508plx.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7B5zMUtr7IZWIC/qs3oi7ayjqdV/BPYXqzDj5dQNLBE=;
 b=RxrVme+mMTnhXY4/id4KYjTus+lvkUjo/dK9vEO1n7PmOpowvkMjpDvTLYb9n6n1Rd
 Q7fyyoclWXI+Qcr3aKi+r1jUYYOnz8lvqI9BUBCuJ28fx9JlHd8HLaVom2Qc93dXmgiK
 rRZNWbiOJ3gzqzArssClWL/x+Mtik377TNed399J8VIbJ2YCvTGH84ZFTYYoHqgggs1N
 rvvWkAa5c1b1+w2t7hfPRmTzDhBpRo31ncRbsfjRS30XsbRJCf82iO9qsP188bLyEQH5
 FuC6lur4N5o6zHqMc0SnTDqBb1LYgxN5VdPhDJ84GduW8nVdUUSatpWuQZT1hEo3Sc2y
 cB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7B5zMUtr7IZWIC/qs3oi7ayjqdV/BPYXqzDj5dQNLBE=;
 b=hPKdqXObuAdinwTkQorlWx8ucOfbWJ+FQlJRbFaHh9hMHE4OW0SnFH11oStoq8Ehae
 a5BIaGVhpygETzhcOfkCfAVMQfyNTQkfa0zD3VXc/BJlX0n97VQBTI151E4N1C4JInMM
 1LB5N9xRDQxR1eb7xwZFtZVClQ6oMtQrFf5sefPEi87gtCiT/iy203KvqbifjJOk4bd6
 YrEDg6T3p8EKjgi1x4AN9PtNdmJ8LZB+T7WQtoGRdY00Sq4C1QHLMvYPNjaUGAINpZrG
 6pVZZADyvtxZ9stnCH9g6gzw2dC2xBM4fQaLXxhUM4PO2ASjiobh2QW4HH+88Jrxzgwa
 KgiQ==
X-Gm-Message-State: AOAM532eRCt/jITkRU1VQ8RggksUIymH4W5TPYgdJL54eDmypYsGV3V8
 786Zr4aiABM1vqj3ifHXwliSfQ2FYYco+A==
X-Google-Smtp-Source: ABdhPJyDspwv0nwBlV8aZ9yRbI/U63UiihPGXDtVrZXGfmH4fzD+sE4TyAkJ+YpWEkFymxu2G3RtkA==
X-Received: by 2002:a17:90a:d709:b0:1d2:87a9:47d9 with SMTP id
 y9-20020a17090ad70900b001d287a947d9mr10956607pju.47.1650554266443; 
 Thu, 21 Apr 2022 08:17:46 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/64] linux-user/nios2: Handle special qemu syscall return
 values
Date: Thu, 21 Apr 2022 08:16:36 -0700
Message-Id: <20220421151735.31996-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor QEMU_ESIGRETURN and QEMU_ERESTARTSYS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 63afba5862..2963fc62b4 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,6 +55,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                if (ret == -QEMU_ESIGRETURN) {
+                    /* rt_sigreturn has set all state. */
+                    break;
+                }
+                if (ret == -QEMU_ERESTARTSYS) {
+                    env->regs[R_PC] -= 4;
+                    break;
+                }
                 /*
                  * See the code after translate_rc_and_ret: all negative
                  * values are errors (aided by userspace restricted to 2G),
-- 
2.34.1


