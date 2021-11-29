Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1E461725
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:57:01 +0100 (CET)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh9Q-0004pY-5D
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3o-0003MS-HE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3l-0002yh-U7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aBU4MfYr9g7aGUUOhcA6ksrr8ARs2Ykvk8DYef8Jw00=;
 b=Ft6IlCbiCjqt3tv1MDlTJCeOtWZ34Lh3zzgWWQQSzu+0lEgK8EyqTddK8MF6vOGx1UubIA
 VLzcJDOOBB2zPHeTre6dVOzfUtxzikjNPgXr3wASfgCJyiwRE1Y45CZeP6SdxzG+5ve7NK
 qmywbbtPlka2ILGBCOv7mCzYvDsKDnU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-S6IRK7aFOc2cHJLjFtlLoA-1; Mon, 29 Nov 2021 08:51:07 -0500
X-MC-Unique: S6IRK7aFOc2cHJLjFtlLoA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso13798712edt.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=aBU4MfYr9g7aGUUOhcA6ksrr8ARs2Ykvk8DYef8Jw00=;
 b=h3IQX98cnWyCCcWpXCAWz8P0puFvCXuug7xSEMdxfdVerYk37cmsnDIbWD8dV9dyFV
 NmV0GPhJ4x5whDvyc3x4z2CFFqOPMUmL/T0YY4xMQazKbkuJfhiId+ukPncAjK0PDA60
 DE9jmSD6VXv+9CZpzA/3+Lt4WK0xrUhfsFGlk4kv+EmF1zn2cdt0DCN/1I7WjMrsfXtf
 9IBIEFyzACJz4+HNh61VkF1WW5QalAxxM5OiApJlkUavsRg/HIT6UAxFBhN/v+BKEtL5
 Q+HXDyFnVKz00Nvczl8Q32hcPfvZ6HavxaPjUXzqQUv7cfAh5NF1bac0syKSEBys1jRl
 Iocg==
X-Gm-Message-State: AOAM533jfBogdS7BdcngsGVK/y/gcxJQnJHgayuog8MiKddiB68ibT7d
 rE/p4X/zIxbhdZ0FTewAXt5kcYr5LXLFYHGf+ZzMkyemIqy7i4eYiiCmSFAENSzq0aAxJKdAPOX
 K2Yezov561SyvpHnX8JDLWiP7bp+eDxZpzvsmTIn+3MNs1nn26sGXWmN0YHeK
X-Received: by 2002:a05:6402:42d4:: with SMTP id
 i20mr75956278edc.281.1638193865940; 
 Mon, 29 Nov 2021 05:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL1pb3YSPcTNpSEOxP3EURM8Rql5QO62ziz6asdO2QHEXxQbuAmigOeHT5qtirxZKUsRgZbA==
X-Received: by 2002:a05:6402:42d4:: with SMTP id
 i20mr75956250edc.281.1638193865661; 
 Mon, 29 Nov 2021 05:51:05 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id go10sm7514926ejc.115.2021.11.29.05.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:05 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] virtio,pci,pc: bugfixes
Message-ID: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dd4b0de45965538f19bb40c7ddaaba384a8c613a:

  Fix version for v6.2.0-rc2 release (2021-11-26 11:58:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to bacf58ca18f06f0b464466bf8c19945f19791feb:

  Fix bad overflow check in hw/pci/pcie.c (2021-11-29 08:49:36 -0500)

----------------------------------------------------------------
virtio,pci,pc: bugfixes

Lots of small fixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Cindy Lu (1):
      virtio-mmio : fix the crash in the vm shutdown

Daniella Lee (1):
      Fix bad overflow check in hw/pci/pcie.c

Eugenio Pérez (1):
      vdpa: Add dummy receive callback

Jason Wang (3):
      virtio-balloon: process all in sgs for free_page_vq
      virtio-balloon: correct used length
      intel-iommu: ignore leaf SNP bit in scalable mode

Laurent Vivier (1):
      failover: fix unplug pending detection

 hw/i386/intel_iommu_internal.h |  2 ++
 hw/acpi/pcihp.c                | 30 +++++++++++++++++++++++++++---
 hw/i386/intel_iommu.c          |  6 ++++++
 hw/pci/pcie.c                  |  4 ++--
 hw/virtio/virtio-balloon.c     | 13 ++++++++-----
 hw/virtio/virtio-mmio.c        | 12 ++++++++++++
 net/vhost-vdpa.c               |  8 ++++++++
 7 files changed, 65 insertions(+), 10 deletions(-)


