Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F64CA540
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:52:37 +0100 (CET)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOT6-0005Z3-S6
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPNJ3-0002EZ-P8
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPNJ0-0004Si-9I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646221085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BUdvzXz8iGKsbnSpqy2Pkbfi1OdFt4mIGGx4XFIiu78=;
 b=Msi0FdNpNNRkB1DA7zl0+HbwMQJ0V+U30w4sdgq9rjkOhru837TUys2oeTlmFwiEbl1OiT
 ZroIqXYCc7dz4oNTKc46lLlnDZGfgkCLIkhEsxdTFS4+O/az+iO6w3vpw/G49B0BVznwKr
 Iex4I6BewZUoWyDBYPC4c/bYivfsY+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-ZhDPsz3_PsqFxOZyebEWiA-1; Wed, 02 Mar 2022 06:36:32 -0500
X-MC-Unique: ZhDPsz3_PsqFxOZyebEWiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D4451854E21;
 Wed,  2 Mar 2022 11:36:30 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45A2183095;
 Wed,  2 Mar 2022 11:36:25 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Enable vhost-user to be used on BSD systems
Date: Wed,  2 Mar 2022 12:36:42 +0100
Message-Id: <20220302113644.43717-1-slp@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since QEMU is already able to emulate ioeventfd using pipefd, we're already=
=0D
pretty close to supporting vhost-user on non-Linux systems.=0D
=0D
This two patches bridge the gap by:=0D
=0D
1. Extending event_notifier_get_fd() to be able to return wfd when needed.=
=0D
=0D
2. Modifying the build system to it allows enabling vhost-user on BSD.=0D
=0D
Sergio Lopez (2):=0D
  Allow returning EventNotifier's wfd=0D
  Allow building vhost-user in BSD=0D
=0D
 accel/kvm/kvm-all.c                     | 12 +++----=0D
 block/linux-aio.c                       |  2 +-=0D
 block/nvme.c                            |  2 +-=0D
 configure                               |  5 +--=0D
 contrib/ivshmem-server/ivshmem-server.c |  5 +--=0D
 hw/hyperv/hyperv.c                      |  2 +-=0D
 hw/misc/ivshmem.c                       |  2 +-=0D
 hw/remote/iohub.c                       | 13 +++----=0D
 hw/remote/proxy.c                       |  4 +--=0D
 hw/vfio/ccw.c                           |  4 +--=0D
 hw/vfio/pci-quirks.c                    |  6 ++--=0D
 hw/vfio/pci.c                           | 48 +++++++++++++------------=0D
 hw/vfio/platform.c                      | 16 ++++-----=0D
 hw/virtio/vhost.c                       | 10 +++---=0D
 include/qemu/event_notifier.h           |  2 +-=0D
 meson.build                             |  2 +-=0D
 target/s390x/kvm/kvm.c                  |  2 +-=0D
 util/aio-posix.c                        |  4 +--=0D
 util/event_notifier-posix.c             |  5 ++-=0D
 util/vfio-helpers.c                     |  2 +-=0D
 20 files changed, 79 insertions(+), 69 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


