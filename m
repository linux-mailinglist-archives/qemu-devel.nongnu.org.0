Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB012F98E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 16:09:31 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inOZt-0002go-IQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 10:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yang.zhong@intel.com>) id 1inOZ4-00027K-UO
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yang.zhong@intel.com>) id 1inOZ2-0006oR-7d
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:08:37 -0500
Received: from mga01.intel.com ([192.55.52.88]:21703)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yang.zhong@intel.com>)
 id 1inOZ1-00069s-RG
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:08:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 07:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,391,1571727600"; d="scan'208";a="224966253"
Received: from yangzhon-virtual.bj.intel.com (HELO localhost) ([10.238.145.50])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2020 07:08:26 -0800
Date: Fri, 3 Jan 2020 23:01:45 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio: add the queue number check
Message-ID: <20200103150145.GA24552@yangzhon-Virtual>
References: <20191223082813.28930-1-yang.zhong@intel.com>
 <5cb6ace0-dd8e-aa22-e280-1e697c2c4156@redhat.com>
 <20191223091856.GA8433@yangzhon-Virtual>
 <e13a5fcc-b861-1847-58a8-e3d6445f84b0@redhat.com>
 <20191223092508-mutt-send-email-mst@kernel.org>
 <187f02d9-1677-d232-a44a-ed7b1e5f6ee5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187f02d9-1677-d232-a44a-ed7b1e5f6ee5@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 23, 2019 at 06:33:26PM +0100, Paolo Bonzini wrote:
> On 23/12/19 15:25, Michael S. Tsirkin wrote:
> > On Mon, Dec 23, 2019 at 12:02:18PM +0100, Paolo Bonzini wrote:
> >> On 23/12/19 10:18, Yang Zhong wrote:
> >>>   In this time, the queue number in the front-end block driver is 2, but
> >>>   the queue number in qemu side is still 4. So the guest virtio_blk
> >>>   driver will failed to create vq with backend.
> >>
> >> Where?
> >>
> >>>   There is no "set back"
> >>>   mechnism for block driver to inform backend this new queue number.
> >>>   So, i added this check in qemu side.
> >>
> >> Perhaps the guest kernel should still create the virtqueues, and just
> >> not use them.  In any case, now that you have explained it, it is
> >> certainly a guest bug.
> > 
> > Paolo do you understand where the bug is?
> 
> No, I asked above where does the virtio_blk driver fail to create the
> virtqueues.  But it shouldn't; it is legal for the guest not to
> configure all virtqueues, and QEMU knows to ignore the extra ones.  For
> example, firmware can ignore virtio-scsi request queues above the first,
> or ignore the virtio-scsi control and event queues (see
> src/hw/virtio-scsi.c in SeaBIOS, it only calls vp_find_vq with index 2).
> 
> In particular this is the reason why request queues for virtio-scsi are
> numbered 2 and above, rather than starting from zero: this way, the
> guest can just pretend that unnecessary queues do not exist, and still
> keep the virtqueue numbers consecutive.
> 
> > E.g. I see this in vhost user block:
> > 
> >     /* Kick right away to begin processing requests already in vring */
> >     for (i = 0; i < s->dev.nvqs; i++) {
> >         VirtQueue *kick_vq = virtio_get_queue(vdev, i);
> > 
> >         if (!virtio_queue_get_desc_addr(vdev, i)) {
> >             continue;
> >         }
> >         event_notifier_set(virtio_queue_get_host_notifier(kick_vq));
> >     }
> > 
> > which is an (admittedly hacky) want to skip VQs which
> > were not configured by guest ....
> 
> Right, this is an example of QEMU ignoring extra virtqueues.
> 
  Thanks Paolo and Michael's comments.

  Yes, the Qemu should ignore those extra vqs when guest virtio-blk
  driver do min(cpu,num_vqs) in the probe function.

  I also tried virtio-blk device like below:
  https://patchwork.kernel.org/cover/10873193/

  The virtio-blk can work with this changes, but vhost-user-blk device
  failed with this kernel patch.

  in vhost_virtqueue_start() function, below operation to check if the
  desc addr set by guest kernel. This will ignore the extra vqs.
    a = virtio_queue_get_desc_addr(vdev, idx);
    if (a == 0) {
        /* Queue might not be ready for start */
        return 0;
    }

  If guest kernel add min(cpu,num_vqs), do we need add same check in
  realize function of vhost-user-blk device?

+    QemuOpts *opts = qemu_opts_find(qemu_find_opts("smp-opts"), NULL);
+    cpus = qemu_opt_get_number(opts, "maxcpus", 0);
+    if (!cpus)
+        cpus = qemu_opt_get_number(opts, "cpus", 0);
+
+    s->num_queues = MIN(s->num_queues, cpus);

     if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
         return;

   If this patch is suitable for this issue, i will send this.
   or i will continue to check better solution in qemu and guest kernel.
   Thanks a lot!

   Yang

> Paolo
> 
> > 
> > 
> >>>   Since the current virtio-blk and vhost-user-blk device always
> >>>   defaultly use 1 queue, it's hard to find this issue.
> >>>
> >>>   I checked the guest kernel driver, virtio-scsi and virtio-blk all
> >>>   have same check in their driver probe:
> >>>
> >>>   num_vqs = min_t(unsigned int, nr_cpu_ids, num_vqs);
> >>>  
> >>>   It's possible the guest driver has different queue number with qemu
> >>>   side.
> >>>
> >>>   I also want to fix this issue from guest driver side, but currently there 
> >>>   is no better solution to fix this issue.
> >>>
> >>>   By the way, i did not try scsi with this corner case, and only check
> >>>   driver and qemu code to find same issue. thanks! 
> >>>
> >>>   Yang
> >>>
> >>>> Paolo
> >>>>
> >>>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >>>>> ---
> >>>>>  hw/block/vhost-user-blk.c | 11 +++++++++++
> >>>>>  hw/block/virtio-blk.c     | 11 ++++++++++-
> >>>>>  hw/scsi/virtio-scsi.c     | 12 ++++++++++++
> >>>>>  3 files changed, 33 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >>>>> index 63da9bb619..250e72abe4 100644
> >>>>> --- a/hw/block/vhost-user-blk.c
> >>>>> +++ b/hw/block/vhost-user-blk.c
> >>>>> @@ -23,6 +23,8 @@
> >>>>>  #include "qom/object.h"
> >>>>>  #include "hw/qdev-core.h"
> >>>>>  #include "hw/qdev-properties.h"
> >>>>> +#include "qemu/option.h"
> >>>>> +#include "qemu/config-file.h"
> >>>>>  #include "hw/virtio/vhost.h"
> >>>>>  #include "hw/virtio/vhost-user-blk.h"
> >>>>>  #include "hw/virtio/virtio.h"
> >>>>> @@ -391,6 +393,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> >>>>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >>>>>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> >>>>>      Error *err = NULL;
> >>>>> +    unsigned cpus;
> >>>>>      int i, ret;
> >>>>>  
> >>>>>      if (!s->chardev.chr) {
> >>>>> @@ -403,6 +406,14 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> >>>>>          return;
> >>>>>      }
> >>>>>  
> >>>>> +    cpus = qemu_opt_get_number(qemu_opts_find(qemu_find_opts("smp-opts"), NULL),
> >>>>> +                               "cpus", 0);
> >>>>> +    if (s->num_queues > cpus ) {
> >>>>> +        error_setg(errp, "vhost-user-blk: the queue number should be equal "
> >>>>> +                "or less than vcpu number");
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>>      if (!s->queue_size) {
> >>>>>          error_setg(errp, "vhost-user-blk: queue size must be non-zero");
> >>>>>          return;
> >>>>> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> >>>>> index d62e6377c2..b2f4d01148 100644
> >>>>> --- a/hw/block/virtio-blk.c
> >>>>> +++ b/hw/block/virtio-blk.c
> >>>>> @@ -18,6 +18,8 @@
> >>>>>  #include "qemu/error-report.h"
> >>>>>  #include "qemu/main-loop.h"
> >>>>>  #include "trace.h"
> >>>>> +#include "qemu/option.h"
> >>>>> +#include "qemu/config-file.h"
> >>>>>  #include "hw/block/block.h"
> >>>>>  #include "hw/qdev-properties.h"
> >>>>>  #include "sysemu/blockdev.h"
> >>>>> @@ -1119,7 +1121,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
> >>>>>      VirtIOBlock *s = VIRTIO_BLK(dev);
> >>>>>      VirtIOBlkConf *conf = &s->conf;
> >>>>>      Error *err = NULL;
> >>>>> -    unsigned i;
> >>>>> +    unsigned i,cpus;
> >>>>>  
> >>>>>      if (!conf->conf.blk) {
> >>>>>          error_setg(errp, "drive property not set");
> >>>>> @@ -1133,6 +1135,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
> >>>>>          error_setg(errp, "num-queues property must be larger than 0");
> >>>>>          return;
> >>>>>      }
> >>>>> +    cpus = qemu_opt_get_number(qemu_opts_find(qemu_find_opts("smp-opts"), NULL),
> >>>>> +                               "cpus", 0);
> >>>>> +    if (conf->num_queues > cpus ) {
> >>>>> +        error_setg(errp, "virtio-blk: the queue number should be equal "
> >>>>> +                "or less than vcpu number");
> >>>>> +        return;
> >>>>> +    }
> >>>>>      if (!is_power_of_2(conf->queue_size) ||
> >>>>>          conf->queue_size > VIRTQUEUE_MAX_SIZE) {
> >>>>>          error_setg(errp, "invalid queue-size property (%" PRIu16 "), "
> >>>>> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> >>>>> index e8b2b64d09..8e3e44f6b9 100644
> >>>>> --- a/hw/scsi/virtio-scsi.c
> >>>>> +++ b/hw/scsi/virtio-scsi.c
> >>>>> @@ -21,6 +21,8 @@
> >>>>>  #include "qemu/error-report.h"
> >>>>>  #include "qemu/iov.h"
> >>>>>  #include "qemu/module.h"
> >>>>> +#include "qemu/option.h"
> >>>>> +#include "qemu/config-file.h"
> >>>>>  #include "sysemu/block-backend.h"
> >>>>>  #include "hw/qdev-properties.h"
> >>>>>  #include "hw/scsi/scsi.h"
> >>>>> @@ -880,6 +882,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
> >>>>>  {
> >>>>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >>>>>      VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
> >>>>> +    unsigned cpus;
> >>>>>      int i;
> >>>>>  
> >>>>>      virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
> >>>>> @@ -893,6 +896,15 @@ void virtio_scsi_common_realize(DeviceState *dev,
> >>>>>          virtio_cleanup(vdev);
> >>>>>          return;
> >>>>>      }
> >>>>> +
> >>>>> +    cpus = qemu_opt_get_number(qemu_opts_find(qemu_find_opts("smp-opts"), NULL),
> >>>>> +                               "cpus", 0);
> >>>>> +    if (s->conf.num_queues > cpus ) {
> >>>>> +        error_setg(errp, "virtio-scsi: the queue number should be equal "
> >>>>> +                "or less than vcpu number");
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>>      s->cmd_vqs = g_new0(VirtQueue *, s->conf.num_queues);
> >>>>>      s->sense_size = VIRTIO_SCSI_SENSE_DEFAULT_SIZE;
> >>>>>      s->cdb_size = VIRTIO_SCSI_CDB_DEFAULT_SIZE;
> >>>>>
> >>>
> > 

