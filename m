Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C006F5201
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tm-0005F8-9Q; Wed, 03 May 2023 03:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tY-0004jW-8p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tW-0005gn-2c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315735514so11342195e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098840; x=1685690840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9Z7ehG7+swOH6zB5dODu6bYg//xIYbQwbOdJN6xAFw=;
 b=vGziq0HUhRJmAorFzy9FGRQqYRE+yawNgrLqoOogrS7r9D0Q0zDlzwQhTkEzeQPX5W
 2/zeigAvZm6vjjOE5Z52n4/MzLUN5gkZueP2sqjNsBI9JzXIiN1ha2fdZJC+VpZ0Vb69
 N85utPHWCxKp4xaE4hT3v+4z3dVowHKTLcybtTj2eiX4HxyCKIRG61Q35MSTB/avXwFr
 doXo9rR4EepfbLiGYey4TQvRc8UcqRkNZUBj3fV9IfBr3LQ/TzQaRxMBb5Xm/c6BsvLe
 AUv1lFYvG3DCz9Pq6D/YeuN0MAyV+7DLzlngvw1h649XDwmL5irYHB6W5MqwHLdbppMK
 1mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098840; x=1685690840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9Z7ehG7+swOH6zB5dODu6bYg//xIYbQwbOdJN6xAFw=;
 b=IGZhQnh4PSzk/+XF3H8HWtbK3uDrxd76NxeDr+Ip181Mlivl0ExoIJTB03YxQ5HKDg
 ifKIKD094gd7iZ0PI4sza0dUSv6QdwUDvtl/hyga5upUeK1gYWgdr/NPgVQKPQ8M68zr
 zXVHJqwDBu9bMkwpEuX3yGyZX90bGiFn1ORZK+xvPyk49qNpeaq39MGroSyguQMoHwuV
 nFIz8AZWStrz8U0ou9/ZjzLTaGxDnej99Lg1AUaCEGX0MyhDMaxkERkQNKTyuLlVMoum
 0qKb/Htrl6VsSrTdUYlB2Tu4mSJc+/vZ5RwJ2Hs50O+Jw+E7DFQEaJ+jms4yGXB89sIa
 0LWg==
X-Gm-Message-State: AC+VfDxgHxUZChKm00W/EIr13E2jcLItBImcHbAP9c/7NpzZb9Dl46mg
 p31pcuXdf4SYVbos/eanoQDJ8odPne3gHMdoXMRyFA==
X-Google-Smtp-Source: ACHHUZ5pw6kkdzbw2uK9ic0ScKjq7eIKB77p08Acec549HYWThgQKDbjEd6gGjgbeWGsgTKt5hD0jA==
X-Received: by 2002:a1c:ed15:0:b0:3f1:72d8:a1b1 with SMTP id
 l21-20020a1ced15000000b003f172d8a1b1mr804670wmh.7.1683098840717; 
 Wed, 03 May 2023 00:27:20 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 64/84] include/exec: Remove CODE_GEN_AVG_BLOCK_SIZE
Date: Wed,  3 May 2023 08:23:11 +0100
Message-Id: <20230503072331.1747057-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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

The last use was removed with 2ac01d6dafab.

Fixes: 2ac01d6dafab ("translate-all: use a binary search tree to track TBs in TBContext")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f01c7d57e8..698943d58f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -467,16 +467,6 @@ int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       CPUTLBEntryFull **pfull, uintptr_t retaddr);
 #endif
 
-/* Estimated block size for TB allocation.  */
-/* ??? The following is based on a 2015 survey of x86_64 host output.
-   Better would seem to be some sort of dynamically sized TB array,
-   adapting to the block sizes actually being produced.  */
-#if defined(CONFIG_SOFTMMU)
-#define CODE_GEN_AVG_BLOCK_SIZE 400
-#else
-#define CODE_GEN_AVG_BLOCK_SIZE 150
-#endif
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
-- 
2.34.1


