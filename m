Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD90301947
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 03:58:39 +0100 (CET)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vbq-0003ux-HC
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 21:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWb-0006iH-KF
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWa-00039e-1Q
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a1so8827042wrq.6
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxfJzCYb9p3cDULfc+U2nLGno8Z8Z8cB17iO0MBRYWA=;
 b=xNxrfNaOcK5gmJCVPvh42++lq5RdzVi6TTbW75rStHU0DCYBILzCj1Ovmw4ugmtqhd
 pbOBYpGbQ9+ofj6BK+8Ko0c/tkF4YhtWKoKfLoXEDWZunYtqLRdKSsA3EGvXCVH8eV6l
 If+Ye3DJx4BJlT218BIDh32yJ9Iu91Icqt9nIg5pZuxXK+aUihupExTh8/J9s0jdC+vZ
 VYsf5MRJVENPSJF+OF7mbtFjLgCZn0h2pVZ1dh1CpH3qkrXiKi6/2ffowQGp+a7HDIHo
 N+E1qssB8XnMy7GWmmXCt8Eo6MKKW+1CmI2D9Qv21gqFoELYO1dWQDeB2M1NL5BhvF5E
 D51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxfJzCYb9p3cDULfc+U2nLGno8Z8Z8cB17iO0MBRYWA=;
 b=WvFaX2QJE593r9glQLx3RYJqIq7fKqbAS6yXpRMT7lW82bw+wSmjS8P6JrCfho0TDL
 Qv+3dWDMHPVeAi7eAQIRW9vUQkkSCMAXWqdRnycHr729Ys/rq+eBoPXB7TwanZYLpop6
 ygkynCKMuV4sIVjFewDMV+4KHvNwykyT1jY2Nap1dnhVnzX8bdcYSW7Rt8t60F/dD84K
 cmB3o/9g3aNOpiQ6ugVrgzxwlLrgfHyCoxV9nEQ1iFi8SsBdMEkM69kguWUiwe7Vwv2w
 8A2GBVHQRJQuCTjDgBHduG7kBUKqanoTrjxi4iOZOTp8qkXL23AiHo1UCCq43jtqMPnh
 LxMw==
X-Gm-Message-State: AOAM531VCf312hjgsxvi0gKAYG/53cKOmBe/JnnOEBBajT4XEl4N50GP
 Kix2tF9RaSKlcTR3hiVEzOkhuA==
X-Google-Smtp-Source: ABdhPJyBKOLKEbyk5J5HsPuXEyM68tEy6mq+dh0X/dTMIIqQXT7cDx93vqvtTEQWVEI4vHp87zsgNQ==
X-Received: by 2002:adf:9526:: with SMTP id 35mr11011348wrs.399.1611456790684; 
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 3/4] hw/intc: set GICD_TYPER.DVIS for GICv4
Date: Sun, 24 Jan 2021 02:53:05 +0000
Message-Id: <20210124025306.3949-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VLPI frames are what make the redistributor size change, so ensure
we state in GICD_TYPER that we have them.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_dist.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..833deb0a74 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -387,6 +387,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
             (0xf << 19) | itlinesnumber;
+        if (s->revision == 4) {
+            *data |= (1 << 18);;
+        }
         return MEMTX_OK;
     }
     case GICD_IIDR:
-- 
2.20.1


