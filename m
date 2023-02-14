Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0269645C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9c-0007XK-Bd; Tue, 14 Feb 2023 08:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9O-0007TK-2B
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:15 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9K-0003td-VB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:12 -0500
Received: by mail-ej1-x634.google.com with SMTP id sa10so39880900ejc.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hCDiOMwbwH+OVe131j6/laXnhN6tskF0qfeJGurFHxo=;
 b=nbQadeXIkcGwp+ziSx3bcp34rZ0bYQMZB8vWyUrQtBTrEWM1OxseSTvLe89DbyeSs/
 iLMBe2qVTCtKFG94v+h9pTjGthyAsradjd8P8a6rbDq62mBhFA/keTliV46lhaacrr/Z
 iBTkHGSJWBp1hoSXUi4YK3Oxufu5LqFXRwn9Dqer8JTAhWDkd/YjxO0OIlI7doKIovWP
 FjvHR3gDuOt29FdJ36bof1vZq83CE1urv/+7QhjiQznvaropVWp6rScQy8meg0JcKpri
 JVCzMKqOXBRt8yxCyyetpeKTFielYvpSp2yGfN/0lZbWmtMg/Wf1hThiu1DWAS0YgkaI
 FX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hCDiOMwbwH+OVe131j6/laXnhN6tskF0qfeJGurFHxo=;
 b=VfH4uC3S8rtS3vNvfwMy9v5AQnmW2aKDagNuvlghcqhdThd0DVTsJqLduGTFLIhSY7
 SNPZyl48gFEVSrkdGog7cQctrCtYxh1FXFRXv1Q1r7tF09naMkSawulAV2aKHoqvDeTt
 zbLjMoFQh5y1WU1pBQGoGgcxAAo1/K4apgYRhmc9ULseFvQlclQHuLlLPVe8UHjJukhm
 v7rfJ4xKT+aT/r/GzkidDk5vq7ExnB2iP7AXHT0sFDbOgnuaozTdjWCKrrIRqY9/hZnq
 M4doMN6K+R/6neky7muR6fTeCXGeOzfcDmYWryRni07WWwZNxdU4Th62QJ8gxPf2X76j
 +MKw==
X-Gm-Message-State: AO0yUKUkVnmWXtGab3lY59jZk4kDzkXirkyhguQut08H50dqZxeqAxWm
 OzS1cYkHiQgfwkKJ0WpSQCYzEXD046M=
X-Google-Smtp-Source: AK7set9l3gwCTATVRivUB52DOGBJYIqOF/gvrupBhn89wTdA282OcigcL69v43gVS/G4r2oFouYAGw==
X-Received: by 2002:a17:906:b88c:b0:88e:682e:3a9e with SMTP id
 hb12-20020a170906b88c00b0088e682e3a9emr2619048ejb.61.1676380509159; 
 Tue, 14 Feb 2023 05:15:09 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
Date: Tue, 14 Feb 2023 14:14:29 +0100
Message-Id: <20230214131441.101760-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

This series mostly cleans up QOM-related initialization code. It also perfo=
rms=0D
some modernization and fixing.=0D
=0D
The first patch originates from "PC and ICH9 clanups" series [1] which has =
been=0D
dropped in v3 in favor of another series [2]. Review comments in [2] sugges=
t it=0D
needs more work, so bring the patch back here.=0D
=0D
Patch 2 fixes a clangd warning and patch 3 modernizes usage of the memory A=
PI.=0D
=0D
Patches 4-9 clean up initialization code.=0D
=0D
The last four patches also clean up initialization code with the last patch=
=0D
doing the actual cleanup.=0D
=0D
Based-on: <20230213162004.2797-1-shentey@gmail.com>=0D
         "[PATCH v4 0/9] PC cleanups"=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
     manjaro-kde-21.3.2-220704-linux515.iso`=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20230131115326.12454-1-shentey@gmail=
.com/=0D
[2] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro=
.org/=0D
=0D
Bernhard Beschow (12):=0D
  hw/i386/pc_q35: Resolve redundant q35_host variable=0D
  hw/pci-host/q35: Fix contradicting .endianness assignment=0D
  hw/pci-host/q35: Use memory_region_set_address() also for=0D
    tseg_blackhole=0D
  hw/pci-host/q35: Initialize PCMachineState::bus in board code=0D
  hw/pci-host/q35: Initialize "bypass-iommu" property from board code=0D
  hw/pci-host/q35: Initialize properties just once=0D
  hw/pci-host/q35: Initialize PCI hole boundaries just once=0D
  hw/pci-host/q35: Turn PCI hole properties into class properties=0D
  hw/pci-host/q35: Rename local variable to more idiomatic "phb"=0D
  hw/pci-host/q35: Propagate to errp rather than doing error_fatal=0D
  hw/pci-host/q35: Merge mch_realize() into q35_host_realize()=0D
  hw/pci-host/q35: Move MemoryRegion pointers to host device=0D
=0D
 include/hw/pci-host/q35.h |  17 +-=0D
 hw/i386/pc_q35.c          |  33 ++--=0D
 hw/pci-host/q35.c         | 325 ++++++++++++++++++--------------------=0D
 3 files changed, 178 insertions(+), 197 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

