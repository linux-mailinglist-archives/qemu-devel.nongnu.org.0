Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5773D64E4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:55:39 +0200 (CEST)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83tC-00054S-2C
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83sQ-0004NG-TL
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:54:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83sP-0002OB-32
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:54:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f13so1878251plj.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=N2q8PR0dbD1yp6S8Wut4JIDmSIqSVrYxOCkKqBnlRHs=;
 b=SpnsLkbwr0QMWZfes3XduKvX1oojXRtWVAniYeuAI8ih0xEUqjRsYQTSUIjSrZ3QkQ
 7ZwZucYPlkx/VffRuHdXoXiR3/yd6coeN76fzej+DYQmScnNfcE4/3ZCLfmop+CjTatu
 Tu+GdOa8g4NCF9gU8DZ1DkMen670PXDNSKneTyGiTVLXLe6zmhjW0BXL7NEQ+Cz/HGVr
 8oPrrs/WK45p1eagdpo9QuXlU13jWT7hBMiysgp4uUqt8uxB9XslexCeq3STh8ciYWfk
 kplADCROCZTasEyEJLS+ZLIS9ryB11PseIgNPYAAtNuJ4HwxggYRp7IjXIxTKSRaAX9h
 HN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2q8PR0dbD1yp6S8Wut4JIDmSIqSVrYxOCkKqBnlRHs=;
 b=pRdeHKmKLPnHvU3/IKApIW4Q++LGYC67iqbiODCrvcdWy0SNxrU656mOmzghK4VQ5Y
 nfzR71hOeFOQQOkiI6W2CcuWXth4qTDY7zpY2pee21b8aWm+EN+0HY0HDys74vOYnAnq
 vkyq+9lioM/bBjizAkDUJEYRpXZYtxMXSE45Jr57e5R9w8cBWDYF9saU5hB+qupm4dcz
 2uDkUV3ftvoa4F45TIXFW0rieQSMLkuRAk3AZMrC+GZ+xyN8uop1kW2aDPhEZYEyH4QW
 SsA4CcIJK2yhfuvYN3eOnaejANi0RpvZBOlouKGk+BTs+e1iicHaaRASbXc4B3V6Q+cc
 VtNw==
X-Gm-Message-State: AOAM532s1LIlM5MUkS+dXgmbpevVsmQKCLrRFfTWfSdu8SfYkoSUARaX
 asz5hTVDmoVBDfHlqGKuFiBDNOCCZtppeA==
X-Google-Smtp-Source: ABdhPJxc/Vvq3D/mpOOTnn3J6vsTFQmfh/VxQD0RhLr7UMUD139wwaZq1XuIUiIQil0dxIF/loQcrw==
X-Received: by 2002:a63:4f21:: with SMTP id d33mr18864101pgb.144.1627318487287; 
 Mon, 26 Jul 2021 09:54:47 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id bj15sm176300pjb.6.2021.07.26.09.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:54:46 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/2] accel/tcg: Fix hang when running in icount
 mode
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210725174405.24568-1-peter.maydell@linaro.org>
 <980b72d1-288a-ee4c-e44c-66a434c219a9@linaro.org>
Message-ID: <dd655367-bd0f-3e00-7c5f-ccff2353c299@linaro.org>
Date: Mon, 26 Jul 2021 06:54:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <980b72d1-288a-ee4c-e44c-66a434c219a9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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

On 7/25/21 8:11 AM, Richard Henderson wrote:
> On 7/25/21 7:44 AM, Peter Maydell wrote:
>> This patchset fixes the intermittent hang seen when running a guest in
>> icount mode, as reported in
>>    https://gitlab.com/qemu-project/qemu/-/issues/499 .
>>
>> The underlying cause of the hang is that code in cpu_loop_exec_tb()
>> was using CF_COUNT_MASK as the maximum possible number of instructions
>> it would try to execute from a TB when it set the icount_decr.u16.low
>> field. This is wrong, because (a) that field can validly be set to any
>> unsigned 16-bit integer and (b) now that CF_COUNT_MASK has been
>> reduced to 511 in commit 78ff82bb1b67c0d7, it might be less than the
>> number of insns in the TB.
>>
>> Patch one fixes cpu_loop_exec_tb() to use the actual maximum valid
>> value for icount_decr.u16.low, which is 0xffff.  Patch two adjusts the
>> "should we ask for a TB with exactly this many insns in it?" condition
>> so that instead of testing "cpu->icount_extra == 0", which should be
>> always true if (insns_left > 0 && insns_left < tb->icount), we assert
>> it instead.  This assertion would have caught the bug fixed in patch
>> one.
>>
>> Tested using the same iterating loop test described in the bug report;
>> without the fix QEMU hangs within a handful of iterations. With the
>> fix it managed 175 successful iterations before I got bored and hit ^C.
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (2):
>>    accel/tcg: Don't use CF_COUNT_MASK as the max value of
>>      icount_decr.u16.low
>>    accel/tcg: Remove unnecessary check on icount_extra in
>>      cpu_loop_exec_tb()
> 
> Nice one.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued for 6.1.

r~


