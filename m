Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E739A65EED1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJJ-0002rI-Uq; Thu, 05 Jan 2023 09:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJB-0002nE-AL; Thu, 05 Jan 2023 09:33:29 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ9-0006zY-P8; Thu, 05 Jan 2023 09:33:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bn26so16848214wrb.0;
 Thu, 05 Jan 2023 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=T6SnYYfpIT4M4iK35TInehoWva1alsrEeKBPee/UGUxNXQa7/6dX8cELwEgnVFkJNl
 32lg/130eKi3eOwH2slkzfKSipbNByn7q5r2EBuYdNBbdzBzcfE+esdOtoBEVLyQExtF
 rWr/d8ByWyvDqcGDTWH4W0LH59ziM/eo9Gn4Zt7aRDpx+h5hZCl/GUhL5IJqOuQxvChd
 Q7JgmP8R2KIWQBrTvXkg2IEwRKQwkY/JeS3E/IbEqdeMLD68XbkEX/zTCvgI6byR1Df5
 BtZ5c7crVf9opZBGOjEWma9DNrUe5z4d5H0LfS8YyVrKWH03Fny+UOF0q8+jWZmM+lFE
 qzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=Q6xxZG+lywNiA4M50zReDPPWJUT7RMCY+qotWIBfxZgKNWEWNjc4NVoYPgtfEhSKQ2
 gZzsqXukTz6c6z4Pv69PzjHysyzx9hhVUQMhfG7BGVhoN4HF1zYG1/fr2fq+Qx438LfE
 Ui9HvRItaUCCuzmSgggYuI92dZbp0m/GZMpOMbm5s7lEPWm3tLNrsJsNciljI30p24hX
 x50d7Y4uo5Kjbw7o7RL/6J19StYJGiTrOXfL7cez9Su3EdDQxMY+dXdRaERqRssHgxjw
 0XPoBBtk66aw5xeRnLdGEFPXg9c+M16KaC+7tDVohEv+/V7PdtnAiTzGiclofrYTncRf
 ajSw==
X-Gm-Message-State: AFqh2kp8YHS2C43Fstv9JTFAu/UAiCtOSFcHRJyfodf9fnjFGwwPslCO
 3/veS8mH9FQ3QJDTEpvDhCWAY50K63eYfQ==
X-Google-Smtp-Source: AMrXdXs7o7hQ4AckhdAfY6BHRGdcoQ/h4hwoDRVTpiBOHOyQzEDWTd3qdlMbx+16nzLuRBHlk7pGhw==
X-Received: by 2002:a5d:5910:0:b0:27c:7c2a:f700 with SMTP id
 v16-20020a5d5910000000b0027c7c2af700mr20721080wrd.8.1672929205811; 
 Thu, 05 Jan 2023 06:33:25 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:25 -0800 (PST)
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
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 18/31] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Thu,  5 Jan 2023 15:32:15 +0100
Message-Id: <20230105143228.244965-19-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e813e20639..c6659bbfda 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -381,7 +381,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -408,7 +408,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.39.0


