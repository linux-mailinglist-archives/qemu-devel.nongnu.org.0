Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11F5386A1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:13:06 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviwx-0003OV-G6
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw7-0003jH-3v
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw4-0007Hl-Fm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so9674574wrb.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ma4AFn/fK0BaWeH2Apz0ZU471NqOd3SDrk8MtIJ6sBo=;
 b=R6xBaoNRDf06NtZi9h1xOPig+4eJP8xtvnEioW3GdFnzHzqQzWOrhVZ/KE2DdUcwGu
 zsawpj1n2pTmm31ldCJhxwEKayJSf934Bpol2DT+/wzOUONs8GSWJFa1I3EJPfAa6Oxv
 Jw/xydcIeY78fVj3SKvBNRHWCsWJX4gWT4lydPf/w3UKA7eeoQpawQJp7otTJiZ9R9EY
 UslKSquMjPAmFJAjKlb6IZYT8nQFVRlvtUuZDbBgSWJcL6q91hCZAMEG7zJ+R6oKQz3W
 4S0jhBSJFsBkt5EwLjpkPaZ/NHEeM59y+lMFAfzVilqPy7G/SAu2ilQdzAvD5SWHq+61
 ikwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ma4AFn/fK0BaWeH2Apz0ZU471NqOd3SDrk8MtIJ6sBo=;
 b=on9LzyUYyMDsngYqDzwM+JKU1QRzirPXCK6mq2Hykfa1PSzyAjaKkVD2CLOJ/WKV8f
 jfujfyWQaigUDDYfd5Ha856N7b4vbbigwLekjdnioizAdJ5nZvjZMv20/GduHW/tIdKX
 YMxI837Md93+0YEEW0uqHQKC4m8jO3U+zn7VawJhmyRfv7X6Qyj8Gt3M24dzhyGTLELB
 5MMQocmyd58IYlUOTQRT7VWoeSDeRr4gFZ/ifE/9HG1ptMZOwx+Ri5v630vbhCnQxvQS
 z12srmQRd4rbqnejwD5rsL7OZuxTbzhC5iEpTAkFhZn1h5TzZa2xRtHyDMe5wtfXe4Xo
 CxrA==
X-Gm-Message-State: AOAM532NEHWrJGLuCt+Zj1wx+Di6rHTR4HF9LvkewkMQjF+5eKAjKo9t
 4taBviIiPyvk+ScqAWAp/m7KblaKIHfAhA==
X-Google-Smtp-Source: ABdhPJxCIKywQxlZh+4RwXCJ3BhmM9CaLOkI65ZhDXveMiKrY9QYSFxT35pO/oFhZ78ZWWOFh7LIUA==
X-Received: by 2002:a5d:47a3:0:b0:20e:5c89:9da2 with SMTP id
 3-20020a5d47a3000000b0020e5c899da2mr47914971wrb.277.1653926880067; 
 Mon, 30 May 2022 09:08:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 057/117] target/arm: Use TRANS_FEAT for do_EXT
Date: Mon, 30 May 2022 17:06:08 +0100
Message-Id: <20220530160708.726466-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-55-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index abb5433ee56..7139e6c0b04 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2081,18 +2081,8 @@ static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
     return true;
 }
 
-static bool trans_EXT(DisasContext *s, arg_EXT *a)
-{
-    return do_EXT(s, a->rd, a->rn, a->rm, a->imm);
-}
-
-static bool trans_EXT_sve2(DisasContext *s, arg_rri *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_EXT(s, a->rd, a->rn, (a->rn + 1) % 32, a->imm);
-}
+TRANS_FEAT(EXT, aa64_sve, do_EXT, a->rd, a->rn, a->rm, a->imm)
+TRANS_FEAT(EXT_sve2, aa64_sve2, do_EXT, a->rd, a->rn, (a->rn + 1) % 32, a->imm)
 
 /*
  *** SVE Permute - Unpredicated Group
-- 
2.25.1


