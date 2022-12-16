Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEB64EBD7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AP6-00057h-WA; Fri, 16 Dec 2022 08:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOO-0004h8-TK; Fri, 16 Dec 2022 08:04:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOM-00086n-1s; Fri, 16 Dec 2022 08:04:47 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a16so3510296edb.9;
 Fri, 16 Dec 2022 05:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPNfr71dTbp0c653nmxcEtXXT0JsYkmwn1Q9Q5b9mbQ=;
 b=BscBcrQC7QM5+0pb9EIpa48mprfKkNXZg4Pk537rwdd8kFvrKPGYW1ijdI+cWGR9+Q
 Xf3IcL9AYCD/+vcvUaDs9Zd7r4mnxQvIlISbaH2/uvPrQsBi00vWz8rHiceSa49ije5U
 wBqusxPp35X3UWAuZwkP8iAtnrP11RkKwfrpeKvibFX6F+SUYA4N4g0zAVuuGZPOm5n4
 2kNMtPoOIqB/Sa6GXiwl/u2m8tYA6Km/dfjD4AftTpEV6JJosxP3Zrm88IN1wVfXafZi
 Oc+nM1ygHSsvaRrr6nrAP4tnHwT3UGdleyfvsPqndgD0SuVlrZbcv938pH/JSW4ihbf9
 dMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPNfr71dTbp0c653nmxcEtXXT0JsYkmwn1Q9Q5b9mbQ=;
 b=SIFrKnpEJ1GONcPaZwNGMBCzQ4VELvkEPhM88ZxamsYIoLQI0W5YKlE8VhS9G3tseR
 77iNzjeDb8FWp3hrleTXKkDJIxMKWjmOhs79D4mqgUfmeGvCzOfV/NXGRSxe2y1TWsbo
 Cx01lXvdmvLq/15slzD7vrf4ju1b9JVvy6+FuTT1djOjWuhptOtwolBqvqvtfgPctmIs
 lEGjx6qHhSQCCKuOEfEOY1olTeNABtYCClV/mM2b3prwGECTCTT3aDCbfk7p7EcuaQ+e
 B54q/h9jos+so1ueg/5UY3Z6mPsclOhPGWxI01K1hQnouTTftewx9l2Y6eusPcS3J2Xd
 mLpQ==
X-Gm-Message-State: ANoB5pm//tfDRekhMSpdzpRnIq4EbmqWYL1dcAsT/cOLTU4g/FNzURef
 qJaRka/sTpn5HyxPVjZqFDNX0BAN8eg=
X-Google-Smtp-Source: AA0mqf5TbIy3B11WZa7Lwgqakj4bh7T7Z7ym9oAu0z8c3JMNTSdOLzamYmyJw839r4JI5R0rAIdm4Q==
X-Received: by 2002:a05:6402:3889:b0:462:9baa:e3ad with SMTP id
 fd9-20020a056402388900b004629baae3admr24522428edb.10.1671195884820; 
 Fri, 16 Dec 2022 05:04:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 6/7] i386, mips: Resolve redundant ACPI and APM dependencies
Date: Fri, 16 Dec 2022 14:03:54 +0100
Message-Id: <20221216130355.41667-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

Now that all ACPI controllers select the ACPI and APM dependencies
themselves, these explicit dependencies became redundant. Remove them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips-softmmu/common.mak | 3 ---
 hw/i386/Kconfig                         | 2 --
 2 files changed, 5 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 416161f833..88aff94625 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -17,9 +17,7 @@ CONFIG_I8254=y
 CONFIG_PCSPK=y
 CONFIG_PCKBD=y
 CONFIG_FDC=y
-CONFIG_ACPI=y
 CONFIG_ACPI_PIIX4=y
-CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
@@ -32,6 +30,5 @@ CONFIG_MIPS_ITU=y
 CONFIG_MALTA=y
 CONFIG_PCNET_PCI=y
 CONFIG_MIPSSIM=y
-CONFIG_ACPI_SMBUS=y
 CONFIG_SMBUS_EEPROM=y
 CONFIG_TEST_DEVICES=y
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 3a92566701..c4fb5b49bd 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -51,7 +51,6 @@ config PC_PCI
     bool
     select APIC
     select IOAPIC
-    select APM
     select PC
 
 config PC_ACPI
@@ -72,7 +71,6 @@ config I440FX
     select ACPI_PIIX4
     select PC_PCI
     select PC_ACPI
-    select ACPI_SMBUS
     select PCI_I440FX
     select PIIX3
     select IDE_PIIX
-- 
2.39.0


