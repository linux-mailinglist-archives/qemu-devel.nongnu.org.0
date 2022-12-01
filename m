Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315663EA68
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:40:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0e9V-0007eI-9W; Thu, 01 Dec 2022 02:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e93-0007Zx-Au
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e91-0007jD-D0
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669880286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tVLwKY4LFtSIe0fmCIeA5Mt2PC+XVOMXUCJ1nJXOB3A=;
 b=KzJOcti/b5bWZUYPaQbji6I6yO4T3UFH9T5VUNGTpCIUmCFvQisnBriojLeT9CAhmPj76f
 Bk5D3+piOFcgbl9dFUFc/+HEtKIbfwC57hKgAbONeubjoYxOuM51oyGWHOSKBSkNOca4eA
 Lm/+saOrj8IpnAQvKQUnkhKSYhze45k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-MfYItZ9qMI-bw9uiJveSgA-1; Thu, 01 Dec 2022 02:38:05 -0500
X-MC-Unique: MfYItZ9qMI-bw9uiJveSgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso463460wms.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVLwKY4LFtSIe0fmCIeA5Mt2PC+XVOMXUCJ1nJXOB3A=;
 b=Eov6OS62rRFScoFW9zAeq2TzBbjmQ7BLpTKQEz8gzXwXIaspzzLWRRyYTdHt5TtQJI
 uChZgzsIMWmVh33D1ucbXUdsBfibQviKZ/pnE0GYr59HMlmeMsUyDb6VPnnGlHRMJi3Y
 95K6K7ycSvWkPA8/tIqflvnYLGJP+wPrqdQ+/vWZ7gqcXix4urFcbxVitPYxhXTw5d/O
 C/xCG09ASJAi/UBbVyL1k+HqMrulGFQ8+WbrcpyZSmOAFuqvg1budJxwb9tbdCw+mQlS
 9HMFsXv0PZUcotOLoEWb3TlbMh9vXubnxthlHK92rdha1j+vn/xrf+ujLPFVYKMEtin3
 Kp/A==
X-Gm-Message-State: ANoB5pkL3B26SnZ8eI4Qb1tWAGM5t3Xp6g3z1h+AvgmlLqhBZQKBzGU6
 iHmUli/SRiutXRDeLZO2nVG5nazAjRxQCbJ8aTw2YwtLgiVpLyeVP0mzvKltDUk7Zy9vISuUrGH
 NRDC3SUAbe9IHVc6g9sQU1jqBp1UVGMYcMLMNQhqlJcR/2Xqb2NqJj8i8SMpT
X-Received: by 2002:a05:600c:1e0f:b0:3cf:e9a4:3261 with SMTP id
 ay15-20020a05600c1e0f00b003cfe9a43261mr51885374wmb.41.1669880283822; 
 Wed, 30 Nov 2022 23:38:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OwUUo4dpZJxhIj3aAx4Oc8o4GOde0i15I4NI0UX7CSinM2EfRo9KZm76In/FeKERC70lZ7A==
X-Received: by 2002:a05:600c:1e0f:b0:3cf:e9a4:3261 with SMTP id
 ay15-20020a05600c1e0f00b003cfe9a43261mr51885350wmb.41.1669880283494; 
 Wed, 30 Nov 2022 23:38:03 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d4bcb000000b00241e7007905sm3657833wrt.75.2022.11.30.23.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:38:02 -0800 (PST)
Date: Thu, 1 Dec 2022 02:38:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/5] virtio: regression fix
Message-ID: <20221201073725.44585-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

The following changes since commit b7c61789e653086618d1825858a97b3d9891e822:

  virtio: disable error for out of spec queue-enable (2022-11-22 05:19:00 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 4987e5bf2e9262094fd89d2b8e4d5bd6c4c7312f:

  include/hw: VM state takes precedence in virtio_device_should_start (2022-12-01 02:30:18 -0500)

----------------------------------------------------------------
virtio: regression fix

Fixes regression with migration and vsock, as fixing that
exposes some known issues in vhost user cleanup, this attempts
to fix those as well. More work on vhost user is needed :)

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (4):
      tests/qtests: override "force-legacy" for gpio virtio-mmio tests
      hw/virtio: add started_vu status field to vhost-user-gpio
      hw/virtio: generalise CHR_EVENT_CLOSED handling
      include/hw: VM state takes precedence in virtio_device_should_start

Stefano Garzarella (1):
      vhost: enable vrings in vhost_dev_start() for vhost-user devices

 include/hw/virtio/vhost-user-gpio.h | 10 ++++++
 include/hw/virtio/vhost-user.h      | 18 ++++++++++
 include/hw/virtio/vhost.h           |  6 ++--
 include/hw/virtio/virtio.h          | 23 +++++++++---
 backends/cryptodev-vhost.c          |  4 +--
 backends/vhost-user.c               |  4 +--
 hw/block/vhost-user-blk.c           | 45 ++++-------------------
 hw/net/vhost_net.c                  |  8 ++---
 hw/scsi/vhost-scsi-common.c         |  4 +--
 hw/virtio/vhost-user-fs.c           |  4 +--
 hw/virtio/vhost-user-gpio.c         | 30 +++++++++-------
 hw/virtio/vhost-user-i2c.c          |  4 +--
 hw/virtio/vhost-user-rng.c          |  4 +--
 hw/virtio/vhost-user.c              | 71 +++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-vsock-common.c      |  4 +--
 hw/virtio/vhost.c                   | 44 ++++++++++++++++++++---
 tests/qtest/libqos/virtio-gpio.c    |  3 +-
 hw/virtio/trace-events              |  4 +--
 18 files changed, 207 insertions(+), 83 deletions(-)


