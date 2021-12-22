Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927CB47D119
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:37:11 +0100 (CET)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzvi-0003hh-Kl
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:37:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsW-0000nW-9R
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsS-00070u-Pr
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RAkllm2E8hvFab+U66jSkRjtIz/2yb4LcmWh8vtiipM=;
 b=h+r4WFPQoi0t4BHYbPFyQJIfyYAos6vCgmWwOsXtFGcaL+sTVCu2pDZB9PMzXjou9HkV+7
 SWxpavdVIc8oadHw2kMnXLMdPih94Y5OLBFpUw2axB2QOIuRlMRgFB7cRIh1xWhxKjIeMB
 IFZpGqZxkNLMysHWi+kR4+Pc87IUnTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-SLOr-nXbMbWeatZMyAq5pQ-1; Wed, 22 Dec 2021 06:33:44 -0500
X-MC-Unique: SLOr-nXbMbWeatZMyAq5pQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A02631006AA4;
 Wed, 22 Dec 2021 11:33:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746EF7B01D;
 Wed, 22 Dec 2021 11:33:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] qtest fixes and improvements
Date: Wed, 22 Dec 2021 12:32:50 +0100
Message-Id: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 8c5f94cd4182753959c8be8de415120dc879d8f0:

  Merge tag 'pull-loong-20211221-2' of https://gitlab.com/rth7680/qemu into staging (2021-12-21 13:30:35 -0800)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-12-22

for you to fetch changes up to e63ed64c6d10768b3a41c3337226372a9664ef6f:

  tests/qtest/virtio-net-failover: Use g_file_open_tmp() to create temporary file (2021-12-22 09:37:14 +0100)

----------------------------------------------------------------
* Fixes for the virtio-net-failover test
* Silence warnings in the boot-serial-test
* Make qtests more flexible wrt missing machines and devices

----------------------------------------------------------------
Laurent Vivier (1):
      failover: Silence warning messages during qtest

Thomas Huth (7):
      tests/qtest/boot-serial-test: Silence the warning about deprecated sga device
      tests/qtest: Make the filter tests independent from a specific NIC
      tests/qtest: Add a function that checks whether a device is available
      tests/qtest: Improve endianness-test to work with missing machines and devices
      tests/qtest/cdrom-test: Check whether devices are available before using them
      tests/qtest/boot-order-test: Check whether machines are available
      tests/qtest/virtio-net-failover: Use g_file_open_tmp() to create temporary file

Zhang Chen (1):
      MAINTAINERS: Update COLO Proxy section

 MAINTAINERS                          |  1 +
 hw/net/virtio-net.c                  |  7 ++++-
 migration/migration.c                |  4 ++-
 tests/qtest/boot-order-test.c        |  5 +++
 tests/qtest/boot-serial-test.c       | 10 +++---
 tests/qtest/cdrom-test.c             | 60 +++++++++++++++++++++++-------------
 tests/qtest/endianness-test.c        |  5 ++-
 tests/qtest/libqos/libqtest.h        |  8 +++++
 tests/qtest/libqtest.c               | 44 ++++++++++++++++++++++++++
 tests/qtest/meson.build              | 40 ++++++++++++++++++------
 tests/qtest/test-filter-mirror.c     | 10 ++----
 tests/qtest/test-filter-redirector.c | 20 +++---------
 tests/qtest/test-netfilter.c         |  8 +----
 tests/qtest/virtio-net-failover.c    |  8 +++--
 14 files changed, 158 insertions(+), 72 deletions(-)


