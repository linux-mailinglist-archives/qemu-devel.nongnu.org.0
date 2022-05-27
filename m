Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49D5367A0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:44:06 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufsS-0003JX-Rx
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003c5-VQ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004Ry-Hw
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so4561272pgc.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+m+Vc/siQJ7yTH12TUx9KUDSpT55djNcEX7+B2WPkY=;
 b=a0uL40S359Qjy4KuCpJh5ZEMJbbcZqHxrDNUwE0ewZt83bNUmF/NCsVAjd8TR6moYj
 muZN9JsMw2nIN5A8BCIl8iLFgApw5mw3MQCqujG3IfYULnAsOqA0bEhFs5LEd/NHANSl
 5D1XDdFOZ6kFpSUQsy+4BgSdyKq568m0YIECGU/lQdjFOmUPdifeYsRZiiw7NXnCawxC
 NSURoQawacbI2h0S7zcLnQdvfN8jtIkbBgaZQpW3ADGviEAvRQSAQML/i61n2W5KAXCU
 1OENHBT6qgdAJGOT02DePXEZb+BwioC8OCcrBfDHKn10m6gHmkTlddCaJOz4cURk6gj7
 QbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+m+Vc/siQJ7yTH12TUx9KUDSpT55djNcEX7+B2WPkY=;
 b=XzxoAkLVEgwDbwqkS/w8D2SpqGzcKsvaXJzXGNUBE00vzCaV4hq5EhDFEdF0A+Qfag
 SxUg/WuDGKlnZ+YlM0otwedFQ2RhV65eToklNrqvym6Q0wCYC7IUuYNyXVIEZfIdpPQP
 63XJTBNRGIAchwM4SbIYhLMyY+E8grpT+tU4glV0vm+BbecuPXV/DYZm1bRZnAUSbS6m
 +1S2lHaZ3AiIbDi6gG3atj3/e9yp9MIMg7uY8nJ43eBAVQtDXgvhXa2svru3226kZI/c
 DdLJYoLFgZIM4AZIpDfgedaABKtCQs9id49IRTXAcoUnBQIsJOeR2Iv3fBoMz9VjuPWQ
 6Lyw==
X-Gm-Message-State: AOAM532K95oqLkBCtUYgYpoIkdnxSBDHiJi776mtfux+bvY8xpuAjLGY
 bLuoSX8lPpKFjKO0ApjkpqTft5hXYLCkFA==
X-Google-Smtp-Source: ABdhPJw/6ZekLKe1RH4+kil0x7vniyIlhNbSC/MxKzlmj/zhGqIZsjfKadih+rePfDLdJHTgAHCQ1Q==
X-Received: by 2002:aa7:8141:0:b0:518:425b:760e with SMTP id
 d1-20020aa78141000000b00518425b760emr42583890pfn.27.1653675787167; 
 Fri, 27 May 2022 11:23:07 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 063/114] target/arm: Use TRANS_FEAT for do_last_fp
Date: Fri, 27 May 2022 11:18:16 -0700
Message-Id: <20220527181907.189259-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f5453e99e1..841c1b5644 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2608,15 +2608,8 @@ static bool do_last_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, false);
-}
-
-static bool trans_LASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, true);
-}
+TRANS_FEAT(LASTA_v, aa64_sve, do_last_fp, a, false)
+TRANS_FEAT(LASTB_v, aa64_sve, do_last_fp, a, true)
 
 /* Compute LAST for a Xreg.  */
 static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.34.1


