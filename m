Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4D454DE0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:30:56 +0100 (CET)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQdz-0002yO-RO
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQcY-0001gb-Ns
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQcW-0006nc-Sh
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637177363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RHEWl4maGLGlKBh+ETFOGn38+LPG8Sw1/ag0JnK/Pz0=;
 b=F3QdrgyD1zjcc2U3vYIMybH/uqa7Jm4hcjZseVyl0L9XltGVnDmVSDPuCShK4sgIzCf/XU
 v5DeHNBJktICFH1Od4E+XCPRSIPqmf5EBB8OTvhuuugg4g9pwZof4XHTfhNg0dSMb6ryWw
 9pz1axw/B8Uq7TTk4pNLRM4RU8w0TFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-UiFibKunPpWmh50SiinQOg-1; Wed, 17 Nov 2021 14:29:22 -0500
X-MC-Unique: UiFibKunPpWmh50SiinQOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C24824F88
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 19:29:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5624F60C4A;
 Wed, 17 Nov 2021 19:28:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] virtio-net: Only enable userland vq if using tap backend
Date: Wed, 17 Nov 2021 20:28:48 +0100
Message-Id: <20211117192851.65529-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa=0D
cases. These assumes a tap device can handle the packets.=0D
=0D
If a vdpa device fail to start, it can trigger a sigsegv because of=0D
that. Do not resort on them unless actually possible.=0D
=0D
Tested with tap backend vhost=3Don and vhost=3Doff, and with vp_vdpa=0D
modified to fail negotiation.=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  virtio-net: Fix indentation=0D
  virtio-net: Only enable userland vq if using tap backend=0D
  virtio-net: Fix log message=0D
=0D
 include/hw/virtio/virtio.h |  2 ++=0D
 hw/net/virtio-net.c        | 17 +++++++++++------=0D
 hw/virtio/virtio.c         | 21 +++++++++++++--------=0D
 3 files changed, 26 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


