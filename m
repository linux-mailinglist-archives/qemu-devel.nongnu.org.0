Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00E6986A1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOnJ-00066P-Fx; Wed, 15 Feb 2023 15:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOnB-0005wU-6h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:54:17 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOn8-0002gG-Sh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:54:16 -0500
Received: by mail-pg1-x536.google.com with SMTP id v3so13406536pgh.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFv27rlMi3MTmQ9bwnIYhdGvpHvdvCeL3Q8QaqePL2s=;
 b=thxile9dXp6B0/Xc4P6gVyP8QyeglxnLAXcieaZ2ahUOpYXC/qs8VvFu8hiD+MSBPm
 Vn3BYI84OpVIawKRs1LXCFB/DnqFA+wzrtBILR00APJJz2h3ifa0ZsPHbbPOpuoL/og9
 hX7bLNw1J5ZyyqGYAyQu7khA5R/07Ecbbjsctcfp29sVZCa3A1bAp3wQb3alcbDiwaCT
 LNJXXAZ1PdGeqJ0fWxE276j8acz7RflFzAVboYWuE8hPjOWA8lmXNHcOvvZL2LEkfKF6
 /394IsczXjhBVU6Dj5r4Evsb/uTthS3GrHKNSzAgmRhAf5pZOGEk+ipar7PEevbLVVLS
 3rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFv27rlMi3MTmQ9bwnIYhdGvpHvdvCeL3Q8QaqePL2s=;
 b=Tl7EhANwRlTaELTwumJhtQnaENveaiI4CBljP7KVqzX55mffNzJvzCCx1nDJTnP9ID
 5w2qf9ZgMWOSuW9d0zSkou6yO8HmxiM3640qPWnc50GSx9f6xQX16Aus3NUlkijT+ptj
 JQy5JGWQetJ4OJK+QYSjAu7gGU5lfnOnmPwlN4DVLfkHo6aj38Qi54PWloMMtAMsWHMc
 p+3Dk2qr6034qyBUOriC8IqK+iwDSJq0v5D5B4MJRgDNh5hZjm8BGPqQgRf6J84n1d3h
 KqsA65lHbyjAE1IZV95ilYqpmAkIpZd5PsakfgnyZ89NqzVgWqQKJw496FECCSm4GwR9
 xA0Q==
X-Gm-Message-State: AO0yUKXg8Q0A4KuyTRtMvN0muTInnLnksoqFaFvC/AnHM37Hvv4mB0ai
 bjYqUfR6QB77qlDs8tm/R/tn9g==
X-Google-Smtp-Source: AK7set824G61mQQqox3+SrMOxw6rJKLDmu45Gr1zN5belQycDJp1UKPfA1MJyzFbRRNT8LiSlbi6ZA==
X-Received: by 2002:a05:6a00:1bc9:b0:5a8:aae7:3032 with SMTP id
 o9-20020a056a001bc900b005a8aae73032mr469828pfw.14.1676494452847; 
 Wed, 15 Feb 2023 12:54:12 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j24-20020aa78018000000b00593baab06dcsm12102599pfi.198.2023.02.15.12.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:54:12 -0800 (PST)
Message-ID: <baeaefda-e63a-0dbe-90cd-c51139d1c0f4@linaro.org>
Date: Wed, 15 Feb 2023 10:54:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215192530.299263-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 09:25, Alex Bennée wrote:
> It is buggy and keeps failing.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/avocado/replay_kernel.py | 1 +
>   1 file changed, 1 insertion(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

