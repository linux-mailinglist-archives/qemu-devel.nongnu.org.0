Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613C653505
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82UG-0003yT-9w; Wed, 21 Dec 2022 12:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Su-0002t1-A5; Wed, 21 Dec 2022 12:01:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Ss-0008BK-Dm; Wed, 21 Dec 2022 12:01:12 -0500
Received: by mail-ed1-x531.google.com with SMTP id m21so12387639edc.3;
 Wed, 21 Dec 2022 09:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdpWMchu40fuVgWhFHcXygW0YC6QE67IM8HMV7vB9TE=;
 b=M1J7w+bVMPz5rzYSk8LS1onuAtPlI+u1+M1bH/nSlnGyVz195x708FSiqek5O+3tq1
 FwBjfI1MpTHP3PMIL7CzLT2mTrdICumbfNBCG7CzwW83i+PbcHRhDaCAvjNhhVKMGtQB
 NYadFV3Uspmj+9jdXn4I7EJIrQgVaLh6kjacqLeCtpg8y01GI569pFKH1FPyLMQnsJsQ
 arxwuGZKMEfiy4x289tFiAkHz/XOnkp+pcsJF35H8gIPoE/GJsoP8GqAU2ygKHlpL3dV
 FoyrdYrJycGkh7o68m7wD4LMp7ZqgkNfwUZNQGk865zutBrQP3C1MyhtED7NVsIweHNk
 r1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdpWMchu40fuVgWhFHcXygW0YC6QE67IM8HMV7vB9TE=;
 b=pkzYMAbtmDn6x8Fzu/CiGw0SXGmeCdZvnh2bXAyoag7fzmGx0dL5kU9joaSvpb4bkx
 YYCdnFsnW26CuqIZYfBgaQqyPe5WRXERbUCxnN11n2ng9zSWtNTbc4O8Xq4tN3n67t5e
 qSehzf/tjwZ8ssHW8hzlmkWT043404pY1al+AO8DPZz3mKE6YJLqUjItUHcFqY7zzTuV
 WO29HpZ6lyGfRnxJlqOxNqvVGBpwf35urq9p5Zb+HFB0HSHqrrvZpzSHLhlfIkPaJWih
 Ios/o2QOE6ck/PEzF8RSuySf0w/vWpJUuN27VFXPnFINaMnGaL5vLtEtqK5Xt1L5r6kZ
 rHXQ==
X-Gm-Message-State: AFqh2kqNKkF/dvMqZA4KguM5NggQW+CJpK6Gou+z+bg0C76Z4lqX9SfI
 RPBxBs4U5KK48Q3oRSONu12UtutogDk=
X-Google-Smtp-Source: AMrXdXuyYxeCsvnKMRjUSrpd3xKrr4efAtLtHReGrwVJ5uMHBec4j9gw4u4GRVTUc8IvbrGFyE0EVw==
X-Received: by 2002:a05:6402:1caa:b0:46f:a73d:367c with SMTP id
 cz10-20020a0564021caa00b0046fa73d367cmr1967219edb.34.1671642066735; 
 Wed, 21 Dec 2022 09:01:06 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 17/30] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Wed, 21 Dec 2022 17:59:50 +0100
Message-Id: <20221221170003.2929-18-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
index a1fd1e0d3e..63f41741e0 100644
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


