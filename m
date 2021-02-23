Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDF322BEA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:08:41 +0100 (CET)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYMi-0005bz-E4
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYLs-0005Bz-R7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYLq-0000sI-7E
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614089264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQXkLq7Pk1AieJ/qPtLDPkEAESFIg90QpbPElIk75kQ=;
 b=Sfojzrt9fxVgFc7itvoaDeH1J2DSi1yOEElD+AU/LRTpdEJVICceMJR8PUFgwpFyak1ixe
 Z+oATwwxYBbODQGeExMnJkC9ATZfx7WENBw+LiRE7Vdogs9CbIqinaR0VauhbI7kWjAT+/
 ES6miNT4VraDuEXojvDtOiZ1qYIPtkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-PGvOMSlsOjm8b3wJ0iLdmQ-1; Tue, 23 Feb 2021 09:07:36 -0500
X-MC-Unique: PGvOMSlsOjm8b3wJ0iLdmQ-1
Received: by mail-wr1-f72.google.com with SMTP id g5so3142205wrd.22
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQXkLq7Pk1AieJ/qPtLDPkEAESFIg90QpbPElIk75kQ=;
 b=L31cloxnppQQPIPILsCxRZ0FoOB6VVNTU3X4IPmZIgt0yWtimrbsNu1irl0d3HcpDe
 OL3K1LwLi8jLWYEzLa0x6xU+9sItbaSHWjXqzT61kwW7YFfKcKFPIN4cup6hDguPvI/8
 MRWF6rcW07Z5jIksG8izq/iK+DM3gGidD/aXkorzojdFmOliUHRYUgJy9VW+nXQ0P9+6
 35CJUwvCPQPMAdvTZ0bsPdXo5RAfL38qaOCDR8XlHIM57KhHMSSUbs7zRxB/cnTcPsvD
 YniViqXbpF/Ww3IFAdI9EduZ0P9NIlwwikvE0myyeQD6FjCwA8YAZJEGYBd5yW2xX9sA
 YZEw==
X-Gm-Message-State: AOAM530thUP+k44BfmM3pfjj6HIpHXuDlDjzxBFs+1dVCrOadz7QuPas
 jxI30fkSkMi+xWjkUvtPurC3y/mwAXbu6V95BafMmAlykMkrNrB1fZ1BO8FQrUFXHX2ptX+G8IM
 W/juvK/26HbFqS+g=
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr6426092wrd.255.1614089255617; 
 Tue, 23 Feb 2021 06:07:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQrUt9xGueVk6YzZmPITfwzczBPc+cadyvtDGTQ2fTE9rqxO/lW3r35pwA/KtFzoHPiHxJNA==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr6426057wrd.255.1614089255284; 
 Tue, 23 Feb 2021 06:07:35 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t14sm292107wru.64.2021.02.23.06.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 06:07:34 -0800 (PST)
Date: Tue, 23 Feb 2021 09:07:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Message-ID: <20210223090531-mutt-send-email-mst@kernel.org>
References: <20200918213436.GA3520@redhat.com> <2848338.ij5OB8EVuP@silver>
 <20210222181159.6b274945@bahia.lan> <6115734.fQeFoySBn5@silver>
MIME-Version: 1.0
In-Reply-To: <6115734.fQeFoySBn5@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "cdupontd@redhat.com" <cdupontd@redhat.com>,
 Dominique Martinet <asmadeus@codewreck.org>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, v9fs-developer@lists.sourceforge.net,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 02:39:48PM +0100, Christian Schoenebeck wrote:
> On Montag, 22. Februar 2021 18:11:59 CET Greg Kurz wrote:
> > On Mon, 22 Feb 2021 16:08:04 +0100
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > 
> > [...]
> > 
> > > I did not ever have a kernel crash when I boot a Linux guest with a 9pfs
> > > root fs and 100 MiB msize.
> > 
> > Interesting.
> > 
> > > Should we ask virtio or 9p Linux client maintainers if
> > > they can add some info what this is about?
> > 
> > Probably worth to try that first, even if I'm not sure anyone has a
> > answer for that since all the people who worked on virtio-9p at
> > the time have somehow deserted the project.
> 
> Michael, Dominique,
> 
> we are wondering here about the message size limitation of just 5 kiB in the 
> 9p Linux client (using virtio transport) which imposes a performance 
> bottleneck, introduced by this kernel commit:
> 
> commit b49d8b5d7007a673796f3f99688b46931293873e
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Date:   Wed Aug 17 16:56:04 2011 +0000
> 
>     net/9p: Fix kernel crash with msize 512K
>     
>     With msize equal to 512K (PAGE_SIZE * VIRTQUEUE_NUM), we hit multiple
>     crashes. This patch fix those.
>     
>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
>     Signed-off-by: Eric Van Hensbergen <ericvh@gmail.com>

Well the change I see is:

-       .maxsize = PAGE_SIZE*VIRTQUEUE_NUM,
+       .maxsize = PAGE_SIZE * (VIRTQUEUE_NUM - 3),


so how come you say it changes 512K to 5K?
Looks more like 500K to me.

> Is this a fundamental maximum message size that cannot be exceeded with virtio 
> in general or is there another reason for this limit that still applies?
> 
> Full discussion:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06343.html
> 
> > > > > As the kernel code sais trans_mod->maxsize, maybe its something in
> > > > > virtio
> > > > > on qemu side that does an automatic step back for some reason. I don't
> > > > > see something in the 9pfs virtio transport driver
> > > > > (hw/9pfs/virtio-9p-device.c on QEMU side) that would do this, so I
> > > > > would
> > > > > also need to dig deeper.
> > > > > 
> > > > > Do you have some RAM limitation in your setup somewhere?
> > > > > 
> > > > > For comparison, this is how I started the VM:
> > > > > 
> > > > > ~/git/qemu/build/qemu-system-x86_64 \
> > > > > -machine pc,accel=kvm,usb=off,dump-guest-core=off -m 2048 \
> > > > > -smp 4,sockets=4,cores=1,threads=1 -rtc base=utc \
> > > > > -boot strict=on -kernel
> > > > > /home/bee/vm/stretch/boot/vmlinuz-4.9.0-13-amd64 \
> > > > > -initrd /home/bee/vm/stretch/boot/initrd.img-4.9.0-13-amd64 \
> > > > > -append 'root=svnRoot rw rootfstype=9p
> > > > > rootflags=trans=virtio,version=9p2000.L,msize=104857600,cache=mmap
> > > > > console=ttyS0' \
> > > > 
> > > > First obvious difference I see between your setup and mine is that
> > > > you're mounting the 9pfs as root from the kernel command line. For
> > > > some reason, maybe this has an impact on the check in p9_client_create()
> > > > ?
> > > > 
> > > > Can you reproduce with a scenario like Vivek's one ?
> > > 
> > > Yep, confirmed. If I boot a guest from an image file first and then try to
> > > manually mount a 9pfs share after guest booted, then I get indeed that
> > > msize capping of just 512 kiB as well. That's far too small. :/
> > 
> > Maybe worth digging :
> > - why no capping happens in your scenario ?
> 
> Because I was wrong.
> 
> I just figured even in the 9p rootfs scenario it does indeed cap msize to 5kiB 
> as well. The output of /etc/mtab on guest side was fooling me. I debugged this 
> on 9p server side and the Linux 9p client always connects with a max. msize of 
> 5 kiB, no matter what you do.
> 
> > - is capping really needed ?
> > 
> > Cheers,
> 
> That's a good question and probably depends on whether there is a limitation 
> on virtio side, which I don't have an answer for. Maybe Michael or Dominique 
> can answer this.
> 
> Best regards,
> Christian Schoenebeck
> 


