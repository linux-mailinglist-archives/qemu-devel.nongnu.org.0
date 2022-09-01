Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC25A9DA7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:03:20 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnb4-0001TI-3w
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0002Jw-QQ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001Wo-BP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id w2so7797060edc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3Gyk0yYaqhNQqCZW+/u5dbgDq0YaELNA3qrSwlkUFhM=;
 b=YxmS6ZV71kNY6JGO5zFCzuEuNujmceKmzkF2L+bdtpXcxFlXvA9CwVJAxiuRLFZF64
 JgjfzdKTyEjab7K08C8f7NhICBBg4AXWwmcYmQVMzX5RJCqSlcc+GUzEu/h7YLfMzIMA
 ZRWBHNzXbriFMkHycqiB9V1YjwQ3CxnL1/1KESi9fgwDZzbNMjHapn4zpXKwvJ7HiHMt
 M8Pw4q4Xld35FW17HWNLYJC23ZuUWK7E8DQfgY5BGBs47Zon/QC7NBmdz45ylwL7cu68
 PCk+Ln1eGuChHWhpgnpUirdyz+KMFmH13NenC2ZZIkxYAes/ri6sXt5qOuTlmIedtkVR
 Ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3Gyk0yYaqhNQqCZW+/u5dbgDq0YaELNA3qrSwlkUFhM=;
 b=zJs/aH5rRuJ5ULNPCxcNQngyNy+6VOvNrN5jt80kV3QbCSLuU8A8Q6mJu/18LVs1LF
 YBnhZCSdpMDFbHzEnfUloKQd4/1DAlO3kwmFsJQJJK8TZbP5BxmfOYjs6Mclx2OZ8wHg
 sCYyoLOO67TMfFHDuf9x3EGj8iFgEJ3DICM/0rcKgXu+n8GCY/H104z1X/ybGvPJHJrY
 B0gTh8/5wKEdx6SViWt7dQA7e0kBXpgyUoukvxqIOR3xmRgmNMgZH62WRTkAYZ6gmH6u
 GZLT5dfu8kEoDDK2bgsFPKJMSbw5hVsL2TcMieTZ8CQuv5xeTmPfcHc6aG32er856cqj
 +bGw==
X-Gm-Message-State: ACgBeo2IVRNxuMex00SeOzS2ME1FGxQRxYefdwLVoSZa/Sl/2piB1q+p
 /EW8Za4c6eEwg/v1wWTBNuLYbAsKDos=
X-Google-Smtp-Source: AA6agR73jTvXcUk7augQAsnDQVSSSLPdMqyXi0hTD1nRNXo/IPdeFwpqzDC6sQGgROY8bJdIStiNVA==
X-Received: by 2002:a05:6402:759:b0:448:98c:9484 with SMTP id
 p25-20020a056402075900b00448098c9484mr23217528edy.165.1662049630563; 
 Thu, 01 Sep 2022 09:27:10 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 24/42] hw/isa/piix4: Add missing initialization
Date: Thu,  1 Sep 2022 18:25:55 +0200
Message-Id: <20220901162613.6939-25-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

PIIX3 clears its reset control register, so do the same in PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..9e2f7b9b71 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -139,6 +139,8 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xab] = 0x00;
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
+
+    d->rcr = 0;
 }
 
 static int piix4_ide_post_load(void *opaque, int version_id)
-- 
2.37.3


