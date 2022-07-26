Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B75819C0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:31:41 +0200 (CEST)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPLI-0000Ak-Ki
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDh-00013s-9Z
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDe-0001dW-Ef
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id v17so2343682wrr.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q3wRM0mYTsBHQhTgGrkSqDwGFdrtiUjwZJz6kElPnj8=;
 b=WeltduiBaletKGgtO3lnBR+GpLm6wvkJ4wSb475GkcQDGjZ2Av0waKab2SX9lmR2Y1
 Qnti0EU3JyWbwrF0us3SqwfazJBbG0Wt9UCOCk2gNq9T9RluR4dzgaMMi5XFxhTT10Kw
 COMwBlOnPEn60tqCmCn/MwN5IfjGw5hxizvGs4K1nvFxP1Mbhav0xfWKxoWxQ7fAKq0i
 syB29I1BMzD0hNWuci6bXC55Dzn127fOwxXwOXGnLO/C1PnFEunZfA0ev4/01leX2nJY
 /R4hu3/zVlhIceDaa4ZpnhAevsZIqTKdhicgcKUvmcbxRShaSj7L9w7YrPbCVL7y9XWA
 KWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q3wRM0mYTsBHQhTgGrkSqDwGFdrtiUjwZJz6kElPnj8=;
 b=sHmxnHhi+8ErrhNnX6jK//1eaCPvqyBVFoJ3bmY23YnFUvbUr72JPqs4cg9l9M4ca2
 VHp+Zz0fRTClikcGyMjexo6gvi/E53ILg1v4f+2bHLyZvbGanGS4I6KzYU7C0Ml+Nlad
 rj6bk9i+Z4JG0YhwDaSSd10JocjOl4gdpMWFuaCI0ZXIXCSC1X5fOXxtU5AJyKbXoNMM
 DVJZY2NzQ1pkgZBW4wA5i9FT2iIVbjtmXQ12f/mzFhup1nxWx8MbpOPNm57vMWJW3LQ+
 NijJPtz3yUtuNGXwim/IV5qkfAeLqHAIw5CiU4mUYzNw1MFfw8cCq10aAKaGQIAeVR4L
 2XLA==
X-Gm-Message-State: AJIora9pI1QX+LfmJH2kUqIoCKU8NZMowb7eAfNL+Z2ode+zMgvNfnnk
 lWi3K6gpmlIqOYt2fqUnc5oWOWwr1h+w1g==
X-Google-Smtp-Source: AGRyM1sk7vLwhyiQSfmYJQ3sIhBk6Trux+m6gSooLxVVzoAc4MZU/9Am7xhpUTgMjmykNUCasKHMiA==
X-Received: by 2002:a5d:4e41:0:b0:21e:88f9:84be with SMTP id
 r1-20020a5d4e41000000b0021e88f984bemr7242462wrt.67.1658859824537; 
 Tue, 26 Jul 2022 11:23:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm11725343wrp.68.2022.07.26.11.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 11:23:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
Date: Tue, 26 Jul 2022 19:23:39 +0100
Message-Id: <20220726182341.1888115-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

This patchset is mainly trying to fix a problem that Coverity spotted
in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the code
is not correctly using the cpu_physical_memory_map() function.
While I was fixing that I noticed a second problem in this code,
where it doesn't have a fallback for when cpu_physical_memory_map()
says "I couldn't map that for you".

I've marked these patches as RFC, partly because I don't have any
guest that would exercise the code changes[*], and partly because
I don't have any documentation of the hardware to tell me how it
should behave, so patch 2 in particular has some FIXMEs. I also
notice that the code doesn't update any of the registers like the
count or source/base addresses when the DMA transfer happens, which
seems odd, but perhaps the real hardware does work like that.

I think we should probably take patch 1 (which is a fairly minimal
fix of the use-of-uninitialized-data problem), but patch 2 is a bit
more unfinished.

[*] The commit 3c409c1927efde2fc that added this code says it's used
by AmigaOS.)

thanks
-- PMM

Peter Maydell (2):
  hw/ppc/ppc440_uc: Initialize length passed to
    cpu_physical_memory_map()
  hw/ppc/ppc440_uc: Handle mapping failure in DMA engine

 hw/ppc/ppc440_uc.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

-- 
2.25.1


