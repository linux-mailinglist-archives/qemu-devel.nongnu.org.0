Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837448C015
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:39:21 +0100 (CET)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZA8-0007VE-J7
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3k-0003ae-49
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3g-0002dI-6H
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641976358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CwAYOAkdHUxQqBo6xtw/pfjbdDWX4dFWeZf4rG48NeM=;
 b=NG3nUmpeudDA1Yu9G2I+16Vp185lYEnsIzvvnsULe1aVm9/JYQ6TEoZScnbA2TtB5PtHPT
 CajSepKrRgD1TLfaAg+1QXCEyRSvepsSBHVGLihuA5FPS922GJjE66Ex6YPS3QcNZd1Bbv
 4C9ZlcZIW4LfL6ScwTcuLkvUZgpmQIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-meWHHIy4O_KcA4PlpVcqgw-1; Wed, 12 Jan 2022 03:32:34 -0500
X-MC-Unique: meWHHIy4O_KcA4PlpVcqgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD1CA2F27;
 Wed, 12 Jan 2022 08:32:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-115.pek2.redhat.com
 [10.72.13.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6357315C;
 Wed, 12 Jan 2022 08:32:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 00/13] Net patches
Date: Wed, 12 Jan 2022 16:32:07 +0800
Message-Id: <20220112083220.51806-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 64c01c7da449bcafc614b27ecf1325bb08031c84:

  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' into staging (2022-01-11 11:39:31 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 99420f216cf5cd2e5c09e0d491b9e44d16030aba:

  net/vmnet: update MAINTAINERS list (2022-01-12 16:27:19 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Peter Foley (2):
      net/tap: Set return code on failure
      net: Fix uninitialized data usage

Philippe Mathieu-Daudé (1):
      hw/net/vmxnet3: Log guest-triggerable errors using LOG_GUEST_ERROR

Rao Lei (1):
      net/filter: Optimize filter_send to coroutine

Vladislav Yaroshchuk (7):
      net/vmnet: add vmnet dependency and customizable option
      net/vmnet: add vmnet backends to qapi/net
      net/vmnet: implement shared mode (vmnet-shared)
      net/vmnet: implement host mode (vmnet-host)
      net/vmnet: implement bridged mode (vmnet-bridged)
      net/vmnet: update qemu-options.hx
      net/vmnet: update MAINTAINERS list

Zhang Chen (2):
      net/colo-compare.c: Optimize compare order for performance
      net/colo-compare.c: Update the default value comments

 MAINTAINERS                   |   5 +
 hw/net/vmxnet3.c              |   4 +-
 meson.build                   |  16 +-
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/colo-compare.c            |  28 ++--
 net/filter-mirror.c           |  66 +++++++--
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/tap-linux.c               |   1 +
 net/tap.c                     |   1 +
 net/vmnet-bridged.m           | 111 ++++++++++++++
 net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 105 ++++++++++++++
 net/vmnet-shared.c            |  91 ++++++++++++
 net/vmnet_int.h               |  48 ++++++
 qapi/net.json                 | 132 ++++++++++++++++-
 qemu-options.hx               |  25 ++++
 scripts/meson-buildoptions.sh |   3 +
 19 files changed, 965 insertions(+), 31 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h


