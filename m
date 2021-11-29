Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D290461062
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 09:44:36 +0100 (CET)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrcH5-0004Ye-8Y
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 03:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrcG7-0003u9-HN
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 03:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mrcG4-0003Wx-AO
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 03:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638175403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBaXAB76thCFCgY3j60LFR7CNY/1oNyGRi1jYqKFybk=;
 b=bWQ0Nef4waJq5TtLR7Jx4vCuECtQ6giRSXa/XgFhMmIb4IG0XdOtO7gGpM6LZAvPOhqqAB
 +AEdjURLp9/a0FFAoOeqLqu5p57jcN4Smw5WLsHY0KFTG9uV1Z1kIMmkUVrtcpeL1Ita2m
 0hEysHlrrVQITnelN1O2G6JqLb9NrMk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-243-_96vGbQGMq25FQ2I9DaMCw-1; Mon, 29 Nov 2021 03:43:19 -0500
X-MC-Unique: _96vGbQGMq25FQ2I9DaMCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r2-20020adfe682000000b00198af042b0dso2568154wrm.23
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 00:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gBaXAB76thCFCgY3j60LFR7CNY/1oNyGRi1jYqKFybk=;
 b=RU/95DvZt886h9rQbfaWkNUVLbdBBK8G19jFbrDhpyXi5QgdTT2pXvqlOrB4d82LKj
 m6wCGhnT8Yeh4GdsZMBPv7/BspDKgW9UwqzvJVtK5SHqX4CFgEpHoewtmRO4oDCg3kH5
 vqOdzlPQorhzBo9Q0ubOWRCz7Y1pZUs6Cichn39P1wpE1mOGM9A3FccNXRw1JjuoxCZ1
 sftnk7KdNDvgXPUPU4a6XPhquOYrsjOgFOnyUnNhCwF4U/bi1DYyqVWSUXyTpwhsTQDs
 qBGEm3DfcvltZwRnfyouD96Tl4u/oyd1N+zDz79VdoMDxcVDeuhmcoMCs52qsJWa4Bl6
 5Ukw==
X-Gm-Message-State: AOAM532AK+nCoDZxGbwV0xz+xeJ4b+dldAFCghdDQaaZriMb0HWf0H6Z
 okBHxWLSyYp50EC73x8MmrLipWwYm6Oe0wCXWLkeI36d2WzpyfgmJGml6VZDodtWw52rxeoEqdS
 NXLu7i9cU2bMfCJg=
X-Received: by 2002:a7b:c452:: with SMTP id l18mr35168733wmi.46.1638175398688; 
 Mon, 29 Nov 2021 00:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvexjMj5PCO1GtnHdUYocw4PW4M6utnxlr1s/g1ypyTMiSDF5xtSGDVWPCUtf8nDXS+O9yrQ==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr35168716wmi.46.1638175398488; 
 Mon, 29 Nov 2021 00:43:18 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6664.dip0.t-ipconnect.de. [91.12.102.100])
 by smtp.gmail.com with ESMTPSA id p62sm13893075wmp.10.2021.11.29.00.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 00:43:18 -0800 (PST)
Message-ID: <d01469aa-a39c-38ad-ea17-892483355ac9@redhat.com>
Date: Mon, 29 Nov 2021 09:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH V2 2/2] virtio-balloon: correct used length
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20211129030841.3611-1-jasowang@redhat.com>
 <20211129030841.3611-2-jasowang@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211129030841.3611-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wei.w.wang@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.11.21 04:08, Jason Wang wrote:
> Spec said:
> 
> "and len the total of bytes written into the buffer."
> 
> For inflateq, deflateq and statsq, we don't process in_sg so the used
> length should be zero. For free_page_vq, tough the pages could be

s/tough/though/

> changed by the device (in the destination), spec said:
> 
> "Note: len is particularly useful for drivers using untrusted buffers:
> if a driver does not know exactly how much has been written by the
> device, the driver would have to zero the buffer in advance to ensure
> no data leakage occurs."
> 
> So 0 should be used as well here.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V1:
> - use 0 as used length for free_page_vq
> ---
>  hw/virtio/virtio-balloon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 17de2558cb..9a4f491b54 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
>          return;
>      }
>  
> -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
>      virtio_notify(vdev, s->svq);
>      g_free(s->stats_vq_elem);
>      s->stats_vq_elem = NULL;
> @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              memory_region_unref(section.mr);
>          }
>  
> -        virtqueue_push(vq, elem, offset);
> +        virtqueue_push(vq, elem, 0);
>          virtio_notify(vdev, vq);
>          g_free(elem);
>          virtio_balloon_pbp_free(&pbp);
> @@ -552,7 +552,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>      }
>  
>  out:
> -    virtqueue_push(vq, elem, 1);
> +    virtqueue_push(vq, elem, 0);
>      g_free(elem);
>      return ret;
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


