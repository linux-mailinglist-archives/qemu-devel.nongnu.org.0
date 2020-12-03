Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0D2CD3C1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:36:40 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklyZ-0008MN-4c
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwn-0007D7-C5
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:49 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwl-0003Bl-Fj
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:49 -0500
Received: by mail-lj1-x234.google.com with SMTP id r18so2006132ljc.2
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBtwfHxcK5xANpYrZVKPQ/ksQZGqD/6GF+EGdoIyzMo=;
 b=HYZdZrVWky04o/0t3xEbUOT0JKA52tIh/D4ZIUiOh5XD0tnXxUDdW78WC7CUGfAI9R
 Q6uPdpeGJ3riBghNMnG0MG+9WOwc1+p7dbQEgc8FJeFtXAac0a8WqPn6Ld+/8+uQuIKP
 nkFe0ETnO/WTM4XtGR0zdiJ96r3gTFZMPOjGG6sCQWew3m+Pn8RvdHrSdkLq9C13pPBc
 46DTJ0eFyAm2ki6sk71jYQmVeKy7txIazzMfTu16e3EK8CWT+iQs3rwYwDmq6W3ekrQU
 fdJmG2sa4Bjf7AgH7Mo0yOxMaAEdjZgVbkMOhkuhrzdrKCMEsukUAvDVfkSCiS9XwYMh
 gNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBtwfHxcK5xANpYrZVKPQ/ksQZGqD/6GF+EGdoIyzMo=;
 b=PjsgdhUC6V56hTVD1e5YdO3wApc0OL6/xEWbPckUAt5jwcQ8q+hOCaxawJatlx4Hq0
 WSJpFiKtsCWs8LVmXdg/TEaGJK+3foJdxSaA+PRECTIVOq93yXuAMFhHvqbrxWggWDiP
 iDRx2TQrY9EKxDS6Ech9YuWu0ENfsp0OgEQV+I+BtZpjPfqrkhFZRENmZadUy+1ScEk/
 +xZIaJ++bPuRyIiRdY7Hy434KlUeEw+RNoR2vJC76NEYsBX4tPz/UWK0dwYkl8/iciK3
 nY0Jf4boyol9a5T9hvqYC6vGgLU/H0h/uAtFjWaQGiRfLNX6DoNPMs5DImrUm27Sv6GM
 OQ+g==
X-Gm-Message-State: AOAM532Wgsz3ZAMgznFn2DDt62QCyq0jv/EZRr0BPdRet/SFouRl5HcS
 HTm6ewCDCC9Os87H0ThHW/UXJT03muNYhQ==
X-Google-Smtp-Source: ABdhPJzdzYm2AX/K1KUETHqXOhnzaWOq2rIfXxAckMTSDI1aLLIyafC4+itFO3PGGDtzTH0Hz/ktxg==
X-Received: by 2002:a2e:8546:: with SMTP id u6mr918228ljj.125.1606991684902;
 Thu, 03 Dec 2020 02:34:44 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q129sm281361ljb.81.2020.12.03.02.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 02:34:44 -0800 (PST)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] hw/virtio-pci: AER capability
Date: Thu,  3 Dec 2020 13:07:11 +0200
Message-Id: <20201203110713.204938-1-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::234;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Main motivation:
According to Microsoft driver\device certification requirements
for next version of Window Server, PCIe device must support AER.
"Windows Server PCI Express devices are required to support
Advanced Error Reporting [AER] as defined in
PCI Express Base Specification version 2.1."

AER capability for virtio-pci is disabled by default.
AER capability is only for PCI with PCIe interface on PCIe bus.
During migration - device "realize" should initialize AER
if requested by device properties.
Fixed commit message.

Andrew (2):
  hw/virtio-pci Added counter for pcie capabilities offsets.
  hw/virtio-pci Added AER capability.

 hw/virtio/virtio-pci.c | 20 +++++++++++++++++++-
 hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.29.2


