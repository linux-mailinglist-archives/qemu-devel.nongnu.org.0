Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD06658F3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:23:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYGB-0007n8-Ns; Wed, 11 Jan 2023 05:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYG5-0007lX-Qv
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYG4-0005W6-Cz
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvE6T/uuDH0XlafcoCC4jrofYgDMA48a5hhE+Wzs18Y=;
 b=aDCK8tN6LIiJaWK3tQhzLKawRqCltaGEJZAwGl5e9ScnWr1kB7slScnxAB2Jp/Y/6Q2zUw
 nLq94TwQXgds09ET8bUCK4Nrfq/c5KkjtSHPETQqSKG9YpWXXObtp+3YSxYdFqP/VvSHYf
 7dBWXsoCfeqUoDB5ZwfGw+2FYjKeB4s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-3MqAB5zfN3uPg4gRZB-kZw-1; Wed, 11 Jan 2023 05:22:58 -0500
X-MC-Unique: 3MqAB5zfN3uPg4gRZB-kZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so7577325wms.7
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QvE6T/uuDH0XlafcoCC4jrofYgDMA48a5hhE+Wzs18Y=;
 b=gvFU9azaqBS0VUrJ9fR4ECR6BeMtYU+3S/gQ4HtTl4X7nfu1fMZX62UdInFHk1Cz0v
 eMaotIAJQDkzWZZHS9VcgF3qOMIihRkTwo9ABotnRLebLHVEnVwJ8/M9L1n0v0P0nFvx
 43+jRwiPLqlP/nd6i/DchTvIcWOUvcKokazGmWs86R/Mb6hUWpsW244PjkWsnDbaF9bh
 gn8JHh84Zo/enI7hEz79tCBPsHbkKaEwCmHh2EzcTP8Cfx6Om2GVnkye3kDfAs6L/HhY
 OjaRB2EX/WFJ84b5lO0D9Bv9m+tG6vSjd0LMgShbw7dbds6UltDJDQXxMgyU5aTAe0Yr
 mX2w==
X-Gm-Message-State: AFqh2kouGQ779x/g9JL2+0kZXifa0XAMA9wiIMW1aKKIEm9uMhSTVwXt
 y7HZ3ge22vm9R66NZBHAjP9K6eSNOlUeAZJzW1c21CrhenwXZMeZO0ulbb0zK3LjTG7RJHgF26U
 /SR8WSfk0MFzuxew=
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id
 ay9-20020a05600c1e0900b003cfb73fbf8fmr51014423wmb.7.1673432576993; 
 Wed, 11 Jan 2023 02:22:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsL+YFsUG9X4j1CqKVvRBnQWbL4CRdF2nh08H0rs+5IyrFNdlwQ1G6H1TeymngOWJJcVvaD2A==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id
 ay9-20020a05600c1e0900b003cfb73fbf8fmr51014405wmb.7.1673432576692; 
 Wed, 11 Jan 2023 02:22:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm13369314wrp.55.2023.01.11.02.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:22:56 -0800 (PST)
Message-ID: <d8513ea3-abec-08a9-3997-54fd83d472f2@redhat.com>
Date: Wed, 11 Jan 2023 11:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 7/7] target/s390x: Hoist some computation in access_memmove
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-8-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.01.23 21:18, Richard Henderson wrote:
> Ensure that the total length is in a local variable
> across the byte loop.  Compute size1 difference once.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/mem_helper.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 92eb6564c3..5f0dd67985 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -299,16 +299,17 @@ static void access_set_byte(CPUS390XState *env, S390Access *access,
>   static void access_memmove(CPUS390XState *env, S390Access *desta,
>                              S390Access *srca, uintptr_t ra)
>   {
> +    int len = desta->size1 + desta->size2;
>       int diff;

I guess I'd have called "diff" something like "size1_diff" to make the 
comparisons easier to digest.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


