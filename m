Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A86F4296
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3l-0000go-Gd; Tue, 02 May 2023 07:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3g-0000ez-O6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3e-0003Gt-Tt
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so2175659f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026431; x=1685618431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjnRB+rrhPhBqqBICpJ5x+fzhQt0vgTrWO9uJRMoXeU=;
 b=vHwelGMaq9zszloEpIfn7eT5RC9hnTmVdG/x2F/ymd6kQvM/x0uXAwF+iTkuBKh76s
 BmDXXyhS2QLp0/gsnLbNPaozsIudYn4VYO//vZNugoJFJ6OKU6kjzWs0Q4rPkA/0BJfm
 POAFlQWxMkYxxbQYdfBvBhLOzCkCNUA4Q75u+PTkGwvVkc3eB8Jxy0mggm9FMFBz9qY7
 kyIczdpAMM/HlB5DF6lnd/6p2SSE5/Hfe6zUkURzNwkPxcJSAlJZAFTsXf7cMjqbUooc
 fTvHFp19Gzkt/BhGHx8DJMFrTszC0NeNoPbjs6oUFIu0Xa+rS0jFiT/Fjz4+GdwcSEYm
 xKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026431; x=1685618431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjnRB+rrhPhBqqBICpJ5x+fzhQt0vgTrWO9uJRMoXeU=;
 b=N2D5vQm3dXkVspv86w/oL82xyWEv+MIBjQvF6Pkr3D+1jkmcoTPxFqUJloHLnAk4qW
 qOLSbU+ACyMDS1j4AR40oPkfYGCytmHjx6soUJwSFhyEFM/IcCtgrHjPmNfmSRsbtJp2
 9A9mWCx43eLd6o5H/bQxVg6NA/AOHXpgVIc+kS5iHsiQM5CiTTR9yn69NRkzqkh+997/
 q5lOt1INBrhfVeCts91mn1vKWQg3W1l5yR4kz9mfPCg/QkZNRJuJNLRJtZfNUze2ad55
 TlCA8khSLh6eeB6TNXiAtRW9S9NItcqinkR/F3kJDQ3XmS8MCdOY2W9ieSRCQYOMoARc
 X+Qw==
X-Gm-Message-State: AC+VfDwRkymb1jEVU/LvID/Mnx15tUBDiIKAZCBRXJEzM4RqJ3c3rFvW
 qHhHpsx9fwM8M6XXhbs4otc2GSw1GUpWQEenKpDGdw==
X-Google-Smtp-Source: ACHHUZ7ulTHXFa6xzZJ63nrbJSCMd8h9BKQxr53KPnC1Ji9RAK4IkxM9bpVBh++7YTO3tuj4LKdqOw==
X-Received: by 2002:a05:6000:136f:b0:2f0:e287:1fbc with SMTP id
 q15-20020a056000136f00b002f0e2871fbcmr12278203wrz.11.1683026431148; 
 Tue, 02 May 2023 04:20:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/12] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Tue,  2 May 2023 12:20:22 +0100
Message-Id: <20230502112023.776823-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 346c614354..a83ebe8729 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,7 +582,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_ext32s(s, rd, rs);
+    if (rd != rs) {
+        tcg_out_ext32s(s, rd, rs);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
-- 
2.34.1


