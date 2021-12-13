Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62808472AFD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:13:38 +0100 (CET)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjGz-0007UR-I6
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:13:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mwjEB-0006Y6-W8
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mwjE6-0004ur-Ou
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639393835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGK+bhityzomX6AHRiVWCe2qJ7RFkNtkEP6ghnxjcXM=;
 b=So/0hH7O+ssZj9Yx0evZmdJ+pcR5QAsQFie274dZqSNalyg0XuoiS2RfdrEPpCRQQP4wHW
 L3RHT34xhVpiKqMenQJs1sed6a8e1xabS14CFEivEyKrnx1Mv1wvzV6IN9r8oZDeTA7NAn
 sfs767/IAAA19n/431SCUEaahmGJ/v0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-72nWlYq3NnezQqF7ubGoiQ-1; Mon, 13 Dec 2021 06:10:31 -0500
X-MC-Unique: 72nWlYq3NnezQqF7ubGoiQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi22-20020a05620a319600b00468606d7e7fso14473048qkb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tGK+bhityzomX6AHRiVWCe2qJ7RFkNtkEP6ghnxjcXM=;
 b=099z4dyngMLkX9I9czAV6YS1yJjH8mZLPCwg8aPOIYBGRJyXQ3LVuRbZDaUqqK1Mbu
 zegVWhyDldC1orxed8kcyGIKVKhNQkkCXtxKoPUZeASK7ficemYbNO8h9Ogk7ls3dcWy
 2oZnkCliAcGRgGXsbQTMw+69ImYJh7g4cO4phI3LFMgkb/UcvgSh9ZwNQq4IkneRG8P8
 SsaGoTuyuiBahoTowsP0LzQrdPYkhRjlUCKfG3WoQ5YyL6CdnsSRF461dtYQGmZVlFQu
 xY97nod2whjEO0gFWQtfUTsF7sEImO5MvfKrWWgxboV3YgjuXuSHSl2kw0U6ynJ0dZ9X
 174A==
X-Gm-Message-State: AOAM532LpcGo7DO4LCrMsm6Vq4rR1DsfMjiExvK00utsQwHKAHFwrnAJ
 cuGN4wNE5NoVgTHqlE4gydecPza+ODO3cObV3uHvSTXMPpPvEklDitAl4NLdnkRp7kBmmQ1EtK0
 RJmDOM4LDLHtua1k=
X-Received: by 2002:a37:e20d:: with SMTP id g13mr32064516qki.121.1639393830819; 
 Mon, 13 Dec 2021 03:10:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7xSAmI60ZBM9qGJlxiRxcXG8hyxMA6kyqkmn6TO1Kgqcxu8JSDSI60hX0/zr0eatzpj+3Yw==
X-Received: by 2002:a37:e20d:: with SMTP id g13mr32064491qki.121.1639393830604; 
 Mon, 13 Dec 2021 03:10:30 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id n74sm5665065qkn.83.2021.12.13.03.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:10:30 -0800 (PST)
Date: Mon, 13 Dec 2021 12:10:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <20211213111025.qlk26qnz7gpc2q4n@steredhat>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <20211209155522.ysgig3bshwtykoxr@steredhat>
 <9615545c46e54943b40e730a3535d550@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9615545c46e54943b40e730a3535d550@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 11, 2021 at 04:11:04AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Thursday, December 9, 2021 11:55 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>; jasowang@redhat.com; mst@redhat.com;
>> parav@nvidia.com; xieyongji@bytedance.com; Yechuan <yechuan@huawei.com>;
>> Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
>> Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
>>
>> On Thu, Dec 09, 2021 at 09:16:58AM +0000, Stefan Hajnoczi wrote:
>> >On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
>> >> From: Longpeng <longpeng2@huawei.com>
>> >>
>> >> Hi guys,
>> >>
>> >> This patch introduces vhost-vdpa-net device, which is inspired
>> >> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
>> >>
>> >> I've tested this patch on Huawei's offload card:
>> >> ./x86_64-softmmu/qemu-system-x86_64 \
>> >>     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
>> >>
>> >> For virtio hardware offloading, the most important requirement for us
>> >> is to support live migration between offloading cards from different
>> >> vendors, the combination of netdev and virtio-net seems too heavy, we
>> >> prefer a lightweight way.
>> >>
>> >> Maybe we could support both in the future ? Such as:
>> >>
>> >> * Lightweight
>> >>  Net: vhost-vdpa-net
>> >>  Storage: vhost-vdpa-blk
>> >>
>> >> * Heavy but more powerful
>> >>  Net: netdev + virtio-net + vhost-vdpa
>> >>  Storage: bdrv + virtio-blk + vhost-vdpa
>> >>
>> >> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>> >
>> >Stefano presented a plan for vdpa-blk at KVM Forum 2021:
>> >https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-so
>> ftware-offload-for-virtio-blk-stefano-garzarella-red-hat
>> >
>> >It's closer to today's virtio-net + vhost-net approach than the
>> >vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
>> >an offload feature rather than a completely separate code path that
>> >needs to be maintained and tested. That way QEMU's block layer features
>> >and live migration work with vDPA devices and re-use the virtio-blk
>> >code. The key functionality that has not been implemented yet is a "fast
>> >path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
>> >offloaded to vDPA.
>> >
>> >The unified vdpa-blk architecture should deliver the same performance
>> >as the vhost-vdpa-blk device you mentioned but with more features, so I
>> >wonder what aspects of the vhost-vdpa-blk idea are important to you?
>> >
>> >QEMU already has vhost-user-blk, which takes a similar approach as the
>> >vhost-vdpa-blk device you are proposing. I'm not against the
>> >vhost-vdpa-blk approach in priciple, but would like to understand your
>> >requirements and see if there is a way to collaborate on one vdpa-blk
>> >implementation instead of dividing our efforts between two.
>>
>> Waiting for the aspects that Stefan asked, I add some details about the
>> plan for vdpa-blk.
>>
>> Currently I'm working on the in-kernel software device. In the next
>> months I hope to start working on the QEMU part. Anyway that part could
>> go in parallel with the in-kernel device, so if you are interested we
>> can collaborate.
>>
>
>The work on QEMU part means supporting the vdpa in BlockDriver and virtio-blk?

Yep.

>
>In fact, I wanted to support the vdpa in QEMU block layer before I sent this
>RFC, because the net part uses netdev + virtio-net while the storage part uses
>vhost-vdpa-blk (from Yongji) looks like a strange combination.
>
>But I found enable vdpa in QEMU block layer would take more time and some
>features (e.g. snapshot, IO throttling) from the QEMU block layer are not needed
>in our hardware offloading case, so I turned to develop the "vhost-vdpa-net",
>maybe the combination of vhost-vdpa-net and vhost-vdpa-blk is congruous.

Yes, I agree it takes more time, but it would be very flexible.

Like Jason said, maybe for this use case it would be better to have a 
generic device, not type dependent, so we don't need to add 
vhost-vdpa-blk, vhost-vdpa-net, etc.

>
>> Having only the unified vdpa-blk architecture would allow us to simplify
>> the management layers and avoid duplicate code, but it takes more time
>> to develop compared to vhost-vdpa-blk. So if vdpa-blk support in QEMU is
>> urgent, I could understand the need to add vhost-vdpa-blk now.
>>
>
>I prefer a way that can support vdpa devices (not only net and storage, but also
>other device types) quickly in hardware offloading case, maybe it would decreases
>the universalism, but it could be an alternative to some users.

Yep, make sense.

Stefano


