Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D15FB1E3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:58:13 +0200 (CEST)
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDtj-0001wJ-G3
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCi9-0004U1-E9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCi6-0007mM-1I
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KFzwfI4xWWrXGzPF6GL7m7oIfEjaLoepedAPPZ02oI4=;
 b=EI8zOspag17FXD2hS6S3t2tmNW2q0Rs5/tZ+3N9eVzumPDj2MgDxvpdcqshMf4pa4/cuvA
 idqTBxzC1D1EsNljVjMVPYLU/AnDDoP2VTFVi4OQip997BDjSRAGDMTOE2mgIXtqXoFpdK
 e1lZqjEjLJxLh8mIwRA1kTrOUE+Oe70=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-dClyIeZzMOWJ4f8Yee3m4w-1; Tue, 11 Oct 2022 06:42:00 -0400
X-MC-Unique: dClyIeZzMOWJ4f8Yee3m4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15FAF299E750;
 Tue, 11 Oct 2022 10:42:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D01BA492B09;
 Tue, 11 Oct 2022 10:41:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH v5 0/6] ASID support in vhost-vdpa net
Date: Tue, 11 Oct 2022 12:41:48 +0200
Message-Id: <20221011104154.1209338-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Control VQ is the way net devices use to send changes to the device state, =
like=0D
the number of active queues or its mac address.=0D
=0D
QEMU needs to intercept this queue so it can track these changes and is abl=
e to=0D
migrate the device. It can do it from 1576dbb5bbc4 ("vdpa: Add x-svq to=0D
NetdevVhostVDPAOptions"). However, to enable x-svq implies to shadow all Vi=
rtIO=0D
device's virtqueues, which will damage performance.=0D
=0D
This series adds address space isolation, so the device and the guest=0D
communicate directly with them (passthrough) and CVQ communication is split=
 in=0D
two: The guest communicates with QEMU and QEMU forwards the commands to the=
=0D
device.=0D
=0D
Comments are welcome. Thanks!=0D
=0D
v5:=0D
- Move vring state in vhost_vdpa_get_vring_group instead of using a=0D
  parameter.=0D
- Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID=0D
=0D
v4:=0D
- Rebased on last CVQ start series, that allocated CVQ cmd bufs at load=0D
- Squash vhost_vdpa_cvq_group_is_independent.=0D
- Do not check for cvq index on vhost_vdpa_net_prepare, we only have one=0D
  that callback registered in that NetClientInfo.=0D
- Add comment specifying behavior if device does not support _F_ASID=0D
- Update headers to a later Linux commit to not to remove SETUP_RNG_SEED=0D
=0D
v3:=0D
- Do not return an error but just print a warning if vdpa device initializa=
tion=0D
  returns failure while getting AS num of VQ groups=0D
- Delete extra newline=0D
=0D
v2:=0D
- Much as commented on series [1], handle vhost_net backend through=0D
  NetClientInfo callbacks instead of directly.=0D
- Fix not freeing SVQ properly when device does not support CVQ=0D
- Add BIT_ULL missed checking device's backend feature for _F_ASID.=0D
=0D
Eugenio P=C3=A9rez (6):=0D
  vdpa: Use v->shadow_vqs_enabled in vhost_vdpa_svqs_start & stop=0D
  vdpa: Allocate SVQ unconditionally=0D
  vdpa: Add asid parameter to vhost_vdpa_dma_map/unmap=0D
  vdpa: Store x-svq parameter in VhostVDPAState=0D
  vdpa: Add listener_shadow_vq to vhost_vdpa=0D
  vdpa: Always start CVQ in SVQ mode=0D
=0D
 include/hw/virtio/vhost-vdpa.h |  10 ++-=0D
 hw/virtio/vhost-vdpa.c         |  75 ++++++++++---------=0D
 net/vhost-vdpa.c               | 128 ++++++++++++++++++++++++++++++---=0D
 hw/virtio/trace-events         |   4 +-=0D
 4 files changed, 170 insertions(+), 47 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


