Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D036F314
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:55:12 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGUx-0002Zp-KM
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIS-0005hD-FD
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:16 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIH-0004K9-21
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:15 -0400
Received: by mail-qk1-x72a.google.com with SMTP id 8so35301632qkv.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXnWCRl8c0ZbS3V9zipcpge4fyvoK9BQ1ATAi7Ar3c8=;
 b=pWioEk+1tpL3rsQ5Fjuhzt4fDbQbJRkC+xo4RoII/nvBKaEIeMVcbY8I1oGfiLzcLg
 YMdhKnX8HW8FGGMBysKDkGEhdwCxptY2TDnb/M12RJ0WUWFfbbF4yIKp+uILkTdsi4zt
 Kl8zyj/dKlX/HOfXGUpZ9fMBXFJtdwZLZH0XE7DjBbXyAS353PQECzovaQWbiHLPvYyC
 sINP6cf/mVp9npdggr7GUb08O43s7E/ZNarA4yXrWxftUEtoxsrDiT6jzBwudidtrxtk
 DmZvZSIu2VyOlk36kQr5hleA5dYjRzFydTlgxSbyHqb8aN3rye4093svjBkJPu/L+AP9
 6PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXnWCRl8c0ZbS3V9zipcpge4fyvoK9BQ1ATAi7Ar3c8=;
 b=C7m0hCX8RORKqkonc+tm1oQB4xkQEp6IovlGtfEykVINmWfT3xmwEWEYrTzh6C3e6x
 uoIQAa76UB5cGHPNAvdzAV9Q6Rtb/JYyxJK2WFydJoRdNt/S14Kv8wwnd7zk+4lkzSXh
 xBuc0UJrIzu6uj6Cd0n9jZ5RsUBw/8xnjDJVIaPXKy9wqkYLcoLkiEOh0zX51ui+soqY
 QNzQHxIGy4o4MIQlC5IM4alPYBhvQsJOAacqfTPNhny3ecqAssHx7GfGjJglI6POJ9VC
 gTIi7T5SbeyY1lTLKyw+cggw+A7mZzP647NqFs3sujS7i24Cs7pnYSZa3ZMovqpZ378L
 MPfg==
X-Gm-Message-State: AOAM531GpYHUKl9kRnRTN8YaXoIBPV6/feL+pmBORYfr6vlqNW9TVw5S
 KRes/z7J36iQ4quocCiR9iDp4w==
X-Google-Smtp-Source: ABdhPJy19a806G2yZUYfY/Od5BkWmL9keHonc6WpQ5LxS1ScJXRkc3oCeWWfOYM+/DECrBXTvTctGw==
X-Received: by 2002:ae9:ef01:: with SMTP id d1mr2372952qkg.483.1619739722320; 
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
Date: Thu, 29 Apr 2021 19:41:53 -0400
Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

Changes in v3:
 - review comments addressed

Shashi Mallela (8):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  hw/arm/virt: add ITS support in virt GIC

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   27 +-
 hw/intc/arm_gicv3.c                    |    6 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |   20 +-
 hw/intc/arm_gicv3_dist.c               |   21 +-
 hw/intc/arm_gicv3_its.c                | 1247 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   11 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  163 +++-
 hw/intc/gicv3_internal.h               |  186 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |    6 +
 include/hw/intc/arm_gicv3_its_common.h |   40 +-
 target/arm/kvm_arm.h                   |    4 +-
 16 files changed, 1738 insertions(+), 37 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

--
2.27.0

