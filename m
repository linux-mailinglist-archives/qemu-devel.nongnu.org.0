Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7BD6F2BE7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 04:03:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptIsB-0003pt-1d; Sun, 30 Apr 2023 22:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs6-0003p7-G9
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:37 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs3-0003Ef-Ew
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:33 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eff4ea8e39so2439641e87.1
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 19:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682906549; x=1685498549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1nufk2HahRxXKXwWBifUuFP7nUKI+u9wU8VpXxR3q1w=;
 b=GECHrjGmphSGWjl1d/MWvbbmoTB9ol7hdo/YI2WoOfGNUaNNbklqVVMKTtl87N2Dzf
 4OT6MLQUJAqKbXbhKh4uK0D59utFRbr/B/RxxphvpBh8pDBhimuNQTIoB//tdt5SfVo3
 nFk279jryys34Upu1cWqJcgSB73CJg9PcfOOcWVtCIC0ngn7UJZKM4ekIOiFsbFnYnJ/
 nq7E+es/Z9lDFIkBoTqYSxKJu72jDOhWJzcKdFpsm+sjcLmePHJT8084HfIJ8e55jUkE
 LiTua2dQ5ed+SL2oS6c2SJOJ2sJ3q+FpQKBKGZWucfN+LgFcgPnI0cMzF0RlMm+hhZUm
 DwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682906549; x=1685498549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1nufk2HahRxXKXwWBifUuFP7nUKI+u9wU8VpXxR3q1w=;
 b=OjWzUxcjolVCn6lVI6FAxmh3daGXH8VHUz6WX8XDoUdJ0kRhTQKzKr7RXW4UpTfa5z
 kvRGco0MtZMxXcuWxgoWqEe4JDcRCsM1km8yPLkcIIaEc9MW66ik+wJMcr2SueD+Rk6F
 phgIBnVlk6UB2GuOF1tS9E9L+B9svUMdbEuESDCw0hBnp6pi22iEZ6OWe7n3rbEmceP3
 Ug8WFSfAd1ckqXPcdwlqLI8hbttsvRDTJfhpC44vcNLmhPn2jIvlEzpENDR3titPQtOx
 DGla4noLddVoBJGMNnWDP/vNZFeHqZV3tzCBzQ72X27DDWdg/UU3plZqAgNWZWZ1FlmT
 E/tQ==
X-Gm-Message-State: AC+VfDwpTy68p4sVcgbGW4uWrl+xHDmWGutRPQXBCmFNpNpWVXBfk2Dr
 3Xz2p37JEzqShagPvlldnk9WEg==
X-Google-Smtp-Source: ACHHUZ44V7M9Io0014WxZoLQJRvJRQosDB1e2O68HapwtHzXO9lNMqNk/3QEkV+oglQapXOoTSuehw==
X-Received: by 2002:a19:5214:0:b0:4ed:ca3b:40f0 with SMTP id
 m20-20020a195214000000b004edca3b40f0mr3240214lfb.9.1682906549297; 
 Sun, 30 Apr 2023 19:02:29 -0700 (PDT)
Received: from vp-pc.. (109-252-127-135.nat.spd-mgts.ru. [109.252.127.135])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm3783271lfk.306.2023.04.30.19.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:02:29 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, peterx@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH v2 0/4] vhost: register and change IOMMU flag depending on
 ATS state
Date: Mon,  1 May 2023 05:02:17 +0300
Message-Id: <20230501020221.188376-1-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12f;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x12f.google.com
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

Viktor Prutyanov (4):
  pci: add handling of Enable bit in ATS Control Register
  virtio-pci: add handling of ATS and Device-TLB enable
  vhost: register and change IOMMU flag depending on Device-TLB state
  virtio-net: pass Device-TLB enable/disable events to vhost

 hw/net/vhost_net.c                | 11 +++++++++++
 hw/net/virtio-net.c               |  8 ++++++++
 hw/pci/pcie.c                     | 22 ++++++++++++++++++++++
 hw/virtio/vhost-backend.c         |  6 ++++++
 hw/virtio/vhost.c                 | 26 ++++++++++++++++++++++++--
 hw/virtio/virtio-pci.c            | 17 +++++++++++++++++
 include/hw/pci/pcie.h             |  5 +++++
 include/hw/virtio/vhost-backend.h |  4 ++++
 include/hw/virtio/vhost.h         |  1 +
 include/hw/virtio/virtio.h        |  2 ++
 include/net/vhost_net.h           |  2 ++
 11 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.35.1


