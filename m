Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2369FB26
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUu5m-0005Bc-33; Wed, 22 Feb 2023 13:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUu5j-00055r-9E
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:43:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUu5g-0007mz-KZ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:43:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so10029602plf.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQJWtbYOI9grQLhgUeD3DxukusUMNwfujnH0TQwA/M4=;
 b=U5wjdpISSonGsu6d4yPC6/ASnmfB2rT2igjCk41IgnUVaKah6LYgfhtOQranD7oz2F
 JBMTx/7H5YyWeDCEclRQP8beYmnWbjR3IgQLqYsmoYnf2CRWT4PTzsXokplBg4mp9yGa
 KjN5xOQgI9C1hM6p9yLhJqIuzWGR1j1dIq/+zt5jscnd2el2AY7GzvNzUZ3nW7n0Rcz8
 WoFrPNNzS0RWnlsiV4ckuwOb53tkE6BviMFu4XWgPRx4AwgX0uiWcitUFC75rgw/2U6t
 El8hB+33n28gXhHPwf7d/IUhZi+pn/LW0ATf7NkJUkjdiT0hMrLKUl545WGEt+H7Vfd/
 FK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQJWtbYOI9grQLhgUeD3DxukusUMNwfujnH0TQwA/M4=;
 b=lHI7EGkj8gCiFc71Vpq/UPlQCQjTJdBz8Hzl9+ZMch4IxGwXjiDubs2dZ+aLZnLyw/
 lSZhnk/ea18ZgrrNj7dqS5iQDvN09qZBXylOGN8u9o/thCaN8LUlciKtlDYxcmCJQgHy
 bjgoxyKfpTyITqGXlAG6FXa2plxFzA/TiJoEeMmIwwgSLEr6BeDfEqbChGxIHXPtjn6p
 1An8hVEtyfhK1pbf7oTGILGil+rQp+WU5g4k+L/7RnAejCp+nv0FKwfE9MLB2uI0AKuT
 vOmW2LoudXXTgwj3kGD6iVLhsxnYIE+ZOLyigxDQG6yqLe78djj4rVLdl+qHKvJ9H737
 E47Q==
X-Gm-Message-State: AO0yUKU4xsqoEBTzYEJATujf38nVn5w3QdQb2iMqoFeqtreNoVIdGpe3
 CYFo31bL3XY06AVUXXA03TPyHg==
X-Google-Smtp-Source: AK7set9yMi5fqJcLRDs8lHu+zOoJEkjdWxjCC1Trk0nzCFNA5gYCJa/7vXjiM6MxWKTrC5pd+iWJ9w==
X-Received: by 2002:a17:902:c408:b0:19a:90ed:af6f with SMTP id
 k8-20020a170902c40800b0019a90edaf6fmr12529469plk.60.1677091422898; 
 Wed, 22 Feb 2023 10:43:42 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b00186b69157ecsm1297922pll.202.2023.02.22.10.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:43:42 -0800 (PST)
Message-ID: <275ea039-aec1-8c81-6267-4a77208840f0@linaro.org>
Date: Wed, 22 Feb 2023 08:43:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
 <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
 <20230222112755-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222112755-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/22/23 06:28, Michael S. Tsirkin wrote:
> On Wed, Feb 22, 2023 at 05:11:36PM +0100, Philippe Mathieu-Daudé wrote:
>> On 22/2/23 13:05, Michael S. Tsirkin wrote:
>>> On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
>>>> Since commit 262a69f428 ("osdep.h: Prohibit disabling
>>>> assert() in supported builds") 'NDEBUG' can not be defined.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> this exactly says NDEBUG is not allowed. why are you removing this?
>>
>> The project can not be built with NDEBUG. There is no point in
>> mentioning it in each individual function.
> 
> the reason we mention it is because there are security implications
> if we don't.

Yes.  However that's not what the text being removed suggests:

>>>> -     * This is just one thing (there are probably more) that must be
>>>> -     * fixed before we can allow NDEBUG compilation.

This suggests that we *will* allow NDEBUG, once a few things are fixed.

I strongly approve of this text being removed.


r~


