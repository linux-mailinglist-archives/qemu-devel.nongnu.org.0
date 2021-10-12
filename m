Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347C42A6D8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:11:26 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIV0-0005hF-O1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maIRQ-0002uS-9Z
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maIRL-0002Wu-Br
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634047653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LuTySLnVQJB8wN9HxIsBfpOq+iIy8fTbtE3HnX0LhDk=;
 b=CjXD+zPeIAf5BgzKDvfVuAAvQRxD8YZ2aBIfPL14xkfH68E5legML1/Q8rzkQ0PySuT/qs
 8B+lAezv11QJC18e8wblKHUBE3WeNTKH3Aj9zKyaz9jjOLnf2tRCWCCrJApMXasup2rYia
 693JmbdRmRzLKcJ6aTCQEh2mvgBQE04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-4Slfj3WyPcy5_ZXO4ZaSMQ-1; Tue, 12 Oct 2021 10:07:30 -0400
X-MC-Unique: 4Slfj3WyPcy5_ZXO4ZaSMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D646F801A93;
 Tue, 12 Oct 2021 14:07:29 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15954196FA;
 Tue, 12 Oct 2021 14:07:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] vdpa: Check iova range on memory regions ops
Date: Tue, 12 Oct 2021 16:07:07 +0200
Message-Id: <20211012140710.804529-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment vdpa will not send memory regions bigger than 1<<63.=0D
However, actual iova range could be way more restrictive than that.=0D
=0D
Since we can obtain the range through vdpa ioctl call, just save it=0D
from the beginning of the operation and check against it.=0D
=0D
Changes from v2:=0D
* Fallback to a default value in case kernel does not support=0D
  VHOST_VDPA_GET_IOVA_RANGE syscall.=0D
=0D
Changes from v1:=0D
* Use of int128_gt instead of plain uint64_t < comparison on memory=0D
  range end.=0D
* Document vhost_vdpa_section_end's return value so it's clear that=0D
  it returns "one past end".=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  vdpa: Skip protected ram IOMMU mappings=0D
  vdpa: Add vhost_vdpa_section_end=0D
  vdpa: Check for iova range at mappings changes=0D
=0D
 include/hw/virtio/vhost-vdpa.h |  2 +=0D
 hw/virtio/vhost-vdpa.c         | 81 +++++++++++++++++++++++++---------=0D
 hw/virtio/trace-events         |  1 +=0D
 3 files changed, 63 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


