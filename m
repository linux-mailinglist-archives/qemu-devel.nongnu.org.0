Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9749F6AC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 10:51:14 +0100 (CET)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDNuP-0001iF-Gz
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 04:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDNrg-0008PS-4r
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDNrb-0001vd-RI
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643363294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sz/5lubMAr5aTwlU+gba/YKMU/b6wnqVD6BrwYOGgIo=;
 b=EI9uqkb5iU4IAG0RmkwkJF9oxEQ75GqkcCr0zDjoA32EQNmp2oeUnUOQxm9cRFkHjWHgJg
 D4034T+SCUakyCXUu5M1Fp6itFHygCzerEAQ8IRz1QYfJqTvXzNgki3OAyBsas6FQONB5/
 At/TYOVtHHOh3LwQfIaiw/z23i840tg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-KLHR4g0QMa-rxxKEq20_bg-1; Fri, 28 Jan 2022 04:48:11 -0500
X-MC-Unique: KLHR4g0QMa-rxxKEq20_bg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c10-20020adfa30a000000b001d79c73b64bso2069431wrb.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 01:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sz/5lubMAr5aTwlU+gba/YKMU/b6wnqVD6BrwYOGgIo=;
 b=rfWHqpCybg+dKenpStbgjL+xp98hQIBnf8GNvsX/7HwO4lPCldHlTJIaiBuvarsHyL
 eLfHtdWofMsEuiph7O/5Oi1c/wt4AmJ4i/qnBTN3xWoT5b18qBFCWelURvOyaf1+4HO6
 aCSPLdpQ58dro4J4BFL9BeU1Ki6HhqLSIAgSmpCGZFHAkX4FBN+/H11oI4sfuVDhGAZM
 9yX3QuSlc25FqMV79jZoEgVztr1x436WIAVBbQei8mWLr5Q3yIqFFevhpIknAX1LNc3x
 a4nJvqZSmBJAWLDQBZwWbVrfLY93zssDyY4FvI+jdIwHj/sjE5cW98ia2PVgwMIujYkC
 765g==
X-Gm-Message-State: AOAM532A0mnWzpObBBAzYST/gKsQ8Q5ETq7/Cv4iaUDndYc/s9bko8LZ
 FBVuKa11yz82e5hwpbBZibc9LCQMb/vhL7+DGjNjZKiWBFEV8ZwBKV+g3c3h1CzP4A5+miYR9MP
 NPky6FEWe6Np/Lro=
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr14863896wmi.47.1643363290330; 
 Fri, 28 Jan 2022 01:48:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFH6hSafPpeK7ux2CQUGAEpfOEt+GdZ0795k1xKJAyR9WZ3O8LqJXZuS7ECUXclaEtrx3dnQ==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr14863861wmi.47.1643363289885; 
 Fri, 28 Jan 2022 01:48:09 -0800 (PST)
Received: from redhat.com ([2.55.144.199])
 by smtp.gmail.com with ESMTPSA id v124sm1514154wme.30.2022.01.28.01.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 01:48:09 -0800 (PST)
Date: Fri, 28 Jan 2022 04:48:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220128044643-mutt-send-email-mst@kernel.org>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
 <20220128032911.440323f1.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220128032911.440323f1.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 03:29:11AM +0100, Halil Pasic wrote:
> On Thu, 27 Jan 2022 18:34:23 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
> > On 1/27/22 10:28, Halil Pasic wrote:
> > > ping^2
> > > 
> > > Also adding Brijesh and Daniel, as I believe you guys should be
> > > interested in this, and I'm yet to receive review.
> > > 
> > > @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
> > > too, and that the fix works for your platforms as well?  
> > 
> > I failed to find a host that has Power secure execution support. I'll keep looking.
> > 
> > 
> > Meanwhile I have to mention that this patch re-introduced the problem that Kevin's
> > commit fixed.
> > 
> > 
> > With current upstream, if you start a regular guest with the following command line:
> > 
> > qemu-system-ppc64 (....)
> > -chardev socket,id=char0,path=/tmp/vhostqemu
> > -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on
> > 
> > i.e. a guest with a vhost-user-fs-pci device that claims to have iommu support,
> > but it doesn't, this is the error message:
> > 
> > 
> > qemu-system-ppc64: -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on: iommu_platform=true is not supported by the device
> > 
> > 
> > With this patch, that command line above starts the guest. 
> > virtiofsd fails during boot:
> > 
> > sudo ~/qemu/build/tools/virtiofsd/virtiofsd --socket-path=/tmp/vhostqemu -o source=~/linux-L1
> > [sudo] password for danielhb:
> > virtio_session_mount: Waiting for vhost-user socket connection...
> > virtio_session_mount: Received vhost-user socket connection
> > virtio_loop: Entry
> > fv_panic: libvhost-user: Invalid vring_addr message
> > 
> > 
> > And inside the guest, if you attempt to mount and use the virtiofs filesystem, the guest
> > hangs:
> > 
> > [root@localhost ~]# mount -t virtiofs myfs /mnt
> > [root@localhost ~]# cd /mnt
> > 
> > (hangs)
> > 
> > Exiting QEMU throws several vhost related errors:
> > 
> > 
> > QEMU 6.2.50 monitor - type 'help' for more information
> > (qemu) quit
> > qemu-system-ppc64: Failed to set msg fds.
> > qemu-system-ppc64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-ppc64: Failed to set msg fds.
> > qemu-system-ppc64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-ppc64: Failed to set msg fds.
> > qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)
> > qemu-system-ppc64: Failed to set msg fds.
> > qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)
> > 
> > 
> 
> 
> Does your VM have an IOMMU and does your guest see it? If yes does
> vdev->dma_as != &address_space_memory hold for your virtio device? If no why not?
> 
> My understanding is that your guest wants to do translated addresses,
> because it sees the ACCESS_PLATFORM feature, and probably thinks that
> your device is indeed behind an IOMMU, from what I assume, at least it
> sees that there is an IOMMU. But then I would expect your virtio device
> to have its vdev->dma_as set to something different than
> &address_space_memory. Conversely if your dma address space is
> address_space_memory, then you don't need address translation because
> your dma addresses are the same  as your guest physical addresses.
> 
> > 
> > I made a little experiment with upstream and reverting Kevin's patch and the result is
> > the same, meaning that this is the original bug [1] Kevin fixed back then. Note that [1]
> > was reported on x86, meaning that this particular issue seems to be arch agnostic.
> 
> We don't have this problem on s390, so it ain't entirely arch agnostic.
> 
> > 
> > 
> > My point here is that your patch fixes the situation for s390x, and Brijesh already chimed
> > in claiming that it fixed for AMD SEV, but it reintroduced a bug. I believe you should
> > include this test case with vhost-user in your testing to figure out a way to fix what
> > is needed without adding this particular regression.
> 
> Can you help me with this? IMHO the big problem is that iommu_platform
> is used for two distinct things. I've described that in the commit
> message.
> 
> We may be able to differentiate between the two using ->dma_as, but for
> that it needs to be set up correctly: whenever you require translation
> it should be something different than address_space_memory. The question
> is why do you require translation but don't have your ->dma_as set up
> properly? It can be a guest thing, i.e. guest just assumes it has to do
> bus addresses, while it actually does not have to, or we indeed do have
> an IOMMU which polices the devices access to the guest memory, but for
> some strange reason we failed to set up ->dma_as to reflect that.
> 
> @Michael: what is your opinion?

Right, I am puzzled too.

> > 
> > 
> > In fact, I have a feeling that this is not the first time this kind of situation is discussed
> > around here. This reminds me of [2] and a discussion about the order virtiofs features
> > are negotiated versus when/how QEMU inits the devices.
> > 
> > 
> > 
> > [1] https://bugzilla.redhat.com/show_bug.cgi?id=1935019
> > [2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05644.html
> > 
> > 
> > Thanks,
> > 
> > 
> > Daniel
> > 
> > 
> > > 
> > > Regards,
> > > Halil
> > > 
> > > On Tue, 25 Jan 2022 11:21:12 +0100
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > >   
> > >> ping
> > >>
> > >> On Mon, 17 Jan 2022 13:02:38 +0100
> > >> Halil Pasic <pasic@linux.ibm.com> wrote:
> > >>  
> > >>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > >>> unsupported") claims to fail the device hotplug when iommu_platform
> > >>> is requested, but not supported by the (vhost) device. On the first
> > >>> glance the condition for detecting that situation looks perfect, but
> > >>> because a certain peculiarity of virtio_platform it ain't.
> > >>>
> > >>> In fact the aforementioned commit introduces a regression. It breaks
> > >>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> > >>> or any other confidential guest scenario that relies encrypted guest
> > >>> memory.  The same also applies to any other vhost device that does not
> > >>> support _F_ACCESS_PLATFORM.
> > >>>
> > >>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > >>> "device can not access all of the guest RAM" and "iova != gpa, thus
> > >>> device needs to translate iova".
> > >>>
> > >>> Confidential guest technologies currently rely on the device/hypervisor
> > >>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> > >>> negotiated, the guest  grants access to the portions of memory the
> > >>> device needs to see. So in for confidential guests, generally,
> > >>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> > >>> about the addresses used being something else than guest physical
> > >>> addresses.
> > >>>
> > >>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> > >>> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > >>> form the vhost device that does not need it, because on the vhost
> > >>> interface it only means "I/O address translation is needed".
> > >>>
> > >>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> > >>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> > >>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > >>> by the device, and thus no device capability is needed. In this
> > >>> situation claiming that the device does not support iommu_plattform=on
> > >>> is counter-productive. So let us stop doing that!
> > >>>
> > >>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > >>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> > >>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > >>> unsupported")
> > >>> Cc: Kevin Wolf <kwolf@redhat.com>
> > >>> Cc: qemu-stable@nongnu.org
> > >>>
> > >>> ---
> > >>>
> > >>> v1->v2:
> > >>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> > >>>
> > >>> ---
> > >>>   hw/virtio/virtio-bus.c | 11 ++++++-----
> > >>>   1 file changed, 6 insertions(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > >>> index d23db98c56..c1578f3de2 100644
> > >>> --- a/hw/virtio/virtio-bus.c
> > >>> +++ b/hw/virtio/virtio-bus.c
> > >>> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > >>>           return;
> > >>>       }
> > >>>   
> > >>> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > >>> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> > >>> -        return;
> > >>> -    }
> > >>> -
> > >>>       if (klass->device_plugged != NULL) {
> > >>>           klass->device_plugged(qbus->parent, &local_err);
> > >>>       }
> > >>> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > >>>       } else {
> > >>>           vdev->dma_as = &address_space_memory;
> > >>>       }
> > >>> +
> > >>> +    if (has_iommu && vdev->dma_as != &address_space_memory
> > >>> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > >>> +        error_setg(errp, "iommu_platform=true is not supported by the device");
> > >>> +        return;
> > >>> +    }
> > >>>   }
> > >>>   
> > >>>   /* Reset the virtio_bus */
> > >>>
> > >>> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32  
> > >>  
> > > 
> > >   
> > 


