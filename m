Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD34693351
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 20:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQvaM-0007rD-HT; Sat, 11 Feb 2023 14:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvaE-0007q9-Kz
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:30:50 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQvaD-0005P7-51
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 14:30:50 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i18so1454780pli.3
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+T2SfH7jBtZNl0aOk8vOTGefOA0tvNUgoeuk1TXRWdI=;
 b=MVAnbr32yY0YSdAJNf9jm+QC+71rjYoUHu9DmRM5I0+IWegyTgigILPWBpxempeqpW
 zhzW+VL7ScL93dZk4fClBWZXZxtWrGp849OlyZEYMdnEdRhcW1IkFESic5yPiwrlu8J/
 /lgJx9WhTtiRIq+JRSpXBF9o6TtzWfs6ksMO/O0k6++dMUi5EesiFwXae6BFBcOBaeDj
 UdeE/u/zyerCJ0Dqof3g8KwxMiXJEak07UILLQl565Njf+w5gr2XVMlZSWLHwF9pawTf
 HEpNMtWzqovr3eKNtQjl/e6+UMaHPRyWnuTGlk1YFvK3hUzQZXp7443DkKQ7O4UFtp8c
 Gw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+T2SfH7jBtZNl0aOk8vOTGefOA0tvNUgoeuk1TXRWdI=;
 b=416DUcFyMHz5yUWt3zZ0Vljf/Cp9hIPR+0kBJezHt9DUHPQ7VJ+iffcXbowNBLZRmj
 1Bcs4fIZEJnNe+PLda+s4crrMA3AHiDHWkpmqcO6YikJHixnvDzlJT33DQqnVid3wCoD
 odkANaC8le2W+VqT+hBSW4YvYdzr8/JqB+hpg8HqvPOGcXlurMYW9E1JwRIDbQ5aYeW1
 Z1pY7BN+ievDDxMqwlV9WQ4mYcSBjvRB56cF0EksDKCogxQI57UYF+bmg8tDgkU8lpKF
 uxPq/tpDjVsF5qwxiYCpzD2p1uKJN+pAfCxRhJ8YFDB79LPbH7PihUJ/uw9/It4Mrb02
 GRwA==
X-Gm-Message-State: AO0yUKVBcFP0KmBssSE31t8QD6xymMeQ7/ZWdOPebiTfe+ua3CHoGAIm
 1U0VNmjns4fZdu++s3nmB67nUg==
X-Google-Smtp-Source: AK7set+g61anhflpSA5N9DYamCC2i0bcnd0aXg84Z6ChI60ib2VjifBZWNfFNHl6/SJuZIA9JNMUJQ==
X-Received: by 2002:a05:6a20:160e:b0:be:afe7:ce5 with SMTP id
 l14-20020a056a20160e00b000beafe70ce5mr23938431pzj.51.1676143847791; 
 Sat, 11 Feb 2023 11:30:47 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s4-20020aa78284000000b0057709fce782sm5236596pfm.54.2023.02.11.11.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 11:30:47 -0800 (PST)
Message-ID: <4ffbeeb3-5126-3e29-34c0-a2b6f0740f88@linaro.org>
Date: Sat, 11 Feb 2023 09:30:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/9] 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> There's
> several static functions that aren't used until the end of the patch
> series... Not sure the best way to suppress the build warnings there (but since
> they are just warnings...).

Are they just warnings?  --enable-werror is default...

Anyway, I've used

static type G_GNUC_UNUSED function(args...)

in the past to ensure bisection, removing the UNUSED marker when they become used.


r~

