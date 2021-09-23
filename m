Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F97417183
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:09:46 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk1R-0002kj-Ju
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs5-0006kr-9R
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:05 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs3-0002kF-Fq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:04 -0400
Received: by mail-qt1-x82c.google.com with SMTP id r1so9098043qta.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rSqhOOIhr81kEtGpbNlNQ1lORrK/rQ/yWC+Oh4ubEpc=;
 b=JLjNVt3v7bPN4FcDcUb+A2vJafQEUb3dWYjyI7p55jhZCbpR4bgyUaCZVdmO8Jd+im
 LV/520tr69yIF4sc9ZhIniqK8te5s7jN0n5MtYBg4PMUZzhLTVEiY7RH0JhRsZeoQhfJ
 haU2MNP+/222IFBjWrxCRsuLcK/1B5vyT2T/fAlDpWv52223gp7hRfKn4Poo/TSICbhM
 +wxig9MMf2zddRoRtcYB++vfk4RjdLMS0zx5sI7EW5LQlId3xq+15I4xdPzJ8QnFMv7g
 7pOdexgdzt+nEFEj3d8iSxsmLz4TEfNi6h9gOokGUN6UqiCdwoyREBs9BZ5h9EIU5zpd
 pSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rSqhOOIhr81kEtGpbNlNQ1lORrK/rQ/yWC+Oh4ubEpc=;
 b=q1cJ8Qszu1kiIhb1khxNhRECHG9u5V1fBtgIInUihE3DlV6dncbe7bHRswLqrDMVO7
 vgP53thzgZ86UBXlFEiLge9GmyXRzerfepTgwY4WS3nMmsM51XAoQJpScF9txFFoBILh
 hZ2gqhWylkEYfDUSypIY15XNsRRTZeUhc1YyvdWFIKNJUh/prAfRz9RsHbwVCDcMhNvI
 Q5pjv9GlVxla29gpIs11KuiZE7phQX66EK+alRPY27BRSTUlWq0q5wcUolTfO4WRFzgQ
 8zpXVOYLVqXmhmEZ8kFZTelNntA1weYFm3a5Eq9OwQVEKE2aScQQ7dkKygQMgwlHBEep
 9J0Q==
X-Gm-Message-State: AOAM532JGaxhmiQaJtpOY7wZrjePIydaArwkriSCYUX81Hr5W7bGVIFD
 osubuIQ0Sw82UojiNIsYIy78Mw==
X-Google-Smtp-Source: ABdhPJyRH+zz+tvaZYbyK5YGblwKjMErhNgKpX2H04Y7lnQ8ze2pRglprvpOyLcgIb097xAWca12Sw==
X-Received: by 2002:ac8:59c4:: with SMTP id f4mr3642540qtf.334.1632484802276; 
 Fri, 24 Sep 2021 05:00:02 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id g12sm6036440qkm.112.2021.09.24.05.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:01 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] bsd-user/mmap.c: Implement MAP_EXCL, required by
 jemalloc in head
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d7f5ce6-22c4-e9de-39c6-fb92d7096385@linaro.org>
Date: Thu, 23 Sep 2021 10:52:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> +        /* Reject the mapping if any page within the range is mapped */
> +        if (flags & MAP_EXCL) {
> +            for (addr = start; addr < end; addr++) {
> +                if (page_get_flags(addr) != 0)
> +                    goto fail;
> +            }
> +        }

How about

     if ((flags & MAP_EXCL) &&
         page_check_range(start, len, 0) < 0) {
        goto fail;
     }

Hmm.  This (and your page_get_flags check) could assert due to out-of-range guest address. 
  You're currently attempting that,

         /*
          * Test if requested memory area fits target address space
          * It can fail only on 64-bit host with 32-bit target.
          * On any other target/host host mmap() handles this error correctly.
          */
#if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
         if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
             errno = EINVAL;
             goto fail;
         }
#endif

but the test isn't correct.  Note that reserved_va may be applied to 64-bit guests, and 
certainly may be smaller than (abi_ulong)-1.

You want guest_range_valid_untagged here.


r~

