Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC9487DBA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:28:26 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uMg-0008V4-Ji
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uEK-0005Le-GW; Fri, 07 Jan 2022 13:44:48 -0500
Received: from [2a00:1450:4864:20::431] (port=34723
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uEA-0004mZ-2X; Fri, 07 Jan 2022 13:44:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id h10so2580235wrb.1;
 Fri, 07 Jan 2022 10:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJ0HweE+UTkeJDGCxduRDt9UXlDB1O40KAWN/sfisIM=;
 b=ptr4Kp8tcjrCfoPZaiHMsl+lMgiQ6/E9wwRN9h+zcKb6YCXMd9hjWcnvhotDFJ7Fau
 qYedXQLQ0t7rfoBCofkTPk937T0Wzlqh7TKcNoXOFLGa7TGsUiAzrAoMuHuDU8jrjZQl
 uqJfM33b1ovMQb/W+6GRz8cp3MmCG3LCG2K3RdeNmwZShP2wvWiz1Pfc8KqAod/wm1GQ
 a4GtU19J3ZCh9AokTvzT+9/9OOKDhRmld9IrG00CqPIQ1BsAr1phexOBOORzsTL+OHGT
 dlhUZYjASJlfn0ynGJchkgN7SY4fQRn3qrRabP6nS4HIoIj31gkORU33RHrM1js1peBi
 X/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eJ0HweE+UTkeJDGCxduRDt9UXlDB1O40KAWN/sfisIM=;
 b=cxfuC6lz/IT7lvz/UdCsj9LOaim8bR7PnIe6k+t4uZf43zj6lFMA23HFJ5yvEqlaeu
 sHJtx0dJEmW2LZKMD4LEVmD07+tHfks4NuyuaRMR/DSSLOVo60oWZlJ6S+y0neEcgTAy
 +RN+wAhvR1hiOdcP97jCsBGtpnU0vcgEMbQn7W+zlm9Pl9x9Hfqwz31xmePEzA2Vkq7B
 BrpRvM9iWr0xVT5x+AqYCij5TCJjJpag2BF5zw/bdY4hMmO77R3aNZKKR/gruhFw2v/x
 C3w5Y3uhvhZC7DwRUmxHk1sMbUvn7tqKSh4Wj5qJvY3prbcp402yE4QZR17W2djIBDMD
 W2ng==
X-Gm-Message-State: AOAM533dEdfY5w2tDtXUKUNOX2fYl2Iq0dIfNgSommWxWxadFzRKUeMU
 /24QpUpNzc5nCL+glfaKt0kByLwqXaWyyQ==
X-Google-Smtp-Source: ABdhPJxppBU687/gGDLyOteWO3hsck4qCvYhxRKDXgfNDu/h1aicajNFnxyYqYuJNUnSF3nqFIP6Pg==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr55499867wry.195.1641581076244; 
 Fri, 07 Jan 2022 10:44:36 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id u11sm5416205wmq.2.2022.01.07.10.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:44:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/
Date: Fri,  7 Jan 2022 19:44:27 +0100
Message-Id: <20220107184429.423572-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107184429.423572-1-f4bug@amsat.org>
References: <20220107184429.423572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Marvell 88W8618 is a system-on-chip with an ARM core.
We implement its audio codecs and network interface.
Homogeneous SoC Kconfig are usually defined in the hw/$ARCH
directory. Move it there.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig   | 3 +++
 hw/audio/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e6525909438..c459c897cc7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -94,6 +94,9 @@ config MUSCA
     select SPLIT_IRQ
     select UNIMP
 
+config MARVELL_88W8618
+    bool
+
 config MUSICPAL
     bool
     select OR_IRQ
diff --git a/hw/audio/Kconfig b/hw/audio/Kconfig
index e9c6fed8261..e76c69ca7e7 100644
--- a/hw/audio/Kconfig
+++ b/hw/audio/Kconfig
@@ -47,6 +47,3 @@ config PL041
 
 config CS4231
     bool
-
-config MARVELL_88W8618
-    bool
-- 
2.33.1


