Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1746AED2E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbah-0006Nr-KD; Tue, 07 Mar 2023 12:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbad-0006EI-VK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:08 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbac-0000Fs-CM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:07 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso17321917pjr.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5SX2cu33hUFWgIxYnukGTkyjFV2BhrFDS5A9sGmc8Ns=;
 b=v+pub/9y7dkCQTPdTFxAdq3ARuS3H0jFhPqb/GY8NjN7TKKrM5Z89ZuR+F9KASFRsM
 tZVbzZetEXqjvecPD6fC9yoF+CfVFouF806sornl69A/NxsH91yOwoQ//QRcQoZFE79W
 1JD2MZMlE1IZBNro087uYf4cJOUGIRrcVjendkZe1UiODlzw9Yx0UeBpk2xzlx0tHsmd
 uDGC/NklMwfKqA6wTCEqLKWfgQef1wxk92Wtd0EwYRxZW5Uoeudw91euTcXon5brBOwk
 5yTHRC8g8cr58Ub9H54AdEA2xLFSMcggbx4z50/spFowhEaEVHoBjLyTTQWvkB38uuR3
 705A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5SX2cu33hUFWgIxYnukGTkyjFV2BhrFDS5A9sGmc8Ns=;
 b=ZuDY1VJzLp88iSvyGJaWvE3yQOxngsSABnqAvQ+nHnbL57Uc3uBo9hPvgdSnIud8fk
 ZYfTmR+rxHnVpsUjCri5iOLWqHP3FjNgDBrMyO2DgBnNIZ6Op5If+AsXemfuqsEQEaOw
 dpi5othb5VIL4qE7+Ubvq02hdh1848i0EWtEvkmIPMB6trYMaxd4bhrcDZDnxs5o5YRK
 KkorP0JdNUswFmxEzy25Abik0h8pi0L4baqk/msXnzBBWYrvRSma4S0u+uvWEC4NUyZJ
 HyPfXzwfVpK8+XV4y1ILQ97lrhPgXybfxv0deYPEacAjm/VWMvAHoPqw1MZdCmNwKJLe
 cMfw==
X-Gm-Message-State: AO0yUKVYuC0OkAfssW6la5LQ9fHltu5BGH9tXo1fWGQcCYd1G7Sc5AOF
 GlX5XID25I961L5DOH6OUP+oe4IxQhMCjA235aw=
X-Google-Smtp-Source: AK7set+er8ReJdxNnA3oa2f/pefqdB0lB/olyrbYg4thPs8/7cb1krZHkrOtGdoDIW29qf7LtJRa9w==
X-Received: by 2002:a17:90b:1b08:b0:234:148:4b27 with SMTP id
 nu8-20020a17090b1b0800b0023401484b27mr16236282pjb.17.1678211942441; 
 Tue, 07 Mar 2023 09:59:02 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 16/67] include/exec: Set default `NB_MMU_MODES` to 16
Date: Tue,  7 Mar 2023 09:57:57 -0800
Message-Id: <20230307175848.2508955-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Message-Id: <20230306175230.7110-2-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index be920d4208..7d9e1f50d8 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -36,9 +36,6 @@
 #ifndef TARGET_LONG_BITS
 # error TARGET_LONG_BITS must be defined in cpu-param.h
 #endif
-#ifndef NB_MMU_MODES
-# error NB_MMU_MODES must be defined in cpu-param.h
-#endif
 #ifndef TARGET_PHYS_ADDR_SPACE_BITS
 # error TARGET_PHYS_ADDR_SPACE_BITS must be defined in cpu-param.h
 #endif
@@ -55,6 +52,14 @@
 # endif
 #endif
 
+/*
+ * Fix the number of mmu modes to 16, which is also the maximum
+ * supported by the softmmu tlb api.
+ */
+#ifndef NB_MMU_MODES
+#define NB_MMU_MODES 16
+#endif
+
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
 /* target_ulong is the type of a virtual address */
-- 
2.34.1


