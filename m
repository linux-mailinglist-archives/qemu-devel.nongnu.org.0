Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7034F21C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 22:27:14 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRKxE-0008Ix-Rd
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 16:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKvU-0007kL-SD
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:25:27 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKvR-0003Hu-N1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:25:24 -0400
Received: by mail-pg1-x531.google.com with SMTP id p12so7892253pgj.10
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=un+Wd5O72QwAkydKPnFQJwaca7vg5tSiAQfopT317qc=;
 b=WeL3vUPGnarwrniLb7cl2Xv3oX3ZpLHIOcIYY6kXg6K6RTvwJE0Fdj8xeFBzTHSPZo
 ewxS6cSs4Y73EufrqWnUTZl2nAb1l7Sts7i8LOWvXE5e9pgMaKLEeBXJ3gtmnfkKcI/r
 AHUgs1h2sdADKck0lG2LQArx5U8MKwyjzyCmhF5itaf1vTRZZ72W+JuGWE2sKenuX4dP
 74v5AVYHFEbt1aJ4z6N9wVDKJICSJXGTsRcihZRD46w1reRCHxQ5SeWT6XrXZXPZM6En
 OEhIQD3akVXX4a8sOY0Ch1pqsBPSquV8u7O8gmOCdM4JFkXPeGVID74KP8QBmhc/wSC3
 Zn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=un+Wd5O72QwAkydKPnFQJwaca7vg5tSiAQfopT317qc=;
 b=k4nD/0plt+nzkynkukb8KvVQn+33Ky40itQx+30n18bA/GDvG51RAy+p04A08Vjuma
 9t6Ldu+W6sqnn1W2xAp48LhtCw6RcWRTJtRJL/eNOJQfWUCmAZKWOOYwmarewyJa+S6p
 lDT8A894JQcJasbgPEUc0BrmTIWiMJL8rSmfRUFScsyIV6GY//OO+ib7ku2afTYsjqiz
 tBHGzgPc9U+I7A5NnOhhNFO12Q79IytcKQGiBzue1JEqphBkIbSwUisGgHEPSr4oYCbq
 OGhUp+VzfqUx7NeMunlxkVb1k+WVkXHKcRBgOnSgojX3FX1ZMjXb8qQEyqf2pyHRVG1w
 eEgg==
X-Gm-Message-State: AOAM5318LV/6/0U0dXEWGp+Fex8pX/1tCh51/svm2glfe7pSlhriylEN
 eF/cy5QQN1Fz3h/xiyCSWKd5+g==
X-Google-Smtp-Source: ABdhPJzsrUoUFfig4w7hN06qNM1GRdJlPuPx7bcTKJgQA7kSiy+q6FnyKyxkUkCgCoiQNzj5Fp+Jhg==
X-Received: by 2002:aa7:9984:0:b029:1f8:b0ed:e423 with SMTP id
 k4-20020aa799840000b02901f8b0ede423mr31104819pfh.81.1617135919315; 
 Tue, 30 Mar 2021 13:25:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r1sm20749690pfh.153.2021.03.30.13.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 13:25:18 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16
 bit call (WIP)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-7-alex.bennee@linaro.org>
 <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
 <CAHDbmO1+q=DxGQcoirmnsSfwp_XKoJvj04oWJBhpGCiEsK=_MQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0e83eb0-29ef-495a-1653-e0281812664c@linaro.org>
Date: Tue, 30 Mar 2021 13:25:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHDbmO1+q=DxGQcoirmnsSfwp_XKoJvj04oWJBhpGCiEsK=_MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 12:20 PM, Alex Bennée wrote:
> Hmm actually the fedora-i386-cross image is:
> 
>    gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)
> 
> with CROSS_CC_GUEST_CFLAGS=-m32 so I wonder what the difference is
> between that and:
> 
>    i686-linux-gnu-gcc -m32
> 
> i686-linux-gnu-gcc --version
> i686-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
> Copyright (C) 2019 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> They are both pretty new.

The difference, I'm sure, is a local distro patch enabling -fpie by default.

I'm hoping that we can just use

--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -10,6 +10,9 @@ ALL_X86_TESTS=$(I386_SRCS:.c=)
  SKIP_I386_TESTS=test-i386-ssse3
  X86_64_TESTS:=$(filter test-i386-ssse3, $(ALL_X86_TESTS))

+# test-i386 has non-pic calls into 16-bit mode
+test-i386: CFLAGS += -fno-pie
+
  test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
  run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
  run-plugin-test-i386-sse-exceptions-%: QEMU_OPTS += -cpu max

Checking with gitlab to see if our oldest host compiler accepts it.


r~


