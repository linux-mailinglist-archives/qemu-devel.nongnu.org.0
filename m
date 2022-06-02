Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13653B152
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:44:05 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZsa-0004iZ-Um
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj4-0002Ot-9f
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:14 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiz-0005Ei-IC
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:12 -0400
Received: by mail-pl1-x629.google.com with SMTP id i1so3276876plg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8QVHsssV/N9S00mQXjYBPgFpjBb96NXM+kaVdZ/lRE=;
 b=Hlsxl02aExRZSOEMZ1YXVMIUwqpkQlJqLtVKC+eDhzgZlmpTslGd7yuZ5sxW7h+WCa
 7sqbfycVWVJFKPKcf7HpNUYVrlBHZTZsVHZ6mrnj++XOGWmEWQm6pDFiXoq1Y+FbtWV4
 M4P5IBEwJ7PrPCOSg1s65sq3oBXNX3NASZCMbA0fuBKf3OCFLxO4VKtcJloifoEuV0bx
 /ErqLhuoW5rdhJiY3LS3APfGXzKotGWUxoY+KaT4cxQmB1H8MEzDFOFOXYkjLtmq0hDB
 o/2lnOWckDmg/9Wuv3S1sN1JpyeBDfxUNidjm9+rJ9f7FnMhackoAooNJPqXJnOqYxnK
 Delw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8QVHsssV/N9S00mQXjYBPgFpjBb96NXM+kaVdZ/lRE=;
 b=2OwISZjZgDmQvaGlU9/KgrGLlP5pZy0omSQL+JG1qUWSkbxaeqiJJ0QsQcn/HgHQAD
 +kKCMEV6ZtUj70KSS+rSKkgzp1SHUdIuzxBYm4w5/TPRl9XQrHUKybl9oYGVgH/cPDJL
 0XM/s80PPi8NfdTJAmWovrh5pTI/lxfmeoOvWsqpI46T/pEmnjZXtFq4pXRzPNDUlG1r
 8cCmRtuQyg0a+7PmPdE/7Y0t7IGAclT6ertQBq++pVSGj5eA+4JmxkzM61zA7qV4OHme
 PftmJv3by/iS7LrOqMxHXmGx0uXlRc7On0dqb5vP44T4JTUf3fwGjxf8jfzSV3Frr7Ay
 mNMg==
X-Gm-Message-State: AOAM533raPI5MhRwMNxO4HX/5XDc2lHYbpfDiINB6vkDUmqiWXvFi+fp
 imH4SYEsZwj95XivYpVE0EWJFpLtl2yO8A==
X-Google-Smtp-Source: ABdhPJzwGPZvl63TpqAjgBI3dF59d80sAW9gIfvZzF6E/z5YRMrD1uMGButcaSCHVGrrrKaJu2AOzg==
X-Received: by 2002:a17:90b:1d90:b0:1df:d0ae:1443 with SMTP id
 pf16-20020a17090b1d9000b001dfd0ae1443mr2418782pjb.122.1654133648114; 
 Wed, 01 Jun 2022 18:34:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Date: Wed,  1 Jun 2022 18:33:48 -0700
Message-Id: <20220602013401.303699-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 56417f7401..12e5d9cd53 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -75,7 +75,11 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
+            break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.34.1


