Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18C631B2E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox22R-0005m7-Ml; Mon, 21 Nov 2022 03:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ox22Q-0005ly-7G
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:20:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ox22O-0003Kt-C6
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669018812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LzSd7HDkP1FiyIMWUBTlBYPuPQ7UUEI3Kb02XggvqMg=;
 b=Wllkw2EpNTqZ7UvETeWwa9NlwXkejI1rqdm9KvCOsoVnUo0ABgnATC0vJRlsN/AUzjow0s
 RHNOVum7mzwLIUfocNP6Ql9tS6LSzUKDVKMmW0fralbvg0m4gUD0ry6ew3s5hOJqmyfxnN
 47S4LVn6WEuL/6sitaPnGbjumCnb8K8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-6WSbhRRkP2SHFGVUV80yQA-1; Mon, 21 Nov 2022 03:20:11 -0500
X-MC-Unique: 6WSbhRRkP2SHFGVUV80yQA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so8899319wmb.8
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 00:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzSd7HDkP1FiyIMWUBTlBYPuPQ7UUEI3Kb02XggvqMg=;
 b=xIk9MG+FHyUQHGwjCvO4/xiiNt7QI16qMOB7CfrXlAWYqJxXU8R6rZQ1JOwFpcbJ74
 OA+NCoX1oa64G5nBC8EaKfEyKCcmWWcNpd3cOxV4TPTrFxC38yaFIq8qwbzj2ppJqSGu
 D04N/fioimrwnvVVJQWG6haUvMdh53gRHju/2mmF+OpkjDhqnW/3AcU2m5T6MNncWm1r
 rB4vaHNcedVTwk+P2LuWsdRggT0EQ5EnMpDYMbUj8aoNeBTs3QK8Q7AP3kaOc0JQP2JK
 Y+4wR50X/aNaPkJZWeCm5rfdkPrn7qDNTQ4d6U3kmIErEt/lgqCpW1eyttSiQ/EHxiLf
 IcOw==
X-Gm-Message-State: ANoB5pk6X9du9RN1AXT4wxPytXjOziqh789iXbSkcH1ODPrgTxYZPGRi
 lUobcHg/P/HMC5BAGAN3ad7hZzXT4Xr/RJO273PCDi5wr3Dqne4eLmTu3tEzAV8iMV3SvajxpTJ
 AzarFLMTO4kQhIIo=
X-Received: by 2002:a5d:50c9:0:b0:241:dc84:eb93 with SMTP id
 f9-20020a5d50c9000000b00241dc84eb93mr550991wrt.136.1669018809866; 
 Mon, 21 Nov 2022 00:20:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf42llXXZe8RpTct1m7Mh5LnIUWmCeVRdYLmBNw+n2EaZYlKo9txGFG3uB7geYsVoUHEi5f8Qg==
X-Received: by 2002:a5d:50c9:0:b0:241:dc84:eb93 with SMTP id
 f9-20020a5d50c9000000b00241dc84eb93mr550966wrt.136.1669018809566; 
 Mon, 21 Nov 2022 00:20:09 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003c6cd82596esm17395903wma.43.2022.11.21.00.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 00:20:09 -0800 (PST)
Date: Mon, 21 Nov 2022 09:20:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v4 30/83] virtio: core: vq reset feature negotation support
Message-ID: <20221121082004.hqxcr7ckefv2zdpf@sgarzare-redhat>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-31-mst@redhat.com>
 <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
 <20221119121900-mutt-send-email-mst@kernel.org>
 <CACGkMEsg=CM8Cjdf+mTKBY2+NLeH5oz7v7dchWPZkVpXeD9NoA@mail.gmail.com>
 <20221121020729-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221121020729-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21, 2022 at 02:07:41AM -0500, Michael S. Tsirkin wrote:
>On Mon, Nov 21, 2022 at 02:17:02PM +0800, Jason Wang wrote:
>> On Sun, Nov 20, 2022 at 1:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> >
>> > On Fri, Nov 18, 2022 at 03:32:56PM +0100, Stefano Garzarella wrote:
>> > > Hi,
>> > > starting from this commit 69e1c14aa2 ("virtio: core: vq reset feature
>> > > negotation support"), vhost-user-vsock and vhost-vsock fails while
>> > > setting the device features, because VIRTIO_F_RING_RESET is not masked.
>> > >
>> > > I'm not sure vsock is the only one affected.
>> > >
>> > > We could fix in two ways:
>> > >
>> > > 1) Masking VIRTIO_F_RING_RESET when we call vhost_get_features:
>> > >
>> > > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>> > > index 29b9ab4f72..e671cc695f 100644
>> > > --- a/hw/virtio/vhost-vsock-common.c
>> > > +++ b/hw/virtio/vhost-vsock-common.c
>> > > @@ -21,6 +21,7 @@
>> > >
>> > >  const int feature_bits[] = {
>> > >      VIRTIO_VSOCK_F_SEQPACKET,
>> > > +    VIRTIO_F_RING_RESET,
>> > >      VHOST_INVALID_FEATURE_BIT
>> > >  };
>> > >
>> >
>> > Let's do this, we need to be conservative.
>>
>> Ack.

Okay, thanks for the feedbacks!

>>
>> Thanks
>
>
>Patch pls? Stefano?
>

Yep, I'll send it.

Should we do the same in the other vhost and vhost-user devices?
IIUC now we only filter it in vhost-net.

Then I'll try to see if we can rework how we handle features to make 
sure we avoid this in the future. Maybe by creating an array of core 
features always filtered, because for example this one is not device 
specific.

Thanks,
Stefano


