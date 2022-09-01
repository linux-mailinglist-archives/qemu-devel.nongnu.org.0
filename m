Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0F5A9D4C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:43:34 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnHx-0000EH-5Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2G-0002DT-BH
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:20 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001Wg-BN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r4so23271458edi.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VkU8fXh1qvcuUfet/WByjtVq3rEvXiBhLPE3cdxFGIg=;
 b=RJG48bhgHgwDYqetfADTk0RXmdQOALXEBmLVyzDV+vGLsR453tSiVCfNUuuGAV3v2U
 hFBWzXlEwsf0SMbIRbWLp3vH9+JMxdLhnT5VKAsLwnYrKaM8HCZ4d47OWUahXwlWQ7CO
 Z4U89yyAzvqTLBb/WeVWqOoRvp+WIQeRvH3vgZ6/Is9W390mwTXBcKvVHUW3iYIME1HR
 4WJLk6p/DsIUK/55kHGYC8si0S3bRpvI/aLDz3xKxh33nSCkJhyx0u4WVe5NLM/g1G41
 rdeysEMeGph7qMKMuZ4BEU9wwVMHTfW2qqFM/wzDU+dUQHU8qFzkvgymEutFHjgzbQef
 UWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VkU8fXh1qvcuUfet/WByjtVq3rEvXiBhLPE3cdxFGIg=;
 b=U7poLRMIzso+b3qB/3Rn5bHOv2sQZ4Ot7PMKJcNRujFWCcwfFHXtxcCYpJgFTuHZ3E
 MKIaicuD7N2s3YR1uvhuAETMSkR55BXKje9DUvvKHfg0r7d51J85EkP2uuyWnAKgH7Ye
 7wJPVZ0KIlyIfNah3O8UGmcVxGOp1kAV2xJPzqy/ElycdNPQobCadSOKVNgol1X8I2pm
 BDmB2uzXuXspTvNN2vUsms+gEMRZblYhnXXTsEtigfxf1nQwkPqFQdJvYbZNqKVv3axJ
 ToP3d7eIlA1jyydehnHHkisjyJ8Jg/HGoZ3xepLenUwwlROcHdiKkOyWujLgNLuXHzng
 ZknQ==
X-Gm-Message-State: ACgBeo0SPKp6BEy1XRqfEJznwOZra1lIW0L7859rqbZ84JjiSpFWVm+o
 ohxpboNKiPnUSOElLUG1d/32vsnpRYc=
X-Google-Smtp-Source: AA6agR5GglRpqbtcE/EdwFbnx/4k0SDYcndOE+L8TmtkZak7iwD28KNylVbirUyBUw0Ah4/GYulEAQ==
X-Received: by 2002:aa7:ca46:0:b0:447:af0a:be68 with SMTP id
 j6-20020aa7ca46000000b00447af0abe68mr29183843edt.327.1662049629452; 
 Thu, 01 Sep 2022 09:27:09 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:09 -0700 (PDT)
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
Subject: [PATCH 23/42] meson: Fix dependencies of piix4 southbridge
Date: Thu,  1 Sep 2022 18:25:54 +0200
Message-Id: <20220901162613.6939-24-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
 configs/devices/mips-softmmu/common.mak | 1 -
 hw/isa/Kconfig                          | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index d2202c839e..416161f833 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -23,7 +23,6 @@ CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
-CONFIG_IDE_PIIX=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index a021e1cbfc..1aa10f84f2 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -45,7 +45,13 @@ config PIIX4
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for PIIX4.
+    select ACPI_PIIX4
+    select I8254
+    select I8257
+    select I8259
+    select IDE_PIIX
     select ISA_BUS
+    select MC146818RTC
     select USB_UHCI
 
 config VT82C686
-- 
2.37.3


