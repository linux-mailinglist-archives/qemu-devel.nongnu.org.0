Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8307B6ECB39
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquGw-0000rC-G3; Mon, 24 Apr 2023 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGp-0000ox-5a
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGi-00056F-Sz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:10 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso18432182e87.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682335317; x=1684927317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hjv2ghBE76zbj8HVMab4fk/OqfGI6I9Ivr921PCqQDY=;
 b=lFT1js+seoNPclOF0gG/3BkgJWeAucwxpd0KNvj+sAZ5TmHnDyGroSSfJp20eDoccs
 stJrUDfYMNnr6lZ1DYQNq5RzRP9M/u/4p4gCOtaK9zSNX8M8IYs1/xouqbc7Bz5T70FO
 vLhSHFVz9NnuN2qoKuTXjYWH5OokRjBuUtnP7aIJ3YZRgjmoXxkauEEtXHtiQZ1MLMzy
 jEKdYl1j3vCztGXyHvvurPJl7OIInrSnp77M2VCGhKNi6fpGNzD/uIPjYhJNQcXBNymC
 WwD3426GUCWL4PoKkIBFtAV/uaaioWkxxMwQki0fEmP7UcnctJ+woMxG1ZPBUTKvBdgn
 24BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682335317; x=1684927317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hjv2ghBE76zbj8HVMab4fk/OqfGI6I9Ivr921PCqQDY=;
 b=lkhTCoedbm8lJdH8CHuZxqTQ8jUbynZ+5l7v/U71oeX5L9KjU0Jepc9qsMVG7Z3DlU
 6PnsdlfeY0Hfpde1AR6GXtK96lQ7abqyupNVB5Zych45P4MZed6QF2osX/nCUpsVeMJK
 yuqrn0Vzy2H1Pwgo/7TDlPLlvu3p60oLL1S1ifzeOq8OiIyEAh2VIDfpiFX9U0J5AEtf
 WNgSyOzLeogslWpeVTzOzpPYTj9GHP9cjIYHRth7d0xuOHQ+qPn5UjudoUwnHdSNqPh3
 ovqX6XUiwL6Z4PuvjNDmB/XEyb1MamJbB7I6urWm0i6mc1n4iciiSQfI4rIJUaj/PDn/
 Nw7g==
X-Gm-Message-State: AAQBX9cr9u3XXEFF05vUBWmQio32QmCTHhbgV4JUlkxBX4EsLwWafMZC
 tyTqh5xnHswsBzGDE1s2BAJrHw==
X-Google-Smtp-Source: AKy350bqeFEPuGT1oW8HVlVOxWc8AmHxX9Mc5sqnOO2CpKpIkm3dOaO8gIOxerLwNnZsABC0cAmesw==
X-Received: by 2002:a05:6512:1081:b0:4ec:9d13:9d09 with SMTP id
 j1-20020a056512108100b004ec9d139d09mr4666643lfg.34.1682335317424; 
 Mon, 24 Apr 2023 04:21:57 -0700 (PDT)
Received: from localhost.localdomain ([80.250.80.22])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a19f501000000b004eff0bcb276sm415542lfb.7.2023.04.24.04.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 04:21:56 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com, Viktor Prutyanov <viktor@daynix.com>
Subject: [RFC PATCH 0/4] vhost: register and change IOMMU flag depending on
 ATS state
Date: Mon, 24 Apr 2023 14:21:43 +0300
Message-Id: <20230424112147.17083-1-viktor@daynix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x134.google.com
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
  virtio-pci: add handling of ATS state change
  memory: add interface for triggering IOMMU notify_flag_changed handler
  vhost: register and change IOMMU flag depending on ATS state

 hw/pci/pci.c                |  1 +
 hw/pci/pcie.c               | 21 +++++++++++++++++++++
 hw/virtio/vhost.c           | 23 +++++++++++++++++++++--
 hw/virtio/virtio-pci.c      | 12 ++++++++++++
 include/exec/memory.h       |  2 ++
 include/hw/pci/pci_device.h |  3 +++
 include/hw/pci/pcie.h       |  4 ++++
 include/hw/virtio/virtio.h  |  2 ++
 softmmu/memory.c            | 12 ++++++++++++
 9 files changed, 78 insertions(+), 2 deletions(-)

-- 
2.21.0


