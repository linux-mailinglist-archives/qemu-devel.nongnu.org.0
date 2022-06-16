Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD754E83C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:00:34 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1srB-00077S-AU
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soF-0004PM-Tq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soC-0001vB-1d
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=iavVkJvGy6ecCXNXwOrMKmfKLNh4j8jPCdxE9vm5FEc=;
 b=hKOHJFv/g6gdIk2FEH2Uega4SB2JvNe9CBckJdOI+10TyL1bN9Nf/YxkoAhykYx5bu7ZMN
 ISth4wjngSLKKawY0a/kmrDWvA8uWVAFcg1SmtuHdsMFauUgwZqwebTJQFxmwzRsIP0TQn
 cYeDfOygDxtygwGWDOl2Th3za/cf/UM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-7Qu09_7EMY6azHBhvVMRYg-1; Thu, 16 Jun 2022 12:57:25 -0400
X-MC-Unique: 7Qu09_7EMY6azHBhvVMRYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l3-20020a05600c1d0300b0039c7efa2526so1145170wms.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=iavVkJvGy6ecCXNXwOrMKmfKLNh4j8jPCdxE9vm5FEc=;
 b=mbIFci0QykYZ93gg55bkCN3Tl5mictKIRQf2NwVhs2vF+Hnay+bApwXundlmgi53lG
 C1OZejIiIzye7RR8udcAEmMi1lfFuD5d73xKUNByEcIjzTV5+rP9UdH2pClOvj3/Ih4s
 PTiA/J69jSTb6lc0slj7IZsHSh3UzauHL33u1rw+LXPXt09Nq1U5tOKpX1RZzXKV0ZLu
 scYKPign7p9lH1WmcT4iNJ8GXc45nZx3Sx2S69g+WHc6vMr7rsiL+VJKJkj0r9STYuqs
 rWiqP5kC4fb1fsMm1/YZ6IL+MJjrXeXegPXnnLPi7P1AEXW1qgzBVJ+xmFUp97glxlg5
 rFRA==
X-Gm-Message-State: AJIora8mALyaEKtNkmNtUBj6AGv36WPVgOgftMALw+0/4dRTGnBBo9Et
 TKwfy03syLyQ9DV1kt6KOrK6ZnbmAFed1KlLDmHM8xCHOfCHB1WpBsNkW2nk9K7C6bv/sEnSpDw
 ha6ks3CKh+6pngGI4730mXVFHhrBWbO0VsurIxVYdH9qkmU/HG5Db1OF+v5M1
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr5533844wrb.607.1655398643749; 
 Thu, 16 Jun 2022 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMEfznvLaGtGq7apWw7sFGvKaiV1u3KKuhCkhBacIBed2n4BC/qVoua00iYcQPIZ3BTV8bvw==
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr5533815wrb.607.1655398643380; 
 Thu, 16 Jun 2022 09:57:23 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b00215859413f3sm2259793wrw.107.2022.06.16.09.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:22 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/10] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

The following changes since commit def6fd6c9ce9e00a30cdd0066e0fde206b3f3d2f:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-06-16 07:13:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 8c97e4deeca9ad791ab369d3879ebfb0267b24ca:

  acpi/erst: fix fallthrough code upon validation failure (2022-06-16 12:54:58 -0400)

----------------------------------------------------------------
virtio,pc,pci: fixes,cleanups,features

more CXL patches
RSA support for crypto
fixes, cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (1):
      acpi/erst: fix fallthrough code upon validation failure

Jonathan Cameron (3):
      pci-bridge/cxl_upstream: Add a CXL switch upstream port
      pci-bridge/cxl_downstream: Add a CXL switch downstream port
      docs/cxl: Add switch documentation

Ni Xun (1):
      vhost: also check queue state in the vhost_dev_set_log error routine

Yajun Wu (1):
      virtio/vhost-user: Fix wrong vhost notifier GPtrArray size

Zhenwei Pi (1):
      crypto: Introduce RSA algorithm

Zhenzhong Duan (3):
      virtio-iommu: Add bypass mode support to assigned device
      virtio-iommu: Use recursive lock to avoid deadlock
      virtio-iommu: Add an assert check in translate routine

 include/hw/cxl/cxl.h              |   5 +
 include/hw/virtio/virtio-crypto.h |   5 +-
 include/hw/virtio/virtio-iommu.h  |   4 +-
 include/sysemu/cryptodev.h        |  83 ++++++++--
 backends/cryptodev-builtin.c      | 276 ++++++++++++++++++++++++++++-----
 backends/cryptodev-vhost-user.c   |  34 +++-
 backends/cryptodev.c              |  32 ++--
 hw/acpi/erst.c                    |   3 +
 hw/cxl/cxl-host.c                 |  43 ++++-
 hw/pci-bridge/cxl_downstream.c    | 249 +++++++++++++++++++++++++++++
 hw/pci-bridge/cxl_upstream.c      | 216 ++++++++++++++++++++++++++
 hw/virtio/vhost-user.c            |   2 +-
 hw/virtio/vhost.c                 |   4 +
 hw/virtio/virtio-crypto.c         | 319 ++++++++++++++++++++++++++++++--------
 hw/virtio/virtio-iommu.c          | 135 ++++++++++++++--
 docs/system/devices/cxl.rst       |  88 ++++++++++-
 hw/pci-bridge/meson.build         |   2 +-
 hw/virtio/trace-events            |   1 +
 18 files changed, 1343 insertions(+), 158 deletions(-)
 create mode 100644 hw/pci-bridge/cxl_downstream.c
 create mode 100644 hw/pci-bridge/cxl_upstream.c


