Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5F612D8E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGuR-0001y0-LH; Sun, 30 Oct 2022 18:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsi-0005PJ-LH
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsg-0000LG-28
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a14so13676280wru.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4JFrtWXcU/SpTQigs0Qb72fyYGn0igOywH9P8OaWUU=;
 b=hplX4vP2EOdsWa3efO4oJhHL6GRD9waUhE7Tlvjt9lMrxWUwF9vIvXCxt3041a7OO5
 NINuuo4EGDUDNfDm3GIn35g57zhm8zpMlQD9mkpbGj5Sc/JHNN3KXf5PmKxbLlGLe7tP
 ya5CVB68ESalHw+mfPoMry6o9WOEmbX6Cidki5N5vlQK+easPrE+v6oAt4fDg+2tS8qa
 HzfMKytDUHSALW/M/P2fB/SY2cayCLGLg3c3QEuLlmPxOUX7pxca//pMr9qkiA+RC0Bd
 v0961pRv2sarUcptsyHovh90bTlEah3WHmpaGClvFarOgDSPg53KzLRSDpRcUNeVVCo6
 Flzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4JFrtWXcU/SpTQigs0Qb72fyYGn0igOywH9P8OaWUU=;
 b=sc+sUs8n+nAirWtzD93lo0jxJpRD/PwO8H3HYot827xxAZeE3JlBAofVSiNSbBAbce
 Gix7Ejp5gtOdBWVjOP11TB194PI8TnXgDXe+6KC3hYpJ73UiHNOZ4DKPI3A/2ufej/7U
 2XTSgcllTEqZmVfWLM4Yj8/DpDOjkXU/JK50OpEI0crM5GAx4lSBaHQrrPJ5sNQ0kNeY
 04nGZvbBnNeaAoHiCFBuJgNXUuPCqah73jb0PTgYzTAwi7+ClvVUgLZkgGqk50NHUilb
 rFqpHWKHOXC26BikP4qdmKfaB/jJhxj/hPPaVxLtKwd/Zk7dbmbQEV16YlwAOdqIqTXt
 +c9w==
X-Gm-Message-State: ACrzQf2rlyE03g/eC9I5vYXhBOGTYEis4xSYno4+ZELyyQRpDHaOoMsj
 GCVmiSz6z00SnkoHGNPMZcwE4Sb+SW1Ezg==
X-Google-Smtp-Source: AMsMyM6m3xUcXsynwkZvdaetB0rGYW38FnuzHrJILJvzOFbVX7Al4pBYPW7NGk9rlXPztheOg7zDkw==
X-Received: by 2002:a05:6000:1b0e:b0:236:5c9e:7110 with SMTP id
 f14-20020a0560001b0e00b002365c9e7110mr6224171wrz.650.1667169252175; 
 Sun, 30 Oct 2022 15:34:12 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bj12-20020a0560001e0c00b0022e55f40bc7sm5268101wrb.82.2022.10.30.15.34.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:34:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 50/55] hw/isa/piix4: Add missing initialization
Date: Sun, 30 Oct 2022 23:28:36 +0100
Message-Id: <20221030222841.42377-51-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

PIIX3 clears its reset control register, so do the same in PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-28-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index e05e65d3bc..9126eb9edf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -140,6 +140,8 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xab] = 0x00;
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
+
+    d->rcr = 0;
 }
 
 static int piix4_post_load(void *opaque, int version_id)
-- 
2.37.3


