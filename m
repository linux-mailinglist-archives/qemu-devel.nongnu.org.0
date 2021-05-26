Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8B391749
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:23:14 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsZ7-0004VH-7H
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV6-0001Zt-2d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00033H-0c
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id 16so585634wmj.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PQhiScHPkNKcCY+PhXTE0UGJiFJX/FPoJRFcJeb+U0=;
 b=OpUxCrrXqnAop+Smfw6gb/h67wmtiVBhoiTxyI9RdJu0GgMBdKVFHdR1dgGqvRBx2L
 s7BGEwAUZQyxBpuIvHcFGuYyxcvqyu7PHtCJTQhZz5FQNgNqynij5pIP+96/biiSZisW
 jj/WgPmyAzSVzDQYJQ59PhezGe3ROXAFmhAhpT24o0n3OxLo9BLoXCeSu3HZxINww8lA
 F7v5JCa1csryj6+JmTK2ZCt1rnwj1cG32qvGQZfW4q+/THrWGWy0ZW9Aao+6LGhZRJ74
 PAC9g1dLCRAYbkGQMkIueVyfijS3biBOgRU8Ilo+y1FqG2ZdXBV01/TPzb5p/Yv76+zU
 8IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PQhiScHPkNKcCY+PhXTE0UGJiFJX/FPoJRFcJeb+U0=;
 b=otXWL1g+DXu/JVOvI9vyphVnSp9swCpEInlHJUmie4HatlTXs5NTqOVSq1jAa71T5l
 Ju2ETjCZTibTn7ZZ8evcvD3XDblhlMGV6MFVdU5OMv7FQBLEZDNhIrSn1qOnIMmTEUwe
 l5AdHdqyWyNZZDBsNWcMb/h6JdTL82cszm3sQOAKmdKC1tj1JBnAex2pe2tD8nl9QLmF
 JHb231309GUwM93HedUxMZaU/9HShtYG7zriuse8ziz4r9pet8C9Orp5ECxr1Pk93Tq9
 hPADHp8rjNVI61FFU73rA3AVW6wgvHR+tbjuES8DVJbe+hJXjIxWjV4+5kbf4N5Tpq93
 ZnZg==
X-Gm-Message-State: AOAM530N+JbRqIYYX0KMtcfszafue4mwOvjIbnruhHNhKd1530nR9T5O
 6uaSYbdiGRY7KinxDesKjhRXBA==
X-Google-Smtp-Source: ABdhPJxxuPZR4qBKDwQ9bix/m6K/wNuvILQZFok1m5NYwWukVXYdSHkYb7c8r1Ow0bIx+UTrZFPhcg==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr29180288wmb.45.1622031534171; 
 Wed, 26 May 2021 05:18:54 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id n13sm21000887wrg.75.2021.05.26.05.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:53 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 2/4] target/arm: fold do_raise_exception into raise_exception
Date: Wed, 26 May 2021 13:18:45 +0100
Message-Id: <20210526121847.1935454-3-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that there are no other users of do_raise_exception, fold it into
raise_exception.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/op_helper.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 078ed74ab962..3b3daa955598 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -27,8 +27,8 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
-                                    uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -49,14 +49,6 @@ static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
     env->exception.target_el = target_el;
-
-    return cs;
-}
-
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
-{
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
     cpu_loop_exit(cs);
 }
 
-- 
2.30.2


