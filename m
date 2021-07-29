Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25593DA261
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:44:42 +0200 (CEST)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Sv-0006wD-NE
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9415-0000sT-9O
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0001CG-Rx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n12so6480687wrr.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=x+wWvPZVN085cj9+J/UYXuN7EbyetXEivfUIiM/yMEz4Yw2t5oLGgNxqygeKA+k7g9
 v0nHSpuvKXlBkvsl8ovFXogx1WwUXPcOPkyp4C/2ThQ/zVlEBjPJ8MTM5P46iCaCpc3v
 0czUwcfw8edILVPfvluUhSgp/guPZiKJ6dvpcJNKWD1zhnizlbTgRetszmnHDl4S4HPS
 q84Dii64JKzDHTK42iBQIrbqwMynCsxuH+vDUoxgW0BTYTw9EDGIVbvI2qcyDyutHAp8
 I+4oswP+io9Ju96dufQLv+HaZlT2ij8A1isB5ZIm8/+2hD6tB7E+mgf3t0lOfrpnguhp
 OqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=mJ0NksR/u+XkzIqssKaLfq5IMGiKe2/TsxjIROJRTaYLxVcu8e+lJZ1ENx4rGUZrBE
 juFMLWdfsQvSDaUeKtQD+ucflMdDDQTl3jdZw27scBDKayxkRxWsWoGLAn+0oV9Osjjh
 ovQIVsoIjXyRnxLXJy59hyEji/WMv+yuhG+Dj+mgKQcGG5nm6iLTwSo9ZBxshMZWYzS9
 DOrWhJDrl4sYOu2QNvDceZ9HKsh8iA7M+tjqc9KThqEE8lLUvKgMuX9lzbkXPaqcCiSl
 snUwfbTMN9ubIMnDI70qByvZdfpBZTkCysRuXEgVy3dIFutvmIwx5ERxjkBp66SbhFhS
 H7uA==
X-Gm-Message-State: AOAM530T9jJuzT3eAAXujf1LOgINcKDG3k4wBAfE3rToL0A6LNvMr6pP
 jTXI8b92GMjgwYEJln2f5XuLuUVHEZ/sMw==
X-Google-Smtp-Source: ABdhPJyC+3aCGillYoXTUEMRkikFdopSJ5BnvR4V73wDJc9LkCH5k3dUOiW9LciHD2GONu0OHPzq/g==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr4208559wru.351.1627557331276; 
 Thu, 29 Jul 2021 04:15:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/53] target/arm: Move 'x' and 'a' bit definitions
 into vmlaldav formats
Date: Thu, 29 Jul 2021 12:14:39 +0100
Message-Id: <20210729111512.16541-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

All the users of the vmlaldav formats have an 'x bit in bit 12 and an
'a' bit in bit 5; move these to the format rather than specifying them
in each insn pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index eb26b103d12..bdcd660aaf4 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -305,19 +305,19 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 &vmlaldav rdahi rdalo size qn qm x a
 
-@vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
-@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
-VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
 # Scalar operations
 
-- 
2.20.1


