Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B06A043C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 09:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV7KQ-0005LN-Oh; Thu, 23 Feb 2023 03:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pV7KN-0005KX-SU
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pV7KL-0005Eg-DF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677142304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6Tz7EHl3jJKKaKShFHnK135BgsEQUJAKVI4MLg0Xw8=;
 b=eVKEIbnLIP8V6n3rbwt1AgnxwHY88nXjnITmOftE/KXGD9Zf46/+K/6M/6ObNznaW7VKjS
 JJsZ7vyHEa/rv48A91yFquotJOZGO9dYypdqxO8m7cg6i08NyEoM6zcQaepuHVv9eyRGLD
 n+yKgYNOJdjLHJ2oWHC2UFR206QDlio=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-j7ccr5qXMuylHVHktT6PPQ-1; Thu, 23 Feb 2023 03:51:42 -0500
X-MC-Unique: j7ccr5qXMuylHVHktT6PPQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 pm17-20020ad446d1000000b0057256b237b9so107944qvb.16
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 00:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6Tz7EHl3jJKKaKShFHnK135BgsEQUJAKVI4MLg0Xw8=;
 b=DrBp8Wjxp58B1+usCOvBa2eyYty4BAELy2vKKKN50nzoucLj4L1LJr753RGAK74l2n
 aXTi32T+z9Smp91Fcq4lcnmJ/DqE3Y+VPx69M9SvCiTuoUbjjtdSRryWJEleygusSQGf
 RwDlt9N3PRLIJEMRbqMf+Dh6a/hMPfLUNBHgLKzx7MJkhogTdkXuM3j2qtXjL/yubKPF
 Cyz4Mk7CKN0Of+UCCc+nQfbO4GtWUq+LqCrpkaNx2fU9Qno6kUA/oTBYBi2CXbtR65jP
 r/X+e4SNDvKVZunxQkW/8kYLnMbTINwvv+L8Ccw0rPYeha2eughz9w98skZu7FYdFLDP
 Ingw==
X-Gm-Message-State: AO0yUKVUWpMDmVcIG9tFgTLIX0Mk7itHx+NzCLBhqPg0lOFWntkXQBqJ
 s5hiDVF/asgreT3Q4zTZWBgvsnGE6NpqwqhGpXzOtXjeiX+RcYR/hRJIEbpTgZk9/tO+7pXJArR
 kT46hdWGZbbtkUaY=
X-Received: by 2002:a05:622a:11ca:b0:3b5:5234:e895 with SMTP id
 n10-20020a05622a11ca00b003b55234e895mr19771725qtk.15.1677142302330; 
 Thu, 23 Feb 2023 00:51:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/lOKU3e7PCfa7Prjcb7oNen8WFuS35nrdvQW4fUgOQYPDy8jVMsWAPWDsaw7kVzNQOlmTNlw==
X-Received: by 2002:a05:622a:11ca:b0:3b5:5234:e895 with SMTP id
 n10-20020a05622a11ca00b003b55234e895mr19771705qtk.15.1677142301989; 
 Thu, 23 Feb 2023 00:51:41 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 ey17-20020a05622a4c1100b003b86b088755sm5758575qtb.15.2023.02.23.00.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 00:51:41 -0800 (PST)
Message-ID: <21d698e6-e7de-a07d-624d-c2fa88152e71@redhat.com>
Date: Thu, 23 Feb 2023 09:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vdpa: stop all svq on device deletion
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-stable@nongnu.org, Lei Yang <leiyang@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20230209170004.899472-1-eperezma@redhat.com>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20230209170004.899472-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

this patch fixes a QEMU crash, could it be merged?

Thanks,
Laurent

On 2/9/23 18:00, Eugenio Pérez wrote:
> Not stopping them leave the device in a bad state when virtio-net
> fronted device is unplugged with device_del monitor command.
> 
> This is not triggable in regular poweroff or qemu forces shutdown
> because cleanup is called right after vhost_vdpa_dev_start(false).  But
> devices hot unplug does not call vdpa device cleanups.  This lead to all
> the vhost_vdpa devices without stop the SVQ but the last.
> 
> Fix it and clean the code, making it symmetric with
> vhost_vdpa_svqs_start.
> 
> Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 542e003101..df3a1e92ac 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -689,26 +689,11 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>       return ret;
>   }
>   
> -static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
> -{
> -    if (!v->shadow_vqs_enabled) {
> -        return;
> -    }
> -
> -    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
> -        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> -        vhost_svq_stop(svq);
> -    }
> -}
> -
>   static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>   {
> -    struct vhost_vdpa *v = dev->opaque;
>       int ret;
>       uint8_t status = 0;
>   
> -    vhost_vdpa_reset_svq(v);
> -
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>       trace_vhost_vdpa_reset_device(dev, status);
>       return ret;
> @@ -1100,6 +1085,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>   
>       for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> +
> +        vhost_svq_stop(svq);
>           vhost_vdpa_svq_unmap_rings(dev, svq);
>   
>           event_notifier_cleanup(&svq->hdev_kick);


