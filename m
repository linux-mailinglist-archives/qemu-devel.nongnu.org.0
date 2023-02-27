Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B26A3C34
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:18:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIl-0005KZ-Tz; Mon, 27 Feb 2023 00:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIU-0004Zb-DN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:40 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIR-00056u-JZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:38 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5082880pjz.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=bSky75kQNaokGkldwx9WxvHXxWcYAfLjGMAg8TIokjVgCOZfI+i0Zl1NjRRHy1Qfjf
 dIvY3HBlE/GwPhvXZXbZjfFpIgeIkRECH5l9Fnm8Pvtx8QZEeF9WdsEM3QUNGNdpYUhH
 80eGDpo2PZd2Q9m4jAmzxolaXBakM4raYLpmH4a4Az4eo3hQxFlsS6XeIxurRP4HtL0F
 40bTr/RbWi7wnpwEE9jLGxq+h2biZA0vcUkNTdCPfbR+YIBP5gPMmcOdoZDBKtLgywvc
 +PXGbNpXarxhDGMfcZCbMmsTHIybdqmubWbvavzexbCY7rkGvl5ZqfJDR5F3RG3Y45uK
 zGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=gmPr9+DUrLAxtpGzPbQG+dPvmq0vMuQx84a8tzzLpDb0QAIFMSscf91dcfgrbaiEUy
 aGnwcW2WMERyvhE3ClCU7SLRdSoND+3LLzqfIQWBW3MAv+1DGOxxkupTTWXy+7fNlbSz
 ErauUfYGiNLqC0vkwZ1MlmqZdmrJME/UlGo75jCRLxMN3O/9MgvB4UjlkAjwNyG3sHlp
 TtO5KvlOnftsmO/NsITbk/04GJlnaotWOieNVSdmfO4CtjwDZfKyWNFh2Y6VBWgZS7sP
 u4iYT8FVzDgAUeXG6X25tx8LM0+g2JOZtrC5RrU9/fCJ7sHxL8A8odZ4ow52mEAEEbfR
 rAwg==
X-Gm-Message-State: AO0yUKWC34LJD3QslizQiZuKmhHTki+KvBcsFQXQQvOH/FM9vg8X6vjJ
 gJWXIC30gyOQi37NBnmBxtOpAnb9nxz7ucg6R0+Tag==
X-Google-Smtp-Source: AK7set/lA9y7f3mKs9mJcXHV1jIrRikf85XLZCw8yANO5NjWeQyhV3oqvAuB8FqQn2SIhQOo5MhYTQ==
X-Received: by 2002:a05:6a20:72a1:b0:cc:f47b:9e with SMTP id
 o33-20020a056a2072a100b000ccf47b009emr5782642pzk.10.1677476612483; 
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Date: Sun, 26 Feb 2023 19:41:41 -1000
Message-Id: <20230227054233.390271-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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

The allocation is immediately followed by either tcg_gen_mov_i32
or gen_read_preg (which contains tcg_gen_mov_i32), so the zero
initialization is immediately discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 760e499149..c0e6f2190c 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1889,7 +1889,7 @@ HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred)
         bool is_dotnew = pred->is_dotnew;
         char predicate_id[2] = { pred->pred.id, '\0' };
         char *pred_str = (char *) &predicate_id;
-        *pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *pred = gen_tmp(c, locp, 32, UNSIGNED);
         if (is_dotnew) {
             OUT(c, locp, "tcg_gen_mov_i32(", pred,
                 ", hex_new_pred_value[");
-- 
2.34.1


