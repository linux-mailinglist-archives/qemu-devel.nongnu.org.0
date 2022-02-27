Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E284C5AA5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 12:36:33 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOHqq-0006BR-Vt
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 06:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHoN-0003d6-56
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:33:59 -0500
Received: from [2a00:1450:4864:20::436] (port=44624
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHoK-0005sk-U4
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:33:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id u1so11166665wrg.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 03:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vhBov15EK0TrZ34A2vPWQVOdhrfYzZBrhcMJYbcthg=;
 b=Is6oUN2RbwECGf0sNQt6GyErnd/ASIDKWeXJFnwPFt9dWzKXVthb4q4jCwvOXIhrq+
 DjaiYzbwSZx2xv+hudG0lm6UC74tIW8C0T+dhhAzjw45O4sRufZx05Dv7RtjPfFiXnSz
 gWpsQFXkCRYCy49FdLNyHbgzZShgYYz6zzXq/WWs57KtLldCtUtNAhDLEMVKfcq/UEIS
 xPd0gqqiFaWG0PyP1e9QfuuUV5y8qZIaWsm6Z9jbN+snMPbldRu7MQ0qeg8O6BdGuvWY
 AXmBd0iMl20iXxfj8UZTjA8CrAZnhLsO8iuUrGKgURXECjJGy7J7fI4BJ0j3G1PJBq76
 pLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vhBov15EK0TrZ34A2vPWQVOdhrfYzZBrhcMJYbcthg=;
 b=caPRW9mS4WJ+5Fukj+Ir+aSFat0/ZHPTPkD7kdVjgDZYEjm9xjfcUdsPgSw+6P+hrq
 SR81Vkiu3yUlTXNVfpy3rzo+wfvCtNT/MMGhCqt46Abo4OeXq6oBDs9A8YfeKjhTT7o5
 +tHRRzmNx9Mdusx/b48WZfAmSGqFYRoFbq3CuxRWq8j592UO8Xq4DV//+fhqF11QAHqd
 chPJJZmu4zRc3Lp2giCSTBUcnWnKOayN7hj15Tc5PxO/omT0Ha2iI3DMU7Z0VALdJqP2
 fxwJ816OJWZrrbi+NwgC5l9JldrmnPvd6D5hMpRssciycO/TobSCxn88ef9FHxAVRXb4
 EwQg==
X-Gm-Message-State: AOAM531J2Fa5xLo4LZXbF0fWI+ZJQObqToS4d9TgGfmdzsGZG/MVMMhV
 zXEZNu0ufgtOE69Mb9pRdr9mOKuuMhRzlw==
X-Google-Smtp-Source: ABdhPJwwe0vecZjJlXx2tGFjCIJxKRB5zMWTbJGZ553EMXW+CYUHqhFSvLU/Ei3+khvyJT4bdtuhJg==
X-Received: by 2002:a5d:61cc:0:b0:1ed:e3d6:e8e6 with SMTP id
 q12-20020a5d61cc000000b001ede3d6e8e6mr12249941wrv.213.1645961635325; 
 Sun, 27 Feb 2022 03:33:55 -0800 (PST)
Received: from station.lan ([46.140.159.18]) by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm7776956wrj.76.2022.02.27.03.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 03:33:55 -0800 (PST)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7
Date: Sun, 27 Feb 2022 12:31:30 +0100
Message-Id: <20220227113127.414533-2-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227113127.414533-1-ziqiaokong@gmail.com>
References: <20220227113127.414533-1-ziqiaokong@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ziqiaokong@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, tsimpson@quicinc.com, richard.henderson@linaro.org,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last entry of DEF_HELPERS_FLAGS_n is DEF_HELPER_FLAGS_7 and
thus the MAX_OPC_PARAM_IARGS should be 7.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 include/tcg/tcg.h        | 2 +-
 tcg/tci/tcg-target.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 42f5b500ed..939041103e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -43,7 +43,7 @@
 #else
 #define MAX_OPC_PARAM_PER_ARG 1
 #endif
-#define MAX_OPC_PARAM_IARGS 6
+#define MAX_OPC_PARAM_IARGS 7
 #define MAX_OPC_PARAM_OARGS 1
 #define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 0cb16aaa81..3e17c0080b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -197,7 +197,7 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R0,
 };
 
-#if MAX_OPC_PARAM_IARGS != 6
+#if MAX_OPC_PARAM_IARGS != 7
 # error Fix needed, number of supported input arguments changed!
 #endif
 
-- 
2.32.0


