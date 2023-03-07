Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C16AED50
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbap-0006UU-M8; Tue, 07 Mar 2023 12:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaj-0006Pw-Ax
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:16 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbai-0000Dr-13
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:13 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso12674996pju.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J//0J0T9F6OVnEWBDmmJOM9XMlk42D9bPy9Nq1gxS+k=;
 b=UUGGeDSgEQJS9pXdQbb6cw9/O0jBDtzzdusjeYVZdRBI4BbbNPTEFhhOw1ekrRe1n7
 d4yYyYTg1WQTkmAltHeiI1QwwXcnP64YayuRaj8Iv3T3eJyp4EvxFpLaePb1iqFoIruj
 uH0TgCLN+qMHuly6W7Tw3+eaC/yagkFSexPiuR6O1AT4ymSHCb9f4zAeUN0ElJjJG5ss
 jdfL7BYhgH9ht05MTol9JJ00hCmN8S+RfCqnTyi6fVHbfPfWjCP4EIlyS6XuPHiD+hIs
 tRKlLEjUe3FJu9TJMSsbtjAe9XDyM29a7e0ntHgTqWmTALdymCd2Zp7dLm2jesORzDzO
 tq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J//0J0T9F6OVnEWBDmmJOM9XMlk42D9bPy9Nq1gxS+k=;
 b=NsdEu37YAanmMqjHreIg9j3/qHwYwfKrsb0LJNLHxny9OZXHLHBpb7n5xp+XWBCfCU
 UPKoWZVX28eXGI0Xb3Xp52BtqXyWTJyZOEHDi5YiG/bDfQmoakL3L+EcnG9KbS41+IDs
 +Wbbwymqaq2xMtwjsLaz5NJo0v6w5gBHxeuPgzshEFPhdnG0bj6Mwx2uwpd4Qd8Wty2D
 JxFIjvXg2NLdsgbbgkREx1JejI3o+CAjy5H7gnIs0ekcpHlZre+s+/guhuZhk5HgG90/
 JkzUncbnis/1vpGZuXeYTOUC6JAwBcNj8NU6ewQed+mxq8hyUytmjBvI1CTs0573YBsr
 jGeQ==
X-Gm-Message-State: AO0yUKW9c58nbQ+DHk531sGr7Cqa+7uiRqDMCy7YU00GANJCiGWRLsvC
 87dKl37FTO4kI00KkpjOGLOaogvQpdtOUjKwwzE=
X-Google-Smtp-Source: AK7set+LMOLZMk7jY5SxQ1351/eKQ/ZTRAlFPSsbJWp8jjpbjCIbD1du8Kggry4hm0XyjQqxxtZZOg==
X-Received: by 2002:a17:902:6a84:b0:19d:1bd6:4b84 with SMTP id
 n4-20020a1709026a8400b0019d1bd64b84mr13561931plk.17.1678211951189; 
 Tue, 07 Mar 2023 09:59:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 27/67] target/mips: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:08 -0800
Message-Id: <20230307175848.2508955-28-richard.henderson@linaro.org>
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
Message-Id: <20230306175230.7110-13-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index f4c76994ea..594c91a156 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -29,6 +29,5 @@
 #define TARGET_PAGE_BITS_VARY
 #define TARGET_PAGE_BITS_MIN 12
 #endif
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


