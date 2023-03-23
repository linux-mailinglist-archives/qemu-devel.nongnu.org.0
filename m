Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480746C7165
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 20:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfR0s-0003CS-SP; Thu, 23 Mar 2023 15:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR0q-0003CJ-PU
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR0o-0007PT-PW
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679601253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L3qoEbTSvNoTmsKY8awcradxbS1fexqfAkCV6o+r+1g=;
 b=forXwp4gaP0onz3bE2sV5fmeC3sCJOBWWedOsjd+mFTI6NMTzFbBCnmrT9wzoDMmmtjHli
 VqcoWNsmDygdjoJlczZwDloGyau16WpyUEEy+gOWOZPD/KRY1ClG3K0Xh4EjPn8qOY8XH0
 BeJt+6HQp7uyrghErbTbPuCOiSSrpFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-Qej5ZdpbMZWYFMGb35vsRg-1; Thu, 23 Mar 2023 15:54:10 -0400
X-MC-Unique: Qej5ZdpbMZWYFMGb35vsRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 382128030A0;
 Thu, 23 Mar 2023 19:54:09 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27315440BC;
 Thu, 23 Mar 2023 19:54:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, Eli Cohen <eli@mellanox.com>,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH for 8.1 v2 0/6] Move ASID test to vhost-vdpa net initialization
Date: Thu, 23 Mar 2023 20:53:58 +0100
Message-Id: <20230323195404.1247326-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

QEMU v8.0.0-rc0 is able to switch dynamically between vhost-vdpa passthroug=
h=0D
and SVQ mode as long as the net device does not have CVQ.  The net device=0D
state followed (and migrated) by CVQ requires special care.=0D
=0D
A pre-requisite to add CVQ to that framework is to determine if devices wit=
h=0D
CVQ are migratable or not at initialization time.  The solution to it is to=
=0D
always shadow only CVQ, and vq groups and ASID are used for that.=0D
=0D
However, current qemu version only checks ASID at device start (as "driver =
set=0D
DRIVER_OK status bit"), not at device initialization.  A check at=0D
initialization time is required.  Otherwise, the guest would be able to set=
=0D
and remove migration blockers at will [1].=0D
=0D
This series is a requisite for migration of vhost-vdpa net devices with CVQ=
.=0D
However it already makes sense by its own, as it reduces the number of ioct=
ls=0D
at migration time, decreasing the error paths there.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/2616f0cd-f9e8-d183-ea78-db1be4825d9c=
@redhat.com/=0D
---=0D
v2:=0D
* Take out the reset of the device from vhost_vdpa_cvq_is_isolated=0D
  (reported by Lei Yang).=0D
* Expand patch messages by Stefano G. questions.=0D
=0D
Eugenio P=C3=A9rez (6):=0D
  vdpa: Remove status in reset tracing=0D
  vdpa: add vhost_vdpa_reset_status_fd=0D
  vdpa: add vhost_vdpa_set_dev_features_fd=0D
  vdpa: return errno in vhost_vdpa_get_vring_group error=0D
  vdpa: move CVQ isolation check to net_init_vhost_vdpa=0D
  vdpa: Cache cvq group in VhostVDPAState=0D
=0D
 include/hw/virtio/vhost-vdpa.h |   2 +=0D
 hw/virtio/vhost-vdpa.c         |  78 ++++++++-----=0D
 net/vhost-vdpa.c               | 199 +++++++++++++++++++++++++++------=0D
 hw/virtio/trace-events         |   2 +-=0D
 4 files changed, 221 insertions(+), 60 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


