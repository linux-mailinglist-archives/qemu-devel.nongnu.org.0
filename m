Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F06581A6C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:44:13 +0200 (CEST)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQTU-0003J3-Cm
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ5-0006Bj-DI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQPv-000502-4x
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ebMRh43JKe2KXs4NKkK4opdxkF1UWx+16y5U1Ff7+tw=;
 b=FPbYHFdDpJy1hogOt8mTwAkiA1DbkA7N4yfLH4yhxIMqot3jZzfUjfduhiOGB5BgCFzZH6
 qK04E769TNZF+tiIG/JcVgcnBxkZkXYV1AAVsxb9Dafuj22m9sq2Bn2Noml7uDulV3+0Jx
 7CW0/n5TaGLfqdCsBkWiPa8xkWNOGvE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-licKJJyTMtGRLBjkByNc-w-1; Tue, 26 Jul 2022 15:40:29 -0400
X-MC-Unique: licKJJyTMtGRLBjkByNc-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so8023463wma.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ebMRh43JKe2KXs4NKkK4opdxkF1UWx+16y5U1Ff7+tw=;
 b=r6cJ75FvY8hKF4WIzQi2LbybSg+Rh3U0CkfArxKHUL5JEBNktekp8cKFgdLIL4cQ5+
 Wl1JccgpefwRFOSoZlFSefwEsGAqfxbdj7A6KhTd7iMcsq5t9aevzRS7EdLc00WVFZPd
 cntaf89mTYoDlxQ8te5qCtPoev1g54rQTKSvbnZ7MwB6ctkiqqShgzvhn0T3BULlRcVW
 lJYZSEqlQW/inocNIrAWW+/u+BxVC6r1570pFR8Tu+oYpCHnJbuZ8lBtHpw6OYrdjRA2
 ilYldidUsYbMmiss4x4ndfJVxQRZ1PMHXfHTU2vDLz3xaziT3AH8IKKc+nPbqyqIHMhp
 ptNQ==
X-Gm-Message-State: AJIora/hLyiSGaR77fqiaazmWXf3kQrEct1I/BkMqI1+nI5wGeV6B55k
 LuLMe3Ts4lFl4f3XAlU6EWsmuxTZL9wcP0UwApTTl6PBC2SlskYu3YGsgpk4sePyR3Zpnjx2+Fv
 3CcTcnDas7Kms48yV267BNzEPpsjp/VhiN0TsDVtlgysG2sq8lIwuN3sKBHeu
X-Received: by 2002:adf:e652:0:b0:21d:6e43:3ec4 with SMTP id
 b18-20020adfe652000000b0021d6e433ec4mr12752294wrn.358.1658864427522; 
 Tue, 26 Jul 2022 12:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0IisO2csr7XR4fFr2DpLfzk48ZqfLi/uTvBmGZwwy+R07TOt2ulKWL2ArzKApFovEJCiVFw==
X-Received: by 2002:adf:e652:0:b0:21d:6e43:3ec4 with SMTP id
 b18-20020adfe652000000b0021d6e433ec4mr12752278wrn.358.1658864426914; 
 Tue, 26 Jul 2022 12:40:26 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm15657163wrq.83.2022.07.26.12.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:26 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/16] pc,virtio: fixes
Message-ID: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d1c912b816844aa045082595eba796b5a025dbc4:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-07-26 13:29:26 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 0522be9a0c0094088ccef7aab352c57f483ca250:

  hw/virtio/virtio-iommu: Enforce power-of-two notify for both MAP and UNMAP (2022-07-26 15:33:29 -0400)

----------------------------------------------------------------
pc,virtio: fixes

Several fixes. From now on, regression fixes only.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jean-Philippe Brucker (1):
      hw/virtio/virtio-iommu: Enforce power-of-two notify for both MAP and UNMAP

Joao Martins (11):
      hw/i386: add 4g boundary start to X86MachineState
      i386/pc: create pci-host qdev prior to pc_memory_init()
      i386/pc: pass pci_hole64_size to pc_memory_init()
      i386/pc: factor out above-4g end to an helper
      i386/pc: factor out cxl range end to helper
      i386/pc: factor out cxl range start to helper
      i386/pc: handle unitialized mr in pc_get_cxl_range_end()
      i386/pc: factor out device_memory base/size to helper
      i386/pc: bounds check phys-bits against max used GPA
      i386/pc: relocate 4g start to 1T where applicable
      i386/pc: restrict AMD only enforcing of 1Tb hole to new machine type

Jonathan Cameron (3):
      hw/machine: Clear out left over CXL related pointer from move of state handling to machines.
      hw/i386/pc: Always place CXL Memory Regions after device_memory
      hw/cxl: Fix size of constant in interleave granularity function.

Robert Hoo (1):
      acpi/nvdimm: Define trace events for NVDIMM and substitute nvdimm_debug()

 include/hw/boards.h            |   1 -
 include/hw/cxl/cxl_component.h |   2 +-
 include/hw/i386/pc.h           |   4 +-
 include/hw/i386/x86.h          |   3 +
 include/hw/mem/nvdimm.h        |   8 --
 include/hw/pci-host/i440fx.h   |   3 +-
 hw/acpi/nvdimm.c               |  35 ++++---
 hw/i386/acpi-build.c           |   2 +-
 hw/i386/pc.c                   | 209 ++++++++++++++++++++++++++++++++---------
 hw/i386/pc_piix.c              |  15 ++-
 hw/i386/pc_q35.c               |  15 ++-
 hw/i386/sgx.c                  |   2 +-
 hw/i386/x86.c                  |   1 +
 hw/pci-host/i440fx.c           |   5 +-
 hw/virtio/virtio-iommu.c       |  47 +++++----
 hw/acpi/trace-events           |  13 +++
 16 files changed, 258 insertions(+), 107 deletions(-)


