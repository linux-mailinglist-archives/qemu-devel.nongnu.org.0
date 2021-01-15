Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC342F88EA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:53:19 +0100 (CET)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xy0-0000zo-27
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs0-0003XQ-BK
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:11 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrr-0005Cc-0p
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:00 -0500
Received: by mail-pl1-x62d.google.com with SMTP id r4so5433205pls.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6Vn8EuRt3zWEIGcR+Vsso1EpzS5NZb4Sjnv0xY+IUE=;
 b=PaMRsJ4AsTRmfgunMw9G8wCbtxV4VxB1Y1z9QfOjPTRXIaAdiK3IdR+RcWr7+RQjVV
 +5NEQMFyR4LvlAwjdEjoQ97GxyFyzv+Igw+PjGZnPtWaKBdm2i2I62Lt3mhEShKDLWKb
 RQVHuBB0r5K009sLlE/7GuVkX8lqY/NWLZKu9WwpBL0WTWSYLqokrupSOpy2itAf/I8r
 xzKYdyff9RMsNShrlrPEytol4MLV4QYtcmIHF9d17/OvZ34GN+wYxIRoVJy4rVvkegJ6
 1DN2OBlmCZw2Q4pRc2GZ8uYn0/uzok7N19XV7hNiy5EMdYYwoHXDn/jPqInbKKV2oEaA
 Pm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6Vn8EuRt3zWEIGcR+Vsso1EpzS5NZb4Sjnv0xY+IUE=;
 b=uF5POL/xeVXnZavmKV0O7NRxVo4/Lx/zmIufbnWn4CyMwAY1WoVF+1DxzhxvTvLhIE
 5ngwIFbQ4GNDfii2OEl8BjE2rtVRlGpz3SB2Zuvk5a+zZ8DGhAblCauXV/IP0o63+YnO
 Ks+rGI75HOllFtUB0ETHV0Hv/Gr7ZimE8m/ZFEcuYPXkPltznYhtxHHDxwA6A9kp5oYO
 2vfunfckL5ol7XsIBH+QSmgroHX17X9eP/3BaPUHhEEbVKRpic3l6bsDTL0HOSPxBiUf
 wW7X03abWrTiWq+HLhkvSi/JZg5664PNlXVagyCtDQVfitqbUmrfErC3pCGhXBSPZRP1
 Aicw==
X-Gm-Message-State: AOAM531IuHLhZQ3EnRNVJcvxQ0F3pNsN7d25Hf4oYgAEay9d7/oHHd2P
 utcOpKjbrwQq0EXIqC7f9A8aUIEzIGMLifjr
X-Google-Smtp-Source: ABdhPJz/yEGErCk7Zt/Jr61dhPZ59UrTF4umCcm5gp1WUGuNvi9T7g+4Ef3q+Jc0PjMiCJzrq2y4Zw==
X-Received: by 2002:a17:902:8341:b029:dc:27b:be2d with SMTP id
 z1-20020a1709028341b02900dc027bbe2dmr15083974pln.30.1610750813805; 
 Fri, 15 Jan 2021 14:46:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/21] exec: Use uintptr_t for guest_base
Date: Fri, 15 Jan 2021 12:46:27 -1000
Message-Id: <20210115224645.1196742-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 2 +-
 linux-user/main.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c23c77589b..c52180e8e6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
  */
-extern unsigned long guest_base;
+extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 65163e1396..5c8e6a4acd 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,7 +41,7 @@
 
 int singlestep;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
diff --git a/linux-user/main.c b/linux-user/main.c
index bb4e55e8fc..2600245300 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -58,7 +58,7 @@ static const char *cpu_model;
 static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 
 /*
-- 
2.25.1


