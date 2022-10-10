Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B555FA29B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:18:13 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwPs-0006Iu-DQ
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwJj-0000YP-5P
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwJX-0002GB-5Q
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unWXtvUHE/PaUu2pQLDrM/5EixE961fap67EUxUWR6c=;
 b=c2KLiViZLpMNyFAumAPDfC1uIgtxPbrs+K/A948t1gQ5VMVhk83ECFXSJ6jw0TWuq7tKh4
 ABxgErMfUu4yOcRwLAKWOzHxoimpl6HSil4LDRS6/RipOv1IMuPMq+R5kVClXGmgR8Z33y
 U4ZjwX6868YPO3LDv0+5aUMpN0y86ms=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-vFa0DxtWNi6IHfHvBIjFXg-1; Mon, 10 Oct 2022 13:11:29 -0400
X-MC-Unique: vFa0DxtWNi6IHfHvBIjFXg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s5-20020adf9785000000b0022e1af0e7e8so2992896wrb.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unWXtvUHE/PaUu2pQLDrM/5EixE961fap67EUxUWR6c=;
 b=FvMJvsV/dIeFLLg6DNMJkNnYghen3VMl4YkBSUGhD533SLxabxs7Xv8jOBHPfVZDNS
 B79/uPR9/+cwBAEfFMsUIqog0cTuLpo0oAlqCD7eNAIOt0Mqw/fsHmcssCNbtB1ji9a8
 Yjm435pZL6EWl1+tPE89uRaghPqR3wlTO5OdrUyXsTS1960qOFOJu9CG6e/IYWBPC6LF
 peSe+nwkM+PPn//S4l80OAqqTQHIDbeBD0cR0sEhImxUhCe/Vz4bpQDqpNMYxZQWbRV8
 bTkVweIDF7SSOzoZatGaARtwaUxVQeRnBl0KmUaXfZ0X3pRnozAfJLT/u4h2IWF2xr2P
 uAKQ==
X-Gm-Message-State: ACrzQf22cQrwWQhD6RViapK9Z3T2iAXoriuBMh7d5ZWhmyTeIe41pGh+
 bjjGFUmks+Ky014Ms4YKuOeJnbxQNJRUIzQJEhjYwfFRwlDD44k0xQWnquzFW+MIFIga2DgvRKb
 MbhBYHJCerxR+IyY=
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr13270960wmq.47.1665421886709; 
 Mon, 10 Oct 2022 10:11:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mTA/5mTxZG2phHIo1frZLWc/JdWtCED+YgmPDQT7U0D+BL4jvGzR7O2ux6aQSBCKkcdNSIw==
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr13270942wmq.47.1665421886444; 
 Mon, 10 Oct 2022 10:11:26 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffbc4000000b00225307f43fbsm7251039wrs.44.2022.10.10.10.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:11:25 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:11:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jason Wang <jasowang@redhat.com>, kangjie.xu@linux.alibaba.com
Subject: Re: [PATCH v5 00/15] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-net kernel in virtio pci-modern
Message-ID: <20221009163405-mutt-send-email-mst@kernel.org>
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 14, 2022 at 12:20:40PM +0800, Xuan Zhuo wrote:
> The virtio queue reset function has already been defined in the virtio sp=
ec 1.2.
> The relevant virtio spec information is here:
>=20
>     https://github.com/oasis-tcs/virtio-spec/issues/124
>     https://github.com/oasis-tcs/virtio-spec/issues/139
>=20
> This patch set is to support this function in QEMU. It consists of severa=
l parts:
> 1. Patches 1-7 are the basic interfaces for vq reset in virtio and virtio=
-pci.
> 2. Patches 8-11 support vq reset and vq restart for vhost-kernel.
> 3. Patches 12-14 support vq reset and vq restart for virtio-net.
> 5. Patch 15 enables the vq reset feature for vhost-kernel.
>=20
> The process of virtqueue reset can be concluded as:
> 1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
> 2. Then the virtqueue can be optionally restarted(re-enabled).
>=20
> Since this patch set involves multiple modules and seems a bit messy, we =
briefly describe the
> calling process for different modes below.
> virtio-net:
> 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
>     -> virtio_queue_reset() [virtio]
>         -> virtio_net_queue_reset() [virtio-net]
>         -> __virtio_queue_reset()
> 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
>     -> set enabled, reset status of vq.
>=20
> vhost-kernel:
> 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
>     -> virtio_queue_reset() [virtio]
>         -> virtio_net_queue_reset() [virtio-net]
>             -> vhost_net_virtqueue_stop() [vhost-net]
>                 -> vhost_net_set_backend() [vhost]
>                 -> vhost_virtqueue_stop()
>         -> __virtio_queue_reset()
> 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
>     -> virtio_queue_enable() [virtio]
>         -> virtio_net_queue_enable() [virtio-net]
>             -> vhost_net_virtqueue_restart() [vhost-net]
>                 -> vhost_virtqueue_start() [vhost]
>                 -> vhost_net_set_backend()
>     -> set enabled, reset status of vq.
>=20
>=20
> Test environment and method:
>     Host: 5.19.0-rc3 (With vq reset support)
>     Qemu: QEMU emulator version 7.0.50
>     Guest: 5.19.0-rc3 (With vq reset support)
>     Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g et=
h1;
>=20
>     The drvier can resize the virtio queue, then virtio queue reset funct=
ion should
>     be triggered.
>=20
>     The default is split mode, modify Qemu virtio-net to add PACKED featu=
re to
>     test packed mode.
>=20
> Guest Kernel Patch:
>     https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.al=
ibaba.com/
>=20
> Host Kernel Patch:
>     https://lore.kernel.org/bpf/20220825085610.80315-1-kangjie.xu@linux.a=
libaba.com/
>=20
> Looking forward to your review and comments. Thanks.

Breaks mingw 32 build

Wl,--no-seh -Wl,--nxcompat -Wl,--warn-common libqemuutil.a libfdt.a libmigr=
ation.fa libhwcore.fa libqom.fa libio.fa libcrypto.fa libauthz.fa libblockd=
ev.fa libblock.fa libchardev.fa libqmp.fa @block.syms @qemu.syms /usr/i686-=
w64-mingw32/sys-root/mingw/lib/libpixman-1.dll.a /usr/i686-w64-mingw32/sys-=
root/mingw/lib/libz.dll.a -lole32 -ldxguid /usr/i686-w64-mingw32/sys-root/m=
ingw/lib/libmingw32.a -mwindows /usr/i686-w64-mingw32/sys-root/mingw/lib/li=
bSDL2main.a /usr/i686-w64-mingw32/sys-root/mingw/lib/libSDL2.dll.a /usr/i68=
6-w64-mingw32/sys-root/mingw/lib/libgio-2.0.dll.a /usr/i686-w64-mingw32/sys=
-root/mingw/lib/libgobject-2.0.dll.a /usr/i686-w64-mingw32/sys-root/mingw/l=
ib/libglib-2.0.dll.a /usr/i686-w64-mingw32/sys-root/mingw/lib/libintl.dll.a=
 -lgthread-2.0 -lglib-2.0 -lintl @block.syms -lwinmm -lpathcch -lm -pthread=
 -lgthread-2.0 -lglib-2.0 -lintl -lws2_32 -Wl,--subsystem,console -lkernel3=
2 -luser32 -lgdi32 -lwinspool -lshell32 -loleaut32 -luuid -lcomdlg32 -ladva=
pi32 -lstdc++ -Wl,--end-group
/usr/lib/gcc/i686-w64-mingw32/11.2.1/../../../../i686-w64-mingw32/bin/ld: l=
ibqemu-alpha-softmmu.fa.p/hw_net_virtio-net.c.obj: in function `virtio_net_=
queue_reset':
/scm/qemu-mingw32-build/../qemu/hw/net/virtio-net.c:560: undefined referenc=
e to `vhost_net_virtqueue_reset'
/usr/lib/gcc/i686-w64-mingw32/11.2.1/../../../../i686-w64-mingw32/bin/ld: l=
ibqemu-alpha-softmmu.fa.p/hw_net_virtio-net.c.obj: in function `virtio_net_=
queue_enable':
/scm/qemu-mingw32-build/../qemu/hw/net/virtio-net.c:578: undefined referenc=
e to `vhost_net_virtqueue_restart'
collect2: error: ld returned 1 exit status




> changelog:
>=20
> v5:
>   1. vhost_net_virtqueue_restart() use -EBUSY replace -ENOTSUP. @Jason
>   2. reuse=A0 VHOST_FILE_UNBIND. @Jason
>=20
> v4:
>   1. Add explanation for preventing userspace datapath in virtio-net.
>   2. Return error when vhost is not started in vhost_net_virtqueue_restar=
t().
>   3. Reset the virtqueue in the device reusing vhost_virtqueue_stop().
>   4. Disable queue reset feature for pre-7.2 machine.
>=20
> v3:
>   1. Remove support for vhost-user in this series and refactor the code.
>   2. Rename 'vhost_net_virtqueue_stop' to 'vhost_net_virtqueue_reset'.
>   3. Make PCI transport ready before device ready when queue_enabled is s=
et to true.
>   4. Add some comments.
>=20
> v2:
>   1. Add support for vhost-net kernel scenario.
>   2. Add a new vhost-user message VHOST_USER_RESET_VRING.
>   3. Add migration compatibility for virtqueue reset.
>=20
> Kangjie Xu (10):
>   virtio: introduce virtio_queue_enable()
>   virtio: core: vq reset feature negotation support
>   virtio-pci: support queue enable
>   vhost: expose vhost_virtqueue_start()
>   vhost: expose vhost_virtqueue_stop()
>   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_reset()
>   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
>   virtio-net: introduce flush_or_purge_queued_packets()
>   virtio-net: support queue_enable
>   vhost: vhost-kernel: enable vq reset feature
>=20
> Xuan Zhuo (5):
>   virtio: sync relevant definitions with linux
>   virtio: introduce __virtio_queue_reset()
>   virtio: introduce virtio_queue_reset()
>   virtio-pci: support queue reset
>   virtio-net: support queue reset
>=20
>  hw/core/machine.c                             |  4 +-
>  hw/net/vhost_net.c                            | 79 +++++++++++++++++++
>  hw/net/virtio-net.c                           | 56 +++++++++++--
>  hw/virtio/vhost.c                             | 16 ++--
>  hw/virtio/virtio-pci.c                        | 16 ++++
>  hw/virtio/virtio.c                            | 62 +++++++++++----
>  include/hw/virtio/vhost.h                     |  5 ++
>  include/hw/virtio/virtio-pci.h                |  5 ++
>  include/hw/virtio/virtio.h                    |  8 +-
>  include/net/vhost_net.h                       |  4 +
>  .../standard-headers/linux/virtio_config.h    |  5 ++
>  include/standard-headers/linux/virtio_pci.h   |  2 +
>  12 files changed, 230 insertions(+), 32 deletions(-)
>=20
> --
> 2.32.0.3.g01195cf9f


