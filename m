Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A0402843
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:09:56 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZvG-0001Xf-IU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNZtc-0000qD-RW
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNZtZ-0007ki-HI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631016487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJIeOisOFip/3oxjFCz1B9MF6+gpqwjho2TulV6Cypg=;
 b=dn3v57pvrWro9PS1W4cC2XrDes5Pzx25Z/XWuobCz+Ea0OnPnwopBvsHk1EdY0WOKBaUKM
 1HceHrZ4GW/BZYVPphN8zxu6KkyEkfnUrNaB5NuefoJRKin3hP38W8SQbMvvZEZ3nBnx3g
 rn0F1LAG+5S6bv4OnhFoSyfLtwoImBg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-mxpfQDXbM-e0NtCMAWA6OQ-1; Tue, 07 Sep 2021 08:08:06 -0400
X-MC-Unique: mxpfQDXbM-e0NtCMAWA6OQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 o14-20020a1709062e8e00b005d37183e041so3544366eji.21
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NJIeOisOFip/3oxjFCz1B9MF6+gpqwjho2TulV6Cypg=;
 b=W79uEZMQMyH06ZHa2yE61q93RGtsJo7j92fEBgChLa+9C6gMrqPFuZ9TJuNaZqQFq6
 yJJvZPEKci8SnzG8PHbWZlD/UUSbZ6Z7N73kk8SF+mZ+EO2jpAE8ryRtZkjsVelP5wiW
 5IKHm+Gxzh86h1JRbn8PfTLdKVtF8cSUUbo4UXCs4fRtl2hNq7SxxwnMZdaHIOi0ZtY3
 n+Tjm2AGCN2xnhF9IMH07bboh+5KRiaH2CEhi/UVGwiayeFtHEJbg0Pc/gwnIB1o7tcz
 XL8Nr7L/P3V2qRWWzlqL6zZlHMjg9ehQGSffEOEixp5pQcUW6IgEALTGTt2ubwKOEZW9
 1xpQ==
X-Gm-Message-State: AOAM530aprfCzoJ/j0xP0IIjt+xpBKbGqP4CVhlobFcq06IEultZWWOw
 2KzA16pQnEQtYTfPLxdiP+7SQ4AYDZGLRHMUz8Iax4vW4MBaduXXFaytN+u3EUfBOjSLewuu9/g
 JOZvyzwMzzoTK5eU=
X-Received: by 2002:a17:907:d86:: with SMTP id
 go6mr19202325ejc.475.1631016485436; 
 Tue, 07 Sep 2021 05:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf1g7ZQusXbx7Y3vPI1EiZxvGZp5JW6Ke6cGZOkUqL2qM16jQv8MLmB36PhOPfpAWL2ssaXg==
X-Received: by 2002:a17:907:d86:: with SMTP id
 go6mr19202307ejc.475.1631016485255; 
 Tue, 07 Sep 2021 05:08:05 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id d6sm6514174edx.0.2021.09.07.05.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:08:04 -0700 (PDT)
Date: Tue, 7 Sep 2021 14:08:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [PATCH v4] virtio/vsock: add two more queues for datagram types
Message-ID: <20210907120803.mecaq73yii3fcu2f@steredhat>
References: <CAP_N_Z_FWCQuzxKG7uXAZRm_-X4A1m1c3Rh_FcBiDAksSbMWug@mail.gmail.com>
 <20210907101530.djm2zsoo4f3pirof@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210907101530.djm2zsoo4f3pirof@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 12:15:30PM +0200, Stefano Garzarella wrote:
>On Sun, Sep 05, 2021 at 11:08:34AM -0700, Jiang Wang . wrote:
>>On Mon, Aug 9, 2021 at 3:58 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>>On Thu, Aug 05, 2021 at 12:07:02PM -0700, Jiang Wang . wrote:
>>>>On Wed, Aug 4, 2021 at 1:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>>>> On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:
>
>[...]
>
>>>>> >+
>>>>> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>>>>> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>>>>> >+                                              vhost_vsock_common_handle_output);
>>>>> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>>>>> >+
>>>>> >vhost_vsock_common_handle_output);
>>>>> >+    }
>>>>> >+
>>>>>
>>>>> I'm still concerned about compatibility with guests that don't
>>>>> support
>>>>> dgram, as I mentioned in the previous email.
>>>>>
>>>>> I need to do some testing, but my guess is it won't work if the host
>>>>> (QEMU and vhost-vsock) supports it and the guest doesn't.
>>>>>
>>>>> I still think that we should allocate an array of queues and then decide
>>>>> at runtime which one to use for events (third or fifth) after the guest
>>>>> has acked the features.
>>>>>
>>>>Agree. I will check where the guest ack the feature. If you have any
>>>
>>>I'm not sure we should delete them, I think we can allocate 5 queues and
>>>then use queue 3 or 5 for events in vhost_vsock_common_start(), when the
>>>guest already acked the features.
>>>
>>
>>I think I just solved most compatibility issues during migration. The
>>previous error I saw was due to a bug in vhost-vsock kernel module.
>
>Please post the fix upstream.
>
>>After fixing that, I did not change anything for qemu ( i.e, still the same
>>version 4, btw I will fix fd issue in v5) and did a few migration tests.
>>Most of them are good.
>>
>>There are two test cases that migration failed with "Features 0x130000002
>>unsupported"error, which is due to
>>SEQPACKET qemu patch (my dgram patch
>>is based on seqpacket patch). Not sure if we need to
>>fix it or not.  I think the compatibility is good as of now. Let me
>
>I'm a bit lost. Do you mean because one of the QEMU doesn't support 
>SEQPACKET?
>
>
>>know if you have other concerns or more test cases to test.
>>Otherwise, I will submit V5 soon.
>>
>>Test results:
>>Left three columns are the source set-up,  right are destination set up.
>>Host and Guest refers to the host and guest kernel respectively. These
>>tests are not complete, and I make the src and dest kernel mostly the
>>same version. But I did test one case where source kernel has dgram
>>support while dest kernel does not and it is good. Btw, if the src kernel
>>and dest kernel have a big difference( like 5.14 vs 4.19), then QEMU
>>will show some msr errors which I guess is kind of expected.
>>
>>Host        QEMU        Guest            --> Host        QEMU            result
>>dgram       no-dgram    no-dgram        dgram       no-dgram        Good
>>dgram       no-dgram    dgram           dgram       no-dgram        Good
>>dgram       dgram       no-dgram        dgram       dgram           Good
>>dgram       dgram       no-dgram        dgram       no-dgram        Good
>>dgram       dgram       dgram           dgram       no-dgram
>>load feature error *1
>>
>>no-dgram    no-dgram    dgram           no-dgram    no-dgram        Good
>>no-dgram    dgram       dgram           no-dgram    dgram             Good
>>no-dgram    dgram       no-dgram        no-dgram    dgram           Good
>>no-dgram    dgram       no-dgram        no-dgram    no-dgram        Good
>>no-dgram    dgram       dgram           no-dgram    no-dgram
>>load feature error *1
>>
>>dgram       dgram       no-dgram        no-dgram    no-dgram        Good
>>
>>*1 Qemu shows following error messages:
>>qemu-system-x86_64: Features 0x130000002 unsupported. Allowed
>>features: 0x179000000
>>qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
>>qemu-system-x86_64: error while loading state for instance 0x0 of
>>device '0000:00:05.0/virtio-vhost_vsock'
>>qemu-system-x86_64: load of migration failed: Operation not permitted
>>
>>This is due to SEQPACKET feature bit.

I think I found the issue, I'm sending the patch to the mailing list.

If you want to try it is here: 
https://gitlab.com/sgarzarella/qemu/-/commits/vsock-fix-seqpacket-migration

Maybe we can reuse the `features` field also for dgram.

Stefano


