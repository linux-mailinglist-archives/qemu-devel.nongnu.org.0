Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7B693553
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzmj-0005a5-NX; Sat, 11 Feb 2023 19:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzmh-0005Y6-4h
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:59:59 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzmf-0008D1-AU
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:59:58 -0500
Received: by mail-pf1-x429.google.com with SMTP id h7so724052pfc.11
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sHIhsIAKClhD868NEUomva/I/AV1GwW03/jWuUtHh5k=;
 b=IMERKmb5Wa807iQis4Ht/mysZifK1EZE8NmSRi7J2K1zmXRWJ3IJdE3mFfC1y7zaOa
 69UfLELfQF/U23F+49QaALV0CvGMgbiwE15NG9SeZ5VdID8ioHiT6euaTsZdEbwSnySt
 O6eC8Xko45/fnhRUBJVa6zqyZHCm+gJajWSgBpgMYwkZkmzV9eUBILPxyaORvCWlywUh
 jaYnQ2L85BacA1KSJNvR+wZaZq39mel1wPjpRdrps/VA3eyAVvqDZbR5P499vetH+niM
 U+3Cf1LXhoqTTd1PL4qCHFlzPp5at1VZOWqQHBFMhSle6nQE2aDT9XjX5UYrRdRopT6U
 rVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sHIhsIAKClhD868NEUomva/I/AV1GwW03/jWuUtHh5k=;
 b=kYgWYlRwceNAN5rvIhR/dTwQQJNRAvQyXbRr7/ffev/vifJNJu0AQV20+hgJ3iAyh1
 fq/4yAOCPCRYQROHd2fCHZJ3ofOC18Yg0xtGOI2DIgD7oHEUC559sX2NsAy0gzDwH+9D
 71zREqz3ddSclxKCqS7ta5upZJqeRTMNXzHwEAgEx5OBpb8GX0dbJtIRNdJmrNylrdOh
 LH99fsltyE9j65EEzL/kyyC2Ap0sBG229GeX3Bci++10CAGWNu0J0RDQMfAdnj6T+FMJ
 ydSnmDGtfQOQcoO92oZ0nFiCXtQu0Vu9rDTBRiyxtpp5wLp/7eSK6Di0FZMqHayNxKpI
 tH0A==
X-Gm-Message-State: AO0yUKWXerRqEFY3TVr9ZWRaAW9d7WW5ajX+pGsfvucm2cwaio050LUv
 EnB78wkJw43X1ydDAooUFknL5g==
X-Google-Smtp-Source: AK7set/cKDJTua1m1XkANFknBbzKqP4nD3165oSGFeT0Wd68AJYanc8Fhit31ltCt6uh1TsiIEudKg==
X-Received: by 2002:a62:bd08:0:b0:5a8:ac15:534d with SMTP id
 a8-20020a62bd08000000b005a8ac15534dmr292474pff.13.1676159995741; 
 Sat, 11 Feb 2023 15:59:55 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j16-20020a62e910000000b0058d9a5bac88sm5326176pfh.203.2023.02.11.15.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:59:55 -0800 (PST)
Message-ID: <30289ed3-7cf4-d50e-59a6-603ee15cf5e9@linaro.org>
Date: Sat, 11 Feb 2023 13:59:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@freebsd.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-7-imp@bsdimp.com>
 <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
 <CANCZdfp394rACvjVDdEao626pSdin1yPvYHW9sf0mNbVwoyeVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfp394rACvjVDdEao626pSdin1yPvYHW9sf0mNbVwoyeVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 2/11/23 13:40, Warner Losh wrote:
> maxmem is defined earlier in this patch:
> 
> +#if TARGET_ABI_BITS != HOST_LONG_BITS
> +    const abi_ulong maxmem = -0x100c000;
> 
> but I'm not at all sure how that number was arrived at...
> It's a little less than ULONG_MAX is all I can say for
> sure.
> 
> As to why it's a special case only sometimes, I believe that it's there for 32-bit
> targets running on 64-bit hosts so that we return a sane amount of memory because
> 64-bit hosts can have > 4GB of ram... I'm not 100% sure of this, and it would
> likely be wrong for 32-bit host and 64-bit target, but that case isn't supported at
> all by the bsd-user project (though in the past it may have been, we no longer
> built even 32 on 32 target/host emulation).

Perhaps you're looking for reserved_va?  I.e. the max va the guest is limited to?

Or, given this is a system-wide number of pages, not per-process, and given the types 
involved, cap at UINT32_MAX?

>     I would expect a 64-bit guest to rescale the result for TARGET_PAGE_SIZE != getpagesize().
> 
> 
> I would too. I suspect that the reason this is here like this is that an attempt
> was being made to handle it, but since TARGET_PAGE_SIZE == getpagesize() on
> all hosts / target pairs until very recently (with the 16k arm64 kernels), this was
> a latent bug in the code and I should fix it before my next submission. And aarch64
> hosts for this are quite rare (most people use bsd-user on amd64 hosts to build for
> all the other architectures).

Ok.  When you do this, remember muldiv64.


r~

