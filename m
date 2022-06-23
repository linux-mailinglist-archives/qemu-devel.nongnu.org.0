Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DF558AC8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:33:27 +0200 (CEST)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4US6-0001av-Vy
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UOt-0007ri-Nt
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:30:07 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UOn-0005lj-Nb
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:30:07 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 128so756543pfv.12
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J9l5Pqk/SpE6qJHjy7mA7oXoH1DF/ggN0MIEkkG0yyM=;
 b=G7FDKjWXQiNAjdIthSrN2jH55a0lq5oCQDsxNyB4NFqbZ3FNAKMfjt8MpsTgGTeGPq
 2iSVhwPKSxjZCCCUl1R1Fw9Ps4l4/BasRJRpQ2bCkWDV6fmdOVLnDrALUBVJbk9yTl2S
 UFleheQA5WGkYOI6+okiFRjr7bfwCogGoRnFu6EIcbCeZvanKQl4tv8jf70sNbaLIrif
 T/Uc7N1Ydhi0Zkrz19NKfutK7tsgTH9YPYzzRfyWeNXpFU2TaHcDLLPLxtA4hPEO/Gud
 WuoeL9gTFkqukzxcxD2oOFApI6yqFBDcJfC0/jdR9vp1QpBe0lWv23BdY6Y3pQ4Q2PH6
 n0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J9l5Pqk/SpE6qJHjy7mA7oXoH1DF/ggN0MIEkkG0yyM=;
 b=KhPH4EMxTCiuQVKb1FAi63mGQa7nk0qwOO+C4X1Y+ZwwoZIsb3zxD5BI3pxhUx1Cm6
 OUnOdX8+RfWoWkhMl8IlQTfGDkiJdJy+Yf3SgQg/NRzWvqbcjdUl9QQVTEqj933j3sgO
 07r97ZbpHWESrC524Z2iiRbwNL/ry+x4uIn5lN/czt9ie88/3A7dvFj804ihcxrLP5DA
 Pi4K6FWa7eTqr0n6NUSTVNjLzjNnfQ7WLIv7e+K2ml20mVxSpGLW9ZWh6wa8942Uj6/r
 gb/ywBE92pZAx6DettGDfEtUqUYt5p1KL7knXG+ND6sp20fRnEXKe/qTSmFTHZj+tQfs
 wUwg==
X-Gm-Message-State: AJIora9GP/N1WuuSmd8MUPFS38QKw8YMREVpulqrUxq6wTU71ImRdhDJ
 90oHd3+YPQQ7eYEBfgDjv30hkQ==
X-Google-Smtp-Source: AGRyM1vD1ym5ZP8GoMUir3YD96azEX/HOBpoKan92G3qiar5bth9ar1HBopHQzeHnfJPtFb3EfZooQ==
X-Received: by 2002:a05:6a00:d9b:b0:525:7208:3d9 with SMTP id
 bf27-20020a056a000d9b00b00525720803d9mr663683pfb.82.1656019799506; 
 Thu, 23 Jun 2022 14:29:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a62e81a000000b0050dc762816dsm110635pfi.71.2022.06.23.14.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 14:29:58 -0700 (PDT)
Message-ID: <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
Date: Thu, 23 Jun 2022 14:29:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow
 wrappers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220623164051.506316-1-thuth@redhat.com>
 <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/22 12:30, Peter Maydell wrote:
>> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
>> -{
>> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
>> -    return __builtin_add_overflow(x, y, ret);
>> -#else
>> -    *ret = x + y;
>> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
>> -#endif
>> -}
> 
> I think I'd prefer to keep the wrapper functions and just delete
> the fallback ifdeffery, but I guess I don't feel really strongly
> about it. Richard, do you have an opinion?

Likewise I don't feel strongly, but lean toward keeping the names.  I will point out that 
without these names, one has to track down the type of each argument to figure out what 
is, or is not, overflowing.


r~

