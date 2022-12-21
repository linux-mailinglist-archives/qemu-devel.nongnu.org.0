Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1CF65347C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:02:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82T9-0002yl-Ux; Wed, 21 Dec 2022 12:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sb-0002mn-LP; Wed, 21 Dec 2022 12:00:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SZ-0008C6-Vc; Wed, 21 Dec 2022 12:00:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t17so38335499eju.1;
 Wed, 21 Dec 2022 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0n/SCpv5aiBm+X16I26hh3ltLrnYFlTaexw96i1C/dI=;
 b=At5ucn5r/KYZwEY2ldUDeWZiPfz4Pc5gGY66Z5OsKmqmOHmB8LC98IbLg2TLv94QBN
 Vr2WWdLJxmp4Cok/e89ysUURzm/FKmbYisvnvawYd9k1lsZt4Q47YMSHuE/qv8FoUfmh
 31FxzsNhPKO4KNJf5QooaBlpzqIN8BZnICPmO3eIpWLN3BhtqOAdeDrQmDo1osqLlAub
 RLI/FdgVnPWb9N0NaGpG2vUrJUQh8NWjdWxyfCaacQQ7mTFwXNOAW1cpMf8HnMZCAHc2
 XwdkZkXgsmlRnwnSygqPTd0CMK38v1rjSzG4kkV/r0wMg7PPrYcG4SqlgzSB7gbd5qUr
 +EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0n/SCpv5aiBm+X16I26hh3ltLrnYFlTaexw96i1C/dI=;
 b=wmDVuWrPUAu0y0TVcZyfsMon6NnQPGPbCWbaA608G3O7aqZgMqHIGK023ZkupI2Fmz
 vUQnQjC/kEuD6nFqEqMIGhbezYFctbgKtRIox2lm/I7hUhoTimLJvje9z6NN+I2Izo0V
 d3vLeVNpifJxqdSXj6Oxl2qQF0ygJOZGRx/VrWuzwsRDyUuBuR43Ft2zD7YJ0+mh33Th
 F6jwW1OH1mXKqkao4348gpZf/pXYgP9yAkETBD5m/rIBzxJu4SOptUvg9vMPLnamKk6U
 8gyDBOfXbf4mczT9qt7enkJiNx5zd6gidkrOMn1LdkdW7lwxkBE5p613ZfdlOX9JmTBl
 oDhA==
X-Gm-Message-State: AFqh2krCQlggHNv6JgE/gyVp4a6ZpPsiD9NaUbpN39XktLqlVh0BiYX2
 gXfWIq1EFgChPqdHALCQrXJyBl5vYWc=
X-Google-Smtp-Source: AMrXdXuHtt+kd8hF3k6jEikEdqvq+1SQgO8naGHqMX+YBskekRHnl58OOgDVd9SnMNvkbLxxodUpzQ==
X-Received: by 2002:a17:906:32c3:b0:82a:5b57:3fe4 with SMTP id
 k3-20020a17090632c300b0082a5b573fe4mr2023134ejk.68.1671642049982; 
 Wed, 21 Dec 2022 09:00:49 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:49 -0800 (PST)
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
Subject: [PATCH v4 04/30] hw/mips/Kconfig: Track Malta's PIIX dependencies via
 Kconfig
Date: Wed, 21 Dec 2022 17:59:37 +0100
Message-Id: <20221221170003.2929-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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


