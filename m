Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01B1DE5EA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 13:52:00 +0200 (CEST)
Received: from localhost ([::1]:54698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc6DX-0004Ja-5V
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 07:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jc6Cb-00037V-Fj; Fri, 22 May 2020 07:51:01 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jc6Ca-0004cD-Md; Fri, 22 May 2020 07:51:01 -0400
Received: by mail-wm1-x341.google.com with SMTP id n18so9542725wmj.5;
 Fri, 22 May 2020 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PeC4/6Bbi6vdN3UI8jEqDsfyPpIFP8TzdU+CFw09D9g=;
 b=ADKhULdRIiNbFVy02LOfvd5zmaNxrf7Z4KbicuV+8XD0qVronN+0P7D8bxRubcT5MM
 lWe7eLoX2Eb4Or4Q0zJ6T6ArEMh1eYC32ShM0c6MP6rKW9R7pWDB34B5CUABBzCp92Ji
 9nQR88FRqpTUH4zD68crT6+oDHRVwGLDg8ZCJbpMBoLRpe5OenbHpM/hhTuwZpcb9tQa
 UmkdCP/VjIKuPQYmwXi85DXXhjgcL+erK/2wmhE1wu+F7rOmFsMmkEhnjsLb8tvd/Imy
 GLU3jU/VgzJTlltHe0niEOmj5z4YumfyGBns/DiG0YZJGSUH5ezQNKSOHX2V4AQSF3Wr
 NlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PeC4/6Bbi6vdN3UI8jEqDsfyPpIFP8TzdU+CFw09D9g=;
 b=FcSSTqG3czcPSBYdlNImhyfOd0hwG6LzsGdGZRJaogZrTtn6tTOUYQpEH5bgEtFD74
 UPOSFdplzpgPTsattl72d3UgVGgImxlYfnm2YfBfmtszDF2Tz5+kHJrXM9Wo+NYNoqNv
 wnfhayVcoecU5uQrFTzDj2NTVvQ+f0KnpHNTH7wxbUvoIkzVrpZHwT8T9B6XG4t6lvHT
 R4QPL6fNsP1lbwSPDJcYCGf3cAdfth1Opu47s3knpqD895hAJP60hnwR1DIKlgaDVOb4
 FMvgzK6dUZ7OHkZhXV60IQLRE4+JJHqnuQooxE8I+NQGtsa4hT1Q02Dpqs94bmXMj0os
 rVlg==
X-Gm-Message-State: AOAM533qIcqRZdVPwayLAe3AzPxgHAMouUZmVy91EQ5RwGhIeVbkHFtI
 urBd/kcEWbpdmjYHHp06qFw=
X-Google-Smtp-Source: ABdhPJzzRmK9cbyw8ZhU+vxusWoRYy4Q85ElqbfHsOOYpIrcUHzI9TvsXvPlT/EpZah+81CQG6fLNw==
X-Received: by 2002:a1c:3286:: with SMTP id
 y128mr12994051wmy.119.1590148258773; 
 Fri, 22 May 2020 04:50:58 -0700 (PDT)
Received: from eden-linux.lan (bzq-109-66-59-205.red.bezeqint.net.
 [109.66.59.205])
 by smtp.gmail.com with ESMTPSA id m3sm9237640wrn.96.2020.05.22.04.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 04:50:58 -0700 (PDT)
From: Eden Mikitas <e.mikitas@gmail.com>
To: peter.maydell@linaro.org
Subject: [PATCH 1/2] hw/ssi/imx_spi: changed while statement to prevent
 underflow
Date: Fri, 22 May 2020 14:50:35 +0300
Message-Id: <20200522115036.31516-2-e.mikitas@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522115036.31516-1-e.mikitas@gmail.com>
References: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
 <20200522115036.31516-1-e.mikitas@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=e.mikitas@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 jcd@tribudubois.net, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 e.mikitas@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The while statement in question only checked if tx_burst is not 0.
tx_burst is a signed int, which is assigned the value put by the
guest driver in ECSPI_CONREG. The burst length can be anywhere
between 1 and 4096, and since tx_burst is always decremented by 8
it could possibly underflow, causing an infinite loop.

Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>
---
 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2dd9a631e1..6fef5c7958 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -182,7 +182,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         rx = 0;
 
-        while (tx_burst) {
+        while (tx_burst > 0) {
             uint8_t byte = tx & 0xff;
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
-- 
2.17.1


