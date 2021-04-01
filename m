Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961D351ACA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:07:33 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1j9-0004oh-WE
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1en-0003BP-4F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ei-0005rG-JS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5Pbh7JYsI4J0e5aEuzh0AVVibuHdRTHb5Ki7aunNDXc=;
 b=dkur4zEVvVobN4x665tRKORFezd7nHqtWU1KDoDlt6xIW9LqbYbGaPApCjBVKo+VR+rm4C
 RLj6AmOVNRrA4hhZfwP4VI/xt4I6/fTtzQpvr/zX5LKnzE2Q/2m135AFFSZZyRVXcSzylw
 VAbd0mkkXg8ixFQzYlzUKzvbqh9fY9A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-YTLhSD74NuKz22wDWxUzYQ-1; Thu, 01 Apr 2021 14:02:53 -0400
X-MC-Unique: YTLhSD74NuKz22wDWxUzYQ-1
Received: by mail-wr1-f70.google.com with SMTP id o11so3126723wrc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=5Pbh7JYsI4J0e5aEuzh0AVVibuHdRTHb5Ki7aunNDXc=;
 b=LUKvM+IBnHxFy9N73HSiA9Dfl+pZXANxuovxxJsYkjl7Zds7mI81P4aZEq2ynA/sWw
 E/GnX/R2M7GyTR19zaDnflsZWtiY0kn7G7LP3QebgLLdewIwyOzfA5XBs52y7JSicT4z
 eZr0H0ilKw2mkcS59+a3g/cYlUAcImJMTQ0USiDWZL2GFyTozZ+PVu8g8GuR6S4gYWw9
 JXg67/6HH4hLkYyjIWr+QisGRTO4uQP2gRkRPm/PXboDvatM3lGbrNuIZsflK1P21k3H
 zaLlK4gJ1/4SOmgGKTAUyWo0sPD3msCLLac27OvWZLTrruxfsrzF40g5oaHAb4m5lc/H
 2lcQ==
X-Gm-Message-State: AOAM533vmWLD7k3/BQ7VrP6l4ZQue2tV4EaWYA14HJA7wFqjNZfOhUog
 GKQX8z04DHI+lKt3kH0CKyymtcbiFfV0RPP8TbwgfrXB/aSSuZMaN5BUUd976JMCejkjXFn5ZAY
 zD6DEl3tPDiwogdPQnuLlOhXfQgoXZJ8rL8DYixnJQiI7K6oWLqcsTgMwUobz
X-Received: by 2002:a5d:518c:: with SMTP id k12mr11218607wrv.15.1617300171964; 
 Thu, 01 Apr 2021 11:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0lKH4WJxozZ+LB5sVQ2JxeNL5RLED6REzAnEM4C8iW8UQ8QpzJLM/imk5FSJiP72pbO2mJA==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr11218580wrv.15.1617300171768; 
 Thu, 01 Apr 2021 11:02:51 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id x14sm10675432wrw.13.2021.04.01.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:02:51 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:02:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] pc,virtio,pci: bugfixes
Message-ID: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1bd16067b652cce41a9214d0c62c73d5b45ab4b1:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-31 16:38:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 8ddf54324858ce5e35272efa449f27fc0a19f957:

  pci: sprinkle assert in PCI pin number (2021-04-01 12:19:52 -0400)

----------------------------------------------------------------
pc,virtio,pci: bugfixes

Fixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Denis Plotnikov (3):
      vhost-user-blk: use different event handlers on initialization
      vhost-user-blk: perform immediate cleanup if disconnect on initialization
      vhost-user-blk: add immediate cleanup on shutdown

Isaku Yamahata (4):
      acpi/piix4: reinitialize acpi PM device on reset
      vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN isn't setup
      isa/v582c686: Reinitialize ACPI PM device on reset
      pci: sprinkle assert in PCI pin number

Yuri Benditovich (2):
      virtio-pci: add check for vdev in virtio_pci_isr_read
      virtio-pci: remove explicit initialization of val

 hw/acpi/piix4.c           |  7 +++++
 hw/block/vhost-user-blk.c | 79 ++++++++++++++++++++++++++++-------------------
 hw/isa/vt82c686.c         | 18 ++++++++++-
 hw/pci/pci.c              |  3 ++
 hw/virtio/virtio-pci.c    | 16 +++++++---
 5 files changed, 87 insertions(+), 36 deletions(-)


