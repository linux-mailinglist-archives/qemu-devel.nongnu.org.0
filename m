Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA95264EBE0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOu-0004rP-Fq; Fri, 16 Dec 2022 08:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOF-0004ec-VO; Fri, 16 Dec 2022 08:04:41 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOE-00086y-5u; Fri, 16 Dec 2022 08:04:39 -0500
Received: by mail-ed1-x535.google.com with SMTP id i9so3546413edj.4;
 Fri, 16 Dec 2022 05:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ywCRLtFydrCjRdIuico86w3nftrrd3f/Hll0wOrVdE=;
 b=j32r64eVbidYZePsyL7EqeEiN0/NxNaEv36NLDsDJlwNHuJOuuuqhN7I6JGnZNkd8l
 elS7rpToQGwzQ2VWmlhw00dft8jpKvgUCyPyWA4fYU6rvyA/pA/B3C+8dCc6glUM0Iuj
 hs285J77Dl9cpm8oT9xsKhMlbd96wjZWY5J3Xp5WqWVoydEd53Oc63y7OLBnmhq02pWH
 OS10MfVdk5H9oTzIvHdWF1/ZUonPlC4wfKQkIdUWSRotKmNO15LXNbRap4ifzuT1JyBd
 aIKBH34+TaRo8gZh8uXMkTB8wekVfvCLuYcX+nLB/yMrrdk+yzdNQJPU+2zA0esxVcED
 V5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ywCRLtFydrCjRdIuico86w3nftrrd3f/Hll0wOrVdE=;
 b=vt2tIf4Vi9IGzdBaGcKHSadvbZaI3gw02Q+JT53eZnOlhtxY20TlfcEouAFquODKeU
 j98Xd5mVsa5nOm8gHVWvFmiuNg7IvnVBf9GSF77t+Q8US6QJ7t2q3lRAvoS/J9PMF3P1
 sg78W/NkxCunkVlC1T7DkOMUMfX45M7kJ4uk6N7ZWtcbvOdroNDJ4n5Cs4XlzJQJSf2p
 6emrA5QunF04cTsAamTvwy0rktaxB8Oc9O8XnddQFROCCFJntpxw4pASxQR+dsqFp9RR
 yu2e2lhOmownqmhoBT321rhks0GZEIqgjJf4ao88DnkfnA82YLE4fwj8fvtNWQS7+gLw
 HRwA==
X-Gm-Message-State: ANoB5plDGqM+s8Bwdm1vJqRRqGrXtQ//+iw38InuudIUn4ZWfZkYPf8t
 5o25ulFDNiqn1PPbrj4dOSAcJvGvv98=
X-Google-Smtp-Source: AA0mqf5rU82ACx+3HhpQK2N9551KzBJV4NKjOcecIPxbwVY48kr1KEQ6hoqyYb29yg+lMvvlbGsFtQ==
X-Received: by 2002:a05:6402:320c:b0:46f:d71c:e732 with SMTP id
 g12-20020a056402320c00b0046fd71ce732mr26078143eda.31.1671195875953; 
 Fri, 16 Dec 2022 05:04:35 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/7] hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
Date: Fri, 16 Dec 2022 14:03:50 +0100
Message-Id: <20221216130355.41667-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

ich9_lpc_realize() uses apm_init() and ich9_smbus_realize() uses
pm_smbus_init(), so both APM and ACPI_SMBUS are provided by the device
models managed by ACPI_ICH9.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/Kconfig | 2 ++
 hw/isa/Kconfig  | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 14694c75b4..704cbc6236 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -15,7 +15,9 @@ config ACPI_X86
 
 config ACPI_ICH9
     bool
+    select ACPI_SMBUS
     select ACPI_X86
+    select APM
 
 config ACPI_CPU_HOTPLUG
     bool
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 01f330d941..0a6a04947c 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -77,5 +77,4 @@ config LPC_ICH9
     # for ICH9.
     select I8257
     select ISA_BUS
-    select ACPI_SMBUS
     select ACPI_ICH9
-- 
2.39.0


