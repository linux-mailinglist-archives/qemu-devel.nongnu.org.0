Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6A5FCB92
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:27:51 +0200 (CEST)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oihOQ-0006Au-Br
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihLD-0001bF-9Q
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihLB-0002Sq-6e
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665602668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=at6clenBJ9HqgC84mGGfW09Uew0Gagvv7vmB2ymp9cw=;
 b=Il3viYVfdbdyBpZOoJ3EccdlFGrD3K/GbfX/ZJwYftutC0OFgw6wZBumG6l8aKe9Fg0tgx
 XJqJoDT5qWwdZNtTd8Zbv6WP87YDnp3bMe/HWzSMi0/kehOCduQFPsCFd4QIREk24xK8Zi
 fTzDQq1yioBA0kqz03wsu2z0rjoZXLM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-iCRclXkeMz2hbor9SLh0ow-1; Wed, 12 Oct 2022 15:24:27 -0400
X-MC-Unique: iCRclXkeMz2hbor9SLh0ow-1
Received: by mail-wr1-f71.google.com with SMTP id
 r4-20020adfbb04000000b0022e5ec02713so5301051wrg.18
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 12:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=at6clenBJ9HqgC84mGGfW09Uew0Gagvv7vmB2ymp9cw=;
 b=eYctlM/DNYKBpZ0TFCQLqMcd5SaoBBdUOC8RyEoxLggebPsLYezHln2Ktq2ic9jTbh
 5IvjdQVno3nUNE77BjlnHHzQdc2F/4Ju69gBlGVK5nR0WHghZQV7pCqDPECPJ3OV6zLj
 auTWcbql/O8K25lReTaTFpkPveyJHD6N6g3FhS900Xw6zdrFhJg8Y46/TOysRyLnT1Es
 bKwZHyVuR3ofjovXt9kaOHZcGgyYpaiptSfnq5upWfgMSyrnlwG3/NIx5H/G4dnfajUD
 His/OtXjapp3qWFBevK1RxZzsFfC7tW730RmP2FpyBW0/BjiG+Ue83Jh9JzITX/mkL7p
 V5dQ==
X-Gm-Message-State: ACrzQf0loN70Px7X2DWFJMidSQYCW2awKP8w4eTwTGsGXM8NBSmBCYcO
 jdjSrSe4auYtxIvrT28I0a60ZGAkbdcL8ihf/txiqxAMOza6Cz5QENW9GwF18P7DtLmOLZK9VZj
 owHHcrSzRdZTMKAE=
X-Received: by 2002:a05:600c:4fd2:b0:3c6:db8a:4d2a with SMTP id
 o18-20020a05600c4fd200b003c6db8a4d2amr146465wmq.178.1665602666315; 
 Wed, 12 Oct 2022 12:24:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7AWqGtibmUuLqhexXkXVcM93PN5zkbvymYnIsB+fDvAQILC3u8acsJ//NFKhev6ZUWnqIBeQ==
X-Received: by 2002:a05:600c:4fd2:b0:3c6:db8a:4d2a with SMTP id
 o18-20020a05600c4fd200b003c6db8a4d2amr146457wmq.178.1665602666016; 
 Wed, 12 Oct 2022 12:24:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:fd00:9f9b:c2f8:47fc:4836?
 (p200300cbc713fd009f9bc2f847fc4836.dip0.t-ipconnect.de.
 [2003:cb:c713:fd00:9f9b:c2f8:47fc:4836])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c314b00b003c6d896a17dsm1454585wmo.32.2022.10.12.12.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 12:24:25 -0700 (PDT)
Message-ID: <a8dab7b4-b3f8-8851-2320-f95059169ab8@redhat.com>
Date: Wed, 12 Oct 2022 21:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/4] qom: Improve error messages when property has no
 getter or setter
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com
References: <20221012153801.2604340-1-armbru@redhat.com>
 <20221012153801.2604340-2-armbru@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221012153801.2604340-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.10.22 17:37, Markus Armbruster wrote:
> When you try to set a property that has no setter, the error message
> blames "insufficient permission":
> 
>      $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
>      QEMU 7.1.50 monitor - type 'help' for more information
>      (qemu) qom-set /machine type q35
>      Error: Insufficient permission to perform this operation
> 
> This implies it could work with "sufficient permission".  It can't.
> Change the error message to:
> 
>      Error: Property 'pc-i440fx-7.2-machine.type' is not writable
> 
> Do the same for getting a property that has no getter.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qom/object.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index d34608558e..e5cef30f6d 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1383,7 +1383,8 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
>       }
>   
>       if (!prop->get) {
> -        error_setg(errp, QERR_PERMISSION_DENIED);
> +        error_setg(errp, "Property '%s.%s' is not readable",
> +                   object_get_typename(obj), name);
>           return false;
>       }
>       prop->get(obj, v, name, prop->opaque, &err);
> @@ -1402,7 +1403,8 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
>       }
>   
>       if (!prop->set) {
> -        error_setg(errp, QERR_PERMISSION_DENIED);
> +        error_setg(errp, "Property '%s.%s' is not writable",
> +                   object_get_typename(obj), name);
>           return false;
>       }
>       prop->set(obj, v, name, prop->opaque, errp);

Much better!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


