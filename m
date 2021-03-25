Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3D34993C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:11:35 +0100 (CET)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUSE-0006aF-9b
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lPUMd-00052b-UX; Thu, 25 Mar 2021 14:05:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lPUMX-0004Al-NF; Thu, 25 Mar 2021 14:05:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3B6B494AA927;
 Thu, 25 Mar 2021 19:05:36 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 19:05:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00568ac2de4-c1cb-4ec9-b203-cb4f049ea7b0,
 9FF242228AEDA557CE571C504A609AA08406F586) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 25 Mar 2021 19:05:34 +0100
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210325190534.7fbdb942@bahia.lan>
In-Reply-To: <20210325130429-mutt-send-email-mst@kernel.org>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325130429-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5514fe00-06ce-4d32-9ba4-b44718acc6aa
X-Ovh-Tracer-Id: 15055533554977511858
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdefgfdtgeeluddujeejleffgffhhedtieeggffguddvgfekvefgfeettdejheevnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepjhgrshhofigrnhhgsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 13:05:16 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > a serious slow down may be observed on setups with a big enough number
> > of vCPUs.
> > 
> > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):
> > 
> > 1		0m20.922s	0m21.346s
> > 2		0m21.230s	0m20.350s
> > 4		0m21.761s	0m20.997s
> > 8		0m22.770s	0m20.051s
> > 16		0m22.038s	0m19.994s
> > 32		0m22.928s	0m20.803s
> > 64		0m26.583s	0m22.953s
> > 128		0m41.273s	0m32.333s
> > 256		2m4.727s 	1m16.924s
> > 384		6m5.563s 	3m26.186s
> > 
> > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > the ioeventfds:
> > 
> >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
> >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > =>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_before
> > =>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioeventfds
> >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> > 
> > address_space_update_ioeventfds() is called when committing an MR
> > transaction, i.e. for each ioeventfd with the current code base,
> > and it internally loops on all ioventfds:
> > 
> > static void address_space_update_ioeventfds(AddressSpace *as)
> > {
> > [...]
> >     FOR_EACH_FLAT_RANGE(fr, view) {
> >         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
> > 
> > This means that the setup of ioeventfds for these devices has
> > quadratic time complexity.
> > 
> > This series introduce generic APIs to allow batch creation and deletion
> > of ioeventfds, and converts virtio-blk and virtio-scsi to use them. This
> > greatly improves the numbers:
> > 
> > 1		0m21.271s	0m22.076s
> > 2		0m20.912s	0m19.716s
> > 4		0m20.508s	0m19.310s
> > 8		0m21.374s	0m20.273s
> > 16		0m21.559s	0m21.374s
> > 32		0m22.532s	0m21.271s
> > 64		0m26.550s	0m22.007s
> > 128		0m29.115s	0m27.446s
> > 256		0m44.752s	0m41.004s
> > 384		1m2.884s	0m58.023s
> > 
> > The series deliberately spans over multiple subsystems for easier
> > review and experimenting. It also does some preliminary fixes on
> > the way. It is thus posted as an RFC for now, but if the general
> > idea is acceptable, I guess a non-RFC could be posted and maybe
> > extend the feature to some other devices that might suffer from
> > similar scaling issues, e.g. vhost-scsi-pci, vhost-user-scsi-pci
> > and vhost-user-blk-pci, even if I haven't checked.
> > 
> > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1927108
> > which reported the issue for virtio-scsi-pci.
> 
> 
> Series looks ok from a quick look ...
> 
> this is a regression isn't it?

This is a regression only if we consider the defaults. Manually setting
num_queues to a high value already affects existing devices.

> So I guess we'll need that in 6.0 or revert the # of vqs
> change for now ...
> 

Not sure it is safe to merge these fixes this late... also,
as said above, I've only tested virtio-scsi and virtio-blk
but I believe the vhost-user-* variants might be affected too.

Reverting the # of vqs would really be a pity IMHO. What
about mitigating the effects ? e.g. enforce previous
behavior only if # vcpus > 64 ?

> > Greg Kurz (8):
> >   memory: Allow eventfd add/del without starting a transaction
> >   virtio: Introduce virtio_bus_set_host_notifiers()
> >   virtio: Add API to batch set host notifiers
> >   virtio-pci: Batch add/del ioeventfds in a single MR transaction
> >   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
> >   virtio-blk: Use virtio_bus_set_host_notifiers()
> >   virtio-scsi: Set host notifiers and callbacks separately
> >   virtio-scsi: Use virtio_bus_set_host_notifiers()
> > 
> >  hw/virtio/virtio-pci.h          |  1 +
> >  include/exec/memory.h           | 48 ++++++++++++++++------
> >  include/hw/virtio/virtio-bus.h  |  7 ++++
> >  hw/block/dataplane/virtio-blk.c | 26 +++++-------
> >  hw/scsi/virtio-scsi-dataplane.c | 68 ++++++++++++++++++--------------
> >  hw/virtio/virtio-bus.c          | 70 +++++++++++++++++++++++++++++++++
> >  hw/virtio/virtio-pci.c          | 53 +++++++++++++++++--------
> >  softmmu/memory.c                | 42 ++++++++++++--------
> >  8 files changed, 225 insertions(+), 90 deletions(-)
> > 
> > -- 
> > 2.26.3
> > 
> 


