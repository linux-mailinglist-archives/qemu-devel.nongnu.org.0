Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51446A3A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:40:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWEU-0000fC-En; Mon, 27 Feb 2023 00:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD3-0003Nc-SN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD0-0002rY-3A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:01 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8856220pjb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=p9OOucYQotsM25d+bKfifADAbChZUQUYPTgvmYZP0aGzV0GbX0EScpUzj68XkSCEsX
 5/OQBRvQoRLM0AHpT9EvT+m6ah/Xz3t2jcgwQPPDDli2H6STCm55C4KaaqTPNq0xkjnf
 8KT+bzG8E+HyKpNTNeYqGDf1TffGOGkaVJCP83PU1WxGP+WehEDmx9J4jasjkrn51stI
 bIAo7tSi1DFOdXtqEwAlFWUXTj4CzX1ApXO4EFVDkFhICY08GoNzgZvtmEanY7qg5TPi
 pVCGpZVHTwq3nmBGTSICzu8lOqF3P+kRFcaWFDmYr35gnniWm2x2g+s97T8SuTiAsN8Y
 jUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=KESxCXJb/oRrbLHAsdBKWuQ8Q2wOnqmSx7czHClDNSj5YATW3wQbyy8fUB8DGUtgpL
 WYwi6s2fWL3B0R+i3cxgxxJx3GqanB7o9DQgJbnDw7TzhJ/V5pEzFYFe/2+suLhawOHA
 WQuRegSbS2kFzC8cIgLgYTsIzB/avCOc68kvihJWLOTU998ZN6OchB+MctuPB0UiZ+ag
 bqt2brkNMFadRawi3vFB6erWpRpi7E9oIApygqeIZrpxwswWe+w6XMaZzXgJbzcP46FG
 3nOJacNDZe6TpfpkOSw3m5tgplC0RqnUkUWk6vNWW1aASEBBoH+48LXChkYt7/pFPpwM
 VfOw==
X-Gm-Message-State: AO0yUKXFDymqEJig8aG3eoax9JTfWNNo4ijfyy9VWXT5pTd5glQNFhTs
 e5HeDWqIfT/n7Gnk1aTpNf6jgsZ88ylxosN/GuI=
X-Google-Smtp-Source: AK7set9o5gz18AlfFTCKVZpaDVOPvV94cuKspnBciJRy/aT7tU9pkB0qhYAf6PUGuzG7qIiVK1rW+A==
X-Received: by 2002:a05:6a20:6714:b0:cc:fbdc:886 with SMTP id
 q20-20020a056a20671400b000ccfbdc0886mr4099004pzh.18.1677476275994; 
 Sun, 26 Feb 2023 21:37:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 18/31] tcg: Change default temp lifetime to TEMP_TB
Date: Sun, 26 Feb 2023 19:36:48 -1000
Message-Id: <20230227053701.368744-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Guest front-ends now get temps that span the lifetime of
the translation block by default, which avoids accidentally
using the temp across branches and invalidating the data.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6cc6758cd6..2e220d4040 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -901,7 +901,7 @@ static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -927,7 +927,7 @@ static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
@@ -946,7 +946,7 @@ static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -972,7 +972,7 @@ static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
-- 
2.34.1


