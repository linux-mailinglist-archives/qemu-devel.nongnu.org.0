Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DD682C0D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD6-0006Dc-C1; Tue, 31 Jan 2023 06:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD4-00069n-4q; Tue, 31 Jan 2023 06:53:58 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD2-0002Lu-I1; Tue, 31 Jan 2023 06:53:57 -0500
Received: by mail-ed1-x534.google.com with SMTP id z11so14156594ede.1;
 Tue, 31 Jan 2023 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TM72a0z+FhD5ZHMPDrVDIbYVXz3mYKr8EKyN+3lrNng=;
 b=Pmc5Q7XvzfTV1Cnma1hYjjikyO1Y7OT0fKjDb7+QbAh/g3wj81zUpI2BurNIvB25xE
 ZltEflif/8AtTPu6FGBsT3bFERIC17ZC0TArtmeGWp2RzVoKUH0BenNfBctY+k0miYfF
 n5znlv8FX+ZL+aroLEIusUhCZdhz9K8U2l2JNhs+G+Cpv2/A+HWvSyiBQe5j8iNP3lUe
 VOgoJ/Pr4J2Mh+z5Ig5cuKJ/TG9cHug1ZmLgFJg2gjDe338aTHnGA8lWR9r1lttIHE9i
 pyjZvoKm/cMmlqCuT6kFqog7XZyhTk+6rZTpvbjXVpgTMo2ibnNCMHVtQP1XgtKGx37A
 T3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TM72a0z+FhD5ZHMPDrVDIbYVXz3mYKr8EKyN+3lrNng=;
 b=Rwurj4VKaGOrrkOQs1ogDa+CH4JNd/yBQbC0XQ9jtJbEbZ8SSCWgcBxE49N55X7Pll
 nSggQB4ojFydl1N/TLb478Be4NZd4ME4u8LZc901DTQ5Lo7w5eI18YtTRovtMvIt1h1e
 0vvo/6xQKq0M7cdWuI+kl3026AyVL/kyVvPudSOc3dgKjbIVCq7gG4bgUNN0zabI9CK5
 pIQAWl9m9ZVSP0KuNHSy7LMTRPJW2yo4IALCzmBCS34eVV8lHu+FnTcQ8FJcp3GbJLrB
 NruHV6zm5XEqtM2X6OP9JSXvLvDtIL917sWAzzI8wwfLpF7Y3aCg6y0oTOoMS5P0hB6G
 BEgg==
X-Gm-Message-State: AFqh2koJe2/ZaH5zHM2W9yExKpmg/S3R9bphV8cS/fthOf05adXRdXSp
 ZSPuZwH2c7b7k1H9TvUFi8ULZWKglG8=
X-Google-Smtp-Source: AMrXdXs69TSXdiAZ5xtBC15dMKgcdG/hCJmT8qZ6J7COIrDS7agTX2SuUL9M8AQawbYKXEK7gl6uGA==
X-Received: by 2002:a05:6402:28ca:b0:49c:96f9:417e with SMTP id
 ef10-20020a05640228ca00b0049c96f9417emr53090466edb.2.1675166034659; 
 Tue, 31 Jan 2023 03:53:54 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/20] hw/i386/pc_{q35,
 piix}: Reuse MachineClass::desc as SMB product name
Date: Tue, 31 Jan 2023 12:53:11 +0100
Message-Id: <20230131115326.12454-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

No need to repeat the descriptions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..ee9d9a4175 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,7 +197,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->smbios_defaults) {
         MachineClass *mc = MACHINE_GET_CLASS(machine);
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 88324af91f..bc4fd06c1e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
 
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
-- 
2.39.1


