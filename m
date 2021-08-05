Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A43E1E87
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:19:57 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBliW-0003wu-3K
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlhS-0003Bk-QR
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:18:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlhQ-0006by-5X
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:18:50 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so3840417pjy.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/H173aqdFOCQj+m5IIfEIRP6jGTgWAQjQImfUYcgWs=;
 b=bJQB6ky6NJdJFr9B0aUfRW7CEJkseJIyE/veX/n0VjsYhUhebHRfVcOX7NhcORnZ2N
 vMuNAHmJTBBEyRRAbH0CTFejKXbUBSwZBz/xWMIoJvW8AbSsaU2Dh1B9iqimUfeKjbvQ
 7tXZcrupYzQwoYd2D4r88O44+F5oX1fqhIcHBOaXSpfKi5e6tC4bEjmiqsGNV1RnvCvC
 CxBOVjhtT1pPiqYF5LIFR1eYpVPAvEfrwijswdrUh+TaqM9AeeM3jKGrofpAC2ACdc5K
 bPdqQo7NENhN+jwcQgL/qzfjwoy2ALqjGdxbd0BN2Wx2JYieeSNUe+Ud1jzjhkKuhJQr
 VFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/H173aqdFOCQj+m5IIfEIRP6jGTgWAQjQImfUYcgWs=;
 b=AOfVvy3TqFGP9fUFmXi5A72pNoFVEFxWA5LgjW8PT+JBYlg07J2Q79b9g6ZQVvZxct
 IQJKWeY5Hk6p2qAeW7P9HlJgHyFAuZp7nFerTdD4iTH4AQdrIfn8LKe3Xi68yRjZjOqe
 oB5m5nsqygAFR0U2AvJYK34HwI72bkDwPeDqoXF3Y9KElM5CH8GuEivoyO2PJihBi53r
 Uc37MUHFWAan9xrD/sjVMZlDs3DrFICVczzb4fNZMIF9ogDmewMbGgBtps4aWJp6TNQP
 8XXfa4/ugcMxw2TTULLhB3Z0JfHx7QCAErFr6C0ZqebpEj5HqxzvbSWNiTV1XgJjhaS9
 icBg==
X-Gm-Message-State: AOAM532aehHEx8BrMftJ7lA8GSK8yg61Pm9yVXwVYoeGkJUtFYdTLjIt
 /zZEcBOJy+j3xY4NEx25aJk2Jg==
X-Google-Smtp-Source: ABdhPJwlgcaKz05P+CmB197BU7ytbWiSIbtZLo1doeKKvEc/UXWJ35Wa7CETn1wH7O+bM+8eQdsmww==
X-Received: by 2002:a17:90b:215:: with SMTP id
 fy21mr6725578pjb.203.1628201926701; 
 Thu, 05 Aug 2021 15:18:46 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 129sm2917666pfg.50.2021.08.05.15.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 15:18:46 -0700 (PDT)
Subject: Re: [RFC PATCH 06/13] target/riscv: Fix div instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd9d55df-523e-2085-c324-e68c54cee403@linaro.org>
Date: Thu, 5 Aug 2021 12:18:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> Don't overwrite global source register after
> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00058.html.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/translate.c | 46 +++++++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 20 deletions(-)

FWIW, I have a cleanup to these routines that does more than add temps.  I've been slow to 
re-post the series; sorry about that.


r~

