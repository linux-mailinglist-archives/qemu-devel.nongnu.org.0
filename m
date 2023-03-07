Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961596AED27
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaz-0006WH-3D; Tue, 07 Mar 2023 12:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbak-0006QE-A8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:16 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbai-0000Hj-Rs
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:14 -0500
Received: by mail-pl1-x629.google.com with SMTP id i10so14994604plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQjWSH3sAb1ESFEEbtwzbWOjNXrNSHZagtnKT5gMg6E=;
 b=Mnt06FbEWy9CdzEFFptD6zWoc+B8g500j26SmmYrW1iQmleBG+gv7GVDzwd3XVZSqs
 N4hHZwrAqB6XuqTB8tbwFZWUy59JC9ixri2S6dY1MjCoRnpRWAhQgcG9Ht+O1vVkBr5u
 jkoim7Kc4N7d8rju6Mz66K3V4wiLTeFOXkJejxmxU1WJzBkqa/2lG1Lkap7BlBGnZhTN
 Xcl1jmIfnE3QF4s7YdvI/NqCL/4Luz6aZ4W738hSc+VoB+MIuXJnV2d3DpQY6GDiq6Ub
 px3345SgIgc+e0oTux73M23hvmZJzFxftIqpDdZ0PnypKG1JbNZLUYduuikna9m+IZaz
 3RWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQjWSH3sAb1ESFEEbtwzbWOjNXrNSHZagtnKT5gMg6E=;
 b=skK9leaT3GzIEnbBH/ZcrtcbDktARTmYrO7kaAhK7r9gXKlPRQ0fyudpuJh3qVO9zP
 52OIL01l2Ds8D7py4O1Q5Je4nFyZ8dvFj/0v5PWi0jfaHYlPc5l9m8+RgHR4Tr2SZH1M
 KTwwpy8d08chRpZZz6z9HsOKrRFcpkqGqdjUp50QBN1mWSksE6IFI8dzJbNXCHcgv0Sl
 rqw3JvSiua4xnpr7hng1V9g1nd5L4tYPHwHKVRFRJVfgN8nRQadl6xpn3gvd2W/Tpkso
 Rmeer3/3ngpXbOfo7k85ytNW2jWJgthHXmHEtwYgFbfsLt9OzCGxcDS1YVH1pFmFJjqX
 QGQA==
X-Gm-Message-State: AO0yUKWYhMW0n45Y6GdfWXVh3R7qerfPTZ5d2GQouLUY3OakFK7uYqJw
 P1+1T6/7qdyW7YtO+K2EZYn4MeKnwJucAdOmN2U=
X-Google-Smtp-Source: AK7set8t9i9gT7s1jA7SL9g2yZwWKgzGu93DKcZgOB9F5DynoIV9joF9SPDwMkDpTibGIerE8jAXlQ==
X-Received: by 2002:a17:903:11c4:b0:19e:f315:98d with SMTP id
 q4-20020a17090311c400b0019ef315098dmr639728plh.43.1678211952118; 
 Tue, 07 Mar 2023 09:59:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 28/67] target/nios2: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:09 -0800
Message-Id: <20230307175848.2508955-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-14-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/nios2/cpu-param.h b/target/nios2/cpu-param.h
index 177d720864..767bba4b7b 100644
--- a/target/nios2/cpu-param.h
+++ b/target/nios2/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


