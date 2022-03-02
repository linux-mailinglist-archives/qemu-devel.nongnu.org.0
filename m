Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E164CB056
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:55:20 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW0F-0000Lz-0a
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxd-0005cC-2G
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:37 -0500
Received: from [2a00:1450:4864:20::330] (port=43934
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxb-00084v-3N
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 a5-20020a05600c224500b003832be89f25so2047090wmm.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bI6UFhAMhWBlOHTyDE4RG/auEtkAok0MRzYGhv/u1kY=;
 b=HSWuVSLqonGBTA5KkMSfYC9rki+0bEp1BlYe0TOupq4TJ/V5YUyu139MZy/TAJLnsd
 +SCEWJeToMPXwg9qdcdBMOJBbO8DLDfFZ+W+IA4ukJUjJAckNFJWlBxB+VyZWfl2ajng
 SEwcvr9KHEHhemksN+S6lGe3dxGFtezhxjJCubTPK0vA1ggWAVYvkzcfYFiivS5tkRnv
 9vfALIoYe2isF5HbvwA2DEBDGlUiY+Iz59PaXYTjHx8X9gvaSpIZHPUaWjXYNMkovbO9
 llcVtyQZozP9re1/xilvTGQozzfw3jIXtuhcSbvw5kN8FYai1qXAOdKfi9ZHdjq7+6q4
 dwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bI6UFhAMhWBlOHTyDE4RG/auEtkAok0MRzYGhv/u1kY=;
 b=EwdjHCpqc1F5UO9E+odMIaUeXBP+USVCAQUv2mR8pG6+HPLjQFq9o/QFkkxbpY4DXx
 I6OVcnFZzm1McjiDspShCz+A/TvhAMkHMtfyMIz4qBnwAyX1lhW5LqUt3ZW6PhaRT/2z
 yYpe//16ZijI2IkD/lFEiy39aWfyiSxV/QCwZUIbN+RyHRFBjF36yS9QZUCtesZtMRjj
 51vfmbBJqdTnGLhw+GNbn5JRp0p1TtLBtpzTERRd1oe8rlbhu3PrfDlurkXbPvtLDujE
 CYH2XmE60vfzBuUI2V1oAZ3FlgtenP2no3ULcevzJzzByr+bhjk/MXM6Fmb1Wv5TfeOL
 r17w==
X-Gm-Message-State: AOAM530iZrXU2ObpK1NdXTBb5o/VMQwqAWe9NhjGeTkUjHUP8cKxScD/
 rf2LRVprt5/T8i9EltfF9abpTQ+6Y65xSA==
X-Google-Smtp-Source: ABdhPJwy8sgu7/gj2mjvi1EUxBm7kD7Y564Q5r2R0DZwMvy5qarOqTO9f4YDbCjaq7kck+S3fodCaQ==
X-Received: by 2002:a05:600c:47d1:b0:381:1c01:2aa7 with SMTP id
 l17-20020a05600c47d100b003811c012aa7mr1297381wmo.189.1646254353736; 
 Wed, 02 Mar 2022 12:52:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] mps3-an547: Add missing user ahb interfaces
Date: Wed,  2 Mar 2022 20:52:05 +0000
Message-Id: <20220302205230.2122390-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jimmy Brisson <jimmy.brisson@linaro.org>

With these interfaces missing, TFM would delegate peripherals 0, 1,
2, 3 and 8, and qemu would ignore the delegation of interface 8, as
it thought interface 4 was eth & USB.

This patch corrects this behavior and allows TFM to delegate the
eth & USB peripheral to NS mode.

(The old QEMU behaviour was based on revision B of the AN547
appnote; revision C corrects this error in the documentation,
and this commit brings QEMU in to line with how the FPGA
image really behaves.)

Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
Message-id: 20220210210227.3203883-1-jimmy.brisson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: added commit message note clarifying that the old behaviour
was a docs issue, not because there were two different versions
of the FPGA image]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec7..e287ad4d06b 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1078,6 +1078,10 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { /* port 4 USER AHB interface 0 */ },
+                { /* port 5 USER AHB interface 1 */ },
+                { /* port 6 USER AHB interface 2 */ },
+                { /* port 7 USER AHB interface 3 */ },
                 { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
             },
         },
-- 
2.25.1


