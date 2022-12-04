Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C178641F22
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKq-0001ln-KM; Sun, 04 Dec 2022 14:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKo-0001lG-KL; Sun, 04 Dec 2022 14:07:30 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKn-0001c1-3w; Sun, 04 Dec 2022 14:07:30 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fc4so16119554ejc.12;
 Sun, 04 Dec 2022 11:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKpijhmAXOPvV4zJYeFTakq7e6VfIrSbYOidvRCdJEA=;
 b=f4Ls+kTcvPkReg3UHW194yTX95PQP/+d3eOMPDweIKBblnW+irQpO90FprVO4z/Lko
 LOfT8E66Rqq0m9wQ93t2htUFgbfkWWmLRJYk49N5V3IPmubgH+MtAFOxSsGEI/UOaD7B
 fiwv1cduclHRqSzNTUEBEz/LcC+5jUgkX0IGuBI7l1W2FrvqQtamvRR/wUa2OtzXuaeX
 V4Nbh3lLrOKLtIhIYfYDcanZNebwl/JhPG8lHWnVyvi5m3cemo3qraLLgRiKKcUReB+9
 HfZqVvcYyUlUGrwPNEieFHW/gbZ6Hrn6PDXnWphCWHwPAbjQrSzZApED1kYBPRVJwmet
 DWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKpijhmAXOPvV4zJYeFTakq7e6VfIrSbYOidvRCdJEA=;
 b=0vvRKoEfUegIrWUryeC/H9E9fPgkacFxsORU5sO36OGnS2+wa2Q47KYkevRb5sImx9
 6xnt2dn357n+hsLo2kQ80Cedu189Z9sdKbokWpH5Tb1O1Exao7RJC823/AUK1Oo6iKqh
 6PEmpJcokypxfN5jsND+1nhFAIxFBUI0pugxvaL1isu9g8lB+/DQIvwm7cc59CZwqFsf
 VRiBSrUgx2JNfwPa42+0+a7wTuSyL1VuoyzoNTwYsfEdh6sOU9cYad4vJ4MWjdzpiLNP
 uBzQ04AOXhoaM+TYyFtmg5A5NHZd9Kp96zPWSpv9CwfTDEUqiDICb57NR1RFCau0MI2f
 zk/Q==
X-Gm-Message-State: ANoB5pnYVKlgAtMyZU9j5Euh+VkUUlbMorQ/JMsb610pgg9hNDOnDqU6
 g9EB0D5hBHu0wqqmH5xZ8LAaYXqQutE=
X-Google-Smtp-Source: AA0mqf4+WHuRtMGrZQ++ylJps/mjUoVNK4eib7uAt8NH4m0xjTMWbmhL3XnRf7c05Cjt5SMMcUTlUA==
X-Received: by 2002:a17:907:1b0a:b0:7c0:fa5f:a032 with SMTP id
 mp10-20020a1709071b0a00b007c0fa5fa032mr128893ejc.112.1670180847022; 
 Sun, 04 Dec 2022 11:07:27 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:26 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/32] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Sun,  4 Dec 2022 20:05:26 +0100
Message-Id: <20221204190553.3274-6-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..e26509a935 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -218,7 +218,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.38.1


