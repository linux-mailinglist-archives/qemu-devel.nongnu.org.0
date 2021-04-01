Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F7350CC2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:44:00 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnJO-0004Hi-J4
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHS-0002c9-8O
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:41:58 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHP-00036d-PG
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:41:57 -0400
Received: by mail-qv1-xf35.google.com with SMTP id q9so367442qvm.6
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svgKfP7SrgBsWmmHOZcQYHV23wZX0ZFPkptJcVYaZQM=;
 b=Yu6Ezsos6SAyXTcIaUpPMLy4RISwXAN5NrrDNLUwCM5KeJclig37BaT7w+MG7sMpLG
 5QX19am1AIl3zpPWksXKbPCgvwqQ9K3T5PmLqg0GJxhVJ1HMYaqEhFzbiytyAwkhqdl2
 CRT/vv6SPRyqk/DnRPNGx9cQNFxT/pGVVTUXzFtBXVTnnGeurXVpQEFbEJ+ksIFS/fv0
 rlxPqvqT0pYmsf6mkJTpgY2ErRw4dlDtaKuVL9xYs37Dyv78RpcDgt3v3Vr9SKFyc2pC
 JjG1q3mEIIMhnPdw/eqa19zkq9xZaBy5YloJUMiMCdtRK0J4uyu4YKl6hl48afLUfw2V
 6nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svgKfP7SrgBsWmmHOZcQYHV23wZX0ZFPkptJcVYaZQM=;
 b=qJN0YdCxHun950AyXl51TH2d9/CHo59RDEj3tLgDKxAW6XTh5PoLEtQXquMIfRWIQm
 3vKgOQ0seF19/rjJIDnoHkS7wha5F4vYUrEoiMWuwZ8Vx5InL380XAUD6O/S57zT5Yx8
 wc0wPeWAnSKUlQy293cnLfLZV/OnijyqQlXjxczb1H/bTcoLFPhCHGCxTljR/HNmbFzN
 QqXSDrjXH2vRKw8SaPijQY9nqJ37zA/Ycu3nw1Xxj1cIZbYoOPTCq6xX3cCcVseE3t5e
 r/YLu/mK0xe5aUUHOQ39r8m/cQa96TQWfMw+DGrqyONUVz7/AjlMiWDpjpk9JP4L/E+t
 hTjw==
X-Gm-Message-State: AOAM530JzApRs2/kQ0hyzbFJdC8GNiqJXy22nxuSNRWDBYkDGPeaxV5r
 4y/6Tmgyz1t6I+ngYp4f6KIscw==
X-Google-Smtp-Source: ABdhPJwPx4D1/hmtVkPRAXOx+/kX2tSzx+K+bQMVneRZ3C48Xw5MOHeLkRLL9xIIFXS+dReK5ooYMA==
X-Received: by 2002:a05:6214:1484:: with SMTP id
 bn4mr6163973qvb.8.1617244914448; 
 Wed, 31 Mar 2021 19:41:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:54 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 0/8] GICv3 LPI and ITS feature implementation
Date: Wed, 31 Mar 2021 22:41:44 -0400
Message-Id: <20210401024152.203896-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf35.google.com
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

Changes in v2:
 - used FIELD to avoid manual mask definition/manipulation
 - defined registers in patches that first use them
 - changed LOG_GUEST_ERROR to LOG_UNIMP for unimplemented code
 - all kvm-unit-tests passed except 1 inapplicable case of its-trigger
   which assumes presence of redistributor caching

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
 hw/arm/virt.c                          |   10 +-
 hw/intc/arm_gicv3.c                    |    6 +
 hw/intc/arm_gicv3_common.c             |   16 +
 hw/intc/arm_gicv3_cpuif.c              |   15 +-
 hw/intc/arm_gicv3_dist.c               |   22 +-
 hw/intc/arm_gicv3_its.c                | 1359 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   54 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  152 ++-
 hw/intc/gicv3_internal.h               |  177 ++-
 hw/intc/meson.build                    |    1 +
 include/hw/intc/arm_gicv3_common.h     |   14 +
 include/hw/intc/arm_gicv3_its_common.h |   40 +-
 target/arm/kvm_arm.h                   |    4 +-
 15 files changed, 1867 insertions(+), 31 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

-- 
2.27.0


