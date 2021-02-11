Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E83187AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:05:25 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8qi-0004fV-Fk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lA8oH-0003ho-FU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lA8oF-0001ZU-FL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613037770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFmn0tOW/BrgHoVL1pkec+8oBtKnv7SfT1FfZ+fezsY=;
 b=F6m1wwozqLwtYPOxDxHuxqf5al1FJuE1/gTyI5FcZmMkgVHnkm8UuHuqcq4CO6iuINDKb/
 E72UxcgeWL7WhsGwH2N5zCBbFiX9vDb2hUB1ScutjYglFy5I6ml1u3hypAoT5XoDNVGLj/
 GcK6mTF/CSFPBFvoZe1RjpCRbAkSTUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-6BbbSHZkNq6vhrfwyIF6-A-1; Thu, 11 Feb 2021 05:02:48 -0500
X-MC-Unique: 6BbbSHZkNq6vhrfwyIF6-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11BC0107ACC7;
 Thu, 11 Feb 2021 10:02:47 +0000 (UTC)
Received: from work-vm (ovpn-114-222.ams2.redhat.com [10.36.114.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 578221F42D;
 Thu, 11 Feb 2021 10:02:45 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:02:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <YCUAwtYQNhjOmMwV@work-vm>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <YCRDLk8e1A4mxbYd@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YCRDLk8e1A4mxbYd@apples.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Klaus Jensen (its@irrelevant.dk) wrote:
> On Feb 11 04:52, Minwoo Im wrote:
> > nvme_inject_state command is to give a controller state to be.
> > Human Monitor Interface(HMP) supports users to make controller to a
> > specified state of:
> > 
> > 	normal:			Normal state (no injection)
> > 	cmd-interrupted:	Commands will be interrupted internally
> > 
> > This patch is just a start to give dynamic command from the HMP to the
> > QEMU NVMe device model.  If "cmd-interrupted" state is given, then the
> > controller will return all the CQ entries with Command Interrupts status
> > code.
> > 
> > Usage:
> > 	-device nvme,id=nvme0,....
> > 
> > 	(qemu) nvme_inject_state nvme0 cmd-interrupted
> > 
> > 	<All the commands will be interrupted internally>
> > 
> > 	(qemu) nvme_inject_state nvme0 normal
> > 
> > This feature is required to test Linux kernel NVMe driver for the
> > command retry feature.
> > 
> 
> This is super cool and commands like this feel much nicer than the
> qom-set approach that the SMART critical warning feature took.
> 
> But... looking at the existing commands I don't think we can "bloat" it
> up with a device specific command like this, but I don't know the policy
> around this.
> 
> If an HMP command is out, then we should be able to make do with the
> qom-set approach just fine though.

HMP is there to make life easy for Humans debugging; if it makes sense from an
NVMe perspective for test/debug then I'm OK with it from an HMP side.
Note that if it was for more common use than debug/test then you'd want
to make it go via QMP and make sure it was a stable interface that was
going to live for a longtime; but for test uses HMP is fine.

Dave

> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hmp-commands.hx       | 13 ++++++++++++
> >  hw/block/nvme.c       | 49 +++++++++++++++++++++++++++++++++++++++++++
> >  hw/block/nvme.h       |  8 +++++++
> >  include/monitor/hmp.h |  1 +
> >  4 files changed, 71 insertions(+)
> > 
> > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > index d4001f9c5dc6..ef288c567b46 100644
> > --- a/hmp-commands.hx
> > +++ b/hmp-commands.hx
> > @@ -1307,6 +1307,19 @@ SRST
> >    Inject PCIe AER error
> >  ERST
> >  
> > +    {
> > +        .name       = "nvme_inject_state",
> > +        .args_type  = "id:s,state:s",
> > +        .params     = "id [normal|cmd-interrupted]",
> > +        .help       = "inject controller/namespace state",
> > +        .cmd        = hmp_nvme_inject_state,
> > +    },
> > +
> > +SRST
> > +``nvme_inject_state``
> > +  Inject NVMe controller/namespace state
> > +ERST
> > +
> >      {
> >          .name       = "netdev_add",
> >          .args_type  = "netdev:O",
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 6d3c554a0e99..42cf5bd113e6 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -123,6 +123,7 @@
> >  #include "sysemu/sysemu.h"
> >  #include "qapi/error.h"
> >  #include "qapi/visitor.h"
> > +#include "qapi/qmp/qdict.h"
> >  #include "sysemu/hostmem.h"
> >  #include "sysemu/block-backend.h"
> >  #include "exec/memory.h"
> > @@ -132,6 +133,7 @@
> >  #include "trace.h"
> >  #include "nvme.h"
> >  #include "nvme-ns.h"
> > +#include "monitor/monitor.h"
> >  
> >  #define NVME_MAX_IOQPAIRS 0xffff
> >  #define NVME_DB_SIZE  4
> > @@ -966,6 +968,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
> >  {
> >      assert(cq->cqid == req->sq->cqid);
> >  
> > +    /*
> > +     * Override request status field if controller state has been injected by
> > +     * the QMP.
> > +     */
> > +    if (cq->ctrl->state == NVME_STATE_CMD_INTERRUPTED) {
> > +        req->status = NVME_COMMAND_INTERRUPTED;
> > +    }
> > +
> >      if (req->status != NVME_SUCCESS) {
> >          if (cq->ctrl->features.acre && nvme_should_retry(req)) {
> >              if (cq->ctrl->params.cmd_retry_delay > 0) {
> > @@ -5025,4 +5035,43 @@ static void nvme_register_types(void)
> >      type_register_static(&nvme_bus_info);
> >  }
> >  
> > +static void nvme_inject_state(NvmeCtrl *n, NvmeState state)
> > +{
> > +    n->state = state;
> > +}
> > +
> > +static const char *nvme_states[] = {
> > +    [NVME_STATE_NORMAL]             = "normal",
> > +    [NVME_STATE_CMD_INTERRUPTED]    = "cmd-interrupted",
> > +};
> > +
> > +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict)
> > +{
> > +    const char *id = qdict_get_str(qdict, "id");
> > +    const char *state = qdict_get_str(qdict, "state");
> > +    PCIDevice *dev;
> > +    NvmeCtrl *n;
> > +    int ret, i;
> > +
> > +    ret = pci_qdev_find_device(id, &dev);
> > +    if (ret < 0) {
> > +        monitor_printf(mon, "invalid device id %s\n", id);
> > +        return;
> > +    }
> > +
> > +    n = NVME(dev);
> > +
> > +    for (i = 0; i < ARRAY_SIZE(nvme_states); i++) {
> > +        if (!strcmp(nvme_states[i], state)) {
> > +            nvme_inject_state(n, i);
> > +            monitor_printf(mon,
> > +                           "-device nvme,id=%s: state %s injected\n",
> > +                           id, state);
> > +            return;
> > +        }
> > +    }
> > +
> > +    monitor_printf(mon, "invalid state %s\n", state);
> > +}
> > +
> >  type_init(nvme_register_types)
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index 37940b3ac2d2..1af1e0380d9b 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -128,6 +128,11 @@ typedef struct NvmeFeatureVal {
> >      uint8_t     acre;
> >  } NvmeFeatureVal;
> >  
> > +typedef enum NvmeState {
> > +    NVME_STATE_NORMAL,
> > +    NVME_STATE_CMD_INTERRUPTED,
> > +} NvmeState;
> > +
> >  typedef struct NvmeCtrl {
> >      PCIDevice    parent_obj;
> >      MemoryRegion bar0;
> > @@ -185,6 +190,8 @@ typedef struct NvmeCtrl {
> >      NvmeCQueue      admin_cq;
> >      NvmeIdCtrl      id_ctrl;
> >      NvmeFeatureVal  features;
> > +
> > +    NvmeState       state;
> >  } NvmeCtrl;
> >  
> >  static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> > @@ -212,4 +219,5 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
> >  
> >  int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
> >  
> > +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
> >  #endif /* HW_NVME_H */
> > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> > index ed2913fd18e8..668384ea2e34 100644
> > --- a/include/monitor/hmp.h
> > +++ b/include/monitor/hmp.h
> > @@ -79,6 +79,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict);
> >  void hmp_device_add(Monitor *mon, const QDict *qdict);
> >  void hmp_device_del(Monitor *mon, const QDict *qdict);
> >  void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
> > +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
> >  void hmp_netdev_add(Monitor *mon, const QDict *qdict);
> >  void hmp_netdev_del(Monitor *mon, const QDict *qdict);
> >  void hmp_getfd(Monitor *mon, const QDict *qdict);
> > -- 
> > 2.17.1
> > 
> 
> -- 
> One of us - No more doubt, silence or taboo about mental illness.


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


