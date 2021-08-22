Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B93F3D75
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:09:27 +0200 (CEST)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHenU-00080l-VF
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaN-0007qX-HA
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaM-0000gV-6G
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso16420672pjh.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jgJJjeTXjiUbDbukKE88rjflxSR0+x8oJyqtKcc0hjQ=;
 b=Gj3DeRrQ3WVvfNNZ/wsC05LHMuAg4oi87tQTGJeVeEO0w25mz8bq4D7Sl+KHxVyvNJ
 72xA0UTF7cz21IrPT9dPTwwMmpDeNT61fFQY4oj69uNB962DC1SDMW+KwHp5f8o0m8Wl
 k8Fwczdgz/kRy652jOzwWPXu9yJcOWi4b/FCCyq4D5jtFC3qOFF9vSRF0Vozu51TG075
 AEcMw5cP9+onml+cbMcjtl+OwYs3GsaT6Fp08aaj+JVwyBFrgidBCCKWeXDXDwCXqjfD
 oAYJiKZC2ouxuAD8LrWDrhv5h/HtVtLctlptV1c3vQBWWW7CxPN4YG9vAwuIywEgoUFK
 /VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgJJjeTXjiUbDbukKE88rjflxSR0+x8oJyqtKcc0hjQ=;
 b=Y8S1gX52h3zytPKopWY/xxaEzlx/UH5f2SK/vUd1rgdBlmmEVy0eoLPK89EBqqRDLp
 kQAs+oYTyFPN/Z0jHHngTQpnjztTY841kI8rqNv1R8hwD0eNpyxSRv5J8ADtQ3wzoMcV
 oMC3zYea1W3AXEXQZBNeyf4bJSMvR5KsxOeM9kCeKzEDfkZNMmGEFTw9cK6e/sqZQyJA
 a6SBoframuwcBAVGoNYUkNNnJ7Npny+mLnut0xP7XKgaHDEJVL7Sn+erEcHJcBLopSVy
 7jNC76s/rkTHHlJNgC3Hnmh+bQYqEMuHabUCQ7SAYdzIWxjsmo+RfuLi4NE8eFlArQkA
 DmjA==
X-Gm-Message-State: AOAM533O1jfQqlbKQRzlb/LTu2kAOyLfJNkLScxEE3/zXS2h6Eu8PrNj
 gVVnpxiUQasx4eRc8lMl7ouGzB0AqeQahw==
X-Google-Smtp-Source: ABdhPJxwPCFuUZJyziHZuAW3ygTEfIbGyEMgRUlZNmWBQtz1/oVIJVNGGWZ+6BZ/cLX2KqYXyHEnzw==
X-Received: by 2002:a17:903:2443:b0:12e:6093:2877 with SMTP id
 l3-20020a170903244300b0012e60932877mr20146060pls.21.1629604548904; 
 Sat, 21 Aug 2021 20:55:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/30] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Sat, 21 Aug 2021 20:55:22 -0700
Message-Id: <20210822035537.283193-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

These si_codes have been properly set by the kernel since the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 3500b2c291..7bc85dffd0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -159,11 +159,17 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->cr[CR_IOR]);
             break;
         case EXCP_ILL:
-        case EXCP_PRIV_OPR:
-        case EXCP_PRIV_REG:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
+        case EXCP_PRIV_OPR:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            break;
+        case EXCP_PRIV_REG:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
+            break;
         case EXCP_OVERFLOW:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
+            break;
         case EXCP_COND:
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
-- 
2.25.1


