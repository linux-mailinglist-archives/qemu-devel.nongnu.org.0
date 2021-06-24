Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E03B317B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:36:12 +0200 (CEST)
Received: from localhost ([::1]:43312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQSh-0004Dx-Hs
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lwQOH-0007lK-DV
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lwQOF-0006lG-GI
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624545094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AocNHEVE77hrTe1QsAg8HylcccsU1Kdy54DZI8L7GII=;
 b=AMO1bbnz0fbj77xHAKBC0kwZhjr81qDCiR1MnVD+s1kc087deA+fo6rouFeixRtekllemS
 N9Ab8sz5iomnFf96jHnd804jyxDpzdac1XDUJQJGVoaA1BprIVCOF0ye2X3rNhAfC/Q7gQ
 vAv0moyYcRCYknDvt226rJ4qLgtkZdU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-wZl7WS9qMHugboytEpLupg-1; Thu, 24 Jun 2021 10:31:31 -0400
X-MC-Unique: wZl7WS9qMHugboytEpLupg-1
Received: by mail-ed1-f71.google.com with SMTP id
 p19-20020aa7c4d30000b0290394bdda6d9cso3404151edr.21
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 07:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AocNHEVE77hrTe1QsAg8HylcccsU1Kdy54DZI8L7GII=;
 b=RAjlLAi5UH6MY1cTFZOr9twsU8WxT3tmEAk2NDYn63p6FinD8x0JOWqATEmJmcQegy
 mkp81l23llvv3Shl5HPUEOKT/we2L4IX8IoWWqEOgTpLzF+Fa+hYtAbciDqtNjbpumD9
 HP7n7v5FKCOs2bNY/cy/Jdtnzyf8rXCJxHfTZUkh0tljQWGzQSiFDo6vTouLGV44iy+e
 BH+QMESFVNhy7AL8Q19CD09MQ9RLbYD4Bi8+p+cy1lN95wsaoiyM7up4LV1dZOS6+sKS
 HD/plkNjyzfUMCKf3r2oTviC03MuRwkphGkDlvLkCGZB2Apy4kaVvSxsN+KTk2DmpGoK
 8CZg==
X-Gm-Message-State: AOAM530u+JUZrLy60BjOQPrAjgM1pfDoqTzBnfPNrqUMtazzJ+IeGq9S
 AnU3KvUT58zL6mDcDFUGacxSQWOoBsXhHXZFQtoFBIO7bjMC1KTm016Ow2UOQZl6jfyVrnEnp/o
 lYrgZYu3IhRXDLoE=
X-Received: by 2002:aa7:c256:: with SMTP id y22mr7572790edo.177.1624545089998; 
 Thu, 24 Jun 2021 07:31:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFWlw0AsU9CCs3JQDOD5Df0M+rQND/KQsGb5wIxrbt83cECD38Pe1NwlF37fmeaKdbtDLFqQ==
X-Received: by 2002:aa7:c256:: with SMTP id y22mr7572765edo.177.1624545089828; 
 Thu, 24 Jun 2021 07:31:29 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id g16sm1271586ejh.92.2021.06.24.07.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:31:29 -0700 (PDT)
Date: Thu, 24 Jun 2021 16:31:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v1] virtio/vsock: add two more queues for datagram types
Message-ID: <20210624143127.fqubmuvw634j44mi@steredhat>
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
 <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
 <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z9kFc3pnK0Uwqc-fvfaakAh5VMYBR+9SZkz3w658XRK1g@mail.gmail.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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

On Wed, Jun 23, 2021 at 11:50:33PM -0700, Jiang Wang . wrote:
>Hi Stefano,
>
>I checked virtio_net_set_multiqueue(), which will help with following
>changes in my patch:
>
>#ifdef CONFIG_VHOST_VSOCK_DGRAM
>vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>vhost_vsock_common_handle_output);
>vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>vhost_vsock_common_handle_output);
>#endif
>
>But I think there is still an issue with the following lines, right?

Yep, I think so.

>
>#ifdef CONFIG_VHOST_VSOCK_DGRAM
>struct vhost_virtqueue vhost_vqs[4];
>#else
>struct vhost_virtqueue vhost_vqs[2];
>#endif
>
>I think the problem with feature bits is that they are set and get after
>vhost_vsock_common_realize() and after vhost_dev_init() in drivers/vhost/vsock.c
>But those virtqueues need to be set up correctly beforehand.

I think we can follow net and scsi vhost devices, so we can set a 
VHOST_VSOCK_VQ_MAX(5), allocates all the queues in any case and then use 
only the queues acked by the guest.

>
>I tried to test with the host kernel allocating 4 vqs, but qemu only
>allocated 2 vqs, and
>guest kernel will not be able to send even the vsock stream packets. I
>think the host
>kernel and the qemu have to agree on the number of vhost_vqs. Do you agree?
>Did I miss something?

Mmm, I need to check, but for example vhost-net calls vhost_dev_init() 
with VHOST_NET_VQ_MAX, but then the guest can decide to use only one 
couple of TX and RX queues.

I'm not sure about qemu point of view, but I expected that QEMU can set 
less queues then queues allocated by the kernel. `vhost_dev.nvqs` should 
be set with the amount of queue that QEMU can handle.

>
>Another idea to make the setting in runtime instead of compiling time 
>is to use
>qemu cmd-line options, then qemu can allocate 2 or 4 queues depending 
>on
>the cmd line. This will solve the issue when the host kernel is an old
>one( no dgram
>support) and the qemu is a new one.

I don't think this is a good idea, at most we can add an ioctl that qemu 
can use to query the kernel about allocated queues, but I still need to 
understand better if we really we need this.

>
>But there is still an issue when the host kernel is a new one, while 
>the qemu
>is an old one.  I am not sure how to make the virtqueues numbers to
>change in run-time
>for the host kernel. In another email thread, you mentioned removing kconfig
>in the linux kernel, I believe that is related to this qemu patch,
>right? 

It was related to both, I don't think we should build QEMU and Linux 
with or without dgram support.

> If so,
>any ideas that I can make the host kernel change the number of vqs in
>the run-time
>or when starting up vsock? The only way I can think of is to use a
>kernel module parameter
>for the vsock_vhost module. Any other ideas? Thanks.

I need to check better, but we should be able to do all at run time 
looking at the features field. As I said, both QEMU and kernel can 
allocate the maximum number of queues that they can handle, then enable 
only the queues allocated by the guest (e.g. during 
vhost_vsock_common_start()).

>
>btw, I searched Linux kernel code but did not find any examples.
>

I'm a bit busy this week, I'll try to write some PoC next week if you 
can't find a working solution. (without any #ifdef :-)

Thanks,
Stefano


