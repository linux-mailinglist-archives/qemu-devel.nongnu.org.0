Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8267A987
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 05:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKX7W-0003QR-JP; Tue, 24 Jan 2023 23:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKX7U-0003Q1-Of
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 23:10:44 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKX7T-0003QW-4P
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 23:10:44 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a18so4212451plm.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 20:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jPE1Z4AiasvWAh81482PZ75gc33qItYy0XzDyKoMixc=;
 b=oTU6Yj4hJGaiSLcbk7N2YURh0GtdwHzd2W6FgaM+BedXCoWTMzrRNSXzrA5f/m3GSU
 y1QNATWo9RrqxhYdkXDclsfMdfcHmOnboZcg+LghPsH06C2vf9dQrQ2VOThLNc3YHdRt
 GHGHYDWGMaizrgTfufgsBkciIoC5oL6ZRXSzvErIy/c8LnsLQt296DoZWy6/EyY5qUL9
 hfbUzV+OYffiSPWfUJEhIYbmKBBkjFbUbXc2HyRWzFK1HRDajP5YWmv/+F6+aAo0kBLS
 qIU28l0t68zGSTzi8ayp3qSuXI4dfNcKC3nrGV4eAN4D59jOxvu5D5d4p6sTeN6nFGb9
 R0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jPE1Z4AiasvWAh81482PZ75gc33qItYy0XzDyKoMixc=;
 b=hUPyaZ0gD91wsELuvg5m7PnNZ+iwLk9cgEH6Zb72Ap3R2KePlw+RUX0Xd242qC7UAa
 du2ja8bTJZQXEOzFuBZuHRltryODZ74PBsFM0NT9J7SMXMVALUDU+RIicfamOVbHF9qJ
 CYN6ZWDzCjRu9BEZyFrJHHJy/z1T1kaeDqrNxwVlNC2d5ythYXkm4L96d4cFhN8YhqE3
 zvDRkZs7fn5P9MGnkHqCOWRXi1HLPaAJjulL75aRZqr8CmMaS4zaYEDnO9/JsgVp/UZp
 ozmgA2TDUp0tYS4wKmKlrDyjAgFp3IzFxvnTeYccMMGe2CYBL4r6T1IMXJRdRgfcXpEe
 d7Gw==
X-Gm-Message-State: AO0yUKV/53NBAm0dl5xPON1hptQm/XV1FBlCJxUD56O4PD1gaaHizwMy
 BWjsAko0+gQBMafDjBk4curecg==
X-Google-Smtp-Source: AK7set+R37yXvoqhAcsjw23PODIcWIcdkiplx4QcLf83p8tO7nOgzPKY2gRqUFL8OY+Gb5g+X0QjQg==
X-Received: by 2002:a17:90b:3805:b0:22c:4e1:93e with SMTP id
 mq5-20020a17090b380500b0022c04e1093emr1348473pjb.15.1674619841228; 
 Tue, 24 Jan 2023 20:10:41 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 101-20020a17090a09ee00b002276ba8fb71sm377487pjo.25.2023.01.24.20.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 20:10:40 -0800 (PST)
Message-ID: <76931dd5-e390-5055-8283-0e1cdf2ddf03@daynix.com>
Date: Wed, 25 Jan 2023 13:10:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Propagate errno when writing list
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221201103312.70720-1-akihiko.odaki@daynix.com>
 <CAFEAcA9sj838rCyPrxAOncXKmdOftZeM16rKiXB5ww7dSYY0tA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA9sj838rCyPrxAOncXKmdOftZeM16rKiXB5ww7dSYY0tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/25 1:12, Peter Maydell wrote:
> On Thu, 1 Dec 2022 at 10:33, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> Before this change, write_kvmstate_to_list() and
>> write_list_to_kvmstate() tolerated even if it failed to access some
>> register, and returned a bool indicating whether one of the register
>> accesses failed. However, it does not make sen not to fail early as the
>> the callers check the returned value and fail early anyway.
>>
>> So let write_kvmstate_to_list() and write_list_to_kvmstate() fail early
>> too. This will allow to propagate errno to the callers and log it if
>> appropriate.
> 
> (Sorry this one didn't get reviewed earlier.)
> 
> I agree that all the callers of these functions check for
> failure, so there's no major benefit from doing the
> don't-fail-early logic. But is there a reason why we should
> actively make this change?
> 
> In particular, these functions form part of a family with the
> similar write_cpustate_to_list() and write_list_to_cpustate(),
> and it's inconsistent to have the kvmstate ones return
> negative-errno while the cpustate ones still return bool.
> For the cpustate ones we *do* rely in some places on
> the "don't fail early" behaviour. The kvmstate ones do the
> same thing I think mostly for consistency.
> 
> So unless there's a specific reason why changing these
> functions improves behaviour as seen by users, I think
> I favour retaining the consistency.
> 
> thanks
> -- PMM

I withdraw this patch. The only reason is that it allows to log errno 
when reporting the error, and the benefit is negligible when compared to 
the consistency.

Regards,
Akihiko Odaki

