Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B5376931
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:02:02 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3rV-0008NM-5e
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3p1-0006rn-1V
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:28 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3oy-0005Bh-FB
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:26 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-CUGJQW_EOQyR9Z9M2ne9CQ-1; Fri, 07 May 2021 12:59:20 -0400
X-MC-Unique: CUGJQW_EOQyR9Z9M2ne9CQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E4D8015F5;
 Fri,  7 May 2021 16:59:19 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F9F10023AF;
 Fri,  7 May 2021 16:59:06 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Date: Fri,  7 May 2021 18:59:01 +0200
Message-Id: <20210507165905.748196-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
              virtio-scsi      virtio-blk=0D
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
This series simply changes the device models to extend the transaction=0D
to all virtqueueues, like already done in the past in the generic=0D
code with 710fccf80d78 ("virtio: improve virtio devices initialization=0D
time").=0D
=0D
Only virtio-scsi and virtio-blk are covered here, but a similar change=0D
might also be beneficial to other device types such as host-scsi-pci,=0D
vhost-user-scsi-pci and vhost-user-blk-pci.=0D
=0D
              virtio-scsi      virtio-blk=0D
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
This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108=0D
which reported the issue for virtio-scsi-pci.=0D
=0D
Changes since v1:=0D
- Add some comments (Stefan)=0D
- Drop optimization on the error path in patch 2 (Stefan)=0D
=0D
Changes since RFC:=0D
=0D
As suggested by Stefan, splimplify the code by directly beginning and=0D
committing the memory transaction from the device model, without all=0D
the virtio specific proxying code and no changes needed in the memory=0D
subsystem.=0D
=0D
Greg Kurz (4):=0D
  virtio-blk: Fix rollback path in virtio_blk_data_plane_start()=0D
  virtio-blk: Configure all host notifiers in a single MR transaction=0D
  virtio-scsi: Set host notifiers and callbacks separately=0D
  virtio-scsi: Configure all host notifiers in a single MR transaction=0D
=0D
 hw/block/dataplane/virtio-blk.c | 45 ++++++++++++++++++++-=0D
 hw/scsi/virtio-scsi-dataplane.c | 72 ++++++++++++++++++++++++---------=0D
 2 files changed, 97 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


