Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D406F36C98F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:38:29 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQjE-00012O-OD
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQhM-000084-Ua
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:36:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQhH-0002TD-83
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:36:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id p17so3335200pjz.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HVbZI0B7gwo0bC+Yq+PhormUBPIYJKo1dipvxa++kXI=;
 b=G2NvXXP/ZB7Mj/qacxtyBqIFIYq+pEWUff6/H3pMvkKsWXbRmdoBl0/dh18ncdVIYc
 tnPjDzC1MDvnCOAAB2+dkQDkVVyJ4pw7yjySzzcIPS/CcjZwje5VJE+UISldpgqExy2k
 9hYpVpamWnEabciWUIHP0fARMhDD7pQyvRHfmqW3lZuQNe95TN5PiR5fhZRGp6IBKwN5
 f01NXusmaFusg5jpfsChy6e9aTl2ZjfV6Dewq0Dn9UdGxNCXF1oBtugvbYt8SYgGuc9y
 /EnsaUWSP5wN7q0Eqk/rgq9c5Vm/cOB107UeYpc++mRvmKR6uF4H1gqxHg1wnjbNyjol
 W+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HVbZI0B7gwo0bC+Yq+PhormUBPIYJKo1dipvxa++kXI=;
 b=RlJoh1qTd1tB/xZxvGe87iyQ94quwO1gRrhlOJbSSKl0W4n42EIX91YYhCHtmPQJnO
 ZmHQeI0cEQYJWRU+tJ27MxBXw4jTYgu96WE3YQ6GC/6hYr0gLw+tBdmsl9SXfSJRavVQ
 T+THJbtd4As3e37EV0YhakGxTa2/xQFjy14tgTYUefiZy7zWVwXOqTHxo5FD4AVI1vaB
 hfFA1JYjwZD7utkelZpxW3owt1dCIzmfEMFhp+XTeVR9bD3ypfmeRdoarung1kNisPr0
 Qo9t8Jn68fgccH2rKxIXyfJJJueNxaube9RnBNd58hoXLzm+q7JhyisBF2Y6p/Iw/Q/Z
 CdzQ==
X-Gm-Message-State: AOAM533WN5xoUk2U2fAo0PKz5SUfwS8IGv6MdBI9R58BP1tTEaodztFf
 4Pmem2zPHiFeVZxfjp+IQgIbnFKW74PuEQ==
X-Google-Smtp-Source: ABdhPJwrtw0PmO+Y+0nGqp5lKDQwxPS0f1/LUcoDxBQ5mzUtFFb0N65bQMqbRIijsEi7f/z20UYMUA==
X-Received: by 2002:a17:90a:f3d3:: with SMTP id
 ha19mr251271pjb.166.1619541385141; 
 Tue, 27 Apr 2021 09:36:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 17sm250206pgd.34.2021.04.27.09.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:36:24 -0700 (PDT)
Subject: Re: [PATCH 02/13] target/arm: Share unallocated_encoding() and
 gen_exception_insn()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aec6a7e6-ae1f-279c-a770-5bce4f4d6e0a@linaro.org>
Date: Tue, 27 Apr 2021 09:36:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The unallocated_encoding() function is the same in both
> translate-a64.c and translate.c; make the translate.c function global
> and drop the translate-a64.c version.  To do this we need to also
> share gen_exception_insn(), which currently exists in two slightly
> different versions for A32 and A64: merge those into a single
> function that can work for both.
> 
> This will be useful for splitting up translate.c, which will require
> unallocated_encoding() to no longer be file-local.  It's also
> hopefully less confusing to have only one version of the function
> rather than two.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.h |  2 --
>   target/arm/translate.h     |  3 +++
>   target/arm/translate-a64.c | 15 ---------------
>   target/arm/translate.c     | 14 +++++++++-----
>   4 files changed, 12 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

