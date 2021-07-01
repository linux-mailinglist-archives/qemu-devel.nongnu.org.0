Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A73B8DF1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 08:57:25 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqdY-00038c-Ph
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 02:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lyqcF-0002QW-E4
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lyqcB-0005E0-Bn
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625122557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1tQSHlP9VsPWMbVWNxMvY/iYGSonQxrrCXGKgC1LIcA=;
 b=bqxDIdRDFRuy+KtY3Ca5nkGIzUaU8IpjcPq0DxZ05e4z13n6d2EIWajMgVUraS6NdzyTFB
 YZid5S3mHvmVUd3DZkozfbp4kj6kkjknrpKmLABKhhBHzFZ+dw73Hga6RS5Mho7K1+ztV5
 iUuODsMqe1Tv5uL/jQDK1wwVseR6NSQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-ZR4Q7JEBPUyPw4ptFp9sFA-1; Thu, 01 Jul 2021 02:55:56 -0400
X-MC-Unique: ZR4Q7JEBPUyPw4ptFp9sFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p3-20020a05600c3583b02901f55d71e34aso787241wmq.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 23:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1tQSHlP9VsPWMbVWNxMvY/iYGSonQxrrCXGKgC1LIcA=;
 b=Cx7TwvkUzzTGseMlJvYoJSsogWpSqWQ+KVeuFfh180T1SMADkzdnna+kXI8McJIY1O
 tdffAbutE6Iz3u1CDFPEU63qrFGfgHqtX3XYGpTk1myhZpXeYeXpETqEuvwW1JYy3b10
 XGQgUIYpOTJcA+bUSmh9Np/UN8Ym+mkFla7OVGeV+oBVJQiKuvAgkjFLaMvTM3dyUNzu
 yteqfapwn1JV8jc7h3sXpE0vQlioZ8dSK9Mc1gJeuIo9nzhRlNMtBHh1Q0FWmzW2STEF
 anFdbbLCrOwTRx/HT/5i9FkUVjMjpojLjCgr1jWDSgqgx2/LubD2VBW38oD+1taREy2p
 5dlA==
X-Gm-Message-State: AOAM532ZDxvoqgEtZD7pw6Q4P6g/veic8j4HT00Msn2NWm1XvM1tWNQ4
 kgOTKwL603JstpRhvgbn/xtn8RBbkUqx9K2Fl4KSNNNaU+ntTVquDXp09MHnU1PCFWcZczyioOj
 1f68Zkuul1Jp1wGs=
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr9021989wmk.135.1625122555629; 
 Wed, 30 Jun 2021 23:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUWMN77x1cpUo7Bqm9wGeAq+XEhaJlBq51OhgXmgzgWOaLi3IPAk9fAJYv4dSf7hk+ZVgHig==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr9021968wmk.135.1625122555455; 
 Wed, 30 Jun 2021 23:55:55 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id x21sm4516756wmj.6.2021.06.30.23.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 23:55:55 -0700 (PDT)
Date: Thu, 1 Jul 2021 08:55:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [External] Re: [RFC v1] virtio/vsock: add two more queues for
 datagram types
Message-ID: <20210701065552.hrodbwbenflhiru7@steredhat>
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
 <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
 <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
 <20210624143127.fqubmuvw634j44mi@steredhat>
 <CAP_N_Z87rs9vUhZr0r2UkYPwT6DC7w4SzagX3B2Gz8O5dz3GTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z87rs9vUhZr0r2UkYPwT6DC7w4SzagX3B2Gz8O5dz3GTQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: cong.wang@bytedance.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Yongji Xie <xieyongji@bytedance.com>,
 =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, fam.zheng@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 03:44:17PM -0700, Jiang Wang . wrote:
>On Thu, Jun 24, 2021 at 7:31 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Wed, Jun 23, 2021 at 11:50:33PM -0700, Jiang Wang . wrote:
>> >Hi Stefano,
>> >
>> >I checked virtio_net_set_multiqueue(), which will help with following
>> >changes in my patch:
>> >
>> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
>> >vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >vhost_vsock_common_handle_output);
>> >vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >vhost_vsock_common_handle_output);
>> >#endif
>> >
>> >But I think there is still an issue with the following lines, right?
>>
>> Yep, I think so.
>>
>> >
>> >#ifdef CONFIG_VHOST_VSOCK_DGRAM
>> >struct vhost_virtqueue vhost_vqs[4];
>> >#else
>> >struct vhost_virtqueue vhost_vqs[2];
>> >#endif
>> >
>> >I think the problem with feature bits is that they are set and get after
>> >vhost_vsock_common_realize() and after vhost_dev_init() in drivers/vhost/vsock.c
>> >But those virtqueues need to be set up correctly beforehand.
>>
>> I think we can follow net and scsi vhost devices, so we can set a
>> VHOST_VSOCK_VQ_MAX(5), allocates all the queues in any case and then use
>> only the queues acked by the guest.
>>
>Thanks for the advice. I checked both net and scsi and scsi is more helpful.

Yeah :-)

>
>> >
>> >I tried to test with the host kernel allocating 4 vqs, but qemu only
>> >allocated 2 vqs, and
>> >guest kernel will not be able to send even the vsock stream packets. I
>> >think the host
>> >kernel and the qemu have to agree on the number of vhost_vqs. Do you agree?
>> >Did I miss something?
>>
>> Mmm, I need to check, but for example vhost-net calls vhost_dev_init()
>> with VHOST_NET_VQ_MAX, but then the guest can decide to use only one
>> couple of TX and RX queues.
>>
>> I'm not sure about qemu point of view, but I expected that QEMU can set
>> less queues then queues allocated by the kernel. `vhost_dev.nvqs` should
>> be set with the amount of queue that QEMU can handle.
>>
>I checked that vhost_dev.nvqs is still the maximum number of queues (4 queues).
>But I found a way to workaround it. More details in the following text.
>
>> >
>> >Another idea to make the setting in runtime instead of compiling time
>> >is to use
>> >qemu cmd-line options, then qemu can allocate 2 or 4 queues depending
>> >on
>> >the cmd line. This will solve the issue when the host kernel is an old
>> >one( no dgram
>> >support) and the qemu is a new one.
>>
>> I don't think this is a good idea, at most we can add an ioctl that qemu
>> can use to query the kernel about allocated queues, but I still need to
>> understand better if we really we need this.
>>
>
>Hmm. Both net and scsi use the qemu cmd line option to configure
>number of queues. Qemu cmdline is a runtime setting and flexible.
>I think qemu cmdline is better than ioctl. I also make the qemu cmd
>line option default to only allocate two queues to be compatible with
>old versions.

Can we avoid both and allocate the maximum number of queue that QEMU can 
handle?

I'm not sure that adding a parameter to QEMU is a good idea. If possible 
it should be automatic.

>
>> >
>> >But there is still an issue when the host kernel is a new one, while
>> >the qemu
>> >is an old one.  I am not sure how to make the virtqueues numbers to
>> >change in run-time
>> >for the host kernel. In another email thread, you mentioned removing 
>> >kconfig
>> >in the linux kernel, I believe that is related to this qemu patch,
>> >right?
>>
>> It was related to both, I don't think we should build QEMU and Linux
>> with or without dgram support.
>>
>> > If so,
>> >any ideas that I can make the host kernel change the number of vqs 
>> >in
>> >the run-time
>> >or when starting up vsock? The only way I can think of is to use a
>> >kernel module parameter
>> >for the vsock_vhost module. Any other ideas? Thanks.
>>
>> I need to check better, but we should be able to do all at run time
>> looking at the features field. As I said, both QEMU and kernel can
>> allocate the maximum number of queues that they can handle, then 
>> enable
>> only the queues allocated by the guest (e.g. during
>> vhost_vsock_common_start()).
>>
>
>Yes. I checked the code and found there is an implementation bug ( or
>limitation) in drivers/vhost/vsock.c. In vhost_vsock_start(), if a 
>queue
>failed to init, the code will clean up all previous successfully
>allocated queues. That is why V1 code does not work when
>host kernel is new,  but qemu and guest kernel is old. I made a change
>there and it works now. I will clean up the patch a little bit and
>send V2 soon.

Great! I'll review the new version!

Thanks,
Stefano


