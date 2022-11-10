Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A202624C8A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEl3-0005cS-4p; Thu, 10 Nov 2022 16:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEl0-0005bT-Bb
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEky-0005m3-Qd
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668114400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dVO8ZgA+SVpCQMrEfVRMlfdXYkyeEFqiKzILPiaNvKA=;
 b=BjX20Dm39MFuZxoqTlPY+i3D2sVu/ceNzc91zLBYiZN7yB4F5c12sPjCagrTtCsl1eaQ4D
 iZSCg87/evW2JkcHNaJJ+1cFmOvTLsQnMPr7KtKX3NqYQMngjO9/VFCaKU+4ih9R2TclhY
 sZr1omnAMD9fbhWJOAtJCY5BBMTmB2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-541-x8kH-B_CPNCocJhF5LpYoQ-1; Thu, 10 Nov 2022 16:06:38 -0500
X-MC-Unique: x8kH-B_CPNCocJhF5LpYoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 186-20020a1c02c3000000b003cfab28cbe0so3259043wmc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVO8ZgA+SVpCQMrEfVRMlfdXYkyeEFqiKzILPiaNvKA=;
 b=yiZMVd5tXdmx+6kVrc0qthbagh5pgmYsmvgrKK436COWDb0EI8cdxPkhDxa+PlReTs
 +tRmEVO+9SYDNjZSnMwp6T26Q5Ww+dDrKtn3AK4QDHnXE2HDGJP1q4xc5A+6YoHwgOqU
 NWa6uf1ZrFXwPwCUPCpQ7WiHmmmOZhrKtrBjNnvVail5bh3Mmyi74wneIOiFEATDi9Zo
 tJXZJdMBqpOMTUWEXItaQyXPnTG9w8X3/Jom7UYfTysgaPbsW21WaNvNErOoqWioNcbR
 Qn40g2/nLtPhWqi1Clz07L6RTra7bUdtVIxE47DdAVCrI1cVCzO0cn7eaigElEEtSrNG
 /qsQ==
X-Gm-Message-State: ACrzQf1frAEXi2qcKpsOZzusQeFjZfSw46eLvAE68Xw5lTy/V6F7o9mq
 AqId2EsFpv9MWKlODtYuMcbaKoQyQ0j+EGlPapnhE3DmqBzz5n+/NRrDgRu14bkzuLJPMeIJ/rJ
 /THnZ9QvSwObWY4V44wWcpzjMzzd5DvNsU0RdgtQDsO/rWJ6R2RfNn1pDF9pB
X-Received: by 2002:adf:f386:0:b0:236:6e8c:f5bb with SMTP id
 m6-20020adff386000000b002366e8cf5bbmr41116207wro.587.1668114397367; 
 Thu, 10 Nov 2022 13:06:37 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4HBNBtv17dMp97NNSYh356NxWQh1rumKjDwljXtXJ95pK6sCXT8yfltWkP0ymMq/loD8779g==
X-Received: by 2002:adf:f386:0:b0:236:6e8c:f5bb with SMTP id
 m6-20020adff386000000b002366e8cf5bbmr41116200wro.587.1668114397122; 
 Thu, 10 Nov 2022 13:06:37 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 z4-20020a5d4c84000000b00236733f0f98sm110303wrs.107.2022.11.10.13.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 13:06:36 -0800 (PST)
Date: Thu, 10 Nov 2022 16:06:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] pc,virtio: regression fixes
Message-ID: <20221110210428.137015-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

There's one other bugfix I'm tracking for 7.2, dealing with reconnect
for vhost-user, let's see whether it's ready in time.
Other than that, this release seems mostly done to me.

The following changes since commit 60ab36907ded2918d33683f2b66f603b7400d8f3:

  Update VERSION for v7.2.0-rc0 (2022-11-08 15:53:41 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to f47af0af0db5933664c621b8af8067ebbcbe66cd:

  virtio-net: fix for heap-buffer-overflow (2022-11-10 10:18:55 -0500)

----------------------------------------------------------------
pc,virtio: regression fixes

fixes issues from the last pull request:

unresolved symbols for taargets without acpi
typo in a comment in checkpatch
virtio buffer overflow

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (2):
      checkpatch: typo fix
      display: include dependencies explicitly

Xuan Zhuo (1):
      virtio-net: fix for heap-buffer-overflow

 hw/display/vga_int.h        |  1 -
 include/hw/virtio/virtio.h  |  2 ++
 include/qemu/typedefs.h     |  2 ++
 hw/display/ati_2d.c         |  1 +
 hw/display/cirrus_vga.c     |  1 +
 hw/display/cirrus_vga_isa.c |  1 +
 hw/display/vga-isa.c        |  1 +
 hw/display/vga-mmio.c       |  1 +
 hw/display/vga-pci.c        |  1 +
 hw/display/vga.c            |  1 +
 hw/display/vmware_vga.c     |  1 +
 hw/net/virtio-net.c         | 18 ++++++++++++++++--
 scripts/checkpatch.pl       |  2 +-
 13 files changed, 29 insertions(+), 4 deletions(-)


