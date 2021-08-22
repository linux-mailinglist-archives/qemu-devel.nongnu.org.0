Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7123F3D8C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:20:51 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeyU-0000CZ-0m
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaR-0007tQ-D5
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaP-0000jS-Q0
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id e7so13334123pgk.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4ABiYbSFXZhLI78uqHDE/IKCat0vkJCalHfW7nxEF0=;
 b=Kq8r5nzYbdmfv1JWiEddnS4y948QncZZa9UzDyipdzH3flWX29k+/DkYMi/ufqYcSZ
 h/mLflqbN0ccYh+3S1AC/cg6NgXNcibmUZxldbtC+IJjhzN8YsPUkYIumy7NMrSd/WKS
 PJ9dqNzy6qEKGminyiVtOYLJYEM1mOpzvo2ZcoMUhg+mavWDOtpdUnNpVtkS5UQRxcXm
 nowufJUD83BUuGbY6Zn5KhWotuh0aIAKFyMR/jZWy2LDhPTwnOvIAvhtjIP90kvlFAJS
 3Jx93QGJUuK9SZSUQL6pDhu6n7mjc1uq0gDYaCfYFr0qyhxLh9a5W5XDLqTFluFK2pvz
 2MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4ABiYbSFXZhLI78uqHDE/IKCat0vkJCalHfW7nxEF0=;
 b=JMr1KLEDFq9DGytkgO9LwxgrOnbrP3XXyf7ovkm6sFsz3ZgXimvrZTkHAVuYiWwYlI
 h6jKDXrA0T7NYt3daUhgGUzbPFxSOdg33S8HsYMdHURdKwgQVFszf9ea49UDXicnHbut
 JZmCwWhRcwnp729CQcj1AtPdarcDnJBwtsjvooteLnHi+AdCizfKzWeL1KvjAqc1gX43
 Tdx71z/NJa+yRXNK2KlkPhJyV4HFLoxwV7cmKgIiQuqsQ4SFP32Uzpo0ODHlay6CXpGQ
 qX4xIoI3pSKCvKnnBGy4sqXk4XqYclCPPgxJ3TH6ZhF8DhnxbKxXWlgcDjwwtewDLi7S
 71tg==
X-Gm-Message-State: AOAM530YAymUcIE7wzpbI9+23/W54xEGnqW3WZkWNneNFvLL+yxVjxzt
 X4o3D3mSXW68BohiOmKncHQgfRZx7rAlEg==
X-Google-Smtp-Source: ABdhPJyhkDsTHBfrd/vKXvwcKE7CDSqKqoqhjC7d7cbRyv+1e0HIjpxDwzrCh5hkM/DL+a/v3j7pew==
X-Received: by 2002:a65:4203:: with SMTP id c3mr25638480pgq.309.1629604552594; 
 Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/30] linux-user/microblaze: Fix SIGFPE si_codes
Date: Sat, 21 Aug 2021 20:55:28 -0700
Message-Id: <20210822035537.283193-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
Fix the if ladder for decoding floating-point exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 9e07e52573..4a75c853b2 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -81,15 +81,25 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
-                si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
-                si_code = 0;
-                if (env->fsr & FSR_IO) {
+                /*
+                 * Note that the kernel passes along fsr as si_code
+                 * if there's no recognized bit set.  Possibly this
+                 * implies that si_code is 0, but follow the structure.
+                 */
+                si_code = env->fsr;
+                if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
-                }
-                if (env->fsr & FSR_DZ) {
+                } else if (si_code & FSR_OF) {
+                    si_code = TARGET_FPE_FLTOVF;
+                } else if (si_code & FSR_UF) {
+                    si_code = TARGET_FPE_FLTUND;
+                } else if (si_code & FSR_DZ) {
                     si_code = TARGET_FPE_FLTDIV;
+                } else if (si_code & FSR_DO) {
+                    si_code = TARGET_FPE_FLTRES;
                 }
                 break;
             default:
-- 
2.25.1


