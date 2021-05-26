Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F4392368
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:53:05 +0200 (CEST)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Ki-00069X-S6
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0005bi-VV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F9-0004Tl-N0
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: by mail-pf1-x435.google.com with SMTP id f22so2239362pfn.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWI9mP5oW4fro3AiRaLHN8aGTJl30ssHDjRGYrYCC60=;
 b=tFrWAlV4z3mgHCOLJOoR1DvLBkSAGfqhc2p35VCH5UFA9iznA5//p7qobSd/4R2lFt
 FYxSLfvaZ8LC8bi5y2hpSPPN2/rJGjn7dA+zjvi3D6AokO+kbCE6LZ+6mL5x8EA3SvOH
 RpdmcvkOCuJbFIfkcDK0glplJym3LsJnUM1twsjRLPcnLDRxGjvJt/psg+40tHjZyWZ2
 4Ot7XvJr9oL01JTmrCfyZjmkcb4OmzN6PZSAb0sEqZHXtNOc8xnxm96xoi1HFnEz4nsu
 Y/7eqOgveLPyEjKUa16//V2J7fbuKFj2dVuE8WSOksaIrT0RaPQasVxp6E1feJVnSPQ2
 4h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWI9mP5oW4fro3AiRaLHN8aGTJl30ssHDjRGYrYCC60=;
 b=ap7X0nsPclwRz/myihWOlnahMSvZMJAfOEIYqEa9a3ji8EqdUmK0utntqQgr1S+kkr
 O9eE6SynRayL3wEecL8cYpGuSGCJcyd/8Hz+Ij4gpf9xHOw1An2skLhrKO0f0MhzZaUF
 pFZHRHwj8l+o3veBvBd6Mb+sO0WmLQeB43YHtHRTRvAfU1uT2xF+YJY8FWRuGTsTbFeq
 Rw/4kffMWyE+bMlAJKZWBHVSBjfDnFTAgdGGG8W6uAQ0JVK6/ASqACQTd0ZY8W68EUoq
 1TH5/uZfkCsupFuInMNMbkoiImRzGOuH4wH2zUVETce7rGeqlHFXjgT306XvVC+gp41H
 ipBg==
X-Gm-Message-State: AOAM533cUR50zdH6lMM6a5m6PCV0TyO+U0IWujIi7BNqbKfiu9oTnVBD
 sxzxDuiskUq/QOxSTKkUmtEbkXPtW3XXKA==
X-Google-Smtp-Source: ABdhPJzghQqUuYR09uiMVU0pzHo24YQYgphHG3gF8RllUE3fZQx77mTpaHfAPTfoxKXoEJ8diW+MmQ==
X-Received: by 2002:a63:974a:: with SMTP id d10mr1041992pgo.180.1622072837868; 
 Wed, 26 May 2021 16:47:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/31] exec/memory: Use correct type size
Date: Wed, 26 May 2021 16:46:45 -0700
Message-Id: <20210526234710.125396-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use uint8_t for (unsigned) byte.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-7-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c8b9088924..175d7151a5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2305,7 +2305,7 @@ static inline uint8_t address_space_ldub_cached(MemoryRegionCache *cache,
 }
 
 static inline void address_space_stb_cached(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len);
     if (likely(cache->ptr)) {
-- 
2.25.1


