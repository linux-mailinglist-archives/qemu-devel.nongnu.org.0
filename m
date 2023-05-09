Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662626FCA70
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:45:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPWD-0004jQ-3l; Tue, 09 May 2023 11:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWA-0004h6-HH
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPW8-0005FP-VG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/l6Oc4sOFWy4Lg4ztNWRTKC5pMvN9AI5ZJr6asWAEt0=;
 b=OmNOfJa3+ULV6fZaDltcAobhcIXOJkxkv/eQEc5q/tzS6kiy9Jv1/tihemy1deVyzqX51c
 h7XZLroIzMJDDdQEf69ACFsTnmHJhVPbyuutkIoaQkTNjueomzvxHi0b/wZOJt8NVCcl2F
 ATOkr7CUH1rLA460xqrsZthqxdwoeEM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-V387P7P0OXu6A1WkIFcF4w-1; Tue, 09 May 2023 11:44:41 -0400
X-MC-Unique: V387P7P0OXu6A1WkIFcF4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082AA1C060CA;
 Tue,  9 May 2023 15:44:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45165C15BA0;
 Tue,  9 May 2023 15:44:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 longpeng2@huawei.com, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, alvaro.karsz@solid-run.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 si-wei.liu@oracle.com, Shannon Nelson <snelson@pensando.io>,
 Lei Yang <leiyang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 0/5] Move ASID test to vhost-vdpa net initialization
Date: Tue,  9 May 2023 17:44:30 +0200
Message-Id: <20230509154435.1410162-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

QEMU v8.0 is able to switch dynamically between vhost-vdpa passthrough=0D
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
v3:=0D
* Only record cvq_isolated, true if the device have cvq isolated in both !M=
Q=0D
* and MQ configurations.=0D
* Drop the cache of cvq group, it can be done on top=0D
=0D
v2:=0D
* Take out the reset of the device from vhost_vdpa_cvq_is_isolated=0D
  (reported by Lei Yang).=0D
* Expand patch messages by Stefano G. questions.=0D
=0D
Eugenio P=C3=A9rez (5):=0D
  vdpa: Remove status in reset tracing=0D
  vdpa: add vhost_vdpa_reset_status_fd=0D
  vdpa: add vhost_vdpa_set_dev_features_fd=0D
  vdpa: return errno in vhost_vdpa_get_vring_group error=0D
  vdpa: move CVQ isolation check to net_init_vhost_vdpa=0D
=0D
 include/hw/virtio/vhost-vdpa.h |   2 +=0D
 hw/virtio/vhost-vdpa.c         |  78 ++++++++++-----=0D
 net/vhost-vdpa.c               | 171 ++++++++++++++++++++++++++-------=0D
 hw/virtio/trace-events         |   2 +-=0D
 4 files changed, 192 insertions(+), 61 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


