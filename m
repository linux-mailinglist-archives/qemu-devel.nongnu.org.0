Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C306D5F6FE9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:06:09 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogY4F-0004Jb-MI
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogY2Z-0002mb-KN
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:04:23 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogY2X-000252-Ok
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:04:23 -0400
Received: by mail-pf1-x434.google.com with SMTP id 67so3133050pfz.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CCQkr2bozRjpYVakrhtIeDGZm4gU2TlgBKfu6vPx5Vs=;
 b=vfWm0SznuKcOhJG8OBaVytyIBGohJAVghRtd4eKyJ6vA9xbWZJtyc+6M+d498Jxl4T
 6VmwLbetechn4f32hmmw6naPURxIqVgYHLSwhCGuYDzwzn+mYc1vqX20u0VSuTz2N4y7
 3f8pr6D36Ax4vxnSQKLAO3FF8aTM84AFWxgeqzE3i6CBdNdea3/ojO9HUUn2vVukIU9e
 m9/hI26dOWeeMmS7xS44LcO3dGTtsvEEkLAyFAYLXaXfub7PyOw4KzVTONlFfswhkNx6
 zTPN5EL77kYR+VR0EW2fN9d/e7B5BB48SGvMOuDwj67Cod0P4fKSNykXA70HrmvQBOP7
 t+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CCQkr2bozRjpYVakrhtIeDGZm4gU2TlgBKfu6vPx5Vs=;
 b=C3jzaYN6xCMpJEn1+oLW76ajSmBwfJajDwU5K1eKM2+0JBdLA4MdYkQA72LxcSF1/s
 5fqlKY/StLl/lZ8EyOzd5ZSmUVEjNRZ/kHxea15n8WoN0uyAQKtX35OHrTvHEexOTQFZ
 vChkorHubU5WZW2B8F7Woh1KcexWyihxVSX4+rEjT5vDUgXZqNS/HbIh2wYzpZcDngWS
 AdW5QfB0AaKBC63XGUye5mFYwCXAM9x+T4xoaW7XRvkqFzL6saKB3N55NWth6xEalH2h
 91bODJofIXsEG/+EHCPrWTjCDnSd++NWY1iywvcdbM5cr5kxyOb/RXnn3gep8wHpMh/t
 hwPQ==
X-Gm-Message-State: ACrzQf0L2MG//feXgX/Gs4VVM6pv6p9dhpsGFSgv8nUxyloMKl4r3b3q
 4n6PwZvHKoLPqEdoRrNhrp3tOQ==
X-Google-Smtp-Source: AMsMyM4jB+XjcUIk9gDH0r4PkVR7EMxVyy1JLvtJI23+R88n5BSI+UaEJM2+HOcm7GT27lk/1ZJcWA==
X-Received: by 2002:a63:2d81:0:b0:446:8d24:c90f with SMTP id
 t123-20020a632d81000000b004468d24c90fmr1519727pgt.160.1665090260093; 
 Thu, 06 Oct 2022 14:04:20 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 c27-20020aa7953b000000b0053e20a0333fsm57468pfp.93.2022.10.06.14.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 14:04:19 -0700 (PDT)
Message-ID: <a810c149-7b4c-c289-e32a-c7b205705b0b@linaro.org>
Date: Thu, 6 Oct 2022 14:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] win32: set threads name
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
 <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
 <CAJ+F1CK4jqCw-QOEdCT0yVRb7eMY9O1+C7fZfY_JHG9CsdM_kw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CK4jqCw-QOEdCT0yVRb7eMY9O1+C7fZfY_JHG9CsdM_kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/22 05:51, Marc-André Lureau wrote:
> Hi Richard
> 
> On Mon, Oct 3, 2022 at 11:39 AM Marc-André Lureau <marcandre.lureau@redhat.com 
> <mailto:marcandre.lureau@redhat.com>> wrote:
> 
>     Hi
> 
>     On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
>     <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
>      >
>      > On 9/30/22 07:03, marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>
>     wrote:
>      > > +static bool
>      > > +set_thread_description(HANDLE h, const char *name)
>      > > +{
>      > > +  HRESULT hr;
>      > > +  g_autofree wchar_t *namew = NULL;
>      > > +
>      > > +  if (!load_set_thread_description()) {
>      > > +      return false;
>      > > +  }
>      >
>      > I don't understand why you're retaining this.
>      > What is your logic?
>      >
> 
>     Also, if we change the "static bool name_threads" to be true by
>     default, then set_thread_description() might be called without calling
>     qemu_thread_naming()
> 
>     It really shouldn't hurt to keep it that way.
> 
> 
> 
> Let me know if the current form is ok for you, thanks

I guess it's ok, sure.


r~

