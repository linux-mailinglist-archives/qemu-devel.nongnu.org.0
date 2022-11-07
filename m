Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0F62022A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAMd-0005Vf-44; Mon, 07 Nov 2022 17:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAMP-0005Te-AR
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:59 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAMN-0005Ie-O0
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l14so18285817wrw.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XXNFe9r1mT6rjhQRSMV/jnp8F1MhoTAoi8vAOIowfQE=;
 b=jaAr/ZxIfHAEcSWikmtdYJg18M5a/nf+0n9GqG0brE93j6HebjfBNIbbk3VHIeUcBy
 G+mwyLBaR3LIi2KJ+5Ji/UY9raRDbsBBamBKv0nxy/5Ff3HudAexSDLKCWY7OaS0/Z1a
 e69zvPT9H159h+X97+Tb9IPbubAQhxEsjf2cu9a8LWX/MQ/3ujOnzqMEpmkEPdE726Yk
 bVHMi51KvFnsNIBE0CP76k3+ERhXs6dyfjcCe22WrxU4lQ6MStPdA6e8wdsnWIHt3T+S
 j1HYr7VoS20BxCCLABG6IamI1eNyLb5g3MtifVZ4a6yJOu7VPfznmwH1xKCtUwxYA+9P
 JQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXNFe9r1mT6rjhQRSMV/jnp8F1MhoTAoi8vAOIowfQE=;
 b=vehiVYHqzWJ8hzCjTr6TA7R24Y8jjk0S2LWzkBWAL+SAGum7yKXDLkHWVyIPU05aiv
 xKH00o8psiR5Ki3wxlyY7W2eMHOb4PwYrM/YxqIoaOvBPNUmboMhePZviAhWrzjSGgAJ
 uBbrKkF8lL2kmhyl96SP6fNJVf0NpnySSA3wH9rqHsxKBMY0Yt4rq5NeCGnu+3+T9ErY
 xa6BXPAaikxfrUrrlRRsjCCP85lHYciq6W9mRKBx2WzzwnmNzA65uVzKqhmccLKWldba
 Sa0qNnpmpYFovxFiMagcIVrNNTsnr6R5ZnBOjj3bHZcoiZZ/bGHh8qyenyAbSH1+uE6k
 iNvA==
X-Gm-Message-State: ACrzQf1QoUBJCP3EFVf1ZW3mRnODXEMLt9yi+mVorgClzUNsUSgENKKr
 JbkjG9pQ78/E1z3FEVU4fpxg5Z2skQLV3w==
X-Google-Smtp-Source: AMsMyM5XtgZ0JW+dYgnaZzWW440wSRT8DStUCxlrAqQF2hee6l0HSf0XdvsV340DAxgLAyst6ABK8A==
X-Received: by 2002:a5d:4f09:0:b0:236:a983:ae5c with SMTP id
 c9-20020a5d4f09000000b00236a983ae5cmr32082507wru.708.1667859170197; 
 Mon, 07 Nov 2022 14:12:50 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm8323533wrq.24.2022.11.07.14.12.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 14:12:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sai Pavan Boddu <saipava@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH-for-7.2 2/2] hw/sd/sdhci: Factor common Present State bits in
 sdhci_data_transfer()
Date: Mon,  7 Nov 2022 23:12:36 +0100
Message-Id: <20221107221236.47841-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107221236.47841-1-philmd@linaro.org>
References: <20221107221236.47841-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we do a non-DMA transfer, we have to set the 'DAT Line Active'
and 'Command Inhibit (DAT)' bits in the 'Present State' register.

Factor that common code to ease code review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f230e7475f..e9bb3576f4 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -909,6 +909,7 @@ static void sdhci_data_transfer(void *opaque)
     SDHCIState *s = (SDHCIState *)opaque;
 
     if (s->trnmod & SDHC_TRNS_DMA) {
+        /* DMA Data transfer: DMA functionality available and enabled */
         switch (SDHC_DMA_TYPE(s->hostctl1)) {
         case SDHC_CTRL_SDMA:
             if ((s->blkcnt == 1) || !(s->trnmod & SDHC_TRNS_MULTI)) {
@@ -948,13 +949,13 @@ static void sdhci_data_transfer(void *opaque)
             break;
         }
     } else {
+        /* Non-DMA data transfer: DMA functionality not available or disabled */
+        s->prnsts |= SDHC_DAT_LINE_ACTIVE | SDHC_DATA_INHIBIT;
         if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus)) {
-            s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
-                    SDHC_DAT_LINE_ACTIVE;
+            s->prnsts |= SDHC_DOING_READ;
             sdhci_read_block_from_card(s);
         } else {
-            s->prnsts |= SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
-                                           SDHC_DATA_INHIBIT;
+            s->prnsts |= SDHC_DOING_WRITE;
             sdhci_write_block_to_card(s);
         }
     }
-- 
2.38.1


