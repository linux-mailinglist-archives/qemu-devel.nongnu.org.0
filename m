Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D063619D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqfo-0004Tv-23; Wed, 23 Nov 2022 09:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oxqfj-0004Tc-D8
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oxqfh-0005D6-MR
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669213456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGKwjKvSYlUydo++kGe9XFisvPAkLPsfEnCvTCmPj6g=;
 b=SRl1N2e9ndvsuCz41AerxsMXC3X2WM7Eviq2S1BbvufxDKv/Qi3cFvEm3soasRZnEkmzxW
 3MKOuc65uI9sgaCycM7efmldMC8kwCkU5cFKsoIr/S+mXlLRFwvCI4jC2K2rFw80Sx4HfJ
 +La4PkCLQLXrJdNwfPIrJ0TumnIg1fc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-5j8gQnIOM5y9BF3XS59ncg-1; Wed, 23 Nov 2022 09:24:15 -0500
X-MC-Unique: 5j8gQnIOM5y9BF3XS59ncg-1
Received: by mail-qv1-f72.google.com with SMTP id
 ns11-20020a056214380b00b004c64784249eso16564070qvb.7
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 06:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGKwjKvSYlUydo++kGe9XFisvPAkLPsfEnCvTCmPj6g=;
 b=YBdYaki5ss4fWFWrnlbVQEIsO1FWmAJE4RjSzrsvfv6WW3ScE9VGrvvLGXmLY6RK9Q
 x06Fby+2yMqTJ7SkvBeYHpvzVG1rqmaD1rrCSEse99whWsqfbpxd7gtRR5eNSuPg7PUw
 3StJ7pSFmHs1pjq6znB/hEa/UVbg82+L+uKRR6nq5ixix6wdX/J7pxKoGluBHZnE+wSG
 O5kEHSyMNgogPWqL+xiYXU2amv5tuq7A1qlUSA4+3jjs41yls0uf46yBJg8pmDqszt23
 jIFjYv6SFCXagVF1W8T2sBETvHT8uR1hf5C4ZkN6WNfjaqdiiZdxxK4KQCLzbLKEnVwS
 nstg==
X-Gm-Message-State: ANoB5pmWj5kM3Ykaw3guc1w5yvurQrtwZdQ0fuEg8eRE3WR8VKvdRFG+
 IIN6efHin0AE3X3svZx2sNXJruaIZ6FQMpyPqUOaNHUzC/lL8Yrf4rWqdQIj3g4lApw0kFwIKsu
 qElCyhQ/7mIfxpn4=
X-Received: by 2002:a05:6214:368a:b0:4bb:6b58:2c96 with SMTP id
 nl10-20020a056214368a00b004bb6b582c96mr8132058qvb.127.1669213454958; 
 Wed, 23 Nov 2022 06:24:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5pJz4CHtdSHrTRGqBp9VSxY+dwcqbU1sYbPghXBOwNE2SCXGNh71qYuvZ5Jlft9gtCLu8s+Q==
X-Received: by 2002:a05:6214:368a:b0:4bb:6b58:2c96 with SMTP id
 nl10-20020a056214368a00b004bb6b582c96mr8132036qvb.127.1669213454730; 
 Wed, 23 Nov 2022 06:24:14 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 bq23-20020a05622a1c1700b0039467aadeb8sm9686390qtb.13.2022.11.23.06.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 06:24:14 -0800 (PST)
Date: Wed, 23 Nov 2022 15:24:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, virtio-fs@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, kangjie.xu@linux.alibaba.com
Subject: Re: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Message-ID: <20221123142407.f6m4mo5exgjhgiix@sgarzare-redhat>
References: <20221121101101.29400-1-sgarzare@redhat.com>
 <CACGkMEtZ9C0uhnDZ7iPJSHvPcbwGCLrzj742zzc9xAVWD7EMVA@mail.gmail.com>
 <CAJaqyWfAA7p9MB4DZ-qtshr28HG3o4uXcxyg+BPC6C+eeojnbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJaqyWfAA7p9MB4DZ-qtshr28HG3o4uXcxyg+BPC6C+eeojnbA@mail.gmail.com>
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

On Tue, Nov 22, 2022 at 07:01:38PM +0100, Eugenio Perez Martin wrote:
>On Tue, Nov 22, 2022 at 4:13 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Mon, Nov 21, 2022 at 6:11 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >
>> > Commit 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
>> > enabled VIRTIO_F_RING_RESET by default for all virtio devices.
>> >
>> > This feature is not currently emulated by QEMU, so for vhost and
>> > vhost-user devices we need to make sure it is supported by the offloaded
>> > device emulation (in-kernel or in another process).
>> > To do this we need to add VIRTIO_F_RING_RESET to the features bitmap
>> > passed to vhost_get_features(). This way it will be masked if the device
>> > does not support it.
>> >
>> > This issue was initially discovered with vhost-vsock and vhost-user-vsock,
>> > and then also tested with vhost-user-rng which confirmed the same issue.
>> > They fail when sending features through VHOST_SET_FEATURES ioctl or
>> > VHOST_USER_SET_FEATURES message, since VIRTIO_F_RING_RESET is negotiated
>> > by the guest (Linux >= v6.0), but not supported by the device.
>> >
>> > Fixes: 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
>> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1318
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>>
>> > ---
>> >
>> > To prevent this problem in the future, perhaps we should provide a function
>> > (e.g. vhost_device_get_features) where we go to mask all non-device-specific
>> > features (e.g VIRTIO_F_*, VIRTIO_RING_F_*) that are not emulated by QEMU but
>> > we expect them to be emulated by the vhost or vhost-user devices.
>>
>> Adding Eugenio, this might not be true if we want to use shadow
>> virtqueue for emulating some features?
>>
>
>I think we should be able to introduce that in the (hypothetical)
>vhost_device_get_features if SVQ starts emulating a ring feature,
>isn't it?

Yep, I think so. The idea is to have a single place where to do it.

> I think a first version not aware of SVQ is fine anyway, and
>to introduce it later should be easy.

Thanks for the feedbacks, I'll keep you CCed.

Thanks,
Stefano


