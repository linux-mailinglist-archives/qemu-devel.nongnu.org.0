Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A53C7178
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:50:35 +0200 (CEST)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Inz-0005qp-0P
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibf-000063-El
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbY-0003jG-K1
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id r11so25256366wro.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+Lu7dJm1TE887g0x9UEBakZnKs1VKB2KmcyMjuqzDNs=;
 b=KCvcGlFRz8nVXWUDiOiiwluzhitAUgKzD+XXpntIwBfbofFxCkYpQBNkJU8L+udvnL
 OSX7R+iDIVQkreLrNMpraRtbnffko1QixSpENw524P2dpWEE+FSAyf+wBURO/B7GiIo3
 t8tTlMXMBwQAuYSz6NcQ93x1Pdpdd4XAJiEjKLEU8k/pgNVSn/TmElW3UcrRkpTQe/fq
 RrXobLUtgMgLqRijqUcoQJnf9mPeuQCVb7q6i17F2d81Bz6SUwi4ff1NiBDWKoEDgDsV
 6dhbwOm5AcVr+LDopDWTmo1KbsKyicE2Xu6L3m5c7nDYUuVzbskvnp2FgOgr+fWuyylF
 Dc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Lu7dJm1TE887g0x9UEBakZnKs1VKB2KmcyMjuqzDNs=;
 b=iqacDeezAH/QiBYcLr6cH3vvuwHYpb114PaDAgJmKagO6IPhBk8O7q0uCRl+29tbjG
 J98cZPxhcDuvJpOQWlOI1Ry0u2WK5pxKCOOLH1/ntir+htedBGClP0meXVKCmEqAqYgA
 0bzOqUI0fm3VlWbRGGfbSLhZUi7F0aPxu/hGHLKKaS6AM4r0k6o7o7kyoCX6Xfu2ArvT
 j2c4UtbewQT53GPdQPbu8OKH84uVKeWqDZ7HdcgW04FWErOoWULRrIWZWOfL0bnaiv63
 3eaHQmdVrLDxxxS+3FN9SB5io+9qWIAIQ/URzP8Z5njJguvOG3Z0EgkUNBCT7bTicr++
 halA==
X-Gm-Message-State: AOAM533QoRNdVMhnIOJBItAe8Qj51VFs2c2Ad76ILSgdn4qWkBIqWaoL
 t3vpDfBhzfd/ZqfPuMSA0cKuE0vIv5AMFTqA
X-Google-Smtp-Source: ABdhPJwAtnQZK1tG/8roIHmMtmdGDr+tGil9wxCauhBM4fsjQPD7xC992bFrXmbqp+CwmgZ+bKgOuQ==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr5863322wrr.57.1626183463369; 
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 19/34] target/arm: Move 'x' and 'a' bit definitions
 into vmlaldav formats
Date: Tue, 13 Jul 2021 14:37:11 +0100
Message-Id: <20210713133726.26842-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
Not sure why I didn't write it this way in the first place;
when I came to implement VMLADAV I noticed the oddity and
preferred to fix it rather than either copying it for VMLADAV
or having VMLADAV different.
---
 target/arm/mve.decode | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1a788e438de..67bd894daf1 100644
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


