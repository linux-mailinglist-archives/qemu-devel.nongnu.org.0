Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2E64EBDE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOr-0004qL-JI; Fri, 16 Dec 2022 08:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOQ-0004hG-Kn; Fri, 16 Dec 2022 08:04:57 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOP-0008A0-0w; Fri, 16 Dec 2022 08:04:50 -0500
Received: by mail-ed1-x533.google.com with SMTP id v8so3562165edi.3;
 Fri, 16 Dec 2022 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAyiiRFMOei2neaEExJFUVT8MX/WkWUhbFfRb/f3ByU=;
 b=i0CqKTeF/SprrDS5MlxHNxwSfDgDKxSDl0i5O75wN74NVzRB8mVorpFGho9KkaPdEG
 cvOmDvA0DS6gOQDy8Y6nb+1nVKbD9fiks0udp1ZaaXQKbbkVINFAIQoJQytzMVhNKnBw
 mwq+8VP0AJoQPGDLOIRU2x570s+DtgtadIZpIfjiGsb55ifUar2djRorRdMoRPy7wttC
 176KymFLQ4VKdzjmJfvoAU/NupTBnw0/mYZ+PlxIoIu+3BRILAi649wxr0CLDFizTgev
 b1qvChfWjFSjVkiN/glcu5m4U9KeSEapD9EZ/hCslWwVAs7FDFlkXprqbQvb0TE+nrip
 pPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAyiiRFMOei2neaEExJFUVT8MX/WkWUhbFfRb/f3ByU=;
 b=03zn1ATlkfWy9Wl6CcLvZXeG0qeCUXYDzyHH0g46YZNCqLl8ILB3kTGJgCsoIychYN
 bye/3SWzrpw3aWOD/oRNg8vclCJafcv9n9/JBwQKcQZvT6OJ5tBP9rMb6L6/kHsro6wW
 aXzu7Ld9USiJ3Xu9E2OMkdA7RISMk7kPauZhg62p4mbWsPcgs0V3QRc7pgohVqs36pDY
 udB2OVp43Q1C+GIQbJ25+PUVHG/6b6wTDUuQRP1jBk5x1fJUJdkC/G2ZkuztMkUfiVqA
 nA7tzaZXEWAHiDqUqM6V2wW+rev5qMWHipJvge6waSBn1agb0MEOogVm9okGZZC9H3IY
 82mA==
X-Gm-Message-State: ANoB5plRkqrG6KzY9Gl+a5TIuYR1bVy+uBUpyBvKT6R+9nxrnCpC8/T+
 BiaG51ureRlqCvbVdxVJfHxC4o3hD9Q=
X-Google-Smtp-Source: AA0mqf7CKgIqU4HSt9yanvYvE38aFgKlQEkSRS7h7MsTiHAuYrNegktcSut6ftppFOmxWKg9LJJqkA==
X-Received: by 2002:a05:6402:c07:b0:46b:203:f388 with SMTP id
 co7-20020a0564020c0700b0046b0203f388mr27240340edb.39.1671195886816; 
 Fri, 16 Dec 2022 05:04:46 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 7/7] hw/ppc/Kconfig: Remove unused dependencies from
 PEGASOS2
Date: Fri, 16 Dec 2022 14:03:55 +0100
Message-Id: <20221216130355.41667-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
- CONFIG_ACPI_X86
- CONFIG_MEM_DEVICE

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index b8d2522f45..0087369f5b 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -76,8 +76,6 @@ config PEGASOS2
     select VT82C686
     select SMBUS_EEPROM
     select VOF
-# This should come with VT82C686
-    select ACPI_X86
 
 config PREP
     bool
-- 
2.39.0


