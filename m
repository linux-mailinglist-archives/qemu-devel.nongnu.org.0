Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D64BD8AF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:52:22 +0100 (CET)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Mj-00083Z-3V
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM5CY-0004on-9K
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:41:50 -0500
Received: from [2a00:1450:4864:20::42e] (port=46729
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM5CW-0003F5-9l
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:41:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id x5so21101699wrg.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VoKaf7Ak3GnWDSeqTu+jT8G56c8Do90Fo0z2JjU+DI=;
 b=qbtD7x6o9V33BSZRPvYk0pgmI7tCuRRtk+8pujO6Qhd4n7sQrlziPSxiDSx9feeeSc
 Jf4RpLJiHMb5EXrsGkhu1sTCube07+4VRLUc+FH1lIm+WFrYbZvGj3JslMq/U/w/F/j3
 V2UwZ+vvq7dApnj75vLDUxjWZ9baZtd3VpFIbqxw47yJYY0XVz3m2q5/VL+UsQp9y0mO
 vkwHUOxMHaHSmAduAwvKTQlucOs6FjQ97JBQZkcxjiY3MPfUfaSsoV9/shdGVlZqELh2
 wCKy3BhZn1VliT7hmMdw2+8kEjV6X8IpfbINbZJmInBGulmqWpiGbIpiYwo5o2wtl7y9
 h/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VoKaf7Ak3GnWDSeqTu+jT8G56c8Do90Fo0z2JjU+DI=;
 b=OMY0FLf3+TqNiN+RerGcye0xqA3JOiTAFS+1gDgQeAi1CSE1hLV+0TYxkt5xQcxgPW
 3HJE2bvvUIx02pVoIYXtZPQrG1wMa/+EWFj/Ns6+IEaWNWwNheHn+S8Gm58arHsBQuha
 lShOXBnhA4RXUYVC9Fj1ww0mub3o5HYyrP6+C/ZP+Fo02nMpXETSwRGK7maCrDmzhdAA
 vWPvYPWgzi9fNd0y2unmJfG+Ha6MC7oscVA0/Rul1hV9nViC/3dTBwx+cv3ozUUxxg5D
 p8I7mc9ui7hsyjUFyri0kAt5jDPV9Cvq5u9Co7Ud5y587hlcND8pLf8mkntOEMAqPYbb
 AzOg==
X-Gm-Message-State: AOAM533AfraqEfS3P62K53mBo4MZSfQoSTQQC1nORbRq3AowGjCzvD2S
 7KWxM9NrDpZifZ1+OIMiZmw/Yw==
X-Google-Smtp-Source: ABdhPJzC71eC4wRAQ0ylk/iKGOH0b0wcuk01dojpfNYLaifRAu33qbf4jXr86Pe7bNQIPY8uk7TUdA==
X-Received: by 2002:adf:c382:0:b0:1e3:1be3:cc38 with SMTP id
 p2-20020adfc382000000b001e31be3cc38mr14941602wrf.368.1645436506679; 
 Mon, 21 Feb 2022 01:41:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b00354d399ef32sm7309517wmq.39.2022.02.21.01.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:41:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: Update AN547 documentation URL
Date: Mon, 21 Feb 2022 09:41:44 +0000
Message-Id: <20220221094144.426191-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN547 application note URL has changed: update our comment
accordingly. (Rev B is still downloadable from the old URL,
but there is a new Rev C of the document now.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec7..5ff47e1dbae 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -32,7 +32,7 @@
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
  * Application Note AN547:
- * https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
+ * https://developer.arm.com/documentation/dai0547/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
-- 
2.25.1


