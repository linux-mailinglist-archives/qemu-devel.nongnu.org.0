Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E6443FCA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:04:14 +0100 (CET)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miD7s-0001wq-L8
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miD5f-0007ua-3w
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miD5Z-0005tD-Dj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635933704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7KaT6DGJk3oTCPAKJ3RhdTuSXH708oWqIQIZrU46Hhw=;
 b=aX8ttY4xE7wpJ/0+e641dqMqsDeCK054zcrIKSsrXNv5Dq2ghDmm1elufsqk1W6U4krrlL
 /CVTDoRYIOLkfss7mcDvP7bS+IAEbsF8YAZb2JNUa2p7Yd/2+zL7NQjAyRzq3QLmhJSlZ6
 J8TLTqyi6lF5WPoUbpTxtJMvBgz5Eyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-TotVukx3NdK9EIBKCtnP6w-1; Wed, 03 Nov 2021 06:01:43 -0400
X-MC-Unique: TotVukx3NdK9EIBKCtnP6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FF86100CCC2
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 10:01:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0964A5D9DE;
 Wed,  3 Nov 2021 10:01:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] vhost: Fix last queue index of devices with no cvq
Date: Wed,  3 Nov 2021 11:01:29 +0100
Message-Id: <20211103100131.1983272-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -1 assumes that all devices with no cvq have an spare vq allocated=0D
for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid=0D
device by the standard, so just stick to the right number of device=0D
models.=0D
=0D
This is not a problem to vhost-net, but it is to vhost-vdpa, which=0D
device model trust to reach the last index to finish starting the=0D
device.=0D
=0D
Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff.=0D
=0D
v3:=0D
* Recover cvq devices.=0D
* Rename last_index to last_vq_index=0D
=0D
v2:=0D
* Delete all the conditional code instead of ROUND_DOWN in a=0D
  deinitely too-bit-tricky way.=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vhost: Rename last_index to last_vq_index=0D
  vhost: Fix last vq queue index of devices with no cvq=0D
=0D
 include/hw/virtio/vhost.h | 2 +-=0D
 hw/net/vhost_net.c        | 8 ++++----=0D
 hw/virtio/vhost-vdpa.c    | 2 +-=0D
 3 files changed, 6 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


