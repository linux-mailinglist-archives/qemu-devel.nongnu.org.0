Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B84CC796
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:05:59 +0100 (CET)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPse4-0006rk-Kk
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYD-0005DA-Le
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:53 -0500
Received: from [2607:f8b0:4864:20::62d] (port=40544
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYC-00042T-2G
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:53 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z11so5862120pla.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+u6WJ4o87lULpTmMeIiEBRzSihebLo/7su9/1OJOC8k=;
 b=xK003ffMaIrcY/dbWaRaFuCbTF8uPblRubVt4NLgZSINCFbFocMEiinQDt0eRAA1xp
 ZiXKTvzxXHB53TQhBa6Fi2VpG9lwB08/nIX7OO1wrVoXmZ6ShZkxdLbQIy3ZlcddfnSE
 MSUM1gPzRPtBsLIrJu/kP/5I69EmMKYzFlQWgLFCOHAAX5JxFVZ8nK7NctCEm9QaPYJe
 j8W10XGLryUKduvRo0awK6/V8COWyoqXO6H7nkJR515HjBMYa+HcpWD5P2CpxcIhHt7Q
 wFVz+xjEMBdgExtFy5UGotvsWXGmd2/07c2znsBd7GJiZEjsbnkwJAIDoqZD6cJbQm7Z
 X8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+u6WJ4o87lULpTmMeIiEBRzSihebLo/7su9/1OJOC8k=;
 b=iIdd4CLXC4+umZSrOyWoDee3WdPQ2/rSNke7MQ9wj/LfQvSgduHB3Do6xy51u6RrLH
 WOtnC/tsfIz0YYCP+f+QqoLdSsunnmNpfabGUbSKl7Ko1clTqpsqY+kt6q2ZpOyRD9+M
 AGGbC1GMCSLNPsBNYAbkvOB1rAUy74/51cbpn/rCiD/gCATurnUTJRpcA0b235zMO0Nc
 YyguJroYezZPZs2mNrUA3Hpo1A6UMCiCpiIC/7POixomKQI8EWKwndyKfbKd1KOMkNb7
 Gg2ZG/xELm1j+VRaiXUzdkSP8/JG/lhgn1MvXABxLNDFfnWTdn52y4ASw/x+54J4NVVl
 dK9Q==
X-Gm-Message-State: AOAM532wkTGXT+ViEKMyBScqmB3MiVioRkGlaoJwN+65TEWYs7YQYz5+
 3gG7YzZv9m34SOa3fBqlYbIa8IxGf8eTrw==
X-Google-Smtp-Source: ABdhPJyZic5F8c5U54MqvdHJBIivi8Ew9i4pLbl8YU+7tpEr5py9QF9d8NMhooA9HgrCh87O9YVHzg==
X-Received: by 2002:a17:902:ecc1:b0:151:9614:59f5 with SMTP id
 a1-20020a170902ecc100b00151961459f5mr10901222plh.132.1646341190481; 
 Thu, 03 Mar 2022 12:59:50 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] tcg: Set MAX_OPC_PARAM_IARGS to 7
Date: Thu,  3 Mar 2022 10:59:16 -1000
Message-Id: <20220303205944.469445-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ziqiao Kong <ziqiaokong@gmail.com>

The last entry of DEF_HELPERS_FLAGS_n is DEF_HELPER_FLAGS_7 and
thus the MAX_OPC_PARAM_IARGS should be 7.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
Message-Id: <20220227113127.414533-2-ziqiaokong@gmail.com>
Fixes: e6cadf49c3d ("tcg: Add support for a helper with 7 arguments")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 9ff1fa0832..98337c567a 100644
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
2.25.1


