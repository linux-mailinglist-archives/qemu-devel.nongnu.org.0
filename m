Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6A69A53E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 06:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pStXN-0000Xu-As; Fri, 17 Feb 2023 00:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStX7-0000WL-7g
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:43:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStX5-0001Jp-8S
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676612622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ic1JKR5CAcdTwH23Dc7G3PiC1Iggt3ZW1Vl8VSHToXk=;
 b=VyIxox4B+pROWin9MqMnca9LJDzR2TlRf6/QhvGNaVlnzNphCYSKnDjqdrBdFXLAfz2bG1
 +6TsCIx9sQrnjhfpiDf9VWayu9M6ysLgcNMz27wZmnF+Whb46BGDsvCkEGnm87EX2jHE9M
 FQwvUodN5iRdw8UHRt0C5shD5ojNCdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-zZkFXyn9PsWGIaVYIXHZMg-1; Fri, 17 Feb 2023 00:43:40 -0500
X-MC-Unique: zZkFXyn9PsWGIaVYIXHZMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 217E43815F7D;
 Fri, 17 Feb 2023 05:43:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D33B492B15;
 Fri, 17 Feb 2023 05:43:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL V3 0/9] Net patches
Date: Fri, 17 Feb 2023 13:43:26 +0800
Message-Id: <20230217054335.57595-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 525ae115222f0b0b6de7f9665976f640d18c200a:

  vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-17 13:31:33 +0800)

----------------------------------------------------------------

Changes since V2:
- drop patch hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()

Changes since V1:
- Fix the wrong guest error detection in xlnx-zynqmp-can

----------------------------------------------------------------
Christian Svensson (1):
      net: Increase L2TPv3 buffer to fit jumboframes

Eugenio Pérez (1):
      vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check

Fiona Ebner (1):
      hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value

Joelle van Dyne (1):
      vmnet: stop recieving events when VM is stopped

Laurent Vivier (1):
      net: stream: add a new option to automatically reconnect

Qiang Liu (1):
      hw/net/lan9118: log [read|write]b when mode_16bit is enabled rather than abort

Thomas Huth (3):
      net: Move the code to collect available NIC models to a separate function
      net: Restore printing of the help text with "-nic help"
      net: Replace "Supported NIC models" with "Available NIC models"

 hw/net/lan9118.c            |  17 ++++----
 hw/net/vmxnet3.c            |   2 +-
 hw/pci/pci.c                |  29 +------------
 include/net/net.h           |  14 ++++++
 net/l2tpv3.c                |   2 +-
 net/net.c                   |  50 ++++++++++++++++++++--
 net/stream.c                |  53 ++++++++++++++++++++++-
 net/vhost-vdpa.c            |   2 +-
 net/vmnet-common.m          |  48 +++++++++++++++------
 net/vmnet_int.h             |   2 +
 qapi/net.json               |   7 ++-
 qemu-options.hx             |   6 +--
 tests/qtest/netdev-socket.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
 13 files changed, 272 insertions(+), 61 deletions(-)


