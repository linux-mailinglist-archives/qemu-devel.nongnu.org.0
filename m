Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1907515DA9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:37:11 +0200 (CEST)
Received: from localhost ([::1]:60098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknHa-0001z1-V7
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAL-0004gK-Cq
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:43 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAI-0006Cs-J2
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id a11so9074853pff.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tl4F0M/gOxqcmd1Ho0EBp9s9GppksaThNyFvq/k0E0E=;
 b=Imyz5dgCKPDXsQAaNisYgo38+kyyK/4XqFm0ucezEGCxTw2ZbS05dLfppOQAzcDr0D
 3iWych4dyUvrHx8IP/UlKoPppqpHiPnpc5KbBajTdEuKeUxa7K3T8bjb4WcdIaW336sP
 RqRiJ7Ou/H4iHO613N7pBfZEve4R7F/Agp59ShSk2Es5hqoLpWUAjhjKqzC+9XcwiDzA
 8rXd222IJmJlL1jvUsu6n99Fj9P4DK1GCbTQExMFnPCWhqTS7/9DPlHoQ98p3XysBjHb
 mjv6CP4+0mr27GPkQdcK3MuyZpMfdfkEr1lokDSc1R1oQpeNkIogDP1T2iHybTKXURdI
 5WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tl4F0M/gOxqcmd1Ho0EBp9s9GppksaThNyFvq/k0E0E=;
 b=gkDqtlxAXWb0wCCpAILN9d+YBzApku/z8JO7F49vdossW3bz1EJ6+pOH8e8+M7z3gI
 FnK5y6ehjRy6AvnUrpzPEyERnuwoYhoXQ1YdkzPNYWpYjerHlsLSv9s031YxbBIAR/tb
 4m671vtMNJ0gfyRBZtFm+XkbkacWGdRnqh01vIbLXSNnIqa+gxqxwVg0fVkCH7jupoDl
 UYl8z+e/gki8BAuQTntLhNssU6uImIsQ9XC5WyiDTvGgWS8F+kXp34LgkFCeSCdAatyu
 6Qo27DrpL9nnuZ5heX2oOwXctnzcFfSnJE3UXMxX8sVDIX8zjploBKpoNxp9IuI9g1oS
 4htQ==
X-Gm-Message-State: AOAM531SSr9lkx3+0Bp8PSa1sMXzxrl4+9nNxZ2d1ZCxPDMDPrmYm2Tm
 YTqlsC73mW9GyjDOyVMqTgdR8j6P6CWfog==
X-Google-Smtp-Source: ABdhPJweC17YhaCdFBjS33va1wNkP7pBfYJ8+bRF0QV7zl/O/PYbGd1LetMAlYzhyFiyIpFYt2d3FA==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr3833726pfh.60.1651325377248; 
 Sat, 30 Apr 2022 06:29:37 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/43] semihosting: Improve condition for config.c and
 console.c
Date: Sat, 30 Apr 2022 06:28:52 -0700
Message-Id: <20220430132932.324018-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While CONFIG_SEMIHOSTING is currently only set for softmmu,
this will not continue to be true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index ea8090abe3..4344e43fb9 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
 ))
-- 
2.34.1


