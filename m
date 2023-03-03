Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041F6A9D91
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY99R-00071d-Fh; Fri, 03 Mar 2023 12:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99O-00070q-Tq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99N-0005JR-1C
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D05fRajnt3wxindlcA+fqaoCtQpZv60pNf1KedGawSA=;
 b=NqJDJ0L53kCsk3yFxWA8shWllmC3C2rZ0F6RWWJo3nqmDLocIfarzBo/SO6hTWAm2b8BPY
 wAXzvU5eZbZ/Kp+AjaOH9QIZiZYdDSyk4CpAAsuSKthkgroohF5l5Vr/EisHwQdH4nh+DX
 9kPzPctWzCkvnt28RH2GCTs6+ikpNRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-GRE7VmxmNrivYK2KGUJtoA-1; Fri, 03 Mar 2023 12:24:51 -0500
X-MC-Unique: GRE7VmxmNrivYK2KGUJtoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85D1780D0F4;
 Fri,  3 Mar 2023 17:24:50 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 561D9440D8;
 Fri,  3 Mar 2023 17:24:47 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v5 00/14] Dynamically switch to vhost shadow virtqueues at
 vdpa net migration
Date: Fri,  3 Mar 2023 18:24:31 +0100
Message-Id: <20230303172445.1089785-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
=0D
Previous versions were tested by many vendors. Not carrying Tested-by becau=
se=0D
of code changes, so re-testing would be appreciated.=0D
=0D
A ready to clone tag named vdpa.d/stop-nocvq-v5 with this version of the se=
ries=0D
is available at https://gitlab.com/eperezmartin/qemu-kvm.git, with the comm=
it=0D
863d54ff00c558ffe54ed2c7ee148ab7f89d4864 ("vdpa: return VHOST_F_LOG_ALL in=
=0D
vhost-vdpa devices").=0D
=0D
Comments are welcome.=0D
=0D
v5:=0D
- Reverse SUSPEND polarity check, as qemu was never suspending devices with=
=0D
  suspend capability.=0D
- Reorder suspend patch so it comes before the reset reorder after=0D
  get_vring_base.=0D
- Remove patch to stop SVQ at vdpa stop, already present in staging=0D
=0D
v4:=0D
- Recover used_idx from guest's vring if device cannot suspend.=0D
- Fix starting device in the middle of a migration.  Removed some=0D
  duplication in setting / clearing enable_shadow_vqs and shadow_data=0D
  members of vhost_vdpa.=0D
- Fix (again) "Check for SUSPEND in vhost_dev.backend_cap, as=0D
  .backend_features is empty at the check moment.". It was reverted by=0D
  mistake in v3.=0D
- Fix memory leak of iova tree.=0D
- Properly rewind SVQ as in flight descriptors were still being accounted=0D
  in vq base.=0D
- Expand documentation.=0D
=0D
v3:=0D
- Start datapatch in SVQ in device started while migrating.=0D
- Properly register migration blockers if device present unsupported featur=
es.=0D
- Fix race condition because of not stopping the SVQ until device cleanup.=
=0D
- Explain purpose of iova tree in the first patch message.=0D
- s/dynamycally/dynamically/ in cover letter.=0D
- at lore.kernel.org/qemu-devel/20230215173850.298832-14-eperezma@redhat.co=
m=0D
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
  vdpa: Remember last call fd set=0D
  vdpa: Negotiate _F_SUSPEND feature=0D
  vdpa: rewind at get_base, not set_base=0D
  vdpa: add vhost_vdpa->suspended parameter=0D
  vdpa: add vhost_vdpa_suspend=0D
  vdpa: move vhost reset after get vring base=0D
  vdpa: add vdpa net migration state notifier=0D
  vdpa: disable RAM block discard only for the first device=0D
  vdpa net: block migration if the device has CVQ=0D
  vdpa: block migration if device has unsupported features=0D
  vdpa: block migration if SVQ does not admit a feature=0D
  vdpa net: allow VHOST_F_LOG_ALL=0D
  vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices=0D
=0D
 include/hw/virtio/vhost-backend.h  |   4 +=0D
 include/hw/virtio/vhost-vdpa.h     |   3 +=0D
 hw/virtio/vhost-shadow-virtqueue.c |   8 +-=0D
 hw/virtio/vhost-vdpa.c             | 126 ++++++++++++------=0D
 hw/virtio/vhost.c                  |   3 +=0D
 net/vhost-vdpa.c                   | 198 ++++++++++++++++++++++++-----=0D
 hw/virtio/trace-events             |   1 +=0D
 7 files changed, 272 insertions(+), 71 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


