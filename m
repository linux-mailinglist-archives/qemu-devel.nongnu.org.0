Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F2662CE4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtU-0002Yt-5b; Mon, 09 Jan 2023 12:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtQ-0002VN-Oz; Mon, 09 Jan 2023 12:25:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtO-00011o-M9; Mon, 09 Jan 2023 12:25:04 -0500
Received: by mail-ej1-x634.google.com with SMTP id ss4so14653060ejb.11;
 Mon, 09 Jan 2023 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6J2v0tgeCkV2MZ5+hrgzpQYTQ8Rtc49tSsYVauuw7Y=;
 b=XP5GJbWrSWiajdiphB7mB87qbbp2fqOlBnZTBVCWObi35aql7M70iIIf+1Q/Im1GCa
 b6D6fPsoqLC8d9MGd0BaesPwrwdtI55sXtRI0i0jHXeGAKpNyVS1AN80uwb+Clh4Y3Ox
 JAQnNEEfzYzyrvoL0pMht5WVbrakyZ8cP5M5SxvmWYSP1alDDeez2aJtBaxUirY3uwQB
 k/F3I2eNnrppWfw8vTCWoZy4pJGYQSZCufMppranauXULkYOtmZN+65J4xIbzn/eL9WB
 N65O35s2JcmPNNot0FlVK15hLLTbtcikf69LSzDMCrvXR1d23CJeMi/DOdhUmcR2Xz5i
 /O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6J2v0tgeCkV2MZ5+hrgzpQYTQ8Rtc49tSsYVauuw7Y=;
 b=0I3xHoFLTLm2N7kaNyDnjYgcUtN65J95rZ03098Oggnk8+5/xLFp4XIWV/yveW0OMq
 S1xtiysYQ4ILyfuhenA4GLRKMLtlCYK6O9TVjPl1AgxmkjaR/4xF1ZWHOsWYNQszG7If
 URAZW0gZpIQ5XW3JbQDiuh8zZICy55LgKVb+LZ11dw6upJDeOEaAzj0KwchI+ranjjMF
 fhsTUAc3huZkJewn3JL32jTTzbOrYIpT/mt3PZ2ZiSO0VeGqPIx3xvHYCMuk3ceRW5LA
 EJwGpvv38blZG7IUgzWSk8syfA6sKOa7+HQKzFWBidYsLApsKxy3F7z+LopRhJkJ9S7z
 yiWg==
X-Gm-Message-State: AFqh2kopoE7GvTSIuCgydMyQo74xE5osLzp1Gs61qlluKYhBX8zi+A8d
 g24JNB9BqnkftUO2Wew/fKJhpU+CRYoTOQ==
X-Google-Smtp-Source: AMrXdXs2ir7JnSNcw40tbknn4ISSeyuQkwgzbkb3LFDQBjq+IBLqCgZ7cCcaIljH2O33WNBwJV6+tg==
X-Received: by 2002:a17:907:8a24:b0:846:95f9:5b4d with SMTP id
 sc36-20020a1709078a2400b0084695f95b4dmr73515340ejc.42.1673285099734; 
 Mon, 09 Jan 2023 09:24:59 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 07/33] hw/mips/Kconfig: Track Malta's PIIX dependencies via
 Kconfig
Date: Mon,  9 Jan 2023 18:23:20 +0100
Message-Id: <20230109172347.1830-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

Tracking dependencies via Kconfig seems much cleaner.

Note that PIIX4 already depends on ACPI_PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 configs/devices/mips-softmmu/common.mak | 2 --
 hw/mips/Kconfig                         | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 88aff94625..8ed6b62ae7 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -17,9 +17,7 @@ CONFIG_I8254=y
 CONFIG_PCSPK=y
 CONFIG_PCKBD=y
 CONFIG_FDC=y
-CONFIG_ACPI_PIIX4=y
 CONFIG_I8257=y
-CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 725525358d..4e7042f03d 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,6 +1,7 @@
 config MALTA
     bool
     select ISA_SUPERIO
+    select PIIX4
 
 config MIPSSIM
     bool
-- 
2.39.0


