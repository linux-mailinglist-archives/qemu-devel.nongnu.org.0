Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0953059775B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:10:02 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPMX-0008LY-Td
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPId-0002d5-AB
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIZ-0000Cn-M6
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5MWKWfltV79bW48GwBP3yLd1onFKFJ3/ZjnMo8JVt0Q=;
 b=B4L3T/6kuWmdN0h1DqPbyXDnDXSGKtnvBCiuBpLxIeHK+z3tVB6UQyGQhzgn3VHgSaPfoE
 TTCRC4NsOa97Ec1NXnP2nBrJsMLpf/2Suy8nrh/aKkIjWBZUM1k8mGWaSyNtPUL/WyXE51
 +HjkNEn7YMikUMMGt4vf/AqIGTwRv1c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-VYM4v525OAGrD-7M7WNbTA-1; Wed, 17 Aug 2022 16:05:53 -0400
X-MC-Unique: VYM4v525OAGrD-7M7WNbTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so1535362wmb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5MWKWfltV79bW48GwBP3yLd1onFKFJ3/ZjnMo8JVt0Q=;
 b=I1ggP+tofjrwgkGemsNQ0CocW5HNBVF25+LYT8QIz9tuAaavW8TiV5a4hKxPF2zoTA
 k4JPdJsEJ5bWwQA233LC2NkilbBZyfadvCjZn/y4NEmGXVhP07piXe9zDGtAAgm/hs8x
 4EKrf++iiw71XtFLCItF3QO7oOjUMgmB4FztMYjm2or6yPz4/2O1vi7+FDw+17rT+uOq
 iQmGwy9p4W72P8Tu2AV+IOsLFXg6Ry537WXUM13RJpX16QexB6Q6mj+aqZBXeYT4nSTp
 q08+1myoaeeI5CpLaRhq2vDPeppA5cb5LDVOnrnrS9Ay9nBvC1bieaYAWcQrprqd2eCa
 VgDw==
X-Gm-Message-State: ACgBeo2I/c98236J4+jcALGUeIufKL+1LQL+FyXYj77WtruehE6gqgH+
 TkAC87DbtQXb2falybSllljysT7KnlrOkDb5QP0ZmZEwEMSR7lPVzXBXN1ipjHb5mIVaJo+qLXw
 fml/AbkCU3D8XtGkoXUWdr/iY6d58wnIMNsK1z0oKxcpzTmGsBdoZprz/aTdQ
X-Received: by 2002:a05:600c:254:b0:3a5:a401:a1e2 with SMTP id
 20-20020a05600c025400b003a5a401a1e2mr2971781wmj.14.1660766752002; 
 Wed, 17 Aug 2022 13:05:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Rws+SatYmDn5pMmsEp4mUtAOHm4UCUfmxoXS0RKHN6MUHZg5Jjb8z4EUEssBMUjgymHm7eg==
X-Received: by 2002:a05:600c:254:b0:3a5:a401:a1e2 with SMTP id
 20-20020a05600c025400b003a5a401a1e2mr2971766wmj.14.1660766751673; 
 Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c214800b003a5c244fc13sm3364180wml.2.2022.08.17.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:05:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/12] pc,virtio: fixes
Message-ID: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:

  Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 9afb4177d66ac1eee858aba07fa2fc729b274eb4:

  virtio-pci: don't touch pci on virtio reset (2022-08-17 13:08:11 -0400)

----------------------------------------------------------------
pc,virtio: fixes

Several bugfixes, they all look very safe to me. Revert
seed support since we aren't any closer to a proper fix.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (3):
      hw/virtio: gracefully handle unset vhost_dev vdev
      hw/virtio: handle un-configured shutdown in virtio-pci
      hw/virtio: fix vhost_user_read tracepoint

Gerd Hoffmann (1):
      x86: disable rng seeding via setup_data

Igor Mammedov (1):
      tests: acpi: silence applesmc warning about invalid key

Jonathan Cameron (5):
      hw/cxl: Fix memory leak in error paths
      hw/cxl: Fix wrong query of target ports
      hw/cxl: Add stub write function for RO MemoryRegionOps entries.
      hw/cxl: Fix Get LSA input payload size which should be 8 bytes.
      hw/cxl: Correctly handle variable sized mailbox input payloads.

Michael S. Tsirkin (1):
      virtio-pci: don't touch pci on virtio reset

Stefan Hajnoczi (1):
      virtio-scsi: fix race in virtio_scsi_dataplane_start()

 hw/block/dataplane/virtio-blk.c |  5 +++++
 hw/cxl/cxl-device-utils.c       | 12 +++++++++---
 hw/cxl/cxl-host.c               | 17 ++++++++---------
 hw/cxl/cxl-mailbox-utils.c      |  4 ++--
 hw/i386/microvm.c               |  2 +-
 hw/i386/pc_piix.c               |  2 +-
 hw/i386/pc_q35.c                |  2 +-
 hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
 hw/virtio/vhost-user.c          |  4 ++--
 hw/virtio/vhost.c               | 10 +++++++---
 hw/virtio/virtio-pci.c          | 19 +++++++++++++++----
 tests/qtest/bios-tables-test.c  |  4 +++-
 12 files changed, 62 insertions(+), 30 deletions(-)


