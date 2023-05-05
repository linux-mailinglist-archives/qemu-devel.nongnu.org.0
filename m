Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E86F8ACA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vL-0000gi-2D; Fri, 05 May 2023 17:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vF-0000ed-39
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0004R8-Q1
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:00 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so23095545e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321897; x=1685913897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rrz9M9TbqlhgVjUVbycqe3VtoE3QrVAsV7Ge7VQZ3uw=;
 b=EPelVIWj0tSeSLQqcBURUqGCcgOS2tuvfgGPfN6RsweSJ15IXFZr7Yo3hIcGGAP8Rd
 vV6EDlKpNU+EsPK5V0ATXTBbsFOVynyTEGb4SdeJ3UwsofrXbf5lY/ejNYuue1dyBJvw
 E3PXJApBUeik6oz0lReMUn8ZJJ2ktFRYmpxnmx32CA1C4t+e4moB9yFo4Zxd4yZJRSIc
 BtakbfAxYd7d7WRPeRsO64tgi7suApxy6/aVEeKjCSqplNCIKoct9OGJilSWVZ7U0ipl
 wN+i6bfrqXcDKFPBKHwiZAjyHc8natecYtblBFFhStQMr5WBj13J/U/N857YwkemLkX2
 HCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321897; x=1685913897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rrz9M9TbqlhgVjUVbycqe3VtoE3QrVAsV7Ge7VQZ3uw=;
 b=cAvmZO1mn+XP//8yT5mH2VpAmaTTIkOmGiLXLncbS4Oc1MbtypRcRGzTfQJILOGN1n
 XEuNkhqvdGXr1TXNiyWUHrcV4CUAYNjBSDLMUezrYuBmTnwYN7TK4yBUT/WXg7rv/y9o
 GCWTdsGShK9xZiFaYpVNGwXPI975/4EGVqBeZyx430iOZFepjoNaLE5a/zuxUKGIdgKD
 6kWYyLPU3Ts/6znCbS8HBRTXVu4cqA57rrsOZgvtJc1H0xph/J/AWRCJ7yK8pLdILfUp
 y4pfppGV7kmeWXumpImvm0yNRa+33Twck/umTT8Axqx2RWCfHMXWaLYYjBQXRLSSPtEO
 vSfA==
X-Gm-Message-State: AC+VfDwL7bNuUnj3mLaukp0KwtNDCJygf5LJRhDotCfxpkCFSQFJbYiB
 O7uMzFkqmjSk410+l9JfR3n1fdlL1r5fTn8h+KnKeg==
X-Google-Smtp-Source: ACHHUZ5FXTHtz30M0ZuhzCQ6XdtDUN4SD5qzvxpRmNhAnhOpq7uUSZSj2nM5/FOKnv7M4yKeKRoySw==
X-Received: by 2002:adf:f189:0:b0:304:a40c:43c6 with SMTP id
 h9-20020adff189000000b00304a40c43c6mr2260620wro.11.1683321897417; 
 Fri, 05 May 2023 14:24:57 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/42] target/hppa: Remove TARGET_ALIGNED_ONLY
Date: Fri,  5 May 2023 22:24:20 +0100
Message-Id: <20230505212447.374546-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/hppa-linux-user.mak | 1 -
 configs/targets/hppa-softmmu.mak    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/targets/hppa-linux-user.mak b/configs/targets/hppa-linux-user.mak
index db873a8796..361ea39d71 100644
--- a/configs/targets/hppa-linux-user.mak
+++ b/configs/targets/hppa-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=hppa
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/hppa-softmmu.mak b/configs/targets/hppa-softmmu.mak
index 44f07b0332..a41662aa99 100644
--- a/configs/targets/hppa-softmmu.mak
+++ b/configs/targets/hppa-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=hppa
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
-- 
2.34.1


