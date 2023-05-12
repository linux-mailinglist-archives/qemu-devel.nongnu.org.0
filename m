Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F76700984
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:52:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTBk-0003DU-Rc; Fri, 12 May 2023 09:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBc-00037o-7p
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:56 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBZ-0006SG-JY
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:55 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac733b813fso106645351fa.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683899511; x=1686491511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eEWfcUs5CScFWa8QYLjWQ4P/myP95FLUFeikpmSyFT4=;
 b=lWDwB6xPHGTH/LjQj4bUGXIc7tMfepvr843AusL7+rLUWRuWQyVBTOES4dmvkrkpvs
 0uwofDTjgLygNAlPyJ9vM3RPmyAUG56iaQIsIXCJymbaW6UGtzL4vSwOsL1O/FXUZv3c
 fMa/XrQveytqCgPd//KCgHMDw1dNUgxUbvHNiVW5sFGG+IGlxPUAcXKgCVFvrULuMO2e
 dAkp2lcaWST7FK2poW8s5H4Pg8h/8XJ228RF34sANzQbiwlUJK84qKJOfrMGNyuV3XZY
 7bTibhgwBG/Jq9zv8adoRgPfb2BaQ60BfFawdZPUk/V5FHdmqEb3bM3uL25+yFQeVZZq
 uNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683899511; x=1686491511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eEWfcUs5CScFWa8QYLjWQ4P/myP95FLUFeikpmSyFT4=;
 b=DNCtMU9wlkJBWPQbNFusktuA9zxJ+Yh7KFKzzQqkWk3X7CmWDx5EeCGnZOl9kz+7S3
 VIA1mwetcmuF03K35jq4oORaLWBtudVC+C3JJ1HZLD5Zz7z47FmwFLh+hH7GpAm6mZk6
 v2Cd4cbfslXnnU6oHULFFpZFvG83slA227XOVfMWXJOVCKQCs36e1ZOkVRPDjldFyLkt
 Ub7iat4vNV0yygahzBDyonKy6VA5LqMManRtJ3okxegsBfeVufzNTQQeJIUW3CdUWGzb
 /4RoyXxg5JriZksfZitpMJqnOneAsalgyFVBt9mt23WIgRy6MxFBB/HQCgv288LZsoc7
 8U6Q==
X-Gm-Message-State: AC+VfDzkyMZJ5vWTMNmYOvAucf0c/XPyJuw43aGeVoC7BPhfMmP0QccP
 XLYi+FCrGwGz3WaIRkMBit2izA==
X-Google-Smtp-Source: ACHHUZ7Q7oO0nsY3Uow9gQDAz+c3XAspavAOBy3V6Q+iE27cnk1m0bDkBkvWywPRACH5ipQp0LWvPQ==
X-Received: by 2002:a2e:9985:0:b0:2a8:bc08:a9a3 with SMTP id
 w5-20020a2e9985000000b002a8bc08a9a3mr5037896lji.28.1683899510900; 
 Fri, 12 May 2023 06:51:50 -0700 (PDT)
Received: from vp-pc.. (109-252-115-147.nat.spd-mgts.ru. [109.252.115.147])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a2e90c7000000b002ad994b0b51sm1744283ljg.16.2023.05.12.06.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:51:50 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [PATCH v3 0/3] vhost: register and change IOMMU flag depending on ATS
 state
Date: Fri, 12 May 2023 16:51:19 +0300
Message-Id: <20230512135122.70403-1-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::233;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When IOMMU and vhost are enabled together, QEMU tracks IOTLB or
Device-TLB unmap events depending on whether Device-TLB is enabled. But
even if Device-TLB and PCI ATS is enabled, the guest can reject to use
it. For example, this situation appears when Windows Server 2022 is
running with intel-iommu with device-iotlb=on and virtio-net-pci with
vhost=on. The guest implies that no address translation info cached in
device IOTLB and doesn't send device IOTLB invalidation commands. So,
it leads to irrelevant address translations in vhost-net in the host
kernel. Therefore network frames from the guest in host tap interface
contains wrong payload data.

This series adds checking of ATS state for proper unmap flag register
(IOMMU_NOTIFIER_UNMAP or IOMMU_NOTIFIER_DEVIOTLB_UNMAP).

Tested on Windows Server 2022, Windows 11 and Fedora guests with
 -device virtio-net-pci,bus=pci.3,netdev=nd0,iommu_platform=on,ats=on
 -netdev tap,id=nd0,ifname=tap1,script=no,downscript=no,vhost=on
 -device intel-iommu,intremap=on,eim=on,device-iotlb=on/off

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001312

v3: call virtio_pci_ats_ctrl_trigger directly, remove
    IOMMU_NOTIFIER_UNMAP fallbacks
v2: remove memory_region_iommu_notify_flags_changed, move trigger to
    VirtioDeviceClass, use vhost_ops, use device_iotlb name

Viktor Prutyanov (3):
  virtio-pci: add handling of PCI ATS and Device-TLB enable/disable
  vhost: register and change IOMMU flag depending on Device-TLB state
  virtio-net: pass Device-TLB enable/disable events to vhost

 hw/net/vhost_net.c                | 11 ++++++++++
 hw/net/virtio-net.c               |  7 +++++++
 hw/virtio/vhost-backend.c         |  6 ++++++
 hw/virtio/vhost.c                 | 30 +++++++++++++++-----------
 hw/virtio/virtio-pci.c            | 35 +++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-backend.h |  3 +++
 include/hw/virtio/vhost.h         |  1 +
 include/hw/virtio/virtio.h        |  2 ++
 include/net/vhost_net.h           |  2 ++
 9 files changed, 85 insertions(+), 12 deletions(-)


-- 
2.35.1


