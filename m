Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3EE3DAADC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:23:31 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Ags-00027M-SS
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Ag5-0001Pg-17
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:22:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Ag3-0000sZ-CR
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:22:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so17024881pjb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qKKyL3b5yRkd5fRIzUtVY8856WiwZeCdCUxOGQcsB4w=;
 b=hdPpa+eSX0ds7GnKzISqiS3fmUKPdj7FP7J1Th5g9QJydRgXMr88rbsvz0v7t1lr0P
 db8pWlk3g+pX2x/07MQpLQ2O9splELEqNJ8wAaNUC5sCUux80jXbRpbisSnjuU45ABN4
 DEyI7jFzHbs7Hpq7Bi7nVOWLIjT9TOVSE7pTmV2jSvZ7iiDsj9cSULP94KfahoQiYAC4
 i6KCrbTjadtI3z4ykg9kEmjfSD0HFmeHFyedt9qpeib/YiEBpoPQcH+2eRPs3y24xm/M
 6GdkMpv+eTiRufWd9hYPn1ol7TsdVg/7OehasQ5+juorTPYYwGeK0xzKrRRLH0iUZO+w
 ZT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qKKyL3b5yRkd5fRIzUtVY8856WiwZeCdCUxOGQcsB4w=;
 b=smXKNRd15ZXgbBiJlR5YCUWpZuspzlp4SfVr8W4yhldVBlYQcjYDGKaxaoO+V02QnB
 sgWaMHZvPr8Wq9zOQ916fQziAGHlaPKL3rjXxxYJeN4v0Tqi9rqDUN5vohb6Ithz2cdc
 xlHWJz0TRT9Y2sIXtRhlwAu1gUV+okPhH0BdTW0lCeQUsdRnQ6nRnVWBgb352qpWmFXm
 9q18NQRE1MbrUVHcGLDvTNNXDPgAtmzn3rSPMje4u/NhSdgzcICgTSTAEmxs5IK9gTqf
 ALvlwUpvjGcyMHw4IdQftb/Dw4/Ibt50bBWKsjIqwUHShU3z6d7x8DsKyZccHQoPiQ77
 v9/w==
X-Gm-Message-State: AOAM533CevCO17H5IuzJ9fKF5sxLIYzAWzcMcv/O1VHF6Rva2Axwb5eB
 juZMWVV29XD2h3rrjZIY627XdQ==
X-Google-Smtp-Source: ABdhPJwme8FURNxz4SeX8AcOzFj/YP/MUZk9HK7lhikn8QHtD/owQJv+5NY2057oJTPauMTtzDQOXQ==
X-Received: by 2002:a17:902:e751:b029:12b:b418:3661 with SMTP id
 p17-20020a170902e751b029012bb4183661mr5850766plf.28.1627582958041; 
 Thu, 29 Jul 2021 11:22:38 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id w15sm3938378pjc.45.2021.07.29.11.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:22:36 -0700 (PDT)
Subject: Re: [PATCH for-6.2 16/43] target/xtensa: Implement
 do_unaligned_access for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-17-richard.henderson@linaro.org>
 <CAFEAcA_b2+KA4w0ny3cdtnuySBUQLFoZ_Yix9oEhOw4zABZJAQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc7c3d49-e5c8-adf4-a7e4-3756d9fa4067@linaro.org>
Date: Thu, 29 Jul 2021 08:22:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_b2+KA4w0ny3cdtnuySBUQLFoZ_Yix9oEhOw4zABZJAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 4:55 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 02:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/xtensa/cpu.c    |  2 +-
>>   target/xtensa/helper.c | 30 +++++++++++++++---------------
>>   2 files changed, 16 insertions(+), 16 deletions(-)
> 
> The xtensa kernel has a CONFIG_XTENSA_UNALIGNED_USER option to
> make the kernel silently fix up unaligned userspace accesses,
> and most of the defconfigs for xtensa set it to 'y'.

I believe the load/store-exclusive instructions should still fault.


r~

