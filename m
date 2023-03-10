Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1D6B4FC8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah9y-0001oD-S2; Fri, 10 Mar 2023 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pah9w-0001nq-NB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:08:04 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pah9v-0005eA-7i
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:08:04 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ky4so6504456plb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zxYielysRLJRbxJ5LMkON7ZbhGQAVkDRfAKWweHtHNE=;
 b=rqdQyOA6VU0L+8O2s/jflEXgGZC6qpHrM3lojQ2b1BlXgPrni95my13T6KT3gjxyjG
 egsYSyf1nexmUu2vJWh8MC/+P2WokVdMeNZSjI5qGEXWbkHB6nH/BkdtT5LzjUqsQDpL
 fUL/MPZTJR/+hVmxLS8PyTWS4/lrx1+3SNnxYrmQn6dhxn7gY3nbAN9rT2b7KzJIpnha
 1BVklwiSAxFX0hvbhnwGlquvKCNz+RETrXJAyoD896se6ZHa3A++h+ukD5zKuFPV6GqS
 WHT9pyEBZU1MMEp8pUvy9h3ejP0jN3eK2kOvNVLIL8B8PNJuIlb6h2w7YdNKqDUPYITf
 4+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zxYielysRLJRbxJ5LMkON7ZbhGQAVkDRfAKWweHtHNE=;
 b=bbzjc6alW78RcWMX4sUxf80HiDE8sDsfOKRY7QLIkT1coJ9je6aYZYDOON03E1/t0W
 d4BPkeKbKYDjGIe2fqIrCzx5t5dzAkCKTsV6Z5JDUu8/92g40Cv+pSeZZ/p4pFwx6Kh+
 mQw8FpI2uGcpHNIjYDcbjv3qjKjZF7JnAHbZ/80zmWDzCrZWlGdX6qtIbRuXmd5BbmN8
 VG6qa/fwOm+raJlp2C04b0W1caRGFUaIqSF6uDSnsAfLbz533g0U74MjNKOvBY2CoYw5
 gfkBrKxHsjHCu0Jq6s1RL6HWeVdZyhu/a+fOuGFKNDfrhgHZvJS2ET0txe5oLycxTXXm
 eTTw==
X-Gm-Message-State: AO0yUKUVhMcsB+2AvFTPQzMv7EdGCRuW5GIz+MGUC9OIkmbnC+zMVrce
 l/NGzzL7Uo5fLs3B2XqtnGtehg==
X-Google-Smtp-Source: AK7set9OmAUbGSEUyErYeqel5cpokO6Z64RkxRflyXnMCaWPevoGzmolZo+fIdohFAyV/9nQGVOUfQ==
X-Received: by 2002:a17:902:db11:b0:19d:7a4:4063 with SMTP id
 m17-20020a170902db1100b0019d07a44063mr30725423plx.46.1678471681708; 
 Fri, 10 Mar 2023 10:08:01 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 kt7-20020a170903088700b00186a2274382sm320988plb.76.2023.03.10.10.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 10:08:01 -0800 (PST)
Message-ID: <7f4dcb6a-c954-34bf-a3c9-3e8cebd034bb@linaro.org>
Date: Fri, 10 Mar 2023 10:07:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/10/23 09:47, Peter Maydell wrote:
> On Fri, 10 Mar 2023 at 10:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> You need a very new gdb to be able to run with pauth support otherwise
>> your likely to hit asserts and aborts. Disable pauth for now until we
>> can properly probe support in gdb.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> If it makes gdb fall over, then shouldn't we be disabling
> the pauth gdbstub stuff entirely ? Otherwise even if our
> tests are fine our users will not be...

It is, annoyingly, a bug in gdb 12 alone.

Before gdb 12, the pauth extension isn't recognized and so it gets treated as non-special 
registers.  From gdb 13, whatever lead to the internal_error() is fixed and the extension 
works swimmingly.


r~


