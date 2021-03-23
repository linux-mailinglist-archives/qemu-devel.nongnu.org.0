Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06E345699
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:16:18 +0100 (CET)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYSk-0002Oh-Tl
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPQ-0000ik-BI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:12:48 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPM-0006aM-A8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:12:47 -0400
Received: by mail-qv1-xf35.google.com with SMTP id g8so9855716qvx.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ib7/ZbV3mF5PTiHLIg5QNXvGETy+Ldq7oZMNFkmIBLg=;
 b=Y6rEazsJtaAy5iuVdbvf53/QJ3vYX6oMv5Qx/I3UCOT2hH1u2T8AG3FIrXQ4K3Uivj
 xbhdeEJg1wl5qxFsESPCOi+kgAbD2IgnSFgrJrA2uXOluMhUw1dRTu35kcwZF54ug/tx
 E7/eANTcPF55egypLSCSgmJI0XRiDyM47WjFvogAI/G694mRWJ+DqA2dIvqMh8avdE26
 HI1dQtrq8aNCOx0NLYZmmrzPCVKICnp5B1d94jCK89APYfwOQWHQxA4AvYxfEiaUV/is
 K0qqrcGpbfQf22jwjCHNwodKdAoVCy2mmnaX4opEMgjuqvpLFaeQgWpV9dQ0/0olXaGO
 9i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ib7/ZbV3mF5PTiHLIg5QNXvGETy+Ldq7oZMNFkmIBLg=;
 b=Bu/vf7/PnUqeImJu2VrD14LjSdGjiMtSf3ozX6i2yTJ727VrD2jO67Ual8wHJHpRIJ
 r25b0SXOosWmywhflVcj0XN6Dg1WmPDLLRE2j0Y4qWicA/vlZuH8pqU6ofqpva4wvL4V
 6pWnXNwvgJJkHHo0hZHJdZ9/3OYq5tERlXk1N/Nx+oGq37GVjiz+bSDISyUTWLz1/OKm
 jV5xiCB6qQF/K+XCUvZvQ++d1Sfl+hdnu4KVimgM4XwEfLyOqm2CnEL4qaOlZwTdXhqJ
 H/Ncgus39YFVvaqGeiQCwX8XwxDJAgR/uhZmW7fm76/Ks6LYbYV5+wKyeLR0YgSrYGsq
 nF5w==
X-Gm-Message-State: AOAM531AL3UgEXRzn/BAGaEZYtdB2v2En3C8tdhgj2Y7PDJtGZcW1bEq
 XwL5N9UpIe761pSlQVPruQQVDw==
X-Google-Smtp-Source: ABdhPJwcOAD1ZilOEFY6YjecRzdzOEeJdWExkqPdCj0o8sia7QBvdIhbKWqM/UwtxJJBUHjziLxcBA==
X-Received: by 2002:a0c:bf12:: with SMTP id m18mr3001809qvi.40.1616472760181; 
 Mon, 22 Mar 2021 21:12:40 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:39 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 0/8] GICv3 LPI and ITS feature implementation
Date: Tue, 23 Mar 2021 00:12:30 -0400
Message-Id: <20210323041238.133835-1-shashi.mallela@linaro.org>
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
 hw/intc/arm_gicv3_its.c                | 1417 ++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   17 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  155 ++-
 hw/intc/gicv3_internal.h               |  176 ++-
 hw/intc/meson.build                    |    1 +
 include/hw/intc/arm_gicv3_common.h     |   14 +
 include/hw/intc/arm_gicv3_its_common.h |   12 +-
 target/arm/kvm_arm.h                   |    4 +-
 15 files changed, 1869 insertions(+), 24 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

-- 
2.27.0


