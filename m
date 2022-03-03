Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19B4CC9C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 00:03:54 +0100 (CET)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPuUC-0001QY-Tj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 18:03:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPuSd-0000WW-BW
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:02:15 -0500
Received: from [2607:f8b0:4864:20::435] (port=38525
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPuSU-00033m-Gc
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:02:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id j1so2049520pfj.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zVc4zhtQllFdJO5pFwhg/tn7hejtSJDxB7oFTfs3g5w=;
 b=F3pS7+iZMG9G60kpg2ogQj83fr0yh5zokUhBewob0ZUFaijmbAfgiEtgALqwBucuul
 xKov8kfiIiKxKA5U4mHr+dTOXfrSkWbl6/+rk/Ru5/4qwRzD7R3U5T5I3DlixVAmGlJQ
 zkETai9lvss0Paqp2a20Mf+OZhH7OLiyr3ZUfKoo3wq88YPmZX1BWoid9lxeP8Rjt6T8
 LEo/SUp848imguEfd5u3/zhXsBsr26wSXq+dS7XmWOX5fQqb4/qvBMsEC3y04oXrsmoa
 FD3Avbw6+Gvc++Yk9EVCAFNM74h+LqbWvFuZWa8Nm8Ia0GeV1YH0RXWcjqd43zEZo+am
 NcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zVc4zhtQllFdJO5pFwhg/tn7hejtSJDxB7oFTfs3g5w=;
 b=SGwxegbIOiwKsugclofDhQ8/6kqfTwyHDiD781RekpMoGftI80vHpDFa6HLE+Qoalt
 Zt9SRYm2dH6GRR1CcXbesfkXigzUJs+ihAk9X49u/3QUgaXwAcKUjpPXyjid6PuLNrdh
 oqSeoEfnWfzq6putbsOfeebwHn0Pb8u94mlJVvkf8xDIjJ0WBY8mdAtcjdeSioLljJ98
 fcBny9XdAlzdhNI/ZweoNlU1lWDWnIAyJgj625MiPHblIIiyyJQu1NlUO1K607A9Uxne
 0aERbBsi6c//N/ODgLjtfZCFKQZ6Gx5TG3vLD7/oSHcLg8meWZGb3HQS3yF7pwmSMNVb
 Txcg==
X-Gm-Message-State: AOAM532vC2lfqfMvaI2UU+TbvSahXfWRRgsf3UKBcQuhPorwxR70eRnw
 4SdmGY5ZJyYkxMOxE6fqbGvjQw==
X-Google-Smtp-Source: ABdhPJzdz2QL6n94tsSavz5M9YrtRn2stlo4kg8JEHgWaJ84uRxm7mH4RdPjchDIZJmh0oT5bsxq/A==
X-Received: by 2002:a62:644a:0:b0:4f6:a2e6:c706 with SMTP id
 y71-20020a62644a000000b004f6a2e6c706mr2748379pfb.42.1646348524893; 
 Thu, 03 Mar 2022 15:02:04 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 ep5-20020a17090ae64500b001bc56af507dsm8833848pjb.47.2022.03.03.15.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 15:02:04 -0800 (PST)
Message-ID: <5931e696-fb03-98e3-ed34-6d0c79c47504@linaro.org>
Date: Thu, 3 Mar 2022 13:02:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
 <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
 <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
 <91cc02c4-8ea5-23e7-7384-6c6b2c8e12b5@linaro.org>
 <CAFEAcA9mO0rEuhj4rxerDF7qiePjWo0tUs5PBUF-zqgxqsdm3A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9mO0rEuhj4rxerDF7qiePjWo0tUs5PBUF-zqgxqsdm3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 06:55, Peter Maydell wrote:
>> Alternately, force size == 1, so that we always get a non-NULL value that can be freed.
>> That's a change on the POSIX side as well, of course.
> 
> Yes, I had a look at what actual malloc() implementations tend
> to do, and the answer seems to be that forcing size to 1 gives
> less weird behaviour for the application. So here that would be
> 
>     if (size == 0) {
>         size++;
>     }
>     ptr = _aligned_malloc(size, alignment);
> 
> We don't need to do anything on the POSIX side (unless we want to
> enforce consistency of handling the size==0 case).

I would do this unconditionally.  The POSIX manpage says that either NULL or a unique 
pointer is a valid return value into *memptr here for size == 0.  What we want in our 
caller is NULL if and only if error.

> I'd quite like to get this series in before softfreeze (though mostly
> just for my personal convenience so it's not hanging around as a
> loose end I have to come back to after we reopen for 7.1). Does anybody
> object if I squash in that change and put this in a pullrequest,
> or would you prefer to see a v2 series first?

I'm happy with a squash and PR.


r~

