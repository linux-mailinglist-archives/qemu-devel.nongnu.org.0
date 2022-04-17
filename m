Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D455048A3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:50:38 +0200 (CEST)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng92j-0005og-RD
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8ws-0000dl-UR
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wq-0003Dt-Kf
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:34 -0400
Received: by mail-pl1-x635.google.com with SMTP id q3so10758682plg.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnTEItSGWycbpaAmp+hDaYT95wtDnOp1XDNT2WSNp3w=;
 b=E6Yq7Evf4C609rZ+2CIrPoceBE6G0loh0WZDqzcpW+M+S5jZQlgAu8P+9bJclkVmeW
 2P7w4GLy/J9hHfie+DwTts7cb6w6DP5v3x/Dgse4HwT78iKzzmOyXkRgDHuH1TqQg/m2
 HEz5VaFnMxCM5YcdgvwV7RxS9kRuK9Io+Xiu5MrRYYdNpY8Aje84cN3C9jUtce/TwLMi
 YH5RPauvCvXZ8FbX0wTqcO0bsTI6O/y84x0+ZcieUQ7iQVYSB7yKfSdoxV+nHs9D2QHV
 CpsUx+jOjI05ykwfaLnECbqysWqdBFqb3Srt1wECZCI9zp2/Ph1sxB5vRCgwDo7e9IFo
 OUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnTEItSGWycbpaAmp+hDaYT95wtDnOp1XDNT2WSNp3w=;
 b=cbAy4aZa2K+lSsgzA3v0uDM5qKLFoxJl6m91VqvPiDE3/i8g+1ywfRxHM0YywjWLlN
 P69SS8b2PlaQrvqai5hVVdaCSNJVdc9YF/w2MG5myxWuLxxOalvCa5bupHrftlEmVZay
 96MUMMlWzj+bk7ZdJGJ/kHss0NfJRELSkUpd2UdT/6W+JuAlQ4Ql9TFsesU5pr4HNFu5
 ggS3Ka6iVqtHfkw+4NJhUtlyO+GjpaY5XAXo32DWoq00mdevKcWf/0KqLdVAJDidVcw7
 HWRsyyHjaDtEaqfwMnUzorywV9g/PK1Z2qVBKkK3wHvNCRFSKbYhBzTCdGbgzruikQz2
 3HqQ==
X-Gm-Message-State: AOAM530po5g6Kz9MwUWalfrNPzncO8O+hb8qGF40GUtaUpdMO3zFPaHY
 svsXuTmTtWHu/XBlzw8wA61nLU5cUDSTMQ==
X-Google-Smtp-Source: ABdhPJzSfiuO3MY4Br/5ROAMmgK3Nsoa6TwiRnA34FOIKg6xcWXn5FEBuQ558h9Qb/hJP3UUD/b39g==
X-Received: by 2002:a17:90b:804:b0:1cb:be2d:e28f with SMTP id
 bk4-20020a17090b080400b001cbbe2de28fmr8942645pjb.21.1650217470376; 
 Sun, 17 Apr 2022 10:44:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/60] tcg: Add tcg_constant_ptr
Date: Sun, 17 Apr 2022 10:43:27 -0700
Message-Id: <20220417174426.711829-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to tcg_const_ptr, defer to tcg_constant_{i32,i64}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 73869fd9d0..cd6eaae410 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1054,9 +1054,11 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
 TCGLabel *gen_new_label(void);
-- 
2.25.1


