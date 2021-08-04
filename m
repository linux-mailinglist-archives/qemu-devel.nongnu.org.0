Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045453DFA14
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 05:49:26 +0200 (CEST)
Received: from localhost ([::1]:54380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB7uG-0008OB-IZ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 23:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tG-0006hd-4T
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tE-0000IV-68
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628048899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y8PvCQW4AWnCayFQZzAEaIJirTE+KK7FiT7oPXlf92g=;
 b=J3anmlMeUphhho/6smgwQPEZIZb9jK8hts8Gsu1T12e7tkL4RSjySjIm8DFpW5Zf/aWkja
 xXtV0can4piyL+xoqGmqFnYxpC3rfLfCYF/7kasJVLNE/pp4DF/RemM/t746tlx68UY55i
 DVmDyZ845bRssA0achiB0usEiWgKwbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-W9Umhp92Or-ii80zUThQHA-1; Tue, 03 Aug 2021 23:48:18 -0400
X-MC-Unique: W9Umhp92Or-ii80zUThQHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465AB801B3C;
 Wed,  4 Aug 2021 03:48:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431C4781E8;
 Wed,  4 Aug 2021 03:48:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Date: Wed,  4 Aug 2021 11:48:00 +0800
Message-Id: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, Jason Wang <jasowang@redhat.com>, Wei.Huang2@amd.com,
 dgilbert@redhat.com, peterx@redhat.com, Sriyash.Caculo@amd.com,
 pbonzini@redhat.com, chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi:

We currently try to enable device IOTLB when iommu_platform is
set. This may lead unnecessary trasnsactions between qemu and vhost
when vIOMMU is not used (which is the typical case for the encrypted
VM).

So patch tries to use transport specific method to detect the enalbing
of vIOMMU and enable the device IOTLB only if vIOMMU is enalbed.

Please review.

Thanks

Jason Wang (3):
  virtio-bus: introduce iommu_enabled()
  virtio-pci: implement iommu_enabled()
  vhost: correctly detect the enabling IOMMU

 hw/virtio/vhost.c              |  2 +-
 hw/virtio/virtio-bus.c         | 14 ++++++++++++++
 hw/virtio/virtio-pci.c         | 14 ++++++++++++++
 include/hw/virtio/virtio-bus.h |  4 +++-
 4 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.25.1


