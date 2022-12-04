Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4A641F3D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKn-0001kz-UV; Sun, 04 Dec 2022 14:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKm-0001kI-M7; Sun, 04 Dec 2022 14:07:28 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKl-0001bf-72; Sun, 04 Dec 2022 14:07:28 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ml11so23088232ejb.6;
 Sun, 04 Dec 2022 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmkH8CbbCM2o782sBEukQ8ETWoFsxaO7vlWTDApTAUc=;
 b=TRzYrq1B48Ga5KU02Eh97MTjX0uBN/OQx3eMXN+jlEoo/PN0CB6cX/vJ0hlObmXkUR
 x1MqZnYLe1hBLAjOAmTUMagtffly0/CqfKCpDc0OVBwN7MO5AUX4SPdUkhlNiN9QqPqI
 I0BiVPppG2HwhHy62gco7XJ6CG0IAeSONOxj6EMm55yrNr483DghGvUboOHhtpXGx0aw
 Ns0anl/MrDzpHhHU/+HGzU9gIMgWOkXb4MLQZtpcIVqiapJ/BQEE4qUbpJGInSkFOdf0
 MsDFN0BZOorspmFWueO2aTkBSYlVD/nW3gmio/5peg5LE4LLa6rFy/ODFYbqD4npV0Pu
 glag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmkH8CbbCM2o782sBEukQ8ETWoFsxaO7vlWTDApTAUc=;
 b=vP/Ifu5xjazBIxbcigXzMLnGgLgYygAvrgzMmw4LaEOKfW1PctJ5YvOcAK1CqoMjkW
 eQ6XcgOBOmkHb+LwoO/mKHd/XXV8t6GN4PDEGsPDt7moohKAizl3x2fAwFiLVdO+umFu
 qJUcYM8bBERK686O69ihhTqcGzwlwMifb2IdmhxBX6VY51hhpc1TIcP3hC8mLvSSkiYY
 TtFeCCWy7189qGepAwzNW9Ai7AZwFLIcgDnKJnOg+TeM/K0afTRbaI5l/zakXJ2LEnHz
 uAOV1cRG4TXb/iCGDsg5U4dVm01PY/HeYhh34akcQM7SnHqEwq9CGbfLUzGo4s5GQNfD
 gqrA==
X-Gm-Message-State: ANoB5pmyNNFXnIz9OXVtKDVHMMLLRx9G0mE45Hor4wvAQKM2u4gu4kgY
 LXOBSajz5H/bd2jfFoVhFrkSX2C5ASs=
X-Google-Smtp-Source: AA0mqf400dXTwpmfT69Qwkfdd7yNwz4vW8q6cRa5Ff5nTjNTAprJAzPGfq+fohf6pIBGn/a71nR/cA==
X-Received: by 2002:a17:906:6703:b0:7ae:5dd6:e62d with SMTP id
 a3-20020a170906670300b007ae5dd6e62dmr56697204ejp.518.1670180845029; 
 Sun, 04 Dec 2022 11:07:25 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:24 -0800 (PST)
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
Subject: [PATCH 04/32] hw/mips/Kconfig: Track Malta's PIIX dependencies via
 Kconfig
Date: Sun,  4 Dec 2022 20:05:25 +0100
Message-Id: <20221204190553.3274-5-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
---
 configs/devices/mips-softmmu/common.mak | 2 --
 hw/mips/Kconfig                         | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 416161f833..7813fd1b41 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -18,10 +18,8 @@ CONFIG_PCSPK=y
 CONFIG_PCKBD=y
 CONFIG_FDC=y
 CONFIG_ACPI=y
-CONFIG_ACPI_PIIX4=y
 CONFIG_APM=y
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
2.38.1


