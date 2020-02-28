Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A51172F5E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 04:34:37 +0100 (CET)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7WQ7-00041t-HJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 22:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7WPL-0003bB-4j
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 22:33:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7WPJ-0006vq-UO
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 22:33:46 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39349)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7WPJ-0006vf-Na
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 22:33:45 -0500
Received: by mail-pl1-x643.google.com with SMTP id g6so670871plp.6
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 19:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f1HUTfjWI/l8GIJRRF8yHhG7QeUn+lrCOnpteX95pLM=;
 b=RBSq1GfRIRYFjHSaxXmwbNoRSaYnW936lY57A8kboKcwYNRtNQmQlh878l2gxT/GGp
 LCXxZ4VlY8yWyyVyqq564hAs2b3pHd133KjJ7rNAskFe3W3d+O7f5RbbHCHf55pSJRP8
 AGAQ/2ZWoISimiQ3KN9WIutydHQSEaJTyjq4ZUzD+f+GRtIGY7RH5re0RGbFWwvxgXbb
 27g4S845JR5Wo0rJUZ+CClDNrkc/+bSW+uTv0SIzb4QLzHmNh1Nv13O0FeHSRnjm5tzW
 TZpEWn1gxGLxlPwUwieRxF7m/Xlq3W72oGMmQ6VcvTp0/RdbEyL10gWDQXSReUwlOgDD
 r/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f1HUTfjWI/l8GIJRRF8yHhG7QeUn+lrCOnpteX95pLM=;
 b=pdrMGxLU6gBqo8hVuqzHko6FBwMX25PUjHB4CVFpx46tfOxuqHHryunF+UhvleOikv
 sx5k4sCa7sw3rUVCKjGxIOFKYRfD7Fg4Jatk5KbyFMY+wyuWZsqKmm4+4krhIiQqTr9x
 aXTIyw2UMBHCSowQ1s0ZP0uyFqS+EMeQxuwIha1uBW6OrvqT8uQjOpLjezjKFts7REzy
 D0xtnJJzmiJT/cZWf/BBgfRUDHwt/3xDQlqOuox94hQClfxSMN16YoODHuyJcsi7aI4c
 GA6LpchGlp/PMProKNH26Xbden56saVMKmdEG4D2borA6ysuNibqfw11umfddc9ki4pe
 UOoA==
X-Gm-Message-State: APjAAAWa3eMyhtk3cy35ytevgz5xhScN34wsPc1A7bfeRmGhgoF8tSSN
 acgc9UZ6pCfnTXYox5w5K5U3uQ==
X-Google-Smtp-Source: APXvYqyNg8c+b1nge2zl3AKwa/fmuWS0TQBCd9OHpVeiNDE2hCZTjRsXzNRQJTYSiQSeQrCufG7O6Q==
X-Received: by 2002:a17:90a:2107:: with SMTP id a7mr944778pje.37.1582860824073; 
 Thu, 27 Feb 2020 19:33:44 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c68sm9188740pfc.156.2020.02.27.19.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 19:33:43 -0800 (PST)
Subject: Re: [PATCH v4 1/5] target/riscv: add vector unit stride load and
 store instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-2-zhiwei_liu@c-sky.com>
 <4cfb56d6-34a5-0e35-87a0-2aefaafa4221@linaro.org>
 <287bde05-421c-f49c-2404-fdee183c9e12@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10e50ea8-7614-f094-a827-38ed09462f29@linaro.org>
Date: Thu, 27 Feb 2020 19:33:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <287bde05-421c-f49c-2404-fdee183c9e12@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, linux-csky@vger.kernel.org,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/20 5:50 PM, LIU Zhiwei wrote:
>> This is not what I had in mind, and looks wrong as well.
>>
>>     int idx = (index * mlen) / 64;
>>     int pos = (index * mlen) % 64;
>>     return (((uint64_t *)v0)[idx] >> pos) & 1;
>>
>> You also might consider passing log2(mlen), so the multiplication could be
>> strength-reduced to a shift.
> I don't think so. For example, when mlen is 8 bits and index is 0, it will
> reduce to
> 
> return (((uint64_t *)v0)[0]) & 1
> 
> And it's not right.
> 
> The right bit is first bit in vector register 0. And in host big endianess,
> it will be  the first bit of the seventh byte.

You've forgotten that we've just done an 8-byte big-endian load, which means
that we *are* looking at the first bit of the byte at offset 7.

It is right.

>> You don't need to pass mlen, since it's
> Yes.

I finally remembered all of the bits that go into mlen and thought I had
deleted that sentence -- apparently I only removed half.  ;-)


r~

