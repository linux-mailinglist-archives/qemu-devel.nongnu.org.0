Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0C6A8B1D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNg-0000ny-6Y; Thu, 02 Mar 2023 16:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNe-0000nW-7L
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:26 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNc-0002Qu-KN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:25 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f13so2469970edz.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQRKJBeG9cauqYrWbmqW+Ppp+qjoxTiP7OWKuybKXVg=;
 b=dg+CLgjARhCedLUDsc7bISfAaEeb+a6SYER6j6exPcr8mxJT+wp5CCgjMCyuGY8MkF
 yehN89zbcRxDiYCEjCij5FPD+7euHMTvkifSG+G2GcOfS7AFIzmzXAyLYU27WTRRQXMA
 AiMCs0VbbIYmU6HmRRJKsgl2Up2HpwQAkPL0x3mU8U9NvLlwHcmufYnF//3c6ot2Xd05
 zrYNJJJK7cutR+UwYZIXfyCoyi7RVxiHqAk3HifZwJ3SgZHUUo9p9Vi+9UQAABLP1e5d
 ScSA6G2GhoJ9lp5h0EoiJkYUBXTB8f8iAMzj59LTRJAVHfwzW5ychZL59B3wq5b0/NzT
 BW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQRKJBeG9cauqYrWbmqW+Ppp+qjoxTiP7OWKuybKXVg=;
 b=wnYY/pyX8vAYVr6B4rFLsgv95fO0yb9Fe18FNoaqePU1E1loHPwNsLdHf6Yuq7/spF
 YLPX41g2P44s42o40zf3+rxtni+cTe7JbKClOmSvzW7WKq+jmXURrMvkq+ebyhdbxNwx
 ENavKD8d/IaRTqTX059bOlnf2q5qRIjzYrrpkU5n+233BAIVTO4GllVoQ9urgFEovB7P
 qR8jAyzVQ293LbdixuELpde7jLIH5OoFyEjTZbXV6izs0/Ut2BmXROlmEtSa/8/fU1zV
 Z6hkmXIPaAf7IxqkllpCuk6PWigvqZSvmZSaTN945cjGkXD2zRyeeResqCq2EHLbJAbt
 F89g==
X-Gm-Message-State: AO0yUKW+xyX9XlijufeD4czS5Wu2eAgCARvcSdpRmqu1eTdMDOOxGq7r
 gNEf4A1NpaTDLMcWcGuoQKtVxFMCdeY=
X-Google-Smtp-Source: AK7set9DR2mY3IS5OU1T6E6R7fzwp4e8ogmENUGk3Gvbj+FY01L8d3UIloH4rFSwQcXvZB0lpBUb5g==
X-Received: by 2002:a17:907:982:b0:88d:777a:9ca6 with SMTP id
 bf2-20020a170907098200b0088d777a9ca6mr15307699ejc.18.1677792140575; 
 Thu, 02 Mar 2023 13:22:20 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 10/23] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Thu,  2 Mar 2023 22:21:48 +0100
Message-Id: <20230302212201.224360-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
index 9eb45810de..e11742ce42 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -371,7 +371,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -398,7 +398,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.39.2


