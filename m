Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C904450B6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:58:20 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYZf-0001Ku-BL
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYY1-0007ik-9w
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYXw-0000m9-Tt
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=krEUcY3W0Za15HGBq9Hrd1DrcQ0AbX0b1stpO/kJrsA=;
 b=PHm2EbJdkZB74OIytBntObxwFAPtnLF309KJ4auACElQpEIDwGJaXMp4qysQDrZucb1UIh
 n/rHqg8q4IzWzbvR3c1+NWFAioEWe9FKn2VORWVt5sLAb+JIKqcZ8MGCWqKFma0xHZ69Xm
 2moIs19q+rX95DK9HedzKKMl2lhj2iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-ArWIZR_NMZyhRkANwncMqg-1; Thu, 04 Nov 2021 04:56:31 -0400
X-MC-Unique: ArWIZR_NMZyhRkANwncMqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA5B1018722
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 08:56:30 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 277D41017CF5;
 Thu,  4 Nov 2021 08:56:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] vhost: Fix last queue index of devices with no cvq
Date: Thu,  4 Nov 2021 09:56:23 +0100
Message-Id: <20211104085625.2054959-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The -1 assumes that cvq device model is accounted in data_queue_pairs,=0D
if cvq does not exists, but it's actually the opposite: Devices with=0D
!cvq are ok but devices with cvq does not add the last queue to=0D
data_queue_pairs.=0D
=0D
This is not a problem to vhost-net, but it is to vhost-vdpa:=0D
* Devices with cvq gets initialized at last data vq device model, not=0D
at cvq one.=0D
* Devices with !cvq never gets initialized, since last_index is the=0D
first queue of the last device model.=0D
=0D
Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff, and ctrol_vq=0D
on and off.=0D
=0D
v4:=0D
* Rename last_index to index_end=0D
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
  vhost: Rename last_index to vq_index_end=0D
  vhost: Fix last vq queue index of devices with no cvq=0D
=0D
 include/hw/virtio/vhost.h |  4 ++--=0D
 hw/net/vhost_net.c        | 12 ++++++------=0D
 hw/virtio/vhost-vdpa.c    |  2 +-=0D
 3 files changed, 9 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


