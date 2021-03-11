Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BA337C9B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:26:45 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQ1E-000790-VY
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKPzW-0005qK-0e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:24:58 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKPzS-00012E-GH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:24:57 -0500
Received: by mail-oi1-x230.google.com with SMTP id u6so16791224oic.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s3vmQb3Efpoif6R05/Yeq9FvioH8dm93x4wDI6v1mCM=;
 b=mOxkZjMyJ7j8dIqeW06Ktz8lkt61t2z+MKOECedIalxPnnnwCKBjtxkj7OWcA+/ClQ
 B3cSChCLn1Y+st7NHbntgUwsVWtEc8JtSaSIWQEet2REQcjMwA7XQzWdy4Gxpb981YP/
 HsrKWmD7z7Gcl1FO8qWtsQuSsfYy31lMlWiWQARMNf9kGR6HYR9b/Ds70CwvjyJoJzdN
 bNI0VwrGh5MTUZ4vva1UMR/mWVYUeo6uKhF1Vqs0NrBysYZrR1ABxoHAtACHn2K1JAEe
 mtvPH3qHwZGcWUm/IHY84o98WnUGDVldk7xvd7bq+TqKULgCPfScGD9oeuYyrcUbVCXP
 RHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s3vmQb3Efpoif6R05/Yeq9FvioH8dm93x4wDI6v1mCM=;
 b=NvzUYi99XJeJWIvhFcwAGW2j03JV+hmYhoo6JEojpz5u5+C2/kPCWErns01lTFduin
 YKXY4eJ3k7yV7xYebAym88JRKd45B2haN9okQr7JQzs/b9ti1cFCw7L7GHVX6UMfOQ/V
 MU1kJIOUe8H0oAB6A3TSg4bx0yWf73xVLpZntU3A597wDvn9UVTQDdkqdL8vIwJ9zweP
 +f1ZrrU4TYGHaE+VeqSN8ZzGW0MQmfIax30I9Z8tGKKjaxUmIY9iXgZccVtXRaszZfCI
 KVhvwMTnmI2LTudjKN7iwcWxlsMajRcPz5Qsl/pFAf9U6+3dBpqGK4FT508hEajvup7l
 n7YA==
X-Gm-Message-State: AOAM530n12XdEz4DqyJivgNZ2sTe59/set9estUTWA8S78DqMhIpS6sR
 UbEessxhXrDH9nE70g4dkRmArg==
X-Google-Smtp-Source: ABdhPJyd7d+ZbJgupYy7aOVfBEtrj3yTKTc8ZGQYsQrKr9UR9wnzrNiIcUwifco4fig3s3eULzXVbg==
X-Received: by 2002:a05:6808:2d0:: with SMTP id
 a16mr7188991oid.83.1615487093278; 
 Thu, 11 Mar 2021 10:24:53 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y194sm686234ooa.19.2021.03.11.10.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:24:52 -0800 (PST)
Subject: Re: [PATCH v5 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-2-david@redhat.com>
 <39285cf8-2214-2257-679d-231e0c6a0652@linaro.org>
 <5b929a10-4561-d596-b43b-33ca4022ea54@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94081af4-2d90-4e6d-10f3-63c58a9b326d@linaro.org>
Date: Thu, 11 Mar 2021 12:24:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5b929a10-4561-d596-b43b-33ca4022ea54@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 12:16 PM, David Hildenbrand wrote:
> On 11.03.21 18:52, Richard Henderson wrote:
>> On 3/11/21 10:17 AM, David Hildenbrand wrote:
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +    /*
>>> +     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or 
>>> haddr==NULL
>>> +     * to detect if there was an exception during tlb_fill().
>>> +     */
>>> +    env->tlb_fill_exc = 0;
>>> +#endif
>>> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
>>> +                               nofault, &haddr1, ra);
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +    if (env->tlb_fill_exc) {
>>> +        return env->tlb_fill_exc;
>>> +    }
>>> +#else
>>> +    if (!haddr1) {
>>> +        env->__excp_addr = vaddr1;
>>> +        return PGM_ADDRESSING;
>>> +    }
>>> +#endif
>>
>> The assumption of PGM_ADDRESSING is incorrect here -- it could still be
>> PGM_PROTECTION, depending on how the page is mapped.
>>
> 
> Interesting, I was only looking at the s390x tlb_fill() implementation. But I 
> assume these checks are performed in common code.

Actually, no.  It's a common bug in our linux-user targets, where we don't fill 
in the SIGSEGV si_code correctly.

See e.g. 8db94ab4e5d.

> Thanks, maybe I can factor that out in a nice way. I guess we could do the 
> access via probe_access_flags() and only on error do the page_get_flags()?

Yes, we could do that.  It's certainly better for !nofault, which is the 
common-case user of this function.


r~

