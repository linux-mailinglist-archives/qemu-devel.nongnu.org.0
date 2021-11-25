Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A845D636
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:31:25 +0100 (CET)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqAA7-0002B2-Qp
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mqA7w-0000Il-3Z
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mqA7t-0007Lf-Jr
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637828944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfhPAdYS1R+raxcpMA8K+o6w5pNmZxhv/z//RR0eXMY=;
 b=d6mLBnMyWcMXacf5ZgWs8mM9d2QnaxTOaK0XI2s5Mns6xQXJ1F/0ySZJ9NfFfm5irEWNLb
 1LJQWvHe6Q4JsnFJM2GRDjd9J19T1XJ7j0nHFwC63LR/CjjG+8cb5BfHbueEFLfW4yJ7xg
 SfwJ/OkqZg11aN6l5hFnAhgGdS0/G7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-lJRju5KZPGahmRM9hghtrw-1; Thu, 25 Nov 2021 03:29:03 -0500
X-MC-Unique: lJRju5KZPGahmRM9hghtrw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so959263wro.4
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 00:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=EfhPAdYS1R+raxcpMA8K+o6w5pNmZxhv/z//RR0eXMY=;
 b=TIcRp+tBCvIeEY4oT61aDN/TRbkhD3EbldJzxcN2FXawFkiZztGjFFaugLV/rgu5b6
 jZYjppGZJyBij/V0h3R9T3ZrdNLQKfdL5qzipx4bbk7p+V/dRJVzhVbDr8X1GJ+wRhf9
 uytDBpRacQz5PuewJeU4No89Nb6rNPry5glLPTVq/BapIVAYnUMCqtNLxFxLq/gVG1W1
 i5SPoanIFCzX1v7Zj6mnfUd0Aiqb5EBhkJJPgXNTHQQnRbh5p9e1tcVzrJnEXAek136g
 i5d+c3OfCVOH7fS7/IEMZODUHDjfVAsLBRPW7BS9pcFgmSjiROBGdR7u/+J4cBUK4aWC
 Wlpg==
X-Gm-Message-State: AOAM532TCgsc2nJO0dfugx2k6VeaqhRZxR9GBHR6DTqnMafJQqvrFZ3s
 pXwBSCeV5j63mmMb4hM87E9NiXHOo2gTE+3kbQUDiSWhW7WbmbksFn/HWuP2oLAQ/NJ+Y8d9XT0
 isR4DDXwtJc/fURU=
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr4601005wri.530.1637828942407; 
 Thu, 25 Nov 2021 00:29:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziGA6ViPBNxpf1Q1numwTFx4nmOkIydDVuVzPbdr3yTn8/7aNhL50PPVDEpFaodOuCn5u7Zw==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr4600980wri.530.1637828942215; 
 Thu, 25 Nov 2021 00:29:02 -0800 (PST)
Received: from [192.168.3.132] (p5b0c679e.dip0.t-ipconnect.de. [91.12.103.158])
 by smtp.gmail.com with ESMTPSA id o4sm8610021wmq.31.2021.11.25.00.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 00:29:00 -0800 (PST)
Message-ID: <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
Date: Thu, 25 Nov 2021 09:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20211125022046.10433-1-jasowang@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
In-Reply-To: <20211125022046.10433-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mpe@ellerman.id.au, Wei Wang <wei.w.wang@intel.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.11.21 03:20, Jason Wang wrote:
> We only process the first in sg which may lead to the bitmap of the
> pages belongs to following sgs were not cleared. This may result more
> pages to be migrated. Fixing this by process all in sgs for
> free_page_vq.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index c6962fcbfe..17de2558cb 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtQueue *vq = dev->free_page_vq;
>      bool ret = true;
> +    int i;
>  
>      while (dev->block_iothread) {
>          qemu_cond_wait(&dev->free_page_cond, &dev->free_page_lock);
> @@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>      }
>  
>      if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
> -        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
> -                                  elem->in_sg[0].iov_len);
> +        for (i = 0; i < elem->in_num; i++) {
> +            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> +                                      elem->in_sg[i].iov_len);
> +        }
>      }
>  
>  out:
> 

Yes, but:

1. Linux never used more than one
2. QEMU never consumed more than one

The spec states:

"(b) The driver maps a series of pages and adds them to the free_page_vq
as individual scatter-gather input buffer entries."

However, the spec was written by someone else (Alex) as the code was
(Wei). The code was there first.

I don't particularly care what to adjust (code or spec). However, to me
it feels more like the spec is slightly wrong and it was intended like
the code is by the original code author.

But then again, I don't particularly care :)

-- 
Thanks,

David / dhildenb


