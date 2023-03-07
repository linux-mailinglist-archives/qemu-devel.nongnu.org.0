Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E776AED9C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:06:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbax-0006W1-Dz; Tue, 07 Mar 2023 12:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbao-0006SQ-Kc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:18 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbam-0000Fz-UV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:18 -0500
Received: by mail-pl1-x636.google.com with SMTP id i3so15005668plg.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkxgGuf9xEM/v6iOm67gkrKLmGJ/ww2ae/rk468/nYk=;
 b=lftSpvHPYUE8Lmf1oHr7LKdQIixLeXHbgpoVF7D42dvpsXJNqKTNG72I2lSu0cX2KB
 Fm8+yqu1hrcO7YTGABk1goPNy/rl7El7NjFWSToPm5B6kdxnvJTYBGYHi5FFG6bgT0rx
 HaPxZ1z97ZMLnZ5whqWnX0N7llZoLtNA7FrRN4rqi1ftj3mcKaWJq4DYYhpJHGlmJQjI
 TrsGpGbTnPOzWdklcK6pxwE9xRzCyaWkvvCGMfs/A9M5bcrxSM+Bs3dUjdWtlWJskiGw
 8o+AswQnf/BsQLzqb3yKl9MDWxYrpaQICZoUNvFxAc+uZ3FLaaUorZbmMU+kpQi4S65z
 GDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OkxgGuf9xEM/v6iOm67gkrKLmGJ/ww2ae/rk468/nYk=;
 b=j8emk9NgmxZW/uOn5jerNkE9U3nOjHfyqiWVj9/uTPaQh2hIbsBXuEyt2S9zAOq21K
 M0rsRPDDnT42M/V+odOcarKgCPCU04be/uxT9zeO3y/J5eFhENdq0j8AcGwBsGyffKBN
 MVPbsuPl/iroYxLc1gI9WrxTZlFynCOxJVybRj7hciJP6RKVDlx3gGgHZOXAKf64V7Cg
 NlooSNSZVuEsSNP7/L043swUpq6PNKpKHmpSizxnJhEySJwyj3h29qIBhkY/8NNg2E8q
 GaSxd3V8z/Q4T2u6RBG7nXg3Fw7yNXWIiObvv2fK1ovEYxlDrFN7y+oLcrSHOKS5WAIN
 bO5g==
X-Gm-Message-State: AO0yUKUKHjSkYaQ7XqmS6jtmIOQcNG6c1LS4JbEfiKxmL7b/IyY5hErX
 KQ/bgnZR53s7cCo66zHrVuPpMmHZbY15iM/9CNg=
X-Google-Smtp-Source: AK7set/f5lFhbZyUmPShnqKgMvFyn4lJ4IWXDpTeV4NPnP6BqsxYue6E+lDAzOcIWUBa7Y7GbjmQcA==
X-Received: by 2002:a17:902:da8d:b0:19b:33c0:409e with SMTP id
 j13-20020a170902da8d00b0019b33c0409emr19307199plx.50.1678211953666; 
 Tue, 07 Mar 2023 09:59:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 30/67] target/ppc: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:11 -0800
Message-Id: <20230307175848.2508955-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Message-Id: <20230306175230.7110-16-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
index ea377b7d06..0a0416e0a8 100644
--- a/target/ppc/cpu-param.h
+++ b/target/ppc/cpu-param.h
@@ -32,6 +32,5 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 10
 
 #endif
-- 
2.34.1


