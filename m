Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F425EFC65
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:54:50 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxkH-0007Cm-P0
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odxdO-0005ms-41
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:47:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odxdM-0008FE-54
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:47:41 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s26so2076632pgv.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mRAHsaDD3MV7YP5hLmXJ2ZRAZffvhImDOCREno7EOIg=;
 b=QnFfr68N741yRP1ajZZOIkHiYZmKzqR4dzZNGJQSCCOZT74j0yc3Vve+rbcVy7nnhZ
 xxyMjMJehVCopnicazhLQ8RvQZGc4+X5a2KIpEwPqdF8+9pRHUeO+MspIgINAUL5b18N
 OMYVq/3hpiUD7AiaIIgbCt9/uWDthSJhjO1i35uV3XquLXmxyKxppwi2yVdk3xYiHspB
 B1DhB5i10EZEtePBxzl+yZjp9tjs7j95lEfOlisM5Ue7uMQ0lh7yhPsLy7kv6cp+dPX6
 JyGufA57wWIEg8crZ2NaS9OxnkGnPAMfLTQD1HttObKlIU/Tmtj9sf12FL5l4VXYSAdi
 ZFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mRAHsaDD3MV7YP5hLmXJ2ZRAZffvhImDOCREno7EOIg=;
 b=JYTVJwM6iFhvTwDIMTZyrSPSXJfPxSSIOPn5iOB0d4kYITAfbviYXTL1Oz+aQwrqql
 CDzKCcer74QDx4Ubjmmc4W1r5oaQqn4VA1VXv23VPPXanPJ1efRJcXZb5CALf0RHeOV2
 NlZ3QLnQcYnIrQfLCq1kW0crABz9nz0p4LtZg5S/5PIAtTSw3bsCFKhCfntwLZkPIhtr
 tQvPzWH4Dt3L24u5mTcfYXDpoV4ULsn4PXcSCelfuhjuPL4CVUHX8hwpZIDHtBFkMpkg
 1WEojRNe62UN/eqI2RKMt4qLa5lV9ZinPM3CqFbOrS46HgJoD7/dhxh1WuRZj2HKef1W
 AQzg==
X-Gm-Message-State: ACrzQf1iZarKzWRhiAU0zoRpANHC1yTy81B0k+kNUu3XLkMlZzIvpByw
 dE6KZRogXv93TaIDByin9lfxXw==
X-Google-Smtp-Source: AMsMyM4EU56zHCw+hQDcXo+nS3vyNT2bUEdaeKjBsFwPKYw2M8CZ1ITIO4XXW30Fl39MP1UoPPZjxw==
X-Received: by 2002:a65:6955:0:b0:439:a99b:bca5 with SMTP id
 w21-20020a656955000000b00439a99bbca5mr3885627pgq.80.1664473658594; 
 Thu, 29 Sep 2022 10:47:38 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7?
 ([2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7])
 by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0053ae018a91esm6608499pfb.173.2022.09.29.10.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 10:47:38 -0700 (PDT)
Message-ID: <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
Date: Thu, 29 Sep 2022 10:47:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] win32: set threads name
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: bin.meng@windriver.com, Stefan Weil <sw@weilnetz.de>
References: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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

On 9/29/22 06:41, marcandre.lureau@redhat.com wrote:
>   void qemu_thread_naming(bool enable)
>   {
>       /* But note we don't actually name them on Windows yet */
>       name_threads = enable;
>   
> -    fprintf(stderr, "qemu: thread naming not supported on this host\n");
> +    if (enable && !load_set_thread_description()) {
> +        fprintf(stderr, "qemu: thread naming not supported on this host\n");
> +    }
>   }

Comment is out of date, and I think it would be better to *not* set name_threads if not 
supported, rather than...


> +static bool
> +set_thread_description(HANDLE h, const char *name)
> +{
> +  HRESULT hr;
> +  g_autofree wchar_t *namew = NULL;
> +
> +  if (!load_set_thread_description() || !name) {
> +      return false;
> +  }

... have to re-query load_set_thread_description later.

Also, unused return value; might as well be void.


r~

