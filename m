Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553D641F18
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLA-00021S-OO; Sun, 04 Dec 2022 14:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL8-00020c-V0; Sun, 04 Dec 2022 14:07:50 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL7-0001f9-C9; Sun, 04 Dec 2022 14:07:50 -0500
Received: by mail-ej1-x635.google.com with SMTP id vv4so23031573ejc.2;
 Sun, 04 Dec 2022 11:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3gqmuMOlAIpQ1xaoKRNBcxHJ2mhWUQEUQO35ICvVUU=;
 b=N7MaiS0Fp8mTnrHX65Y0n/c81yYRe+SPkjoNqe/cYDBepzC3zSXAKalKs0osPSpiAH
 dcdoV+4/fttUDYKt56bqXwtRLbhenIjkO3GZgOPJVYS5D1U2bk9zIGWzq4NNuef+rvm5
 idA9spL85PfdJEuKrLIdzt8zJFLjgm+nVRUNocgswLd47d9jOYUVZcdEoNknmQ6L9D9K
 6OFHJIYSMiiunK23T6p74Wgd2IA7W7SSz5ohBLSGn6Frxfw+1KyA34FDXUbMhnlRmOqQ
 puLChAu3WlX5js9gwN1PnVVoZlVZ82YM7hAS5+gkAeoU32XO60CQMhiL7pwiXg13JRON
 7lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3gqmuMOlAIpQ1xaoKRNBcxHJ2mhWUQEUQO35ICvVUU=;
 b=nkJN//WxCxbc1XDkcL0kEMHUMLyGEEETuKNetHFhWdYGEcT90WdgsIXlXkBsq11akC
 6zu+BCrKJ1+J2nnSdyKYK5dVafzDxu1VabV5dUkwoZ7zdUjnKQ7pmtvrSMKxa4xP9g8G
 745bkywMLxOnf876YJ/sJMfnoRj+kwn2KijN3TQNHqV9mVNuIqa2cDSjTphHI9KZ8xBO
 0aYxtNSVa8ojcX40IeKGukvu45Rnfxp31CBdlWChr5/55PZHmFA0IUx31nQxwjO0AlNd
 qdfQmMZ5Tf+PCVxjjsYbRbw5qVbV2gud8+pjRMAVAkgTSSYbg/7j3LRzkRXckTTPLluB
 ePTQ==
X-Gm-Message-State: ANoB5pkotAcX5Pt0fBeESUoyHJOn8NAZxv440kblldHibygnyBI8Qubz
 4X2VvyIkyuk5Hs+I1r2ItFfZYilVAAw=
X-Google-Smtp-Source: AA0mqf4m8OoTmCFIVFC8IB2M/wSEInzhTOmuESDPSpemBDFSCz7oWjzKrcyE/On0ECXsxYEtz43trA==
X-Received: by 2002:a17:906:dfca:b0:7c0:f5d7:cacf with SMTP id
 jt10-20020a170906dfca00b007c0f5d7cacfmr1139672ejc.732.1670180867434; 
 Sun, 04 Dec 2022 11:07:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:47 -0800 (PST)
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 16/32] hw/isa/piix3: Rename pci_piix3_props for sharing with
 PIIX4
Date: Sun,  4 Dec 2022 20:05:37 +0100
Message-Id: <20221204190553.3274-17-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7ee706243a..a811a9bdab 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -392,7 +392,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -419,7 +419,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.38.1


