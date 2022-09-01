Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECAE5A9D4F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:43:54 +0200 (CEST)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnIH-00010C-RH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2F-0002AZ-D3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-0001WS-8T
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: by mail-ej1-x62e.google.com with SMTP id h5so24263173ejb.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yGdmqiJEs/Ih4VcMeEjpHKxrhM+7MINgFFPzQOhgP7U=;
 b=Oz1dRLDxSNrceDRnp1mWahTMYjBb8op0WeazAu5h+cufjdiVlW5A3/HXUPy1JWm/gU
 LbEQRIQ5jdWKNVFiuambSGP1flCAEzKHv85MAKa4kRLOSOudBjEQLuXhBo+tLueR1gBu
 ZDYIusbxANrWdp0bq5DPj4RP96nxnz59/NYG0SBGFgif3p2dzAW8atrVH/nGdDXMJuhx
 KUjXEY0jy2h5K1Tx9FrYzRaoUS4S/z50DdAygiS5Ukt63YP2q9HM/flw97HTyqR2+kWW
 j4Vct8azGbSJ/VgRXYO5HKbppqmaK2FGaPkqlBdYNAAQdBHjadmrnemIxJ9b8izsFDTc
 wD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yGdmqiJEs/Ih4VcMeEjpHKxrhM+7MINgFFPzQOhgP7U=;
 b=maHL2VjKw/d/Yxb3DRT4/Lc1fZ2RpmdeyqZ7Hs87TI3ZCXo6/YpJfsWofQpwGdDU6c
 HORevkDnerQU4j5tDYXfmqDkyS8bSRWl4Jep5nmaxXRNhX4+vNlgF/QCnZfHcsV3g/y0
 yXnETpqparoJPDruKByd9YxaIT+I9/XI2zOwvbN4j3sGdFheUVNiVgdKBrFykE9cikeo
 b3oWVi71G+40rcpda778Pf0xdul5+yC4xxp7lxPUm9vOqTUvPn9qQVClRJjGHTZv4ber
 V4OYzf8YyOjUrAlr+Dn5p0WaMKz6a2mR0I7UCsUp0l1Mx/R+BLWIzW5gUwqbHEhmfb6z
 pemQ==
X-Gm-Message-State: ACgBeo1CD+0cZ5BGv+usTkXs0XLr3XfKMEX0q1NGHzmqXdG1216wcGYB
 hUn+gHpa02sqSS1grtNzFU31yvGtTCc=
X-Google-Smtp-Source: AA6agR6G22XaYuClTbAZrJDUny0T69DPrwt9JQllHFIdHuFmg/GmnG0xCKNtPzOCpJQKA5qMpv930A==
X-Received: by 2002:a17:907:a410:b0:741:386b:17e4 with SMTP id
 sg16-20020a170907a41000b00741386b17e4mr19360772ejc.46.1662049624686; 
 Thu, 01 Sep 2022 09:27:04 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:04 -0700 (PDT)
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
Subject: [PATCH 18/42] hw/isa/piix3: Rename pci_piix3_props for sharing with
 PIIX4
Date: Thu,  1 Sep 2022 18:25:49 +0200
Message-Id: <20220901162613.6939-19-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index ae1df8e73e..cb3fef7654 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -380,7 +380,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, "piix3-ide");
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
     DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
@@ -411,7 +411,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.37.3


