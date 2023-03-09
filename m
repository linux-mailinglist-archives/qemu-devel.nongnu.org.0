Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F76B2E2C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWw-0004Ye-Dk; Thu, 09 Mar 2023 15:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWv-0004YU-1s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:25 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWt-0000oD-B5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:24 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2990838pjg.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nn2f5OVcz8HskSux0hfRUwU1SxB0qGsV3Unoj95qovs=;
 b=vn9vWxlE5yiMT3DQSsGYch7szT4sTfhGbAGLFFIYHdLQ+v6/g4s9WriR1fTibjcRdR
 CZnekJ/La5iLZgmxG7z8FWolDVtfz0rjjQ8V5srOipcBSwuMypyDCK0kdibHGfqjxilJ
 WnG2+1PyvYQyHehuQB34cUu5PqWfy+QfQnK3ShiSUHcvQw1muw3DkG8nc0w7CSC/EOO3
 wRAXnuBgYDhyQT3T+4E13PaPIspsSD3QxaJUEGF7SRNJhGOwM4qt7HS19SQy5ANe2l/Z
 qmUEczEwSxjne+gS/JeQxtVoQ7yRV23aUExksoe9yyDqljNg2XM8RfEQAbaPvVJpmMFc
 pvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nn2f5OVcz8HskSux0hfRUwU1SxB0qGsV3Unoj95qovs=;
 b=KQaVLHBVh30bhHZdWJEUbECco8jyp5Jtd3vO1KnjmSnbzIs9NYpinTaXdTbGSkQhCD
 NHWVy0T1XNcz0yAjhyJHksQzrPWpbP2OVNsOVmYR4Fte64oyUPKu4AJI5p0Ja4AWnnnU
 xsbTnvTZPGHfdRccR8Uiljtiax4T53+13QL4xp5izc4s3n8F6TCADcEoXflYtp9UwzhY
 5zW9xrMGbiZgqShKAKLWA16FZz8lt9Y+TMgiEakoVmUpPTYdNhyh19KgnElzw7Eu8Myx
 MjG6iN6u/N+mJri8MA4Moio+J0kcZVqXySc3q5b83SFZiNfgdwFo60oWyQuGqyw2B8zy
 AF3g==
X-Gm-Message-State: AO0yUKUtX09hNPpz78/W7WY4utZg+qWrA31fmBesb63p5Bi+uweW4Xij
 W6J/KYyiZnAJThkXdcBSeDQtQF7c5TzCZVe8Op0=
X-Google-Smtp-Source: AK7set+IM1AoMnfZfzc03iHLMwLVlc27uJ1hOkI9fMDWD4tkH31rEXPoyTM1yjUzDz4wP0dDRgEKGg==
X-Received: by 2002:a17:90b:1bc5:b0:233:affd:a96c with SMTP id
 oa5-20020a17090b1bc500b00233affda96cmr26563263pjb.16.1678392382119; 
 Thu, 09 Mar 2023 12:06:22 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 34/91] target/sh4: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:53 -0800
Message-Id: <20230309200550.3878088-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-20-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/sh4/cpu-param.h b/target/sh4/cpu-param.h
index 98a02509bb..a7cdb7edb6 100644
--- a/target/sh4/cpu-param.h
+++ b/target/sh4/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


