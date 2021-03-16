Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9B33DAAA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:21:37 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDNw-0002vH-J8
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9F-0003GX-MG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9D-0005Nw-I4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dGiB3vWvrVlYUe0UxxWpZkr1TbCa/uSCxoIWTfjcFVg=;
 b=hc0SWWq3/qLnpy4RKEs+VIJ7l+ks6/9Cn9yT2pwVdrVBrx/CTd5Ax2RNqYW96e1H1B6c0m
 DDZazbXHfqZWyNpGEiJaEIVa682D7aX2sP9Tl9FOyYzlqbIIyKJ4hTbEFmEtJY/Iu/i/3A
 oe6trhhdR57UcC18AT4iUyq52ufNGn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-mveVZiv1NLeH0hvb0dTwYw-1; Tue, 16 Mar 2021 13:06:19 -0400
X-MC-Unique: mveVZiv1NLeH0hvb0dTwYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DBCE801596;
 Tue, 16 Mar 2021 17:06:17 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97DD60C13;
 Tue, 16 Mar 2021 17:06:03 +0000 (UTC)
Subject: [PULL 00/10] VFIO updates for QEMU 6.0
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:06:04 -0600
Message-ID: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a resend of the same sent on 2021-03-11 where 00/10 and 02/10
were eaten by the mail server.  Rebased to current staging and re-tagged.

The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-request' into staging (2021-03-16 13:17:54 +0000)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210316.0

for you to fetch changes up to 758b96b61d5cbc19204f340012d5a325f0a2105b:

  vfio/migrate: Move switch of dirty tracking into vfio_memory_listener (2021-03-16 10:06:44 -0600)

----------------------------------------------------------------
VFIO update 2021-03-16

 * Fix "listerner" typo (Zenghui Yu)

 * Inclusive language and MAINTAINERS update (Philippe Mathieu-Daudé)

 * vIOMMU unmap notifier fixes (Eric Auger)

 * Migration fixes and optimizations (Shenming Lu)

 * Use host page size for dirty bitmap (Kunkun Jiang)

 * Use log_global_start/stop to switch dirty tracking (Keqian Zhu)

----------------------------------------------------------------
Eric Auger (2):
      vfio: Do not register any IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
      spapr_iommu: Fix vhost integration regression

Keqian Zhu (1):
      vfio/migrate: Move switch of dirty tracking into vfio_memory_listener

Kunkun Jiang (1):
      vfio: Support host translation granule size

Philippe Mathieu-Daudé (2):
      hw/vfio/pci-quirks: Replace the word 'blacklist'
      MAINTAINERS: Cover docs/igd-assign.txt in VFIO section

Shenming Lu (3):
      vfio: Move the saving of the config space to the right place in VFIO migration
      vfio: Set the priority of the VFIO VM state change handler explicitly
      vfio: Avoid disabling and enabling vectors repeatedly in VFIO migration

Zenghui Yu (1):
      vfio: Fix vfio_listener_log_sync function name typo

 MAINTAINERS          |   1 +
 hw/ppc/spapr_iommu.c |   5 +++
 hw/vfio/common.c     | 103 ++++++++++++++++++++++++++++++++++-----------------
 hw/vfio/migration.c  |  63 +++++++++----------------------
 hw/vfio/pci-quirks.c |  14 +++----
 hw/vfio/pci.c        |  24 +++++++++---
 hw/vfio/pci.h        |   2 +-
 hw/vfio/trace-events |   2 +-
 8 files changed, 119 insertions(+), 95 deletions(-)


