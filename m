Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A83BE0D0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:20:57 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xBH-0002jx-Tf
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x95-00008K-FM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:39 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8j-0001NU-VS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:39 -0400
Received: by mail-qk1-x72c.google.com with SMTP id j13so474033qka.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlfYE6GosY6ASC/rsUukB4KR+vpFhOf0HuSrLzk2U+g=;
 b=XeBnAqjD/CnU+Gt0WuQYZsOAhGSxzVCOsOiqLbjUDarcmy/I8Xb6FxLl1Vr9Va45CU
 2H6pdWOrujbIg2hdD1KLwM5g/YT/u1kpnyEOhNQxJDonkbRAf+js79u40nzQTI3fBme1
 2uwvcHm+z8GD4wfR0Rb03uUzSNiYFsIf+NLCg/+OSKJq43qmfQzqVwdGNzuLQ6sH9L/q
 obzTbt56hunJbuMfMaNTsKuMs0RdhMN2ebrdqi+QnyV+MNcMVMLlzl8fufxgnekdXQI8
 bT6Lvv07z/UddhkQlSRpXVb/nuEet3XjMa9EL2CWpQ0piwYjznBYCsMBjdJN4mKBtdO+
 da5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlfYE6GosY6ASC/rsUukB4KR+vpFhOf0HuSrLzk2U+g=;
 b=WsS22tkrkj6d7tFmfCUGHoGZTE90ESTanRFNTa89+E6N2sg6GYqoDlRueFWaH+A2xb
 b2noDoD2YBortMW/fW+Nr5zVC9rYmIYlDJOi/SFKtEND8UQPSiko5dcc6PnCsnqMwyyX
 2gqo4GckkxUzev0wScmN2J4sp9Lk4PJOBmaO0bGe9ErdVV85Vv8F+P3xjf6AtqfHtXZJ
 2H/0AG+JAYdbW1zAxTiEC1+Fnm/JhX8HD8bspSBugKmaFj82g6zpDbmeybb8nDczfbbd
 49myCs/CSiWz00skQ/YKAyGyYGnRqB2VDgekglfn1N0R/jDHZpaAveM/2rR1aD2eMs6R
 h4kA==
X-Gm-Message-State: AOAM533hvmWfYF2exVhuVcroEEoALy3tTIc7FozAAbmIzL9OYASBW5fN
 yPTddyYVfey3wInIPuP+KqnTPA==
X-Google-Smtp-Source: ABdhPJyns1IF5zL4gvQkez4mfFL8/gQwuxdCXTktNksd2i5L32ly9RVOEY4uB8ir8FfsQCq+YZWGEg==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr23303315qkm.362.1625624296998; 
 Tue, 06 Jul 2021 19:18:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:16 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 00/10] GICv3 LPI and ITS feature implementation
Date: Tue,  6 Jul 2021 22:18:05 -0400
Message-Id: <20210707021815.45938-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v6:
 - made changes to masking scheme being used in all relevant sections
 - updated process_mapti to validate idbits based on GICD_TYPER.IDbits
   instead of GICR_PROPBASER.IDbits
 - updated its_realize() to check every CPU for physical LPI support in
   each associated redistibutor and return error if not
 - removed GICR_TYPER_PLPIS check in its_reset()
 - addressed pending v4 comments in gicv3_internal.h #defines
 - refactored gicv3_redist_lpi_pending() as per v5 comments
 - added iasl disassembly for new IORT.pxb file
 - addressed all v5 comments around code formatting and
   gicv3_internal.h #defines 
 - All kvm_unit_tests PASS

Shashi Mallela (10):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  tests/data/acpi/virt: Add IORT files for ITS
  hw/arm/virt: add ITS support in virt GIC
  tests/data/acpi/virt: Update IORT files for ITS

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   28 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1301 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  154 ++-
 hw/intc/gicv3_internal.h               |  189 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 20 files changed, 1771 insertions(+), 27 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

-- 
2.27.0


