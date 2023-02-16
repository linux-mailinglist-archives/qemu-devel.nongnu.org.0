Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C2698BDE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWl9-0006Gd-Lr; Thu, 16 Feb 2023 00:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWl1-0006G3-OO
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWl0-0008On-0p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DJ2ndHDUeZt3MMhQOCWhowCX8kiINFbK5xPfh4luxPQ=;
 b=HDrbeVMD/xnv8yO8OVY1rgj9wUknaFU5S3wVBNcaWOBq5kKb/e5w7DWaZcX8USfrO1JVOn
 PSoDuPLVFqHlMbuKk37MNHgiCFhwKCh3OkXzrck64FrE5SiiAtFalO4FtHXSyoacagUO6I
 4usqAxxTDs0HtwNaTHGVjNmJwjdBHVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-fa4l9Y7nPHiJXzWvkmk7Mg-1; Thu, 16 Feb 2023 00:24:29 -0500
X-MC-Unique: fa4l9Y7nPHiJXzWvkmk7Mg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74DB81C05AC1;
 Thu, 16 Feb 2023 05:24:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-253.pek2.redhat.com
 [10.72.12.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9100492B0E;
 Thu, 16 Feb 2023 05:24:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 00/10] Net patches
Date: Thu, 16 Feb 2023 13:24:14 +0800
Message-Id: <20230216052424.50926-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:

  Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 5e53a346d8bd2bd22522e1e7abd8f122673e4adf:

  vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-16 13:17:57 +0800)

----------------------------------------------------------------

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

Qiang Liu (2):
      hw/net/lan9118: log [read|write]b when mode_16bit is enabled rather than abort
      hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()

Thomas Huth (3):
      net: Move the code to collect available NIC models to a separate function
      net: Restore printing of the help text with "-nic help"
      net: Replace "Supported NIC models" with "Available NIC models"

 hw/net/can/xlnx-zynqmp-can.c |   9 +++-
 hw/net/lan9118.c             |  17 ++++----
 hw/net/vmxnet3.c             |   2 +-
 hw/pci/pci.c                 |  29 +------------
 include/net/net.h            |  14 ++++++
 net/l2tpv3.c                 |   2 +-
 net/net.c                    |  50 +++++++++++++++++++--
 net/stream.c                 |  53 ++++++++++++++++++++++-
 net/vhost-vdpa.c             |   2 +-
 net/vmnet-common.m           |  48 ++++++++++++++------
 net/vmnet_int.h              |   2 +
 qapi/net.json                |   7 ++-
 qemu-options.hx              |   6 +--
 tests/qtest/netdev-socket.c  | 101 +++++++++++++++++++++++++++++++++++++++++++
 14 files changed, 280 insertions(+), 62 deletions(-)



