Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C366A8B7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 03:35:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGWN4-0001xg-Iq; Fri, 13 Jan 2023 21:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWN2-0001vJ-3W
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:34:12 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWN0-0008WC-Ea
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:34:11 -0500
Received: by mail-pl1-x631.google.com with SMTP id jn22so25182367plb.13
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjav3zuYvpbFyuced3+kXs6qBD4vCq1U9b46uWY/t7g=;
 b=H5IQpT1sVM87nUqQsS8zt1gQNPvxdwnce/PYS2KvVpEmRGDkZ8pceSK9jr+miftnEB
 fP9r4UmzhbazZyKBr/Ie/COHU1N4jtgzduS/r9TltG7wSlI5nHZ7pYEW3ertqcBGDTm2
 GxTJmfWpggXCds7j7EM3Yn1mnpjEO2+TEb7Zhgo0ZZqFH0HqWBqb6TuU3ONd2A2V5n0V
 pz+0VwswrbRrCwcL1jNBRVHWJhCkgrH9HQGi96ttAsbF6nrYK7ZoTR+idht7XWk6vdTM
 J4Y9S/5ce38EHVdEn8Ph40AbXzWO7jRGi0ewZjm7sJitHyiP9G5nF+XuHQEkB2Z8fBA+
 G8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjav3zuYvpbFyuced3+kXs6qBD4vCq1U9b46uWY/t7g=;
 b=NtVZFLHKniztWZV9+qe4e0quRdr0XSRZLebWgSlQJ5eDtJnbuZgSfsqBCaCpgp75Yb
 0/TUB/ggtVIBxcHCHcH6tl8OUBNb5WrIvh7StBX58JcnlSVZJoCqem5Un5MKegPhKYoZ
 O5KermYmzSKtrimv3IBO2RIqBHG7XQ2/dkKVp465kBEZwKzQq3g45ULkDw3rPCZfTNlk
 puzogDedKZd8wIC4Nn1N6QgauxenUt3SqzBEjcO6xO6bx5pBM0X7P/9BM7bNlR48a4Yc
 tEYoKplFyt4wS33NRYWRxCjAIJqVGoKJfC40ZdIzGybnMsitPXt2tog5BIMZ1uE4UWaH
 wYCQ==
X-Gm-Message-State: AFqh2kpthmLSElej9FWQ3k3wd8saPZpT9uILFHVVh2InrcNSiYBhq9XF
 MIwMyB465a0ktY6Ls4iqgbt4mg==
X-Google-Smtp-Source: AMrXdXuojJZX13oyLYJgGUrGXSDaQGoOZaJfinbwsIa1rRGu21YhzV5KU1TjUKeGZqhVGJTUT0yuxA==
X-Received: by 2002:a05:6a20:9b87:b0:ac:44ab:be3b with SMTP id
 mr7-20020a056a209b8700b000ac44abbe3bmr96762289pzb.60.1673663648679; 
 Fri, 13 Jan 2023 18:34:08 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c4-20020a63da04000000b0047911890728sm12430012pgh.79.2023.01.13.18.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 18:34:07 -0800 (PST)
Message-ID: <76e73d82-6a44-b9c6-ce60-417e15507b40@linaro.org>
Date: Fri, 13 Jan 2023 16:34:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] testing: probe gdb for supported architectures ahead
 of time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230105181533.2235792-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105181533.2235792-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/5/23 10:15, Alex Bennée wrote:
> Currently when we encounter a gdb that is old or not built with
> multiarch in mind we fail rather messily. Try and improve the
> situation by probing ahead of time and setting
> HOST_GDB_SUPPORTS_ARCH=y in the relevant tcg configs. We can then skip
> and give a more meaningful message if we don't run the test.
> 
> [AJB: we still miss some arches, for example gdb uses s390 which fails
> when we look for s390x. Not sure what the best way to deal with that
> is? Maybe define a gdb_arch as we probe each target?]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure                                     |  8 +++++
>   scripts/probe-gdb-support.sh                  | 36 +++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target             |  2 +-
>   tests/tcg/multiarch/Makefile.target           |  5 +++
>   .../multiarch/system/Makefile.softmmu-target  |  6 +++-
>   tests/tcg/s390x/Makefile.target               |  2 +-
>   6 files changed, 56 insertions(+), 3 deletions(-)
>   create mode 100755 scripts/probe-gdb-support.sh

Plausible as a mechanism.

I would say that your script would need to actually examine all of the 'set architecture' 
output to map gdb arches to qemu arches.  In particular, the :foo stuff is important. 
E.g. mips:isa64 (amongst others) means mips64.

I can verify that I no longer get the MicroBlaze error with make check-tcg, so that part 
of the patch works.


r~

