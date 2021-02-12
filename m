Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C201131A4FC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:07:47 +0100 (CET)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdn8-00082J-Hn
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVK-0001Xg-6z
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:23 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVB-0007lD-4A
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:21 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so252980pgj.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=hbZByw+aEjdrjdkAzS+n/JlDa+c+d4dS9jRIAsfwE3oCrPTgdvisCppYx4AwgPa18Z
 CQ/E+uJk1IHVKFbvYUfF6/c+0v+YobHg3k574aYDuSAeU+OLKW2WVW99B4wi+bc2KwPc
 3Na6QhqjFF0HHCHqp6RHW9Xx+civcfIEM3LF8J5hw3e71WWXxvKqzybNkMvrnx4DYq21
 rw2pvAzTN5zk/sRFpGx5WKY5qUtfcuslSHWpalOay+yNRRJ2zqumOEZRM+A5wn2PXiyS
 gEUgxBhTPaPdbdWo4tkvDwGEPZZyM32Zbycm2ivYiGj3E5l56iICCFRoi6t6k94hMiI7
 XlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=QrwC1enYVm+1zTSMXyYAA/vLuv3C7gN0Hj2GH7uLJRTTce47mpP81dCMcMw2qnRjdR
 OkLLXiSMbdwEmQcOY6/WiZjxpnYB3mMolpLzS5XIaiAFggQa08uCMvqpOWG347AVfYRX
 yubK9yOZM+DIxrBTQ5vBxzalT2aqGb83YTpInVlH99pC1fGaWa/JuFx/ou6JPjnU5PfL
 cYPrup8wsgPq4NqWChMldPZBHgP4OEMpPxpyEokLifJoniPvxBv1StDIHa2PlFzdVtpr
 C86X+yw6BZlCu+15pCmaqIvryepTaz84h0f6S4GdMZj7br/3z1BUfkv3Fc+4xUNY7QcN
 3ioA==
X-Gm-Message-State: AOAM530p4RsgprgJ76+EYbQ7N9/W53k/TeohYlbhEKM947bN5Wo4j+7Y
 sM0SC96Jm3+dkEpNvP7N3CLe+DeFJ/vvLw==
X-Google-Smtp-Source: ABdhPJzdnhkiYn0X/yMMLPlMgYX+XTr/fEj+si784IXvCPUr4PegICFIo3vBTuQGy9CI5lADwOXurw==
X-Received: by 2002:a63:515:: with SMTP id 21mr4426539pgf.231.1613155751270;
 Fri, 12 Feb 2021 10:49:11 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/31] exec: Improve types for guest_addr_valid
Date: Fri, 12 Feb 2021 10:48:36 -0800
Message-Id: <20210212184902.1251044-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1


