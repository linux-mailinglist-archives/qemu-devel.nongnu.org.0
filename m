Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685713F304C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:56:13 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6sO-0000in-HH
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6pw-0006qH-07
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6pu-0008Uk-B7
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629474817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQV2u2VRaDRkJzaiNo2J7mtyoEO7u/bGgcHHlUIoKrc=;
 b=GgQkYjVsSih7aMvnWJi/r6td5Kr7Nn4UC7hdzgSrYiZs6z36RDsu8rSG/5kdeVBYyd7X7/
 S0MGCVQuVWhz6wNGqTuUqU7LJgVy+pawmWfYZXkdpJ4WbN2yF3jqT+Z/2M2BoHgHr8UnUJ
 Pr2vzzJp+8kTFxmCO2UcZWF/KnAZ2Qo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-u1gGLjsJPCKbdLzryaEx7Q-1; Fri, 20 Aug 2021 11:53:36 -0400
X-MC-Unique: u1gGLjsJPCKbdLzryaEx7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so2525224wmr.9
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nQV2u2VRaDRkJzaiNo2J7mtyoEO7u/bGgcHHlUIoKrc=;
 b=KQ03EhcjW1rFFtv2KS94jU+GBK6+IWruqD3+87L+U2lgnyP0SCcrIUE2jmwZzE4AW0
 twKsJ3umt1nFj1ukHSH3jk5CJLimxVUKvt1Nh3VRoryq0iHRuNKJSqwmwHFXbIbZLRMe
 XybdNUl46c5Sr1X3kHm0zftfK8VJa77xLGjj90C0rpkm0DNa+qMATEnKlXw3yGPz41oP
 zkgqxxKGYp/1qdupYU0pOYqOw3m/9joKOvGDkYScdAWnkFfMTuWzhboppsjW9i8VFY1x
 nWJjmw/C50wCejsaZlZafBHS8und8W6/R9QRFKLAkGmafhcQ7yRnEX56MXa/L3RPa6tI
 nfIw==
X-Gm-Message-State: AOAM5326xJ/cfQQlpzDWKGXsXjh0zS8GYnI32sV8Q+cwcRSKQEQ59mhz
 W3l/6eb8gl8EzJcy4wY50/+yqK5y/gKDiQL8uzSZEa18iVqgMEdBpH4q5IF7DVMnw3FI11wou7O
 QDPWoFYGEN+E3Xlw=
X-Received: by 2002:adf:c3c3:: with SMTP id d3mr3648522wrg.373.1629474815238; 
 Fri, 20 Aug 2021 08:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTNHdPNY6y3agcrGLl4t0EyL2Fca5nw5gM+5IgKz0oxhyfdQlf1uq/dAO6MxlPFhZDLZx7SA==
X-Received: by 2002:adf:c3c3:: with SMTP id d3mr3648502wrg.373.1629474815065; 
 Fri, 20 Aug 2021 08:53:35 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id c13sm2119372wru.73.2021.08.20.08.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:53:34 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210820155211.3153137-1-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
Date: Fri, 20 Aug 2021 17:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820155211.3153137-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 17:52, Philippe Mathieu-Daudé wrote:
> When Linux refuses to overcommit a seriously wild allocation we get:
> 
>    $ qemu-system-i386 -m 40000000
>    qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate memory
> 
> Slighly improve the error message, displaying the memory size
> requested (in case the user didn't expect unspecified memory size
> unit is in MiB):
> 
>    $ qemu-system-i386 -m 40000000
>    qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram': Cannot allocate memory
> 
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   softmmu/physmem.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 2e18947598e..2f300a9e79b 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>                                                     &new_block->mr->align,
>                                                     shared, noreserve);
>               if (!new_block->host) {
> +                g_autofree char *size_s = size_to_str(new_block->max_length);
>                   error_setg_errno(errp, errno,
> -                                 "cannot set up guest memory '%s'",
> +                                 "Cannot set up %s of guest memory '%s'",
> +                                 size_s,
>                                    memory_region_name(new_block->mr));
>                   qemu_mutex_unlock_ramlist();
>                   return;
> 

IIRC, ram blocks might not necessarily be used for guest memory ... or 
is my memory wrong?

-- 
Thanks,

David / dhildenb


