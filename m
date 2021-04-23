Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE94369780
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:57:55 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZz7p-0001jW-Uh
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4Z-0008M1-E6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:31 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4R-0008BD-Em
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v13so11913493ple.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsXeBdu2JntzVj4lcYbggTf999tBIRhJuC0R8XrcZfo=;
 b=MV94a6zoAq3XHyIT3U7vYCjunnAHwNGV3qNSWlnKEH9UENIRmBkH680fCdfzqKcx5S
 x4HsinVIvfa29ch00Rdg/SMAQdJ1qRiPk3i09VRe8sCHyeOKkttyM8xMiz+EPm6SuDJS
 seSIu3IM31eo5vF8ZGBqgW+Z9vKvQTozLMglUD+di8ccy/lAweMcLVHN5Fi0x8Y095nW
 mpb+UgaWQelfqQ7QoIzT/0kCBf3bUu1Kcfg+7OTYoVQlFYhBp/PwJCKYHsjY5TmYAR7A
 6+f9ooLTvxByrPpQrdW4GkRNNNrp94jHgy+wJu6VNYC1kJg6BnYsIHm/c3rh7RveYyOq
 5cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsXeBdu2JntzVj4lcYbggTf999tBIRhJuC0R8XrcZfo=;
 b=d9cieg8JhI9ohs2ygLAGtU4fBhtS6/N+N/EIGEPI4su55y8/As7OFMXjQTOGzyrBXC
 Aq5OzLhakQotCYlI54T45UpNN7g4FRRZJzBYsSdQZS9L3ArlTXb29AsMqjPwQAPRJCfM
 monFoj37YdVuK3kqD1iRZ8wdk/P55VLbHhW3+ih/ddHCkSJEFqHTBek44xVHVtVrgI35
 TQv54eeIlVU+AFnfSevAUYBbAmL7T4tqH9bAQv0BTo2eigpjwcV5q2VkdAqAQYQ/x5Pa
 Zp9z3bTLBCW4JKmZm/hkjgx1EFSdAEwPdcoJeW7Gtz2ZwO/u3GZeTd540R7SgbKjorKW
 Fwvw==
X-Gm-Message-State: AOAM533rRQJzaYM3B9CgsYJ9fDrTrvO3sUcnt8r0PjYr6wZMewfVnNNc
 v1++emImbTW4nh2asiURQeAYKV0vzlt6Aw==
X-Google-Smtp-Source: ABdhPJxPeFLFggVgXKLHLEqczytRWW7AoVCCPKjzeXub19pFfG3PEIL47EEKkw8op/LucMd47smdQQ==
X-Received: by 2002:a17:90b:238d:: with SMTP id
 mr13mr5509325pjb.23.1619196856212; 
 Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux-user/arm: Do not emulate fpa11 in thumb mode
Date: Fri, 23 Apr 2021 09:54:11 -0700
Message-Id: <20210423165413.338259-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These antiquated instructions are arm-mode only.

Buglink: https://bugs.launchpad.net/bugs/1925512
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 106909c7d8..e2a1496b9f 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -347,7 +347,7 @@ void cpu_loop(CPUARMState *env)
                     goto excp_debug;
                 }
 
-                if (emulate_arm_fpa11(env, opcode)) {
+                if (!env->thumb && emulate_arm_fpa11(env, opcode)) {
                     break;
                 }
 
-- 
2.25.1


