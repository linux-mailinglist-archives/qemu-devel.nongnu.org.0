Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BF6B7BFD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8H-0007LC-56; Mon, 13 Mar 2023 11:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8E-0007L3-0q
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8C-0003cL-Ap
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id h14so11723907wru.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YmK4D6ZWvcLyT+3zP0TBMYxPeXlhmXeGjtiUoTZaEUw=;
 b=G2/N+9+gZCQVAU7Re8HeclmO1Z785RCxx6DzDz5pJSlP+qYGCLBV9AON1447hmz6zT
 PcHM+j8oKzvpPj4Whw7A500dltgoY6FXZi8zmwhuPfpqvNjU8dL0eeMFVheWvHox1Pg3
 ugXpMpkdcI0hWPkrAKNUqgRsoaGc+GUIdQgUS7goXZgMOjbYK59dZyBgI89tMn/D+EXj
 6NbfGK2Bj8D6NEDHCffx5kjyyblS/8hhYaIuQdvkLMs3iTxFEe8UvHm00JhYOJTdUhHD
 21PXPx2OJzbOCvg+TPtU1bRQhSXseWb5BQ2FQuuvZcNtrMdkt+LjCadf0Ruaxq9LJ2ui
 3RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmK4D6ZWvcLyT+3zP0TBMYxPeXlhmXeGjtiUoTZaEUw=;
 b=0DqEKSB/OIK/uVId1tOyA4ZdQbRvqSvEVI/KaHbcMamqMA+FyllAyMjXBb/4J553yU
 VrBBbVTSHtNKRySvGZIJVmyBu9c1MgA4ZY+nPCYt5n7skTBiZPnXUVmCJZ7ZA6J5ijQb
 +d69P49Jo0bOs8uBksFW9kzVBmDQVM1r5Z5W0CbzOWhVfrXPifTHbaxc+yqD29KwsTW1
 mezyulkF8+KPjR38wOCdTQaMdaPjniZhUHMUWUbLoek0vXeq0rpfBGsCIR/bdGLx3oMr
 WZ90qStT4api1dVUHO5+uWqqlRNj0dgDP5IbNoih4ibyZDP9CR1Wc8F3f4HFEH04SU4Z
 2BUg==
X-Gm-Message-State: AO0yUKU5Xo14tMYnLWLbzU/t8R29hOJDpoOYAcA9kURLUmEJtBuDTaVJ
 e7VPV5J8bF+VkqnP69WiXJmZMA==
X-Google-Smtp-Source: AK7set9k3OYFGNgqnIlcin6lA2g4o5D1/Va7pPjgxr1bkHn5PFzNNUnUhHznZCsdi6qAbXFZ5UB1FQ==
X-Received: by 2002:adf:e887:0:b0:2ce:a9e9:490b with SMTP id
 d7-20020adfe887000000b002cea9e9490bmr4324005wrm.31.1678721434432; 
 Mon, 13 Mar 2023 08:30:34 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d400f000000b002cea299a575sm7560716wrp.101.2023.03.13.08.30.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:30:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] hw/i386/amd_iommu: Orphanize & QDev cleanups
Date: Mon, 13 Mar 2023 16:30:25 +0100
Message-Id: <20230313153031.86107-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Following [*]:

  "Last time I tried AMD vIOMMU it didn't even boot."

mark amd_iommu as orphan in preparation of deprecating it
(or should we do that directly?).

Extract the PCI realize() code from sysbus one in order to
remove the single case of calling pci_add_capability() and
msi_init() on a *realized* QDev instance (in order to
strengthen the PCI/MSI APIs in a follow up series).

[*] https://lore.kernel.org/qemu-devel/CACGkMEtjmpX8G9HYZ0r3n5ErhAENKhQ81f4ocfCYrh=XoF=5hw@mail.gmail.com/

Philippe Mathieu-Daudé (6):
  MAINTAINERS: Mark AMD-Vi emulation as orphan
  hw/i386/amd_iommu: Explicit use of AMDVI_BASE_ADDR in amdvi_init
  hw/i386/amd_iommu: Remove intermediate AMDVIState::devid field
  hw/i386/amd_iommu: Move capab_offset from AMDVIState to AMDVIPCIState
  hw/i386/amd_iommu: Set PCI static/const fields via PCIDeviceClass
  hw/i386/amd_iommu: Factor amdvi_pci_realize out of
    amdvi_sysbus_realize

 MAINTAINERS          |  4 +++
 hw/i386/acpi-build.c |  6 ++--
 hw/i386/amd_iommu.c  | 74 +++++++++++++++++++++++++-------------------
 hw/i386/amd_iommu.h  |  9 +++---
 4 files changed, 54 insertions(+), 39 deletions(-)

-- 
2.38.1


