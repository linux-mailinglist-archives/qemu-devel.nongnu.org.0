Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34969826C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLkJ-0006oF-0h; Wed, 15 Feb 2023 12:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLkH-0006mS-MF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLkF-0005kh-B8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676482742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dBxgKbAsrwfDmfpjmBV1YPVi8dqYOKR2Zj7LrjjvHRo=;
 b=JwGUxDnuCjfKVq4rOC2AbbaIEOYOKKRgjiGoP15fF9CwfndJX4NbSAA3XdzbKlSlQoFRi0
 T05jZxBxETWYNPDD1qgsoM9wKXtqGsb3/6G+vzZ9HxAEuW/6OXQ0URysvUVYlwAGoAqaln
 JAzGvo5q+1rmKHhiC9N5ezPKSy4dyJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-UfsLyjoJMi-h_D8CUDRfdw-1; Wed, 15 Feb 2023 12:38:56 -0500
X-MC-Unique: UfsLyjoJMi-h_D8CUDRfdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3227C382C974;
 Wed, 15 Feb 2023 17:38:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD4EA140EBF4;
 Wed, 15 Feb 2023 17:38:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Shannon Nelson <snelson@pensando.io>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, si-wei.liu@oracle.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, alvaro.karsz@solid-run.com,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH v3 00/14] Dynamically switch to vhost shadow virtqueues at
 vdpa net migration
Date: Wed, 15 Feb 2023 18:38:36 +0100
Message-Id: <20230215173850.298832-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

It's possible to migrate vdpa net devices if they are shadowed from the=0D
start.  But to always shadow the dataplane is to effectively break its host=
=0D
passthrough, so its not efficient in vDPA scenarios.=0D
=0D
This series enables dynamically switching to shadow mode only at=0D
migration time.  This allows full data virtqueues passthrough all the=0D
time qemu is not migrating.=0D
=0D
In this series only net devices with no CVQ are migratable.  CVQ adds=0D
additional state that would make the series bigger and still had some=0D
controversy on previous RFC, so let's split it.=0D
=0D
Successfully tested with vdpa_sim_net with patch [1] applied and with the q=
emu=0D
emulated device with vp_vdpa with some restrictions:=0D
* No CVQ. No feature that didn't work with SVQ previously (packed, ...)=0D
* VIRTIO_RING_F_STATE patches implementing [2].=0D
* Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like=0D
  DPDK.=0D
=0D
Previous versions were tested by many vendors. Not carrying Tested-by becau=
se=0D
of code changes, so re-testing would be appreciated.=0D
=0D
Comments are welcome.=0D
=0D
v3:=0D
- Start datapatch in SVQ in device started while migrating.=0D
- Properly register migration blockers if device present unsupported featur=
es.=0D
- Fix race condition because of not stopping the SVQ until device cleanup.=
=0D
- Explain purpose of iova tree in the first patch message.=0D
- s/dynamycally/dynamically/ in cover letter.=0D
=0D
v2:=0D
- Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is empty=
 at=0D
  the check moment.=0D
- at https://lore.kernel.org/all/20230208094253.702672-12-eperezma@redhat.c=
om/T/=0D
=0D
v1:=0D
- Omit all code working with CVQ and block migration if the device supports=
=0D
  CVQ.=0D
- Remove spurious kick.=0D
- Move all possible checks for migration to vhost-vdpa instead of the net=0D
  backend. Move them to init code from start code.=0D
- Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net backe=
nd.=0D
- Properly split suspend after geting base and adding of status_reset patch=
es.=0D
- Add possible TODOs to points where this series can improve in the future.=
=0D
- Check the state of migration using migration_in_setup and=0D
  migration_has_failed instead of checking all the possible migration statu=
s in=0D
  a switch.=0D
- Add TODO with possible low hand fruit using RESUME ops.=0D
- Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers do=
=0D
  their thing instead of adding a variable.=0D
- RFC v2 at https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02574.=
html=0D
=0D
RFC v2:=0D
- Use a migration listener instead of a memory listener to know when=0D
  the migration starts.=0D
- Add stuff not picked with ASID patches, like enable rings after=0D
  driver_ok=0D
- Add rewinding on the migration src, not in dst=0D
- RFC v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.=
html=0D
=0D
[1] https://lore.kernel.org/lkml/20230203142501.300125-1-eperezma@redhat.co=
m/T/=0D
[2] https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.ht=
ml=0D
=0D
Eugenio P=C3=A9rez (14):=0D
  vdpa net: move iova tree creation from init to start=0D
  vdpa: stop svq at vhost_vdpa_dev_start(false)=0D
  vdpa: Negotiate _F_SUSPEND feature=0D
  vdpa: add vhost_vdpa_suspend=0D
  vdpa: move vhost reset after get vring base=0D
  vdpa: rewind at get_base, not set_base=0D
  vdpa net: allow VHOST_F_LOG_ALL=0D
  vdpa: add vdpa net migration state notifier=0D
  vdpa: disable RAM block discard only for the first device=0D
  vdpa net: block migration if the device has CVQ=0D
  vdpa: block migration if device has unsupported features=0D
  vdpa: block migration if dev does not have _F_SUSPEND=0D
  vdpa: block migration if SVQ does not admit a feature=0D
  vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices=0D
=0D
 include/hw/virtio/vhost-backend.h |   4 +=0D
 include/hw/virtio/vhost-vdpa.h    |   1 +=0D
 hw/virtio/vhost-vdpa.c            | 130 +++++++++++++++-----=0D
 hw/virtio/vhost.c                 |   3 +=0D
 net/vhost-vdpa.c                  | 195 +++++++++++++++++++++++++-----=0D
 hw/virtio/trace-events            |   1 +=0D
 6 files changed, 274 insertions(+), 60 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


