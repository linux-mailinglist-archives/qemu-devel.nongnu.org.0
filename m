Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42D337936
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:23:51 +0100 (CET)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKO6I-0002mD-FB
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKNhe-0004Ta-VG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:58:23 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKNhd-0001Ff-8v
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:58:22 -0500
Received: by mail-qk1-x735.google.com with SMTP id a9so21049376qkn.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XxEHsAQBazfx7gTUquVVDsCJdFgNEziRyst0i6MM7BE=;
 b=IC+I2I/qAX80MYqyqgq+gf1svuPGpaZCWezmT4W9arFDF0u29QyvzswDWTcskbFQqc
 w6OnbICFAe284FwClrWrZbq/56AAHmj4Xjx4HAEZW0iG8QHveVRpMpKW/8gpTqDiu4lk
 iD/kjGYDWR/5LZmFYTc1JJ4JBlkgHCMitQIuqUGxC5HcWVylf0T16iqpxUrfFJCZ2g0E
 WFZcxdKysIlbfNDZ62ognNm0f9J0RirLgTvWTdJJYkFjLm7Y6beyxiQKVc9laz/9PMh0
 b3NVl+jwx/QxgWsCQacAdFLESKpRLiCOQ11cfz4NP6x14Ej93DPSFKq9tQk1wRFeCSkB
 LJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XxEHsAQBazfx7gTUquVVDsCJdFgNEziRyst0i6MM7BE=;
 b=DPSA1lbD1+2JekHQxBdf9CSEZQe3KMe1w+U6IEQoZ3FGbU1i9M7VTGt/UbA6N908hZ
 tpWs6LGOJhz5i3O3ZdKjNMlkRzo3HA8JHx8vNmqEwwjEmtHADB89zfpRbVlHSZEV0cGk
 PEjldhfdK1mFYCIsi0w+USQuPOoiKII92b69JCnQcB9jW8RA+xVgTVMAtu/77xJPpbBS
 BSZoXyaF7YOLoHCytTsLyVzViFDx37DHl/TdRtQqh2Pot6/ZfThAEe5r6pIoH+DdM0+r
 GZ5PPDtFenSVKjLDYo4dBtMKzeWheJdUDrBnX7PjvFX4IShHOYMsJMg828kJAywCZSjm
 +4CQ==
X-Gm-Message-State: AOAM531oFN9ivIItZxieQYgdiKMWOMOCnKGpIoSaycuB25uV0utYvdeB
 pZhz8KujIMnnylNc1rzZe543zA==
X-Google-Smtp-Source: ABdhPJyplp/EwINZArMW+5Un7G2lRfbE4h3IVqXrRav6PCWe0NlXmxgbAjrG4mLx0/PjtHCA50qRhQ==
X-Received: by 2002:a37:660e:: with SMTP id a14mr7905666qkc.35.1615478300193; 
 Thu, 11 Mar 2021 07:58:20 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h7sm2180492qkk.41.2021.03.11.07.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:58:19 -0800 (PST)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303132850.459687-1-thuth@redhat.com>
 <a6cb6d81-8cf3-4e3a-29f4-1593e1fffec5@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c21d4c1-6a4d-ab89-00e9-be9a7c86c09a@linaro.org>
Date: Thu, 11 Mar 2021 09:58:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a6cb6d81-8cf3-4e3a-29f4-1593e1fffec5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 8:03 AM, David Hildenbrand wrote:
> As talked with Thomas off-list, there is no trusting on host==NULL
> as well (see comment in struct S390Access). host==NULL simply
> means we have to do individual ld/st.

I think that comment is stale with the use of probe_access instead of 
tlb_vaddr_to_host -- TLB_DIRTY is in fact handled now.


> +    env->tlb_fill_exc = 0;
>       flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
>                                  nofault, &haddr1, ra);
> +    if (env->tlb_fill_exc) {
> +        /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
> +        return env->tlb_fill_exc;
> +    }
>       if (unlikely(size2)) {
>           /* The access crosses page boundaries. */
>           vaddr2 = wrap_address(env, vaddr1 + size1);
>           flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
>                                       nofault, &haddr2, ra);
> +        if (env->tlb_fill_exc) {
> +            /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
> +            return env->tlb_fill_exc;

But this is pretty clean, and definitely works.


r~

