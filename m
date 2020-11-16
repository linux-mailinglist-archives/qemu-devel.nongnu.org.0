Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C32B4051
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:55:11 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebE5-0005F6-U7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kebCf-0004es-J2
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kebCc-00070X-1c
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605520415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZYqBjX8yYGXMhNDpYQC9X1C9lD25rvo3M3MRvUXFHs=;
 b=IFUQ6xN5f96/3t7wmMThCzG3xL+jFxKuM+21Bqk1Dp1fuy6V9LnTXR+LbL3YQjTm2SHjMj
 iVk9TQFyqKCduXFzGZo0I2IwV+wZ2LQP3zhblJIxeuGH2gKFjIC3fcMKJ/KdFeBH+23y+L
 +K1Hm2rV2cOSiSshiGGnjSVZ7qtvruI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-VlqOB-N8MBeZ-OCt5aMG5g-1; Mon, 16 Nov 2020 04:52:53 -0500
X-MC-Unique: VlqOB-N8MBeZ-OCt5aMG5g-1
Received: by mail-wm1-f71.google.com with SMTP id y1so9970772wma.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 01:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aZYqBjX8yYGXMhNDpYQC9X1C9lD25rvo3M3MRvUXFHs=;
 b=p40UO/+kbCajpM7NYhBqRfHwv6ZVFIAZq83mpBT0ezezE/DfaNt0n/bXUYduBkMYRu
 pHsaV/FzUO2tmvgv7XcyeMSj1qauve+UGAxg+E4sKIGMctnVc9wWjspm1sjxeZVp6T6L
 hgK+OAXeuvqZbvzvUPN8vwL2zDSoajDER5zioTBpI5XL4v9e1/zhzLJ2X27o9rNpdPwK
 T8DMw63gtPL2xjM29G3OlStX9OYxgR/ZjTq+c/9L58VG9gGo7hfpL8dCHP4pcqmJW2zK
 BmBonG1a6rwrhcWWsV8n/p+4vIHAoc1Ka8HXMrUMUBmR579ZIRyQ4XjgmxjnL2K205sz
 3zyQ==
X-Gm-Message-State: AOAM532oRzrJTQ8+WZ8Yq1DTaQ+R0KFLVdXe8boTAwaCFh6mgfdCkxy3
 b5M/3qizEsVNssOU+baDeMGZjh5AC/m0LA1cu3lUSyIQoaCewzUWNWIKakFwfKeQZTnoy2nkiT5
 W1t/J7d6qYvu3xkI=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr14807535wmb.16.1605520372748; 
 Mon, 16 Nov 2020 01:52:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQkEuRwhk9WQ+2jgRdt/346ZUOIMV8Vu89S98gSicG73PjTJIkD3KIe3yYzsxTkAiuKNOJVg==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr14807518wmb.16.1605520372500; 
 Mon, 16 Nov 2020 01:52:52 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id a128sm19376773wmf.5.2020.11.16.01.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 01:52:51 -0800 (PST)
Date: Mon, 16 Nov 2020 04:52:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Subject: Re: [PATCH] contrib/libvhost-user: Fix bad printf format specifiers
Message-ID: <20201116045218-mutt-send-email-mst@kernel.org>
References: <5FA28106.6000901@huawei.com>
 <5FB1E074.50205@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5FB1E074.50205@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, marcandre.lureau@redhat.com,
 QEMU <qemu-devel@nongnu.org>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's in the latest pull weren't you Cc'd?

On Mon, Nov 16, 2020 at 10:14:12AM +0800, Alex Chen wrote:
> Kindly ping...
> 
> On 2020/11/4 18:23, AlexChen wrote:
> > We should use printf format specifier "%u" instead of "%d" for
> > argument of type "unsigned int".
> > 
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
> > ---
> >  contrib/libvhost-user/libvhost-user.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> > index bfec8a881a..5c73ffdd6b 100644
> > --- a/contrib/libvhost-user/libvhost-user.c
> > +++ b/contrib/libvhost-user/libvhost-user.c
> > @@ -701,7 +701,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >          return false;
> >      }
> > 
> > -    DPRINT("Adding region: %d\n", dev->nregions);
> > +    DPRINT("Adding region: %u\n", dev->nregions);
> >      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
> >             msg_region->guest_phys_addr);
> >      DPRINT("    memory_size:     0x%016"PRIx64"\n",
> > @@ -848,7 +848,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
> >      VhostUserMemory m = vmsg->payload.memory, *memory = &m;
> >      dev->nregions = memory->nregions;
> > 
> > -    DPRINT("Nregions: %d\n", memory->nregions);
> > +    DPRINT("Nregions: %u\n", memory->nregions);
> >      for (i = 0; i < dev->nregions; i++) {
> >          void *mmap_addr;
> >          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> > @@ -938,7 +938,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
> >          return vu_set_mem_table_exec_postcopy(dev, vmsg);
> >      }
> > 
> > -    DPRINT("Nregions: %d\n", memory->nregions);
> > +    DPRINT("Nregions: %u\n", memory->nregions);
> >      for (i = 0; i < dev->nregions; i++) {
> >          void *mmap_addr;
> >          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> > @@ -1049,8 +1049,8 @@ vu_set_vring_num_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int num = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.num:   %d\n", num);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.num:   %u\n", num);
> >      dev->vq[index].vring.num = num;
> > 
> >      return false;
> > @@ -1105,8 +1105,8 @@ vu_set_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int num = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.num:   %d\n", num);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.num:   %u\n", num);
> >      dev->vq[index].shadow_avail_idx = dev->vq[index].last_avail_idx = num;
> > 
> >      return false;
> > @@ -1117,7 +1117,7 @@ vu_get_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
> >  {
> >      unsigned int index = vmsg->payload.state.index;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > +    DPRINT("State.index: %u\n", index);
> >      vmsg->payload.state.num = dev->vq[index].last_avail_idx;
> >      vmsg->size = sizeof(vmsg->payload.state);
> > 
> > @@ -1478,8 +1478,8 @@ vu_set_vring_enable_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int enable = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.enable:   %d\n", enable);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.enable:   %u\n", enable);
> > 
> >      if (index >= dev->max_queues) {
> >          vu_panic(dev, "Invalid vring_enable index: %u", index);
> > @@ -1728,7 +1728,7 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
> >          return false;
> >      }
> > 
> > -    DPRINT("Got kick message: handler:%p idx:%d\n",
> > +    DPRINT("Got kick message: handler:%p idx:%u\n",
> >             dev->vq[index].handler, index);
> > 
> >      if (!dev->vq[index].started) {
> > @@ -1772,7 +1772,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
> >      DPRINT("Request: %s (%d)\n", vu_request_to_string(vmsg->request),
> >             vmsg->request);
> >      DPRINT("Flags:   0x%x\n", vmsg->flags);
> > -    DPRINT("Size:    %d\n", vmsg->size);
> > +    DPRINT("Size:    %u\n", vmsg->size);
> > 
> >      if (vmsg->fd_num) {
> >          int i;
> > 


