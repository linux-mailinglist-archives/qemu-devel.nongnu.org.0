Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308BB65EEE6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJP-000300-92; Thu, 05 Jan 2023 09:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002ko-HK; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIy-0006um-9H; Thu, 05 Jan 2023 09:33:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so36265542wrz.12;
 Thu, 05 Jan 2023 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpTLCQQN9sJV5BZKqwLD7eLW09/Kk5l3kKtc6B53Yig=;
 b=EzF7fF3aNLveV8O9Pm4eA13kcNQK+5rCbxp/z7qIVNBov130rDL3IB56Sr6H8w8tQd
 K8LnISLAf0ZrlOLGL3nf8JVBGT2TYHSY2g2qeoEqK5/CApXRYAFdjbua/ztJFqoC/H20
 F/1PrgQWvgzfK4wPH2KYg0OVgKQ7VQyDOCNpAyuIborJ7HLuBR/M/tZGVDPLH+xAKYZX
 obMsCJcVVZSN6q1+UXdpu4tjIbHaecqtD3/nCs58wsnWCnYVzAwGsEc34FO5DTWip2QH
 +MIh4JFEm9T3sNGFZyiOnzBMJmjWJPI67C98STyOK1c4/TkGhoyQEt7nYgGalgsYpCVQ
 XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpTLCQQN9sJV5BZKqwLD7eLW09/Kk5l3kKtc6B53Yig=;
 b=OHHHjaFKZH5T9FDDvZBnx7iJEilkDhDY+PyobDY4a72+bFfpIGtk3gop+NgKFWvuaz
 G3Th51XaFS5m+f3OSeDxY2d8Okc+E/1ZGdqjTxTdeXJ6FiBe0KApgS0/4Q/1uNw5Vg9q
 okXpqsvi9zYKadQ0l0nieNfCnAcHlwmI8hw+h1y9krgQTtX1bPiHVmL6JkQ/ByL3Qyn9
 e0pDPSv+Zp9gpk2g9Rew7DtpKAFiuHnGnUlEVMX9Vu/ktON2GupOd9xL/Vas/KjQ6g7p
 EhgGNC6OZvmb0APzMwjMh5ir9MBa0cIVeGStarRRSjKv2sfa4KDoQCMu4SjxsP137rKA
 Xk9g==
X-Gm-Message-State: AFqh2koBzIEUn3Poahq/45UACpYA+htBMViRINlPF8i9A713flgiuBm1
 sjvNd2vOL1lGF1RXMsI4O4XvPhjwGKQRTQ==
X-Google-Smtp-Source: AMrXdXvCFjW4Kk9R9ho1I4zkCm/wsquEGbIGOF7gwhUDKiz7yEU6TsxmhzyUsuCKHgkNxCNXcQGWSg==
X-Received: by 2002:adf:e383:0:b0:242:69f4:cb6f with SMTP id
 e3-20020adfe383000000b0024269f4cb6fmr32240445wrm.32.1672929193975; 
 Thu, 05 Jan 2023 06:33:13 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 07/31] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Thu,  5 Jan 2023 15:32:04 +0100
Message-Id: <20230105143228.244965-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d1f7d95936..f67893cd7c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -234,7 +234,8 @@ static void pc_init1(MachineState *machine,
                                        : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.39.0


