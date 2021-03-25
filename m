Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B73494F4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:09:22 +0100 (CET)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRbt-0006WB-Ky
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaU-0004f3-0r
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:54 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaS-0007ds-As
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:53 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-OGD1z102PNiIO8Chvcx2Vg-1; Thu, 25 Mar 2021 11:07:47 -0400
X-MC-Unique: OGD1z102PNiIO8Chvcx2Vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61AD4801817;
 Thu, 25 Mar 2021 15:07:46 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 109535C241;
 Thu, 25 Mar 2021 15:07:36 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Date: Thu, 25 Mar 2021 16:07:27 +0100
Message-Id: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,=0D
a serious slow down may be observed on setups with a big enough number=0D
of vCPUs.=0D
=0D
Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):=
=0D
=0D
1=09=090m20.922s=090m21.346s=0D
2=09=090m21.230s=090m20.350s=0D
4=09=090m21.761s=090m20.997s=0D
8=09=090m22.770s=090m20.051s=0D
16=09=090m22.038s=090m19.994s=0D
32=09=090m22.928s=090m20.803s=0D
64=09=090m26.583s=090m22.953s=0D
128=09=090m41.273s=090m32.333s=0D
256=09=092m4.727s =091m16.924s=0D
384=09=096m5.563s =093m26.186s=0D
=0D
Both perf and gprof indicate that QEMU is hogging CPUs when setting up=0D
the ioeventfds:=0D
=0D
 67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable=0D
  9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single=0D
  8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable=0D
=3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_b=
efore=0D
=3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioev=
entfds=0D
  0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single=0D
=0D
address_space_update_ioeventfds() is called when committing an MR=0D
transaction, i.e. for each ioeventfd with the current code base,=0D
and it internally loops on all ioventfds:=0D
=0D
static void address_space_update_ioeventfds(AddressSpace *as)=0D
{=0D
[...]=0D
    FOR_EACH_FLAT_RANGE(fr, view) {=0D
        for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {=0D
=0D
This means that the setup of ioeventfds for these devices has=0D
quadratic time complexity.=0D
=0D
This series introduce generic APIs to allow batch creation and deletion=0D
of ioeventfds, and converts virtio-blk and virtio-scsi to use them. This=0D
greatly improves the numbers:=0D
=0D
1=09=090m21.271s=090m22.076s=0D
2=09=090m20.912s=090m19.716s=0D
4=09=090m20.508s=090m19.310s=0D
8=09=090m21.374s=090m20.273s=0D
16=09=090m21.559s=090m21.374s=0D
32=09=090m22.532s=090m21.271s=0D
64=09=090m26.550s=090m22.007s=0D
128=09=090m29.115s=090m27.446s=0D
256=09=090m44.752s=090m41.004s=0D
384=09=091m2.884s=090m58.023s=0D
=0D
The series deliberately spans over multiple subsystems for easier=0D
review and experimenting. It also does some preliminary fixes on=0D
the way. It is thus posted as an RFC for now, but if the general=0D
idea is acceptable, I guess a non-RFC could be posted and maybe=0D
extend the feature to some other devices that might suffer from=0D
similar scaling issues, e.g. vhost-scsi-pci, vhost-user-scsi-pci=0D
and vhost-user-blk-pci, even if I haven't checked.=0D
=0D
This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108=0D
which reported the issue for virtio-scsi-pci.=0D
=0D
Greg Kurz (8):=0D
  memory: Allow eventfd add/del without starting a transaction=0D
  virtio: Introduce virtio_bus_set_host_notifiers()=0D
  virtio: Add API to batch set host notifiers=0D
  virtio-pci: Batch add/del ioeventfds in a single MR transaction=0D
  virtio-blk: Fix rollback path in virtio_blk_data_plane_start()=0D
  virtio-blk: Use virtio_bus_set_host_notifiers()=0D
  virtio-scsi: Set host notifiers and callbacks separately=0D
  virtio-scsi: Use virtio_bus_set_host_notifiers()=0D
=0D
 hw/virtio/virtio-pci.h          |  1 +=0D
 include/exec/memory.h           | 48 ++++++++++++++++------=0D
 include/hw/virtio/virtio-bus.h  |  7 ++++=0D
 hw/block/dataplane/virtio-blk.c | 26 +++++-------=0D
 hw/scsi/virtio-scsi-dataplane.c | 68 ++++++++++++++++++--------------=0D
 hw/virtio/virtio-bus.c          | 70 +++++++++++++++++++++++++++++++++=0D
 hw/virtio/virtio-pci.c          | 53 +++++++++++++++++--------=0D
 softmmu/memory.c                | 42 ++++++++++++--------=0D
 8 files changed, 225 insertions(+), 90 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


