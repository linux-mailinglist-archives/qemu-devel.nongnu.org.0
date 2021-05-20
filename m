Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC838A370
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 11:51:25 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljfKu-0001FG-BA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 05:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljfJx-0000Qg-TP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljfJu-0006a8-Ul
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621504221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1ZGn+JnDqLkh49Rzvg99C6NYXBzpykyCeC02z7AbKo=;
 b=XE4Uuz3LZScm+ydm5dMFZLHu0SDfSaYJMVD3dzRGd1dDcYzdI2IqG7pgRFpwjTOzdO8K49
 mf1L9zk3HLHR+rK156vTfeAxZQNfYm+iMQV3RtyYekMD7ZuhlB5XWZ4WwtYcSGDkZln1pq
 3XUkZ91NBww0vRjPp+Kyll/87gHW728=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-1bD-dujYO6-GQVotE-LUQQ-1; Thu, 20 May 2021 05:50:19 -0400
X-MC-Unique: 1bD-dujYO6-GQVotE-LUQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB078189E5;
 Thu, 20 May 2021 09:50:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A0519C59;
 Thu, 20 May 2021 09:50:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C10151800393; Thu, 20 May 2021 11:50:12 +0200 (CEST)
Date: Thu, 20 May 2021 11:50:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Message-ID: <20210520095012.h3naydbrycpuv5xa@sirius.home.kraxel.org>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
 <20210519001414.786439-4-vivek.kasireddy@intel.com>
 <20210519061339.dq4yfrc7j42jdj5g@sirius.home.kraxel.org>
 <957d144a53ed4549944cbb09fdffe2cb@intel.com>
MIME-Version: 1.0
In-Reply-To: <957d144a53ed4549944cbb09fdffe2cb@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 06:23:58AM +0000, Kasireddy, Vivek wrote:
> Hi Gerd,
>  
> > > +#ifdef CONFIG_LINUX
> > 
> > > +void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
> > 
> > > +#else
> > 
> > > +void *virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
> > > +{
> > > +    /* nothing (stub) */
> > > +    return NULL
> > > +}
> > 
> > Fails to build for !linux ...
> > 
> > You can place the stubs in a file in the stubs/ directory instead.
> > They'll be used via weak symbol references instead of #ifdefs then.
> [Kasireddy, Vivek] Will do; should I send the whole series (v6) again with this and the
> other error in patch #10 fixed or just the fixed versions of these specific patches?

New series please.

> I see that in set_scanout:
> 
> g->parent_obj.enable = 1;

Yep.  When the guest configured a scanout for the first time enable is
set.  device reset clears it btw.  And set_scanout_blob should take care
to set enable too.

> VirtIOGPUBase *g = vvga->vgpu;
>
> if (g->enable) {
>     g->hw_ops->gfx_update(g);
> } else {
>     vvga->vga.hw_ops->gfx_update(&vvga->vga);
> }
> 
> Since the parent_obj is different the above code is always going into the else part. 

No.  VirtIOGPU->parent_obj actually *is* VirtIOGPUBase.

> Is the goal here to show the content from virtio-gpu if there is a set_scanout?

Yes.  The idea is to switch into virtio-gpu mode when the guest driver
did load and successfully initialized the scanout.  Go back into vga
mode when the device get reset due to reboot (or other reasons).

> The only way we are able to get everything to work as expected is to enable our virtio-gpu
> guest driver for the VGA device instead of the virtio-gpu PCI device. But we are not sure
> if this would be OK or not. We don't run into these issues for Linux guests as we only 
> enable virtio-gpu-pci as we have -vga none.

I'd suggest to run qemu with "-vga none" or "-nodefaults" so qemu will
not automatically add a display device.  Then explicitly add the device
you want.

  "-device virtio-gpu-pci" is the pure virtio-gpu.
  "-device virtio-vga" is the virtio-gpu device with vga compatibility.

Both should work just fine with both linux and windows.  The only
difference is that you'll get boot messages with virtio-vga (thanks to
vga compat mode) whereas virtio-gpu-pci doesn't display anything until
the guest display driver is loaded.

OVMF can handle both virtio-gpu-pci and virtio-vga so you should see
the grub boot menu with both devices.  A GOP (used by efifb) is only
available with virtio-vga though.  Not sure how windows behaves here,
probably it wants a GOP too for the early boot screen.

The standard vga is "-device VGA", cirrus is "-device cirrus-vga".

HTH,
  Gerd


