Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A8617AF3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXbs-0003bi-Bd; Thu, 03 Nov 2022 06:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oqXbp-0003bH-DM
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oqXbm-0005Li-8S
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667471880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SbDC2Mwl9eSSBsT2AW5/yGipvZuHluLgyKkgXCaE6v8=;
 b=b9Qp4qGTQ0E8UlyEwXsEaaX8a0IAjxqpu8gJY9rOo2WpEVIiHgdMmCeoNZCyy34Hd14BTL
 KIF/0ecC9SfhUFhWIKa0iGw8VLL1faW/9PS9XUXWuO8CloEymRPN3/NJfgOO782PvlmD1w
 vUC5SX3KytmvZfyZ8xL/nPg8gyyNjGY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-dO4QyggTMuSIBHM9E1-UIw-1; Thu, 03 Nov 2022 06:37:59 -0400
X-MC-Unique: dO4QyggTMuSIBHM9E1-UIw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f20-20020a0564021e9400b00461ea0ce17cso1069433edf.16
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 03:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SbDC2Mwl9eSSBsT2AW5/yGipvZuHluLgyKkgXCaE6v8=;
 b=vT9BydYnVH7IdtH30D3IOj4fsad12d5kVPrvi9/iY4wmPkiFfxsA2p3SUOYqGaXZfG
 6hgq49W8TLyUtVXK0x1gy0XhGRCEgBtJGz9J38xFsaZzNENXEeJY6uqTWxC/hCSUGlBs
 MV4KpBE49K/363FnF0h7QwepaFz2NMtEb3VI/ti2F4S6UIuvVOyUxqH/YtKxsnAmqkha
 2U+g0Fdnz1113DHdM5WlzYAEddj3CMfzsF0A+BwmTVy9ezArSARjVbXwhy+fBfTSpZyM
 0hWOxo7ULCs3wBiL3oqSz1pz2fFAH8w67adHDB8ru3Lt6YYABrUsSAOS0XxmF36msSto
 nsmQ==
X-Gm-Message-State: ACrzQf0s119Nlz4Yy/7iw4uXlszDLXUM/Jb7T1u8cCbGDbd1zFiahGXY
 sKtfqvNkySrKPVxlTr2m9A8ucR8sBqt7VVx4VmRsin+w3NYR30rGQnl+jUVKi9myN8k1LDDXuhO
 BB2j/R1iQRenMjuvtStlJ3adOVs6RnGc=
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr29395149edd.254.1667471878502; 
 Thu, 03 Nov 2022 03:37:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4o9yL+UzbJkKeWvVim3Pe3D08A7aJByKoGyKI16Zs6APXYV/pgxadWJ/3vZMntPofFWH1YOsLOGCwJl6JjD/k=
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr29395127edd.254.1667471878294; Thu, 03
 Nov 2022 03:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAGxU2F4zRGASAv4YLoQpfRB-2cvaMij6YZo6t9E+69MZ+8Mong@mail.gmail.com>
 <CACycT3vMVbm94OYtUgB9bS6_pU6FKh1Y6kWPyAxi4rvjUfQ3qg@mail.gmail.com>
 <20221026101716.zwl5rkwb7awq4mvw@sgarzare-redhat>
In-Reply-To: <20221026101716.zwl5rkwb7awq4mvw@sgarzare-redhat>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 3 Nov 2022 11:37:46 +0100
Message-ID: <CAGxU2F7Fyxw3UkZK=b2SwS5YrriThYaRGDiF9W4MCCC4MSA6xA@mail.gmail.com>
Subject: Re: Issue with VDUSE (QSD vduse-blk export) and vhost-vdpa
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>, 
 qemu devel list <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 12:17 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Oct 26, 2022 at 05:39:23PM +0800, Yongji Xie wrote:
> >Hi Stefano,
> >
> >On Wed, Oct 26, 2022 at 5:12 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >>
> >> Hi Xie,
> >> I was testing libblkio [1] with QSD vduse-blk export and had some
> >> issues.
> >>
> >> In a nutshell, QSD prints me the following messages when using
> >> vhost-vdpa to access the device:
> >>
> >>   Failed to get vq[0] iova mapping
> >>   Failed to update vring for vq[0]
> >>
> >> This happens only with vhost-vdpa, using virtio-vdpa instead the device
> >> works fine.
> >> I'm using Linux v6.0 and QEMU master (commit
> >> 214a8da23651f2472b296b3293e619fd58d9e212).
> >>
> >> I haven't had much time to investigate, I hope to do it next week, but
> >> maybe it's much faster for you.
> >>
> >> I saw that ioctl(VDUSE_IOTLB_GET_FD) in libvduse.c returns -1 (EPERM),
> >> so IIUC in the kernel vduse_dev_broken() was called, and the device is
> >> in a broken state.
> >>
> >>
> >> We will use libblkio in QEMU [2] to access vDPA devices via vhost-vdpa.
> >> But I'm doing these tests without QEMU for now, using an example inside
> >> the libblkio repo:
> >>
> >> # Build libblkio and examples
> >>     # Fedora/CentOS/RHEL
> >>     dnf install -y git meson rust cargo python3-docutils rustfmt
> >>     # Debian/Ubuntu
> >>     apt-get install -y git meson rustc cargo python3-docutils
> >>
> >>     git clone https://gitlab.com/libblkio/libblkio.git
> >>
> >>     cd libblkio
> >>     git checkout v1.1.0
> >>
> >>     meson setup build
> >>     meson compile -C build
> >>
> >>
> >> # On terminal 1
> >>     modprobe vduse
> >>     modprobe vhost-vdpa
> >>
> >>     qemu-img create -f qcow2 -o preallocation=full /path/to/test.qcow2 1g
> >>
> >>     qemu-storage-daemon \
> >>       --blockdev file,filename=/path/to/test.qcow2,cache.direct=on,aio=native,node-name=file \
> >>       --blockdev qcow2,file=file,node-name=qcow2 \
> >>       --object iothread,id=iothread0 \
> >>       --export vduse-blk,id=vduse0,name=vduse0,num-queues=1,node-name=qcow2,writable=on,iothread=iothread0
> >>
> >>
> >> # On terminal 2
> >>     vdpa dev add name vduse0 mgmtdev vduse
> >>
> >>     cd libblkio/build
> >>
> >>     # blkio-bench executes
> >>     ./examples/blkio-bench virtio-blk-vhost-vdpa \
> >>       path=/dev/vhost-vdpa-0 --runtime=5 --readwrite=randread
> >>
> >>     # after this step, QSD (running on terminal 1) prints the following messages:
> >>       Failed to get vq[0] iova mapping
> >>       Failed to update vring for vq[0]
> >>
> >> I don't know if I'm doing something wrong or in libblkio we have some
> >> issue, but using vdpa-sim-blk works correctly, so maybe there is
> >> something in vduse that is missing.
> >>
> >> Any help or suggestion is welcome :-)
> >>
> >
> >I'd like to know whether bio-bench uses the shared memory
> >(tmpfs/hugetlbfs) as the vdpa memory region. This is what VDUSE needs.
>
> Okay, so IIUC every memory regions should have an associated fd.
>
> The buffers in libblkio are already allocated in this way, but it is not
> true for the virtqueue memory, I'll change it and test.

I just changed the virtqueue memory allocation as you suggested, and it worked!

MR here: https://gitlab.com/libblkio/libblkio/-/merge_requests/141

Thanks for the help,
Stefano


