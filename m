Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F336855E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:59:25 +0200 (CEST)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcfk-0000D4-R2
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZcR0-0003UD-1N
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZcQv-0001PK-5e
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619109840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7HKjJwBgBbSIcPb07qHE1hAVEzEUM96oRZrW56A4bk=;
 b=g0TT8Bb+/ecxa7PJYcOXj3IQdYCr1Kd1rS/w2w92CPt99kzta2Fizh/uCYyY7uHZM4Bpno
 5S70Jd4iSau7roeoyukkcTvbiTNIYCZrPWKfjA1vxSUpROrhna68pM6CQjHDTuWrQ1AAx7
 0zl4D2Wp/ElzYL263UtZWgMsIOZQOuc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-JImF6ystNt2hPudTXRamiw-1; Thu, 22 Apr 2021 12:43:52 -0400
X-MC-Unique: JImF6ystNt2hPudTXRamiw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j72-20020adf914e0000b02901073cdd9d65so4518113wrj.0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N7HKjJwBgBbSIcPb07qHE1hAVEzEUM96oRZrW56A4bk=;
 b=AptgXEQegv+M1NONBS624TgmGjgKrrS+xydZTPJl4qXgQgF71LOMeElLyWpDz9zvDI
 BHBGGZsX0rBHXe7FACf2cZPfpgZRiB+9AzPLzNRyLMA6/vjg5RyWV/SgR0Fpr31cDfqz
 XlB3t6Z6EigcrS+IXzKaEFqnRnFUG9b5hqlqOQ7Qp1d3oHyGCufTtgTczdug92EWxyEI
 1D2K+omlDsXQbWSLzmtRS+Nx+VUUkWsvv8A1kX9fmR092W+ov4OA4I9eZoybEtsLxnhs
 O1tKzaE0W7EjA7u917QAOmM71g2IhMoLnIBfkOg3FJOzMTcFxAG0hGcHO4qGdQ9zmbZS
 HSEw==
X-Gm-Message-State: AOAM532Dk41mzYpneNuZz6s00b+DVwKD5RrD2tNuQ+3eUahAiRds31SC
 CjYfjO1oNaapl7SXtLXNmJg4exZ/LdLa7er6V86bUZ7itpiX/5Tj5wEeWTwgzSpcddn33FVuVxU
 vQlVEyI5Sx+1wagg=
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr5240814wrx.139.1619109831499; 
 Thu, 22 Apr 2021 09:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8NCgnW9Eaf5kgR6vD0Tj75uh+NunRP/hqe5dMU7hfJFVrmcYsJ00l52StkY2SwDqc97y62A==
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr5240787wrx.139.1619109831318; 
 Thu, 22 Apr 2021 09:43:51 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23eb0.dip0.t-ipconnect.de. [79.242.62.176])
 by smtp.gmail.com with ESMTPSA id a2sm4724602wrt.82.2021.04.22.09.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 09:43:51 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210422154427.13038-1-alex.bennee@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <62c06053-733e-ebc9-d719-f34a8b31e17b@redhat.com>
Date: Thu, 22 Apr 2021 18:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422154427.13038-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 17:44, Alex Bennée wrote:
> We can remove PAGE_WRITE when (internally) marking a page read-only
> because it contains translated code. This can get confused when we are
> executing signal return code on signal stacks.
> 
> Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-option bit")
> Found-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   target/s390x/mem_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 12e84a4285..f6a7d29273 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -145,7 +145,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>   
>   #if defined(CONFIG_USER_ONLY)
>       flags = page_get_flags(addr);
> -    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE))) {
> +    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
>           env->__excp_addr = addr;
>           flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
>           if (nonfault) {
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


