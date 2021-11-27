Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9045FD3D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 08:34:00 +0100 (CET)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqsDe-0001kX-KD
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 02:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9V-0007hn-Hn
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9Q-0002Ab-KJ
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TCie3oqDboqlsv9myvdhPC56GuUsoDHAoEOU36URlTU=;
 b=fA6S8fzl8BAcs0MXbtN3But5NzydveCZiPDPYb6zNZMIRv5M5pgxH2kobb7o3ZhaCIswwC
 ODCWgsBuuGgb5WErTHj8rs8g+Ewn48OJL8Dy7USEtCaTLa/ONrn/zKOx4IWxyq63mxHY+J
 WRkXcgPgRDv3PmGHicufLdqbELY9YfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-VgqMYYLtMSGUJm6PiWHS2A-1; Sat, 27 Nov 2021 02:29:32 -0500
X-MC-Unique: VgqMYYLtMSGUJm6PiWHS2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01ED4801B01;
 Sat, 27 Nov 2021 07:29:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40977608BA;
 Sat, 27 Nov 2021 07:29:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 0/4] virtio-iommu: config related fixes and qtest
Date: Sat, 27 Nov 2021 08:29:06 +0100
Message-Id: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a qtest for the virtio-iommu device. The test
allowed to identify an endianess bug in the get_config().
We also remove the unneeded set_config() and fix the value
for domain_range.end field.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-test-v6

History:
v5 -> v6:
- added patches 1-3
- qtest: fix domain_range.end expected value

Eric Auger (4):
  virtio-iommu: Remove set_config callback
  virtio-iommu: Fix endianness in get_config
  virtio-iommu: Fix the domain_range end
  tests: qtest: Add virtio-iommu test

 hw/virtio/trace-events            |   3 +-
 hw/virtio/virtio-iommu.c          |  38 ++--
 tests/qtest/libqos/meson.build    |   1 +
 tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
 tests/qtest/libqos/virtio-iommu.h |  40 ++++
 tests/qtest/meson.build           |   1 +
 tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
 7 files changed, 511 insertions(+), 24 deletions(-)
 create mode 100644 tests/qtest/libqos/virtio-iommu.c
 create mode 100644 tests/qtest/libqos/virtio-iommu.h
 create mode 100644 tests/qtest/virtio-iommu-test.c

-- 
2.26.3


