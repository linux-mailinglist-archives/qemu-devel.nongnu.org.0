Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0D148E37C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 06:14:04 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8EuY-00086a-Fh
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 00:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8EqC-0005hd-NF
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Eq8-0001Np-RH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642136967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YRTa5i6gTUCkHwNVWWmki0S5VDHZVK0W7hHaxbOcS18=;
 b=cgUAPeCPaQtVA44AnVwwXejcLU689mNdUXK1ycPb7QbGpsUsHPiPzVwPculkb916TfQ/aw
 rS5zvNWW//YDuh0G7vnyrhRb5SYOthrSWXOIX6sAtcKSc5leA/aACh916tk6ejIvt/Bhoq
 vWi0Fi9kGQ3B8nDVKfGmtluHhOzO5Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-J097QaZXOYO_e0bZpQ0YEA-1; Fri, 14 Jan 2022 00:09:15 -0500
X-MC-Unique: J097QaZXOYO_e0bZpQ0YEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87378185302A;
 Fri, 14 Jan 2022 05:09:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70F2D108A9;
 Fri, 14 Jan 2022 05:09:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V3 00/13] Net patches
Date: Fri, 14 Jan 2022 13:08:56 +0800
Message-Id: <20220114050909.27133-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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

The following changes since commit f8d75e10d3e0033a0a29a7a7e4777a4fbc17a016:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220112' into staging (2022-01-13 11:18:24 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 818692f0a01587d02220916b31d5bb8e7dced611:

  net/vmnet: update MAINTAINERS list (2022-01-14 12:58:19 +0800)

----------------------------------------------------------------

Changes since V2:

- Try to make vmnet work on some old mac version

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
 net/vmnet-bridged.m           | 120 +++++++++++++++
 net/vmnet-common.m            | 333 ++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 122 ++++++++++++++++
 net/vmnet-shared.c            | 100 +++++++++++++
 net/vmnet_int.h               |  48 ++++++
 qapi/net.json                 | 133 ++++++++++++++++-
 qemu-options.hx               |  25 ++++
 scripts/meson-buildoptions.sh |   3 +
 19 files changed, 1004 insertions(+), 31 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h


