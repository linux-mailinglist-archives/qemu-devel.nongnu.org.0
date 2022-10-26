Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F064F60DDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:17:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncSo-0005LG-Ch; Wed, 26 Oct 2022 05:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oncSX-0004zQ-9f
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oncSV-0003ON-Jn
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666775542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5xNkruRiJnIiOSQrrYHGPH2e+vVoDqGR1JcaSONjqvk=;
 b=MiPubo6XDuMGeoXo/q8ChiNRDp9UtbpSSQwPuIpZlyViMqlYKWeAP4TiqlSyDCPez3JT6c
 vYvA2fkEiz9uiwmh+a7dD4EJ+S2RZtwZ6jiU4F/Mn0P0y0syveiGc9HSDkVy1/CJZlH2lu
 AOU5yZBDFhnBexRaKsu538c4RbP8pxc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-SOKCHuZlO6y-W1vkQ2eiZg-1; Wed, 26 Oct 2022 05:12:19 -0400
X-MC-Unique: SOKCHuZlO6y-W1vkQ2eiZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r66-20020a1c4445000000b003cf4c205936so206671wma.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 02:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xNkruRiJnIiOSQrrYHGPH2e+vVoDqGR1JcaSONjqvk=;
 b=UdOPFCrM1SowltJHfAU/PlRWBzXNH2zJ3bBIWQQ3qh31qSqtKpPuSj7MixBatnJlUA
 /CoyKgsvn/sfY3NsdVYTqgJMy95VD5kEITasavNuCRfDhfgZWTkhr60WoB7+gI/IOwZf
 aD/iIXEWEL0Kyw4Wg0CNzOzSiKhnqsIrAa8yS5eODKqtPlVLQPGbEWmY1as42SKNiev8
 pZlRHuUE3wx/fIbcmLdYRQnQilQL24NVjqmFwFJxqdK29JjN4hVaaAkCguHrGkChmiFc
 K7HpqSvjbnVFjAk4hKqZJgzTfXMF57HHSz097YTOI3034FqegAV/+mry2VgNVLMMla74
 DT4w==
X-Gm-Message-State: ACrzQf3LI5xBGExWWDiSLi80uHX+kAm3MSCuD03oQQNGJ/eJjmYkLB6b
 cg7yRM3iWPkHscBoxVx9FtEnUG+NaY6Gqf5bup69qEi5hpKCC/XSOYe0ET+xp0qEXu8G4AhaK7C
 LmjjSLmimaqi5Yjw=
X-Received: by 2002:a05:600c:3147:b0:3c6:f871:1fec with SMTP id
 h7-20020a05600c314700b003c6f8711fecmr1709606wmo.71.1666775538557; 
 Wed, 26 Oct 2022 02:12:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7idyMh4A58fzq3JEftOywVimGTAari7nGWN9abaxQpXAUmUwLzSihveVvwWD8Ab2kRm6uTLQ==
X-Received: by 2002:a05:600c:3147:b0:3c6:f871:1fec with SMTP id
 h7-20020a05600c314700b003c6f8711fecmr1709579wmo.71.1666775538308; 
 Wed, 26 Oct 2022 02:12:18 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-34.retail.telecomitalia.it.
 [87.11.6.34]) by smtp.gmail.com with ESMTPSA id
 m17-20020a056000009100b0022eafed36ebsm4798032wrx.73.2022.10.26.02.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 02:12:17 -0700 (PDT)
Date: Wed, 26 Oct 2022 11:12:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>,
 qemu devel list <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Issue with VDUSE (QSD vduse-blk export) and vhost-vdpa
Message-ID: <CAGxU2F4zRGASAv4YLoQpfRB-2cvaMij6YZo6t9E+69MZ+8Mong@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

Hi Xie,
I was testing libblkio [1] with QSD vduse-blk export and had some 
issues.

In a nutshell, QSD prints me the following messages when using 
vhost-vdpa to access the device:

  Failed to get vq[0] iova mapping
  Failed to update vring for vq[0]

This happens only with vhost-vdpa, using virtio-vdpa instead the device 
works fine.
I'm using Linux v6.0 and QEMU master (commit 
214a8da23651f2472b296b3293e619fd58d9e212).

I haven't had much time to investigate, I hope to do it next week, but 
maybe it's much faster for you.

I saw that ioctl(VDUSE_IOTLB_GET_FD) in libvduse.c returns -1 (EPERM), 
so IIUC in the kernel vduse_dev_broken() was called, and the device is 
in a broken state.


We will use libblkio in QEMU [2] to access vDPA devices via vhost-vdpa.  
But I'm doing these tests without QEMU for now, using an example inside 
the libblkio repo:

# Build libblkio and examples
    # Fedora/CentOS/RHEL
    dnf install -y git meson rust cargo python3-docutils rustfmt
    # Debian/Ubuntu
    apt-get install -y git meson rustc cargo python3-docutils

    git clone https://gitlab.com/libblkio/libblkio.git

    cd libblkio
    git checkout v1.1.0

    meson setup build
    meson compile -C build


# On terminal 1
    modprobe vduse
    modprobe vhost-vdpa

    qemu-img create -f qcow2 -o preallocation=full /path/to/test.qcow2 1g

    qemu-storage-daemon \
      --blockdev file,filename=/path/to/test.qcow2,cache.direct=on,aio=native,node-name=file \
      --blockdev qcow2,file=file,node-name=qcow2 \
      --object iothread,id=iothread0 \
      --export vduse-blk,id=vduse0,name=vduse0,num-queues=1,node-name=qcow2,writable=on,iothread=iothread0


# On terminal 2
    vdpa dev add name vduse0 mgmtdev vduse

    cd libblkio/build

    # blkio-bench executes
    ./examples/blkio-bench virtio-blk-vhost-vdpa \
      path=/dev/vhost-vdpa-0 --runtime=5 --readwrite=randread

    # after this step, QSD (running on terminal 1) prints the following messages:
      Failed to get vq[0] iova mapping
      Failed to update vring for vq[0]

I don't know if I'm doing something wrong or in libblkio we have some 
issue, but using vdpa-sim-blk works correctly, so maybe there is 
something in vduse that is missing.

Any help or suggestion is welcome :-)

Thanks,
Stefano

[1] https://libblkio.gitlab.io/libblkio/
[2] 
https://lore.kernel.org/qemu-devel/20221013185908.1297568-1-stefanha@redhat.com/


