Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C06464D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33ay-0005n6-4F; Wed, 07 Dec 2022 18:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33av-0005lm-Cm
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:53 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33as-0003VZ-4W
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:52 -0500
Received: by mail-ed1-x530.google.com with SMTP id a16so26995727edb.9
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2lh7ePLWH9MC7IF9XYD3B06iz9fHKdzke7e7jCke8U=;
 b=Jw2Ani+IqG6qlnlSN9BR/Xa4HrMAowg+445q6WLiqlWN23Ru0Ha4JQgdVm7ZnwLOWc
 vgRpjRVLP19zWiQvby7sdRlKGRdRG3KBl2R6kCpCON1F55UnGGJuRrJbBYxIQfJzXsAd
 Iclwsdn9w3FAWuqHS5ZcUV2LmqPUZzLA9EH2F/aFXwjLnGRxC7pdImuJ+bCF/+P5uXVh
 pNyxCvAjJgxBt39jPUqiFNpoURKGLxK2KfPTAU4s6G+dpt/stAO6Co9Jd1lD6sCEhcVp
 YOnyxtZfG4V8/PgvJeADdhlHfmap0P/Mm1MRUCTA8GwN4Z9dD3RkDg5GCzrup+Xj87WP
 FZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2lh7ePLWH9MC7IF9XYD3B06iz9fHKdzke7e7jCke8U=;
 b=MvmNEVFX6ek9K42sbuPSnjLNUG/aEJPA0fjicnKyZoG+8hINXFFeIhp6FcQfaSh+e3
 VMiN5XOUsR8K80altPpLn5A2PmMo5bM8e5LMCIonlWMo4Kj2jGTc6BwmW3s1nJ31iOx1
 +Us5rQfPeWw0PkOY91eQSWnj2TOvndAmLvcXMGCywmJaz6A8emPoqOwACeJ2b+5dwZVQ
 x1wmxXix8ixndJrImLdV1Tilt4i03mgMWekzKW1tQ0UUCtfugyG0uBr3b6WXo5IcfvFS
 IQP4GgqnAhfSnG7V+/+oLz2IIseQD0cB2xnR0UQLmmUYAxW9B9Z2/M46kFv3IPQiM0e4
 kqRA==
X-Gm-Message-State: ANoB5pk0P/ckolYOjcr4jSCuRIF1jH6YziIG6cGujAFfaWH22yAxHi1w
 H9KkFasmwNQP5lFQ19QtfGDR0rpceLM=
X-Google-Smtp-Source: AA0mqf4zlAU/bzOPaJ8hMBx/PGrpnlP8oHjXjMzE0CUvUgRMfFoMXVLwzLtEtfPzXoetaW/yBAfb2w==
X-Received: by 2002:a05:6402:4518:b0:461:46c5:992f with SMTP id
 ez24-20020a056402451800b0046146c5992fmr945335edb.4.1670454768342; 
 Wed, 07 Dec 2022 15:12:48 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/5] hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
Date: Thu,  8 Dec 2022 00:12:05 +0100
Message-Id: <20221207231205.1106381-6-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207231205.1106381-1-shentey@gmail.com>
References: <20221207231205.1106381-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

Removes the following dependencies from ppc-softmmu:
- CONFIG_ACPI_CPU_HOTPLUG
- CONFIG_ACPI_CXL
- CONFIG_ACPI_HMAT
- CONFIG_ACPI_MEMORY_HOTPLUG
- CONFIG_ACPI_NVDIMM
- CONFIG_ACPI_PCIHP
- CONFIG_ACPI_PIIX4
- CONFIG_ACPI_X86
- CONFIG_MEM_DEVICE

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index b8d2522f45..0ab77177a8 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -77,7 +77,7 @@ config PEGASOS2
     select SMBUS_EEPROM
     select VOF
 # This should come with VT82C686
-    select ACPI_X86
+    select ACPI
 
 config PREP
     bool
-- 
2.38.1


