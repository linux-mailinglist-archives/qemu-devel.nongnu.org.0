Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7968EBEA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:43:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgyv-0004zR-6q; Wed, 08 Feb 2023 04:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgyq-0004zF-FC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgyn-0005J6-0M
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4nHc7PKY3dIIDDjL54H8jqZDgXha9FAtUUXMSFpr0m8=;
 b=U5wsTGgeBqi6vFo77rvlAZ93WQ6d2uDnExIogYCwsmROmRcgFWkWSUdcpx/NkLPDk8ofyc
 7QpdQUL9DPjZktKrWDXxz+ae0t219BORm+mjW14xpE3QQXNXpzQxSeO3MN5MIpnq22irB5
 kasSjqkAozYdv3yYaJBC01pNe0GpgYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-9QKI3Oi2PtmoLbSGi34ixw-1; Wed, 08 Feb 2023 04:43:00 -0500
X-MC-Unique: 9QKI3Oi2PtmoLbSGi34ixw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 661A93806739;
 Wed,  8 Feb 2023 09:42:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2222166B2A;
 Wed,  8 Feb 2023 09:42:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 00/13] Dynamycally switch to vhost shadow virtqueues at
 vdpa net migration
Date: Wed,  8 Feb 2023 10:42:40 +0100
Message-Id: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

It's possible to migrate vdpa net devices if they are shadowed from the=0D
start.  But to always shadow the dataplane is to effectively break its host=
=0D
passthrough, so its not convenient in vDPA scenarios.=0D
=0D
This series enables dynamically switching to shadow mode only at=0D
migration time.  This allows full data virtqueues passthrough all the=0D
time qemu is not migrating.=0D
=0D
In this series only net devices with no CVQ are migratable.  CVQ adds=0D
additional state that would make the series bigger and still had some=0D
controversy on previous RFC, so let's split it.=0D
=0D
The first patch delays the creation of the iova tree until it is really nee=
ded,=0D
and makes it easier to dynamically move from and to SVQ mode.=0D
=0D
Next patches from 02 to 05 handle the suspending and getting of vq state (b=
ase)=0D
of the device at the switch to SVQ mode.  The new _F_SUSPEND feature is=0D
negotiated and stop device flow is changed so the state can be fetched trus=
ting=0D
the device will not modify it.=0D
=0D
Since vhost backend must offer VHOST_F_LOG_ALL to be migratable, last patch=
es=0D
but the last one add the needed migration blockers so vhost-vdpa can offer =
it=0D
safely.  They also add the handling of this feature.=0D
=0D
Finally, the last patch makes virtio vhost-vdpa backend to offer=0D
VHOST_F_LOG_ALL so qemu migrate the device as long as no other blocker has =
been=0D
added.=0D
=0D
Successfully tested with vdpa_sim_net with patch [1] applied and with the q=
emu=0D
emulated device with vp_vdpa with some restrictions:=0D
* No CVQ. No feature that didn't work with SVQ previously (packed, ...)=0D
* VIRTIO_RING_F_STATE patches implementing [2].=0D
* Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like=0D
  DPDK.=0D
=0D
Comments are welcome.=0D
=0D
v2:=0D
- Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is empty=
 at=0D
  the check moment.=0D
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
Eugenio P=C3=A9rez (13):=0D
  vdpa net: move iova tree creation from init to start=0D
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
 hw/virtio/vhost-vdpa.c            | 126 +++++++++++++++-----=0D
 hw/virtio/vhost.c                 |   3 +=0D
 net/vhost-vdpa.c                  | 192 +++++++++++++++++++++++++-----=0D
 hw/virtio/trace-events            |   1 +=0D
 5 files changed, 267 insertions(+), 59 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


