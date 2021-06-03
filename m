Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB139A80F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:14:55 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqvm-000532-Mc
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu1-0002BZ-KQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqtz-0005QP-5s
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id h3so3858507wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m51+sIPoEGhMaWZf4hgHR8aYAnr1Re61ef82SgF3zgg=;
 b=VTsaJNsFWFNoGKuUyJSu6xv3yC8FYVYBlDPadmNwD7T5SNQvp6s89+XiUIL7Ex6NLj
 sQ1yDyf1s1L2zGoS290+jhx0fU9KZ2Kvr15I7R47xqzp6Om1Q2o2TF262NNvSViaCciA
 xNsNTDTgaPnIqgj70E5IuadOYUFtR1Bm0s+kDoVBw38GspXHJzhL4meZJw1Y/vgeYk1B
 dBpqLhmWGduYnGn5tR0tWUA+EH+GhTUTQAgEnuFhbgQeCjyxrWcF3Pq6dPegb1QsMv7C
 zkzMQxak0wp0Hm9GJrCKySn9/jyUG5iC+LptXHOdu7pYmagcS5Z4ALNDRuGLjYISP/gO
 PAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m51+sIPoEGhMaWZf4hgHR8aYAnr1Re61ef82SgF3zgg=;
 b=q3PaGU8bsuntbWSCcA7YTAYTkPogHcax/+w/DwWagSQ/QdN3pmHZRmm6cS1Ul34Eok
 s08C96yxZ9qSGQ55ep/Xk75R4MiteGL0KPV21S2+IZpSVGNbelGrm7tvLLfrkJUBrin3
 9os5ZeF8gBmxIe5UwrP3AolXclkGq5oFdpQYuwLJcV9EbpqnReo0ULswXH3lmuTPsfjP
 bcC2qAgpnpOOrSOR9pl2DyC+Qco1udwuaUmfwTBRPdelZRidD9kWEuMhxYiSpGgiGzC6
 qwUiVj+U0DZhDERVAQw5PGEVaHPQmbOIOyq5t9AH0yKlhHEEqBp9pKjywRvtJhy57MuK
 x4gg==
X-Gm-Message-State: AOAM531UdhFXkXNc7tDcO4doC9rd2CyZJDZDooaX6yrbCCXEQOzWtvao
 grb+NJcjUXwUmQE+COxlXwSS0A==
X-Google-Smtp-Source: ABdhPJxPpuUK7ogMLlJqrvRwb/cx+4kE1W6Jp6OonGkWT8lK+BGCHfcJBgehQj6nPVqWYsejlXgymg==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr10837736wmc.70.1622740381410; 
 Thu, 03 Jun 2021 10:13:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/acpi, arm: Provide and use acpi_ghes_present()
Date: Thu,  3 Jun 2021 18:12:56 +0100
Message-Id: <20210603171259.27962-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the Arm code in target/arm/kvm64.c which decides whether
it should report memory errors via the ACPI GHES table works
only with the 'virt' board; in fact it won't even link if the
virt board is configured out of the QEMU binary.

This patchset replaces those virt-specific checks with a single
new acpi_ghes_present() function which tells the caller whether
it's OK to report errors by calling acpi_ghes_record_errors().
The mechanism we use is a simple flag in the AcpiGhesState
which gets sent if the board calls acpi_ghes_add_fw_cfg() to
set up the GHES stuff.

We need also to provide 'stub' versions of both acpi_ghes_present()
and acpi_ghes_record_errors() so that we can link even if no
board using ACPI GHES has been configured into the binary.

(You can test that this series is necessary by commenting out the
'CONFIG_ARM_VIRT=y' line in default-configs/devices/arm-softmmu.mak
and building with KVM enabled on an AArch64 host.)

I have tested with 'make' and 'make check' but nothing beyond
that; testing by somebody who has a guest setup that uses GHES
would be helpful just to check I haven't accidentally broken it.

thanks
-- PMM

Peter Maydell (3):
  hw/acpi: Provide stub version of acpi_ghes_record_errors()
  hw/acpi: Provide function acpi_ghes_present()
  target/arm: Use acpi_ghes_present() to see if we report ACPI memory
    errors

 include/hw/acpi/ghes.h |  9 +++++++++
 hw/acpi/ghes-stub.c    | 22 ++++++++++++++++++++++
 hw/acpi/ghes.c         | 17 +++++++++++++++++
 target/arm/kvm64.c     |  6 +-----
 hw/acpi/meson.build    |  6 +++---
 5 files changed, 52 insertions(+), 8 deletions(-)
 create mode 100644 hw/acpi/ghes-stub.c

-- 
2.20.1


