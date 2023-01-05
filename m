Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81265EEF3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJG-0002pt-E8; Thu, 05 Jan 2023 09:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002ki-Hr; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIu-0006tk-1M; Thu, 05 Jan 2023 09:33:13 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r2so1493199wrv.7;
 Thu, 05 Jan 2023 06:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0n/SCpv5aiBm+X16I26hh3ltLrnYFlTaexw96i1C/dI=;
 b=Sg54jycdG9d4dHVSOGE3L3NgT2pGvcQIjqy5XJ7GjXZgFig0GYpvuN5XyoqfYtiBna
 93F0Noa+lqoOPVzPWHdXDm2Yp18o6XE0QdFLboxbyySCgDtxalpjczRHVWQUSPeu4XpG
 3pjL5KdH80bjRqm1l6h7z4D0XW7RC8eI5myb/YsX6YRFHXMEWjoVNhJrlFNQznKJ0FSY
 3PXSYggcl9w7rtmLl0T5bQVPoOllp4v7Rk3xcr1OviLHq40Ft+X7GEqp/WlCOz1VwsJ1
 nYjDV4L1Q+cvvuzgeNbukeEbNcSXYXc5JH69Gjha5YBVCTBKm/1WrC2JfrkjmBVdeEIS
 mb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0n/SCpv5aiBm+X16I26hh3ltLrnYFlTaexw96i1C/dI=;
 b=37cE1KfMwQYHkhmfnDdHeaMu73o/MGw4msmvYftxok0K8fT8Yk9yIvt2bnkjqa17Ab
 nilxvOjUs8OHuGST5I7CbI6PybqXf4UuAWoxeZ+hzOAo5upwEVKXFaA2AKmTRG0EC8IW
 YTl54qbemvE9hxhLANet5/vkpEKc5Tv+BLt4fzocwOnFjPwHsQLtX8YNNEydNAWchqpp
 uZ5jKMBmu8Wv7jS5HeZ7Rczf837masvXVElTglaauU2mS34uo+0h1IOvXYNmbQjHZMjz
 CMv6zhFOaCCz3qK0bdABGIEwqAe0KS60kEgA4+IdWPTuHuSxJuJABHKfGZ8IFxTryImA
 QJoQ==
X-Gm-Message-State: AFqh2krZJXtmCiYhvgQOSH+JdwD+W2mks2abTvKEQl0FEq5xpX4fM5K9
 rYVgkcApzUztVtHn3AZffI4Q4WyetSL/Ow==
X-Google-Smtp-Source: AMrXdXtuO1JLTiJ1KXMgjtMV3qTQXthYD0Dpx7do4CaA5bl5cXNuUa3b8t5paV5uRGni0RgSyURSoQ==
X-Received: by 2002:a5d:51c7:0:b0:29d:7fe4:b70e with SMTP id
 n7-20020a5d51c7000000b0029d7fe4b70emr6667961wrv.7.1672929190301; 
 Thu, 05 Jan 2023 06:33:10 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:09 -0800 (PST)
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
Subject: [PATCH v5 04/31] hw/mips/Kconfig: Track Malta's PIIX dependencies via
 Kconfig
Date: Thu,  5 Jan 2023 15:32:01 +0100
Message-Id: <20230105143228.244965-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
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
2.39.0


