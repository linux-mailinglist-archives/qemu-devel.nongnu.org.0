Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E762A50BDD8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:03:46 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwh8-0000BI-2N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWb-0000Ce-KR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWa-0007E1-2L
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id b7so12099169plh.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaXzjQ4uHQf8aegyrwpNgla1ibfyULSXvI/9Vr/sAxc=;
 b=uzvq1Mmx4Z5LeDSrJix1HRmDgnXI16CUHKhB0IpCC4jJErwC+K6nDWPszW5ubK9+El
 pYFaL3g2doJcDRyVvUe1YaB3PP1cs5SkwXUTw5awRY/vvgj5csQMDpztGB3ixGaFLCog
 tw1+vH5G+hzQ2I0Oe6wgf4o7CHN/1j6XvOJSDhKD8zPNua3ir20q4UxM4sqtD0FsCWJR
 6iwik96YUgffyiXJEJT6aDU7YJJ8Mm+bI4AB0aTCa7eU7afnADHIjbBFF1c3kxyGm+DJ
 EowY8vqvvzlS2FE6VLvLz/6XeNCylScSq0YyK2sN8zftzZTpfD65S2tuW/L44GCMwixr
 V0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaXzjQ4uHQf8aegyrwpNgla1ibfyULSXvI/9Vr/sAxc=;
 b=NKimjJAoJjP74sXjrwzk0+xuzKVnGP5lQUFpaXM0qH3xgFYoFNMp2d5keAOHI838uk
 1k5q9QWbzpZeo5T8C2qPfMN+JJUjjAYZBWBuCLeVyqAz2zgVfsrpJxWYqw2v8iuzcIUB
 okIPAZ+wauMdxGS+CzQAyRM3DZRk/Q3YtXiEq6rIMmj2Tw0gcu9fxKe65Apk8IlVTDB4
 XlG0Ht0RAUoAtY2/6nOhTnG+QLU88uSUGOqNjOp8cVdgbTqI590klYrZ10y0jziQOHRU
 XjUqacZInhI1xnpWjYPOVPrufe/7MT+4BEkFyFQON9Bz4xJJyWW34dd3yPCi61A8wwJW
 jOxw==
X-Gm-Message-State: AOAM530yAJQzOHeSl+T2/xm5l52syymyX+UpP+EJ+RaMUPuxQ0kgqM27
 okRQg5zg2z5kN7wmjr6BAb6Yj4EC8rKYffhI
X-Google-Smtp-Source: ABdhPJwFwnniLkk7Gn8aVu+3cBlXH3ECWkKgTzAfwPK4WtdspHwGYFKRSEw/6cMEmifsTJH0LecuiQ==
X-Received: by 2002:a17:902:c2c7:b0:159:9f9:85f3 with SMTP id
 c7-20020a170902c2c700b0015909f985f3mr5227177pla.18.1650646370791; 
 Fri, 22 Apr 2022 09:52:50 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/68] linux-user/nios2: Handle special qemu syscall return
 values
Date: Fri, 22 Apr 2022 09:51:35 -0700
Message-Id: <20220422165238.1971496-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Message-Id: <20220421151735.31996-6-richard.henderson@linaro.org>
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


