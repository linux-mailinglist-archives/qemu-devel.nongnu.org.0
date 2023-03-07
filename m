Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B06AED5C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbH-0007E2-VV; Tue, 07 Mar 2023 12:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0006V5-Vu
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:20 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbao-0000Ch-DO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so17367406pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYtHjl//bYahnv6h701fEkZOElLi4CuxGsmLUp3plto=;
 b=TvJTkLGNRrqv8U0blGG731xq4KLSC6DyiClZTfNvYbHE3b7udpLN7gUzQ8n3SzQemk
 CQjbCPSvpvrrO07UwjcezNwCA6NMWaqp/6wg1QCRHYUxq872GDfQCwW51kQZXcYdIf4X
 tGiunzAxNk7gUGU8lcTCFDt2M8ScayZQRO+72iADRsNLI1lAJBrAqKHnefCW8ziWyIRE
 Y2r9UJHZYw1Qs+lKlVfrJg9HIXFJ0hrHPvuE59pyBp6PmcJMQu3nKWolW+/Qm08GICL/
 Bz4wJDQS+LpyflTT3gMx5lJHrVza/9ygSaw38yzTDOlie+f5ErQxZxoNq+kxfIeTB5Qz
 kFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYtHjl//bYahnv6h701fEkZOElLi4CuxGsmLUp3plto=;
 b=De3guo8QCfB/xB9dRvYKoJrubOMWQeJZ9esgju7z39DBcwAjKx71jmHaonWdI7VLFz
 mm2ZpuT2T6Q6hqheCCDAOzdCtzn0Gr29vWdP+L1sSTEDLc/fx4NZOAanmdcyiebmUhXQ
 q8sY7hPYK8PIT7PamYACMXdA4atIhvcyBxpgRW9L91mjPcmAsE5muQ+Kr037sUAJXV8A
 oayB6SPnZf0BqpL32pqAKrgjkzotuf2JDONyMaXwgSwp+UsT4/pRjADNGfvDg1o0MQHz
 4CBISXE3KANifV8Gni/6u2NC45gZtPyjUgAva1erqnY8a6a9LVSc8NlNA2rPSzU0VjiD
 TgNw==
X-Gm-Message-State: AO0yUKWL8qpbvRvUUMEp8MnwDZKrvtJQ+xvaCZcXUGYxVZb7BnQzU6He
 kp3sFrVEpmS7MsofyJJN1cqyZjCOLqnN54At0TE=
X-Google-Smtp-Source: AK7set98+6V3TAlaolI16S5Oe+EW8FfzwbcIt8T78ioEfVfgzoELaC89rbrnCQjhZYf+e1pEvcJIOw==
X-Received: by 2002:a17:902:d486:b0:19d:1230:439b with SMTP id
 c6-20020a170902d48600b0019d1230439bmr19624664plg.63.1678211957588; 
 Tue, 07 Mar 2023 09:59:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 35/67] target/sparc: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:16 -0800
Message-Id: <20230307175848.2508955-36-richard.henderson@linaro.org>
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
Message-Id: <20230306175230.7110-21-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
index 72ddc4a34f..cb11980404 100644
--- a/target/sparc/cpu-param.h
+++ b/target/sparc/cpu-param.h
@@ -16,13 +16,11 @@
 # else
 #  define TARGET_VIRT_ADDR_SPACE_BITS 44
 # endif
-# define NB_MMU_MODES 6
 #else
 # define TARGET_LONG_BITS 32
 # define TARGET_PAGE_BITS 12 /* 4k */
 # define TARGET_PHYS_ADDR_SPACE_BITS 36
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
-# define NB_MMU_MODES 3
 #endif
 
 #endif
-- 
2.34.1


