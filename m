Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFE406DB4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:42:52 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhjv-0005ZW-FA
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh5-00021s-PG
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:55 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh4-0002qP-24
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:55 -0400
Received: by mail-qk1-x730.google.com with SMTP id p4so2174115qki.3
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tTLsJKlT08rbaA/jwVJCYtTXkiAqHHZeUBxFg8nz6I=;
 b=MWwTCIErsul4RY2HEFD8fKSLQ+fakFQLc/OkyWAe7uWioUu7P9wRCcjjNxExGuCWgu
 fp+9yiBSQY2JCV2yWgfTbxzhbJWp+u/0U6iR9ynCCgYaZPdsO4pBriOMEnBTCUGSgciS
 qVyUxIYO3OPfFRCKkf0PEWIE7Jy00H7gXi54+iM+CUHIZY/aAIpq92urZWZpmaau7fz8
 EfNSUpOW7LyS+l3urinpOW5N02ACYPM2ypzFIdMyjBnyHBYs5eNMtjNfZ+0geelweVmO
 3OsiFguk4PD8JVxCIo0BctPETgAnoTyeRijOUyLLWnerUMN5+2GizDKwuV/mEllRPxes
 nbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tTLsJKlT08rbaA/jwVJCYtTXkiAqHHZeUBxFg8nz6I=;
 b=kqXS84IUIg/jesdvnuMk9zJqTEP2+GzyBdr3F5rGKfNwdSnjda6tH/bcjojyvj+woA
 AB4K6ZvjtLkduJ9BVv3wGLyvBC2xnRw2yZhDfDzPky1eUGYc2VaDPXv3ESCa/mm5UPwx
 VOEgNBjVX3CnE535PORnm4Q30IzFozpK7uAP+cc4UL96MKeRdRcMycoOtWL2QG5Ur73w
 4VQKELOB5bVRjP58SpEe8D7yMWQhFd6VUw9j7muTVFoMeL5Uc1G/hXsxxLrdo9uUObrU
 VF7hc6LFyt5l/TmPZ35nmrN+MdPlesgoV2aAtY2YXTbm1/X9AroEFTZnTOv90jcH1dVv
 IfPw==
X-Gm-Message-State: AOAM532wofcVSBwBFpLtti9FXvUguYY8BKkQDEVHJaMjl0ZPhItOEMos
 Ez3OydyyafA8nftwUdUP2zpzHQ==
X-Google-Smtp-Source: ABdhPJyXDZ37Ula9wWQqdOaM2x5GpBJfod4BaYRZ77Pp+3I0zW1Rcr/wk5FHoEj6UGDk+6IYqW3GYw==
X-Received: by 2002:a37:634d:: with SMTP id x74mr8013387qkb.453.1631284793032; 
 Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:52 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 0/9] GICv3 LPI and ITS feature implementation
Date: Fri, 10 Sep 2021 10:39:42 -0400
Message-Id: <20210910143951.92242-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to virt platform,wherein the
emulated functionality co-exists with kvm kernel functionality.

Changes in v9:
 - removed sbsa-ref patch due to inconclusive ongoing discussion
   regarding ITS placement and version in sbsa-ref platform.This will be
   taken up as a separate functionality later
 - updated its enable code as per latest virt 6.2
 - updated its code to replace usage of MEMTX_ with bool
 - All kvm_unit_tests PASS
 - Verified Linux Boot functionality

Shashi Mallela (9):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  tests/data/acpi/virt: Add IORT files for ITS
  hw/arm/virt: add ITS support in virt GIC
  tests/data/acpi/virt: Update IORT files for ITS

 hw/arm/virt.c                          |   29 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1322 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  153 ++-
 hw/intc/gicv3_internal.h               |  188 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 19 files changed, 1768 insertions(+), 24 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

--
2.27.0

