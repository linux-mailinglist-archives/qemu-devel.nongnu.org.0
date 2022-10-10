Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C35FA04C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:40:17 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtx2-0006C1-5Z
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkp-0005sR-U1
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkn-0005Xa-Tc
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id a3so17362158wrt.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2l11ylByNeiqzqou8mXaI05tY4/Ztz0H+1BMCNUIG2M=;
 b=aDTReDEeVrRAWHAS5VuFxxiwzBNelP76tNFqTiOlkm1S+Q61+/ta9atvk3eUX4SGqO
 Ueg5iSmNPCQh0XugVt8gESpneMhqt2KkozHl2QGkFH9y4iAXbE+9v9ygouOdrl4CM+Hs
 5dtm5Em+73l0IACL2MSX/1nkKwVN02LxSLMCDl0ID/b5TD4yixKGpYKmBDzKotZiPFTo
 e46qZ/MXEP+xPiDCAJ4LZmzvLXDkkVGdKDrBm8O7I5nGIPc/xCPTLgn71lNjNw7dHDsL
 s979rG5eAAtYh4TxtskUfDyINJgJ0PxCIYDLkWfsQI5m/wiJf1GJl76vlxn5smpZb07g
 C/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2l11ylByNeiqzqou8mXaI05tY4/Ztz0H+1BMCNUIG2M=;
 b=0L66PWpKxm3vb/uMesJKq0rk/4piw9D67omln92Fw747JUu9OJTB+e2RNmKssHUCls
 BrNGuX7lzfP7V2uzeuZq9OnRoFwjetHBkb8POSgFbLdc9OMDjLh2DcuOZoYjyfyOwyaE
 U1KlXrfYGJtujHci3QNghHOfc7L8EVz0zO5Cb0g2qg2kTg5q+boQbT7SDZOdfgFzR3Pq
 JGqqM+XPBVlRCvYiIMSskC6yXdkttYtgQ3IciHOQ33VLjSyPbEGtCncPAjBpRWKnjIKD
 cHqTejMKcsw7idl7btY2XxI/ib3n8vpviZ7g0zEcRZsCJfSXIesHfjwhWvEJcvCwUYCm
 VHqQ==
X-Gm-Message-State: ACrzQf0AIZE4narPCBD+g/KoAuOxDtQOwI5PDPQaX04+fkHEQ/vCiYG0
 pfh0rgl1xNCcPI7BANpna7BohErWNofJHA==
X-Google-Smtp-Source: AMsMyM6pJqBbIVirN5L2vHZnhLgcA4Hc/gOuXMow/6DWy6kN0gJLSI/E2fsyiTMA4mJlt5W/F8lj1Q==
X-Received: by 2002:adf:ebc6:0:b0:22a:c5ee:b057 with SMTP id
 v6-20020adfebc6000000b0022ac5eeb057mr12131398wrn.317.1665412056351; 
 Mon, 10 Oct 2022 07:27:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] docs/nuvoton: Update URL for images
Date: Mon, 10 Oct 2022 15:27:05 +0100
Message-Id: <20221010142730.502083-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
images can be found these days.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20221004050042.22681-1-joel@jms.id.au
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ef2792076aa..c38df32bde0 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -82,9 +82,9 @@ Boot options
 
 The Nuvoton machines can boot from an OpenBMC firmware image, or directly into
 a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gsj`` and
-possibly others can be downloaded from the OpenPOWER jenkins :
+possibly others can be downloaded from the OpenBMC jenkins :
 
-   https://openpower.xyz/
+   https://jenkins.openbmc.org/
 
 The firmware image should be attached as an MTD drive. Example :
 
-- 
2.25.1


