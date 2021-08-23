Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9A3F511C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:16:45 +0200 (CEST)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFMj-0005Vp-RX
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFLf-0004b8-Gh
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFLc-0006Zt-TP
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2esEdtQnTaK+l/Fvb9no/v+45uWIgsWevH5o9WjEHk=;
 b=Wy1INmljXPCh+DLorcdvCOY6QG92PrL9BnM5+b6Vpnd5TEXtjriTINZZgQ+c1lUbaSU8an
 SyhH8nL8ecIsL75CfAE3DLmMqAxByCi2WMjLOKF8FR/vWnseegWGYlgEGfS876LdEPkGQl
 p4Au4Zi2aSDfkAN8pI/pLF2kcYbYXYI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-85tEif2aNMuOwJIC34BZ8Q-1; Mon, 23 Aug 2021 15:11:01 -0400
X-MC-Unique: 85tEif2aNMuOwJIC34BZ8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so81873wmj.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k2esEdtQnTaK+l/Fvb9no/v+45uWIgsWevH5o9WjEHk=;
 b=V1YXFbQsNA3DQQXnvlB3pDBKrLt3gs5Z2No6rFZT3vOq7I8or7l8rsRmy/5RblaGhC
 btvLQo8QuKsSQ6Qnt+qpHjHBUIe3WkKORKv41Lj1Skc42P9HNUhWhrfapEU8qCWELU/N
 57vqK0/jpO4Lgf26l8W+GEPLH4kcFmYnt4WjsqqeI4TIu7q21+NryX8C5HOZEcqgJU1d
 ZrNiQXBkW2FBn0BcXSloBjMwIhZkxriZbc9JwCcRm5P7ZCi1q5l4BL3cPlbz35OoeUZe
 1LdcGLnPGg8sHdDcYzBkE6Ns/8NWl6E+ys/H/PdKtsUEJDDjzX/7xEbnT5kVlfpqskSk
 wt8Q==
X-Gm-Message-State: AOAM531EOLo0/Fyr3TqwpumdT1a7FvPDKNKljnEIwZbpcSLzd6hZ6PsB
 X1dhRWC6zRgFNI7WA2+nlkKvs2mpvylKkfO/9W5RADsCOsUde1rLnk+mxSa52LivYEP8TE4U3wR
 n2WMw3G0POM3yODk=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr96572wml.140.1629745860126;
 Mon, 23 Aug 2021 12:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEPjcSyjcyMaPJGkUxjiOQM5i5fhU9K8qw58OfPI7QIaaYZOIVaEeHmpOeogJ60DrKZskqFw==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr96545wml.140.1629745859873;
 Mon, 23 Aug 2021 12:10:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 c25sm57100wmr.15.2021.08.23.12.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:10:59 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Message-ID: <dc7e8e9b-6891-5c33-0ecf-e4065335e4f4@redhat.com>
Date: Mon, 23 Aug 2021 21:10:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> Check bus permission in flatview_access_allowed() before
> running any bus transaction.
> 
> There is not change for the default case (MEMTXPERM_UNSPECIFIED).

s/not/no/

> 
> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
> using it won't be checked by flatview_access_allowed().

Well, and MEMTXPERM_UNSPECIFIED. Another indication that the split 
should better be avoided.

> 
> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
> using this flag will reject transactions and set the optional
> MemTxResult to MEMTX_BUS_ERROR.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   softmmu/physmem.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 0d31a2f4199..329542dba75 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>                                              hwaddr addr, hwaddr len,
>                                              MemTxResult *result)
>   {
> -    return true;
> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
> +            return true;
> +        }

I'm a bit confused why it's called MEMTXPERM_RAM_DEVICE, yet we also 
allow access to !memory_region_is_ram_device(mr).

Can we find a more expressive name?

Also, I wonder if we'd actually want to have "flags" instead of pure 
values. Like having

#define MEMTXPERM_RAM 	        1
#define MEMTXPERM_RAM_DEVICE    2

and map them cleanly to the two similar, but different types of memory 
backends.


> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Invalid access to non-RAM device at "
> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
> +                      "region '%s'\n", addr, len, memory_region_name(mr));
> +        if (result) {
> +            *result |= MEMTX_BUS_ERROR;
> +        }
> +        return false;
> +    } else {
> +        /* MEMTXPERM_UNRESTRICTED and MEMTXPERM_UNSPECIFIED cases */
> +        return true;
> +    }
>   }
>   
>   /* Called within RCU critical section.  */
> 

Do we have any target user examples / prototypes?

-- 
Thanks,

David / dhildenb


