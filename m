Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA646EC57
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:56:55 +0100 (CET)
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLmv-0004pA-Sx
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mvLlg-00041y-Ho
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mvLlc-0004u2-DE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639065331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nnEn721wCPpogAKL1T3/hM/ASFJlW7laoTCIqSXGzMw=;
 b=NeinSl3UF3BZtyyBE6x5wSCXp+XgZKzrMOb2f6h1hfwWlR5iXyI4FCY5FLrt6CeqFmiEwz
 AzOPBKvVBHd7riYmtdcmgnmNxXzzAepqWxWgYlz6zCw8GM9GNDrpdWncZHrmwyYSiqzd8Z
 PovVpnGvhvPeNsDGM38hkZVKWHMKhAU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-71IyvDRaMvu9L1v1i6KWPg-1; Thu, 09 Dec 2021 10:55:28 -0500
X-MC-Unique: 71IyvDRaMvu9L1v1i6KWPg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so1547256wrp.8
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 07:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nnEn721wCPpogAKL1T3/hM/ASFJlW7laoTCIqSXGzMw=;
 b=DGfZhRUPRGOkJ/FzKcNCAsfq+uAuffYTvpibV0sNs419/dJZ3AwftPA+d/ogC/KTsU
 7ys7l4su8tnVGl4xFIW64+rDcNDTNH62QU68qT/UgCX3rbzeuZ4hNr9sVXGUzDlF0bDg
 Ps0FrOJcgCwNLDJOlr2mIOEJ6jIoBI4x7PExYmOl0+cX8aZZlZIwlmlPzUFKqFEH9QXU
 ewg1K5L6qfkuWq/uMbusP+05LOVNC4JkljBJpS+BxsEt1t4wb8Jz7rBF0yjTvfX+3kat
 HsYeCX/FEEyhNtnQdoGKlF3vtd92RoJjoio0crERYW3hfPogitrfPcnYDuQZmVC+zHZz
 xhoA==
X-Gm-Message-State: AOAM5336DQ1JkPgcW1HfK6wKBeJjO1jce1+e1uE2olGfuKU8+5kaNIA6
 ONjDsmppz6uYj84bJEuo7tE4Cx9zxYDZ8JayXzRz0o2O4murR/Uf4920yvo3YAlWPAwcwS3tybo
 URPvTcdBMK75sDTc=
X-Received: by 2002:adf:ecca:: with SMTP id s10mr7396403wro.405.1639065327329; 
 Thu, 09 Dec 2021 07:55:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFC8aMUeliWm4E7786iRwVNlh+nMQaSltF2PBaMFkld23H5p3+s/l6IS5LHrXgrOmsp0Zfhw==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr7396388wro.405.1639065327104; 
 Thu, 09 Dec 2021 07:55:27 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id s63sm198207wme.22.2021.12.09.07.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 07:55:26 -0800 (PST)
Date: Thu, 9 Dec 2021 16:55:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <20211209155522.ysgig3bshwtykoxr@steredhat>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, xieyongji@bytedance.com, arei.gonglei@huawei.com,
 parav@nvidia.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 09:16:58AM +0000, Stefan Hajnoczi wrote:
>On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> Hi guys,
>>
>> This patch introduces vhost-vdpa-net device, which is inspired
>> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
>>
>> I've tested this patch on Huawei's offload card:
>> ./x86_64-softmmu/qemu-system-x86_64 \
>>     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
>>
>> For virtio hardware offloading, the most important requirement for us
>> is to support live migration between offloading cards from different
>> vendors, the combination of netdev and virtio-net seems too heavy, we
>> prefer a lightweight way.
>>
>> Maybe we could support both in the future ? Such as:
>>
>> * Lightweight
>>  Net: vhost-vdpa-net
>>  Storage: vhost-vdpa-blk
>>
>> * Heavy but more powerful
>>  Net: netdev + virtio-net + vhost-vdpa
>>  Storage: bdrv + virtio-blk + vhost-vdpa
>>
>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>
>Stefano presented a plan for vdpa-blk at KVM Forum 2021:
>https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-software-offload-for-virtio-blk-stefano-garzarella-red-hat
>
>It's closer to today's virtio-net + vhost-net approach than the
>vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
>an offload feature rather than a completely separate code path that
>needs to be maintained and tested. That way QEMU's block layer features
>and live migration work with vDPA devices and re-use the virtio-blk
>code. The key functionality that has not been implemented yet is a "fast
>path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
>offloaded to vDPA.
>
>The unified vdpa-blk architecture should deliver the same performance
>as the vhost-vdpa-blk device you mentioned but with more features, so I
>wonder what aspects of the vhost-vdpa-blk idea are important to you?
>
>QEMU already has vhost-user-blk, which takes a similar approach as the
>vhost-vdpa-blk device you are proposing. I'm not against the
>vhost-vdpa-blk approach in priciple, but would like to understand your
>requirements and see if there is a way to collaborate on one vdpa-blk
>implementation instead of dividing our efforts between two.

Waiting for the aspects that Stefan asked, I add some details about the 
plan for vdpa-blk.

Currently I'm working on the in-kernel software device. In the next 
months I hope to start working on the QEMU part. Anyway that part could 
go in parallel with the in-kernel device, so if you are interested we 
can collaborate.

Having only the unified vdpa-blk architecture would allow us to simplify 
the management layers and avoid duplicate code, but it takes more time 
to develop compared to vhost-vdpa-blk. So if vdpa-blk support in QEMU is 
urgent, I could understand the need to add vhost-vdpa-blk now.

Let me know if you want more details about the unified vdpa-blk 
architecture.

Thanks,
Stefano


