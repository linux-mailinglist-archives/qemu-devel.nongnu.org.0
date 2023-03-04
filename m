Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A46AAAB7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmr-0003Dz-EL; Sat, 04 Mar 2023 10:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmo-0003Dj-P6
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:02 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTml-00088x-As
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:01 -0500
Received: by mail-ed1-x534.google.com with SMTP id g3so21713443eda.1
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rI7C7ueEP8F9AV+v0BIwt94pBkWYJ/t5nXKdwwnYsMM=;
 b=UCCpHF44/SvkpY/xS06H9n0nBeei4xAUgTiCRkxzrLsnPEOAlyBuopa9kfS+LsTxrj
 rQ00CXRui9Zz+gAKk/yS2xpVNDqXT9f6QniLIZJ/KWaVgar/pYBsWr8JqAmkrSsX2eLt
 yT2eXVxG1kXC5bwufJC1Um88FUTPQR4oreCXVJG2yeNr4o+iGLo+O+OioSSRP/yLVh/r
 ByCqXcw2/U5r/G4ixgckZJ5f/dBjuBqYx7nq4b/7iKXrMF6ehlIbHj6J0HpRnuLSy63h
 4ziCBdaJiYeseVOzpKzmm0xOxKTK4D0Xna6LzMdbUFL7MvMlRyhkIVswCCTIYde/azOK
 9Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rI7C7ueEP8F9AV+v0BIwt94pBkWYJ/t5nXKdwwnYsMM=;
 b=IKWClYAsuSrfzknz607a25PorjOb7Z2BYPH7DPQWNHxUWjOuhMN6yhvrS3x6gGErYp
 gmMiXAhqEC7hpyvPmLMQ4Bcvd4brx+f+Z+KEFayYoRvnkFQyz1Gx94truWOeBIv89yDl
 KJohdTRM37OgYBWtZkbHYLNH9OmyoWXCw+g041vrvgRGOEevSFvi6XM2tChbkoM4wZNa
 SlbvCulT4HTX5L/VJfchc+KGD9VqNYnNm2D/PWNPTKBlvJXvU25pBAxt5nf5GuJEDlLa
 qMxCgFnbbjqEC1b2HaJ5XqzlGRG+NYF9pz5lvxyg92un/CJeqxLPpIwJ2l8nqJrB06Si
 0NLA==
X-Gm-Message-State: AO0yUKVBzFtC/ECAf7s1E4MoNM/o317a64191lzRbeF2Ts0gTZAK4m6L
 /I8oTi0pgGiBqdocIOleLs3gNnE7uPw=
X-Google-Smtp-Source: AK7set8u+Km6K0+r0LrzGwbxSGnE5VVbt+B/oT3B4HUZkikHUcMc2vC8F2k2Ob2HgLNqFQexMOcD+Q==
X-Received: by 2002:a17:907:9b03:b0:8aa:be5c:b7c5 with SMTP id
 kn3-20020a1709079b0300b008aabe5cb7c5mr5540280ejc.41.1677943616982; 
 Sat, 04 Mar 2023 07:26:56 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:26:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/13] Q35 PCI host fixes and QOM cleanup
Date: Sat,  4 Mar 2023 16:26:35 +0100
Message-Id: <20230304152648.103749-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
     manjaro-kde-21.3.2-220704-linux515.iso`=0D
=0D
v2 (addresses Michael's comments):=0D
- Patch "hw/pci-host/q35: Fix double, contradicting .endianness assignment"=
=0D
  - Fix Fixes tag=0D
  - Switch to native endian=0D
  - Add clang warning=0D
- Patch "Use memory_region_set_address() also for tseg_blackhole"=0D
  - Rephrase commit message to avoid pseudo "Ammends" tag=0D
- Introduce PCI_HOST_BYPASS_IOMMU macro to avoid duplicating the property n=
ame=0D
- Patch "hw/pci-host/q35: Initialize properties just once"=0D
  - Mention manual reassignment in commit message as the problem being fixe=
d=0D
=0D
Based-on: <20230213162004.2797-1-shentey@gmail.com>=0D
         "[PATCH v4 0/9] PC cleanups"=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20230131115326.12454-1-shentey@gmail=
.com/=0D
[2] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro=
.org/=0D
=0D
Bernhard Beschow (13):=0D
  hw/i386/pc_q35: Resolve redundant q35_host variable=0D
  hw/pci-host/q35: Fix double, contradicting .endianness assignment=0D
  hw/pci-host/q35: Use memory_region_set_address() also for=0D
    tseg_blackhole=0D
  hw/pci-host/q35: Initialize PCMachineState::bus in board code=0D
  hw/pci/pci_host: Introduce PCI_HOST_BYPASS_IOMMU macro=0D
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
 include/hw/pci/pci_host.h |   2 +=0D
 hw/i386/pc_q35.c          |  33 ++--=0D
 hw/pci-host/q35.c         | 317 ++++++++++++++++++--------------------=0D
 hw/pci/pci_host.c         |   2 +-=0D
 5 files changed, 181 insertions(+), 190 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

