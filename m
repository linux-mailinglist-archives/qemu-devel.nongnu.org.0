Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4D60DEC4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 12:19:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ondTY-0006wp-3o; Wed, 26 Oct 2022 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ondTU-0006oD-OP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ondTR-00069I-IH
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666779442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfHzw1uUDDLd1Skw76XeIS+ol/3nqXCeV9p3xBHmvSE=;
 b=QtBUWGjbt9Pfw8sGVpyU6ibg4Rf/QJHTFcom6n7hiY5rGssZySFk6bIlFlU5cIM/8EQMzg
 9iv7bC855OUFwE853UarZVp9rt7eOLuJe1F8SLWAkdk/gBMXQPJ17YL61WPdigzEgAiUXi
 OmYj6Vhi7ObwzpIxAgMiUe4rFPLWk+Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-DZLNH8JNPmOjbByOrpvm1w-1; Wed, 26 Oct 2022 06:17:21 -0400
X-MC-Unique: DZLNH8JNPmOjbByOrpvm1w-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402270e00b0045d1baf4951so13768335edd.11
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 03:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfHzw1uUDDLd1Skw76XeIS+ol/3nqXCeV9p3xBHmvSE=;
 b=25nUYMhE2bOs6qqDH2jZTYj5M/1dAcDEtushBxOulXqE9yQs90c9kDfQ6JWhGmbmS8
 OLOyI0A13mhyFgJ/rTeJeAew9hk0Zmw6h0vctJGb9q2CU7aZqzcOTG7iKYfgez9VyiUl
 ImiV/sMVv7kMugTfwcFgoM6VsbHUlxbco8bpJQWJmo1n/NSZXaRfSRDcTOzpYfSi5pE3
 smhMC6FK3/Zslkm9PHf1uvpFJ97I36HKApH8BNDyQSuvFUAH0xllwriPpYSp9FL1Gtcl
 2GduRjNXi/PeRJgzdm9XkhCa0+go4/oGrL/Fk0HVq6bWzYcAt6t0wNm/HRBfGpZRoypy
 e6cQ==
X-Gm-Message-State: ACrzQf2ICiBicmWi/qfbulnllaxPJn+VAp00mjBlgKfhUfHwwC1L6YrB
 zbd5EjO6yD02T01YkEg8hvoxDR85YgREMHZrNAJEBwFOOW7FDQs8Qdc5xGX69yXoDdppVK4yizG
 ZeZC651m4y34zr4o=
X-Received: by 2002:a05:6402:500d:b0:459:3e56:e6f9 with SMTP id
 p13-20020a056402500d00b004593e56e6f9mr41041558eda.367.1666779440249; 
 Wed, 26 Oct 2022 03:17:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM607CBXEUgwqhrW5hUNFPMaO0HiuTQcCanmGMIa6t/joJBY4H/rQcad/t9kyFk8+TbfkA83RA==
X-Received: by 2002:a05:6402:500d:b0:459:3e56:e6f9 with SMTP id
 p13-20020a056402500d00b004593e56e6f9mr41041533eda.367.1666779439945; 
 Wed, 26 Oct 2022 03:17:19 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-34.retail.telecomitalia.it.
 [87.11.6.34]) by smtp.gmail.com with ESMTPSA id
 sd7-20020a170906ce2700b0078d76ee7543sm2683925ejb.222.2022.10.26.03.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 03:17:19 -0700 (PDT)
Date: Wed, 26 Oct 2022 12:17:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>,
 qemu devel list <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: Issue with VDUSE (QSD vduse-blk export) and vhost-vdpa
Message-ID: <20221026101716.zwl5rkwb7awq4mvw@sgarzare-redhat>
References: <CAGxU2F4zRGASAv4YLoQpfRB-2cvaMij6YZo6t9E+69MZ+8Mong@mail.gmail.com>
 <CACycT3vMVbm94OYtUgB9bS6_pU6FKh1Y6kWPyAxi4rvjUfQ3qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACycT3vMVbm94OYtUgB9bS6_pU6FKh1Y6kWPyAxi4rvjUfQ3qg@mail.gmail.com>
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

On Wed, Oct 26, 2022 at 05:39:23PM +0800, Yongji Xie wrote:
>Hi Stefano,
>
>On Wed, Oct 26, 2022 at 5:12 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> Hi Xie,
>> I was testing libblkio [1] with QSD vduse-blk export and had some
>> issues.
>>
>> In a nutshell, QSD prints me the following messages when using
>> vhost-vdpa to access the device:
>>
>>   Failed to get vq[0] iova mapping
>>   Failed to update vring for vq[0]
>>
>> This happens only with vhost-vdpa, using virtio-vdpa instead the device
>> works fine.
>> I'm using Linux v6.0 and QEMU master (commit
>> 214a8da23651f2472b296b3293e619fd58d9e212).
>>
>> I haven't had much time to investigate, I hope to do it next week, but
>> maybe it's much faster for you.
>>
>> I saw that ioctl(VDUSE_IOTLB_GET_FD) in libvduse.c returns -1 (EPERM),
>> so IIUC in the kernel vduse_dev_broken() was called, and the device is
>> in a broken state.
>>
>>
>> We will use libblkio in QEMU [2] to access vDPA devices via vhost-vdpa.
>> But I'm doing these tests without QEMU for now, using an example inside
>> the libblkio repo:
>>
>> # Build libblkio and examples
>>     # Fedora/CentOS/RHEL
>>     dnf install -y git meson rust cargo python3-docutils rustfmt
>>     # Debian/Ubuntu
>>     apt-get install -y git meson rustc cargo python3-docutils
>>
>>     git clone https://gitlab.com/libblkio/libblkio.git
>>
>>     cd libblkio
>>     git checkout v1.1.0
>>
>>     meson setup build
>>     meson compile -C build
>>
>>
>> # On terminal 1
>>     modprobe vduse
>>     modprobe vhost-vdpa
>>
>>     qemu-img create -f qcow2 -o preallocation=full /path/to/test.qcow2 1g
>>
>>     qemu-storage-daemon \
>>       --blockdev file,filename=/path/to/test.qcow2,cache.direct=on,aio=native,node-name=file \
>>       --blockdev qcow2,file=file,node-name=qcow2 \
>>       --object iothread,id=iothread0 \
>>       --export vduse-blk,id=vduse0,name=vduse0,num-queues=1,node-name=qcow2,writable=on,iothread=iothread0
>>
>>
>> # On terminal 2
>>     vdpa dev add name vduse0 mgmtdev vduse
>>
>>     cd libblkio/build
>>
>>     # blkio-bench executes
>>     ./examples/blkio-bench virtio-blk-vhost-vdpa \
>>       path=/dev/vhost-vdpa-0 --runtime=5 --readwrite=randread
>>
>>     # after this step, QSD (running on terminal 1) prints the following messages:
>>       Failed to get vq[0] iova mapping
>>       Failed to update vring for vq[0]
>>
>> I don't know if I'm doing something wrong or in libblkio we have some
>> issue, but using vdpa-sim-blk works correctly, so maybe there is
>> something in vduse that is missing.
>>
>> Any help or suggestion is welcome :-)
>>
>
>I'd like to know whether bio-bench uses the shared memory
>(tmpfs/hugetlbfs) as the vdpa memory region. This is what VDUSE needs.

Okay, so IIUC every memory regions should have an associated fd.

The buffers in libblkio are already allocated in this way, but it is not 
true for the virtqueue memory, I'll change it and test.

Thanks for the help :-)
Stefano


