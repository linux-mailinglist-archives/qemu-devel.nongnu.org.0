Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE093AE731
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:32:43 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHEQ-0004N5-SL
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGp1-0000jW-6r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGoz-0002uE-Ei
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAMNCMMhbrJ2T96gQmYlohqSXYGyVVmUM7cG9LRhDNk=;
 b=BW55brZjDXGr+o8foa662G5CL+IiMMSNZqdV2BAIyBEy2wS/SRrIEObQ3w1yd1Ry3++idU
 ddjiWPXofLkIIN7UjzUXQNVFrbdQ6GOxMsQhQL1Xs6OXeV/OjyenlAYv6/oBDQp09JjVEW
 pmiBqkSFvLOpKo4kVcv4fx0/TOf7mV0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-MsCx7zyVPJ-rM_D1txLENw-1; Mon, 21 Jun 2021 06:06:23 -0400
X-MC-Unique: MsCx7zyVPJ-rM_D1txLENw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so1754690wms.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 03:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XAMNCMMhbrJ2T96gQmYlohqSXYGyVVmUM7cG9LRhDNk=;
 b=KbNXMbsvRCNrEnFiUstvhbfeaCbgP99YLgglVMO8x6wJ2PLEWxj+IKWqzXkxIMJnfM
 vQvAHKxjzh6iJ3r2d7nynSPOZypMyIdYIZ+x9B18S3om4xC10ts0RP52A3cG253fN6Hs
 yXGdy8DHKdvOW+DsqtIE4HM8V8z8ZCwk+C3YP0Wa00a1SWmpqi4IBsoPiPDYQgNnp270
 ds/llTirjhVvtY/Td7YWG6Mu3xau8tKwL0+SDscinwb73FWIDVg4wH1Bh2C3kIL4WPXq
 1WnmhWRp9Gszv5qqfDLbNq46dI2F3amHkVnW8zWPaK+yKj6Qwzmu5EPUw3g+Iff1Rq4L
 Xsgw==
X-Gm-Message-State: AOAM533+l5C88kMPozWX0LzCyAxiVYTvthxL4+zc1gf0rahqBcaGcb6V
 Bed+L843s9o+2RlJuQ8Xyw9StGt1i3gMN0iKhNKqqVf3VEEJQUK6h7Kgcc4WIqU3bgGeivUO4hn
 N1x4MAs1ZHqS+Wv0=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr27274700wrt.281.1624269982526; 
 Mon, 21 Jun 2021 03:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiyabIv05U/g3Q/0fW8PBh8QDsGubAGcGpC4JneJiE0sza7UkLNhSmMm3Dx5Iwb/C/9zBNVQ==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr27274677wrt.281.1624269982383; 
 Mon, 21 Jun 2021 03:06:22 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l12sm17271269wro.32.2021.06.21.03.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:06:21 -0700 (PDT)
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: qemu-devel@nongnu.org
References: <20210523094040.3516968-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3198f6b-3bce-1686-2123-e1c44479bdf9@redhat.com>
Date: Mon, 21 Jun 2021 12:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523094040.3516968-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: only one space before end of comment (mst)
> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..130e3568409 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;
> 


