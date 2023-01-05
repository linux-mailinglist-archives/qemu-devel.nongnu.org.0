Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A865E7E9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:36:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKz-0001W7-5Q; Thu, 05 Jan 2023 04:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKw-0001VO-Ia
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKv-0006pH-5F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s35k0RneRD6JhyeM2uQz3SiG5naDndGylOIMBCANsXw=;
 b=HmfMrzjDRiC3x92FeMXlkFWP7Ig6Ah7qiI5n2AD6dwwDopOPnZ6ocLrgQI8sggyh/sWXVW
 h3tRj4JoxGpd4XRyv/NRef4vyd4ylc5fezRzefZ+KRXU9vO0NW2ZahC6wPkh9R1wEgFz7W
 /ymha8WuBtz6WqX43ybZXT8Hl5bllbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-OEo0vmCBN0uURlHvrNXGRA-1; Thu, 05 Jan 2023 04:14:55 -0500
X-MC-Unique: OEo0vmCBN0uURlHvrNXGRA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020adfa10e000000b002631c56fe26so4629929wro.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s35k0RneRD6JhyeM2uQz3SiG5naDndGylOIMBCANsXw=;
 b=gcZ2Pfs4g6ewPqo6t2MAZInC0oMHXo0Yu283VeqimEotEoHNa5aZFNtPtFex3W8AF9
 YVElfUgdVtCWXB7dQFHwuPlP92prMp8alfAufmUbNaUvkyYvXX7hlYlqEvZEq4noEP1u
 hjzZ9HNNUVt6mIJV34zyWvEqX6gcxkUXG1U2+nRzX7EM+QtjwyjoPvlonXUeRqQkY2OT
 Xh7RCUta6nCEnVrdlA6Yus4LLX6o8lnaB/xpxbP21mWt9dPO66CvVP5aBQxC2Q/DKHwd
 CY+G7vtpBSkZYJPq5MFWTG1n+33COSa1bU+v7d4kLyT9Aa4/TGr5ku/3Ey6tRPnAUfTI
 R56A==
X-Gm-Message-State: AFqh2kqcd3oJRkFVxm+e50xMwqqDebj6jDPVva7Xav5bQDQ/JOZh89yi
 2mAbKTqpjnc1iWx6E4HdqbEDm75DUKq7EwoxOMLQHi+/FgMX2SqKN3YV5B22gTRoUw8gwJ75oIe
 YOAZS9zhRms2rNHs+7wcet69wvQxHFk2tY8nXRSH6TS7UKVgkFkS8YL5ZTBA3
X-Received: by 2002:a5d:6b04:0:b0:24f:11cc:86b7 with SMTP id
 v4-20020a5d6b04000000b0024f11cc86b7mr28275479wrw.41.1672910091929; 
 Thu, 05 Jan 2023 01:14:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVqVxYPJXj3Z5wV1XMFz55PBSA9iKtHH8JFay/+cAHm7IsxD3rMsr5QeInaMYCFeJez/TZPw==
X-Received: by 2002:a5d:6b04:0:b0:24f:11cc:86b7 with SMTP id
 v4-20020a5d6b04000000b0024f11cc86b7mr28275460wrw.41.1672910091601; 
 Thu, 05 Jan 2023 01:14:51 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b00241d544c9b1sm22750863wrj.90.2023.01.05.01.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:51 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 10/51] i386, mips: Resolve redundant ACPI and APM dependencies
Message-ID: <20230105091310.263867-11-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Now that all ACPI controllers select the ACPI and APM dependencies
themselves, these explicit dependencies became redundant. Remove them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221216130355.41667-7-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
MST


