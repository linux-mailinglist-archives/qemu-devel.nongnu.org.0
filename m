Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C178244BE2F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:59:41 +0100 (CET)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkOK-0008Cp-UM
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkMr-0005h8-9h
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:58:10 -0500
Received: from [2a00:1450:4864:20::333] (port=53861
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkMp-0000V3-Jw
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:58:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id y196so1584301wmc.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H1HNDYYRVhRwd0A+BZ9pBmTU/pfkmkT64KnTUf71Sfs=;
 b=BkwAwAqySFqTyoIAqqvS+K7iExYGDRkjPOYQOk9aFxjtAqzhlOO/xZPMyqOWVWS/Ci
 4v558P92t/NaCshxYIbrPIUGArNA//70CboA8KkZ0AMHrP/eZ/6eCAbY4jgRY+fk+gkW
 xFRTf/iB1vqs5uYt36jxrnkBGmmXrCcFKe3ONq2/36AqWO7Z2DBRxUOaX+IiTtQ1+wMj
 zH2fszMeP6//Gu0wLn7WgQGeBj3OWEhr1vsUxyD0azvkDOhr/L+9KYzwX+fWK14r/Y3V
 9B2d+S+AnMh+EgBRV5GdQF+n2M3EPW9Zw1NDOrV/xNqpwE6qYVa2N2Et4y82jO2v89Vz
 xR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H1HNDYYRVhRwd0A+BZ9pBmTU/pfkmkT64KnTUf71Sfs=;
 b=pEmbPr8cQLJFMo+QgBc9CrYQdOrjF6zJcKJ2aLScbHXYRmSlEVO8ypTFDBGqYMe+L8
 HYxYPUbv4V5p4YeAvMlS6jU7iUuaEVFi2f/5D6E546QsV758iPl0GS7diUBj48dFBWHJ
 0Lcn0vU7/QcXsNh6xTSNDJuGTUOK/7R9kkW5QroKec7N4DhB5ED9iJlGUKciwh1+h1rO
 FRH9Ub+6cvfJw/VXWQigK29p3sdZTyXy7bEaKNr3CF6KR3tCXrrkK4lT6w/s+mt4IC+m
 2UnGFq+gnzbcSdsSCGvbLiYdciEQkxnbw1/cP8uCQikAzXi3H7fWZav8x5Q24Z84T7gD
 LgTA==
X-Gm-Message-State: AOAM53071vndKm7OGOTBZIdMDqIZwvS3NX58gx3rUd9BpIT5LXoAOkZq
 HFEZbydsI2rbv4rpPoXmORcFvQ==
X-Google-Smtp-Source: ABdhPJxI6BUH7ed/ipW6oiXcV5T+etK6wmCWBJybp53y2PxUOmkPmhpIVo68xVcMm4ORCixw91yS4A==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr14823518wml.49.1636538286172; 
 Wed, 10 Nov 2021 01:58:06 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id f6sm5173316wmj.40.2021.11.10.01.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:58:05 -0800 (PST)
Subject: Re: [PATCH] spapr_numa.c: fix FORM1 distance-less nodes
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211109183553.1844689-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <490a7d19-9e16-b77e-2114-032d7c5091d6@linaro.org>
Date: Wed, 10 Nov 2021 10:58:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109183553.1844689-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, Nicholas Piggin <npiggin@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 7:35 PM, Daniel Henrique Barboza wrote:
> Commit 71e6fae3a99 fixed an issue with FORM2 affinity guests with NUMA
> nodes in which the distance info is absent in
> machine_state->numa_state->nodes. This happens when QEMU adds a default
> NUMA node and when the user adds NUMA nodes without specifying the
> distances.
> 
> During the discussions of the forementioned patch [1] it was found that
> FORM1 guests were behaving in a strange way in the same scenario, with
> the kernel seeing the distances between the nodes as '160', as we can
> see in this example with 4 NUMA nodes without distance information:
> 
> $ numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>    0:  10  160  160  160
>    1:  160  10  160  160
>    2:  160  160  10  160
>    3:  160  160  160  10
> 
> Turns out that we have the same problem with FORM1 guests - we are
> calculating associativity domain using zeroed values. And as it also
> turns out, the solution from 71e6fae3a99 applies for FORM1 as well.
> 
> This patch creates a wrapper called 'get_numa_distance' that contains
> the logic used in FORM2 to define node distances when this information
> is absent. This helper is then used in all places where we need to read
> distance information from machine_state->numa_state->nodes. That way
> we'll guarantee that the NUMA node distance is always being curated
> before being used.
> 
> After this patch, the FORM1 guest mentioned above will have the
> following topology:
> 
> $ numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>    0:  10  20  20  20
>    1:  20  10  20  20
>    2:  20  20  10  20
>    3:  20  20  20  10
> 
> This is compatible with what FORM2 guests and other archs do in this
> case.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01960.html
> 
> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> CC: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/spapr_numa.c | 62 ++++++++++++++++++++++-----------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

