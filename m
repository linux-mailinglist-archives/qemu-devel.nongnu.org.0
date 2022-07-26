Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D875819CC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:34:22 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPNt-0001fR-EP
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDv-0001cJ-CK
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:24:03 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDf-0001de-3N
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:24:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso8618706wmq.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vy16z4ljJdbwe81vd9Sx+BZv55mLr+tRl2mig2DmfaQ=;
 b=KDQTm0FxKQ3uVMDcXWucyFcC32XBkuowajZtNCmiCeEgGjD1cCwC6TY/7xN0qLdw3E
 6mfZ3tYYC5CZMgqNt3ATx6vNzEAshqafhtgMlSWk87SHdnge7sc2SLglga+FeWj/afOw
 0wsYTkAffNiZ6RDizeG0941xIGEkFNAlNS3mky066HIkkHDqMeFfAENroau0rk7uPONW
 fiGAzYYH/oQuWRfungdpLnQ15HMBME+LQS1+5Mwfd2HwGM1oLzFdY97+kr5kcA1120na
 hRFFkxzD8CQFNuuzxCzWXAYln88eq3pGC3lj2j5aWFN3FpKHDuUf8Dsip0bw96WRdiAi
 6hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy16z4ljJdbwe81vd9Sx+BZv55mLr+tRl2mig2DmfaQ=;
 b=hu9/mbRdq+5p5iMUI2a4vd3SAlY4YS8pD/fblGjGd8KKm85tzCBvyEjUGfP6aqr4Sp
 RnLyGyH87ftwVQb65mWKeaLUv7vHv96eq0kaP99FPcp9vfO/bYGHTCdoUFP4K/tEN4nc
 iylsF4lPgEKpaEKdc/Bw1R5RjwS0p/T+t+GyDG5VtY7ROdjfEU6tVu+UWQpry4jPRGif
 pZow7NWoMTwGQsTF7WzPF2/eAqP2xuiVPLsR6qabs8aCyX23k0kqbF51ZvivlBOO6U0j
 QCigIy4rBjZKkeW0guq8xNrpq8P/QNJU3h+9X8bn0pGKbkj6v+hQTqNYtzCgFgKx3A6o
 uZSg==
X-Gm-Message-State: AJIora+ncGM5/4dEbm1tYjKRlOD0EgQ2+xKr8HAdzmQ4FpZ6BsnIVEB3
 3KQghamuQnFgaS4XBBRIxuItFfEmJYDNmw==
X-Google-Smtp-Source: AGRyM1uKDzX3/hcD+XAOS5SyAX0cERT6c7yrdaeQ/7g+DoQPQMczR065oFxzssbuPn908eUgIRxqlQ==
X-Received: by 2002:a05:600c:2044:b0:3a3:15a1:ddfd with SMTP id
 p4-20020a05600c204400b003a315a1ddfdmr332556wmg.3.1658859825611; 
 Tue, 26 Jul 2022 11:23:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm11725343wrp.68.2022.07.26.11.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 11:23:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC 1/2] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
Date: Tue, 26 Jul 2022 19:23:40 +0100
Message-Id: <20220726182341.1888115-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726182341.1888115-1-peter.maydell@linaro.org>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
to implement a DMA transfer.  That function takes a 'plen' argument,
which points to a hwaddr which is used for both input and output: the
caller must set it to the size of the range it wants to map, and on
return it is updated to the actual length mapped. The dcr_write_dma()
code fails to initialize rlen and wlen, so will end up mapping an
unpredictable amount of memory.

Initialize the length values correctly, and check that we managed to
map the entire range before using the fast-path memmove().

This was spotted by Coverity, which points out that we never
initialized the variables before using them.

Fixes: Coverity CID 1487137
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seems totally broken, so I presume we just don't have any
guest code that actually exercises this...
---
 hw/ppc/ppc440_uc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index a1ecf6dd1c2..11fdb88c220 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -904,14 +904,17 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
                     int width, i, sidx, didx;
                     uint8_t *rptr, *wptr;
                     hwaddr rlen, wlen;
+                    hwaddr xferlen;
 
                     sidx = didx = 0;
                     width = 1 << ((val & DMA0_CR_PW) >> 25);
+                    xferlen = count * width;
+                    wlen = rlen = xferlen;
                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
                                                    false);
                     wptr = cpu_physical_memory_map(dma->ch[chnl].da, &wlen,
                                                    true);
-                    if (rptr && wptr) {
+                    if (rptr && rlen == xferlen && wptr && wlen == xferlen) {
                         if (!(val & DMA0_CR_DEC) &&
                             val & DMA0_CR_SAI && val & DMA0_CR_DAI) {
                             /* optimise common case */
-- 
2.25.1


