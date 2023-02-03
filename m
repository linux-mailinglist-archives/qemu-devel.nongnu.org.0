Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C4689F47
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyxM-000192-Ge; Fri, 03 Feb 2023 11:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxH-000187-W9
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxF-0007iT-QH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:27 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4285116wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SUsLQg0oaqWfD49FP9cko9iTU6zXgC1yWm7dY0xvcFo=;
 b=ci8x5l4vPKRZHqcf0CmxogSBboGq9c9bpXah0SAMJGax+nA2ead2b20Cxnnkjno3aG
 aKK3wgW46XJ4FGk2Kva727r/j8gFAGLZZQ+5vNvAY7tbsbV3CnhD0rVzUqOxl++0QzGK
 ZZ9Y61ejPgNvBpLeQ7JIGkUHqUU6zkuU+AZrZSXYhWXzfowq5zewIC7OqA76ZMl46d1g
 7q0YvFY2+U4MZYy7uqd+7eSc+Zzn16Xcx8NFJfMoOQ8mkKxFADGyEZ7b44AYM9dwF3cf
 aeho1MdAleHJm5qpEbQXJHus+eVQzByKVIDFtzFg2OBH+x5Lpw9h9Dm1uccnEgJFtenc
 +OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUsLQg0oaqWfD49FP9cko9iTU6zXgC1yWm7dY0xvcFo=;
 b=HCBZZ2SWbrXn/YkYrzmacsDQniXktf4Vp4mB11AqIlMbz0uMccU9QVjJocjynDzL8j
 q2iI2CG/zW6g1VGzlAKXrnrL6CiqQN3Bb3p3zGsvJNx3A42NDIkXd0aJHj8GUPEMfYMU
 yUSADLY68sTiBZoIhKO8QjXHaRKAkOKHHjqxrUjqOS+thctTfttX6t45KgSaq+5ZV7nd
 /T1IIm0Mwa8N6r23fRhE1SM57BgEWRjguYVAYOt2USdF6qCoBRNMYb7P0fnFE6XtgLvZ
 ioGSTI7z8nWTaFXtYEJLgxBnz7UG9yOSjQzJf20cNdxSlQ7fG4my5j6hEQVDZNKv/sy2
 N2QA==
X-Gm-Message-State: AO0yUKXwIpj4XOqXV1JTjVVps2VtM23e36a86capYkvdp5F0bZik3mXD
 L5t3rbJRYvyO/lR3eh+kN5CzSAhGHyyf0YHN
X-Google-Smtp-Source: AK7set9PL7SXOYWqqrHsoD0zRwZEusl+RHnaC9ZQSw7spSsYcrRPbU2RhEMI4nr3meXMzRJdmxDg1Q==
X-Received: by 2002:a05:600c:16c4:b0:3db:9e3:3bf1 with SMTP id
 l4-20020a05600c16c400b003db09e33bf1mr10153382wmn.31.1675441823645; 
 Fri, 03 Feb 2023 08:30:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b003dc521f336esm3424564wmq.14.2023.02.03.08.30.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 08:30:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Date: Fri,  3 Feb 2023 17:30:18 +0100
Message-Id: <20230203163021.35754-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

To ease code review, rename ACPI CPU hotplug variables
to more meaningful names.

Since hotplug parent can't be any QOM object, and must be
a QDev, convert AcpiCpuHotplug::device from Object* to
DeviceState*.

Philippe Mathieu-Daudé (3):
  hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
  hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as 'container'
  hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'

 hw/acpi/acpi-cpu-hotplug-stub.c |  8 +++---
 hw/acpi/cpu_hotplug.c           | 46 ++++++++++++++++-----------------
 hw/acpi/ich9.c                  |  9 ++++---
 hw/acpi/piix4.c                 | 14 +++++-----
 include/hw/acpi/cpu_hotplug.h   | 12 ++++-----
 include/hw/acpi/ich9.h          |  2 +-
 include/hw/acpi/piix4.h         |  2 +-
 7 files changed, 47 insertions(+), 46 deletions(-)

-- 
2.38.1


