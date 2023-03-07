Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C76AEE17
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbap-0006UQ-L7; Tue, 07 Mar 2023 12:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbah-0006OY-PC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbag-0000Ch-Ba
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so17367130pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCC18g/mOO0enBAn8+GrmseLruJnNoSJ9xpyvnm2U6s=;
 b=rT6D5FQia5cOExAe9eFZRdxFP3ZmUM0YwwGoaWeUwPbjdK830yd61lkLew62J4X1DS
 P/H6VD2YZeQVnXcCBXrnTKOPhmYIhpIkrPk/FRFo6NeNp81myXgYdScE5XGWXU2x5Btp
 EkTXPxdY4BGHqh0GOKU/CwfLdcumFe+rxQfImezpspKQHa71/lfQILMOSRMFLFp3uH6D
 r97v8erSloVXtgVvIqPHgXpwVg+GNwlEgCA0OaoJ9heBump9gS4Qz/Xn4lwVV+PiSK6g
 sPNMEXkt3ZXn63l/PGPWZjmQEJK/9pPoILVsehKb5LLnoJYhkcUOwOKB6u9c9pw+GqwQ
 00MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCC18g/mOO0enBAn8+GrmseLruJnNoSJ9xpyvnm2U6s=;
 b=gyDr9H8+g/Hke2WLnZcHpM0xVyDAgcB4K8tRGhGKl8DjUoUDBami0ksaXJaE26n2Te
 wNGOmawASIOAIbuLAk7acbSpsQ7ktNBdYEXXLGCAZXTtfB+qy5PuVrOyTHTL1CyUoiWd
 s0NnKqaQOYDHog/eTihIwgMhcsPOe+d95tww5apuEZJbR2O7CQNy0eIxqsrcRq9m+xUq
 oiUra7QyQfE1at6i2afDMM983O28BQaBXqEQcp8O3w9w32M7vTMm6E7tH9acW/hrPkjz
 1Tlm5CK31m+j9eiR7IbOAZeYeSv4kk2eKw1v0Omo/PJSxMQ1+uXhXaouIoFiSmMFWDCx
 ROSg==
X-Gm-Message-State: AO0yUKWxQJbpubZA5ggHilONH70jGgg5QTdslEVGGtRTfWx2ZQqliRJn
 eyTEzMq3BHaNoNOSTa13cVFIUg4L6S1J5ex+Kv8=
X-Google-Smtp-Source: AK7set+jusn/H6rqY6CMAmFLfwSAZ+OllOn8vGWXcZ8p00goHJ7Iml4OftG7oM5b+EP9LHaik75y+Q==
X-Received: by 2002:a17:902:e549:b0:19e:76c4:2d30 with SMTP id
 n9-20020a170902e54900b0019e76c42d30mr20241322plf.61.1678211949625; 
 Tue, 07 Mar 2023 09:59:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 25/67] target/m68k: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:06 -0800
Message-Id: <20230307175848.2508955-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Message-Id: <20230306175230.7110-11-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
index 44a8d193f0..39dcbcece8 100644
--- a/target/m68k/cpu-param.h
+++ b/target/m68k/cpu-param.h
@@ -17,6 +17,5 @@
 #define TARGET_PAGE_BITS 12
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


