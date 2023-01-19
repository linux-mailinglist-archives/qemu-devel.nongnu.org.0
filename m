Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE938674333
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIb0q-0003QS-If; Thu, 19 Jan 2023 14:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIb0n-0003P7-UO
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:55:49 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIb0m-00007i-BG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:55:49 -0500
Received: by mail-pf1-x435.google.com with SMTP id w2so2325178pfc.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=60ubSJWMgXBCMk4G+sk0bwC4wU6sZG2s5aaGU26PCgc=;
 b=c5tUVJo9KsQg/e2/06yvoXVffwvbMuSZQ5PrMra81qc0nWPfQGQZKeOnU4apOMrwER
 EHyDAo+7I2TU8TPndLhFy3EaVeLduBPXvXnWsPvRpR0P1MaB/2OA4ELKR8Aq6JQxd16D
 XdfC00Q9m5xpP28BGXeZwHi9bJQFM0Bly2pQL4szWYR3jbXpx2s5RJe0tjNviAQpVt8v
 Rwl8aaOYuRdASPYXgJlHwRdM2FLWSvhQWinRuNPwAJz9xYPjpsBDAFcqrQxEcVLrTg8v
 SHc1UffcvPwLS0NkgKkmbfDg4DJiPYuFmftKQw3DmOArpScWz5w7CYlRgXSn/LzV/jNI
 ekSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=60ubSJWMgXBCMk4G+sk0bwC4wU6sZG2s5aaGU26PCgc=;
 b=Ut05mflZr+N4UhP8iRVWdJM88lm8MFJmi/uF5lL3aYR2dDG8lAfEwpEuQDQ8z0nDbK
 KlZQbTUlxBClm0vXJgZwO12e+ODEFCGlx94hXpQJVObf4D4lpdK+rtOfLILkgsjH++YW
 KhMct5YgLP1iVyzQJa7uk4pMTVfGVqzVDIsvZ71plqAr9YAKHq+GPTJfS4VmZBG2Z4Kg
 NPa6yQGpvlOOmHsbqLDSLA9QoQEVUfVwPQXs/WyPgYKwts0Pw13RjuYJms54MIuaB1+8
 GOzngE4x/UnUJgEdqasT4Lz1GzdDk8wKNuwNZEsmrDMmnL/jShVjjEJe7pOXOtI9UzXH
 LXLw==
X-Gm-Message-State: AFqh2kobaECLR7+0KxQ/eQ13pYujRalKbJKZjl/wvKCMu0X/8ma3mQ1j
 1deHORZXt6sR3n/wpQQUeX+soA==
X-Google-Smtp-Source: AMrXdXubxaGoQzVjECFuJrsNZNImeAzTs3/tg3ADC1lGOkYIlGY6UTB7QAGQfmtALFmopeeORIMQCA==
X-Received: by 2002:aa7:98ce:0:b0:58b:25f9:52c1 with SMTP id
 e14-20020aa798ce000000b0058b25f952c1mr38877020pfm.31.1674158146573; 
 Thu, 19 Jan 2023 11:55:46 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q7-20020aa78427000000b00580978caca7sm18163340pfn.45.2023.01.19.11.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:55:46 -0800 (PST)
Message-ID: <0ffe338e-87b1-98f6-8fbf-efa16b47675c@linaro.org>
Date: Thu, 19 Jan 2023 09:55:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/18] tests/tcg: Use SIGKILL for timeout
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119180419.30304-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 08:04, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> linux-user blocks all signals while attempting to handle guest
> signals (e.g. ABRT), which means that the default TERM sent by timeout
> has no effect -- KILL instead.
> 
> When a guest aborts (possible nios2 guest bug), sending SIGABRT to
> itself, I have caught one thread waiting in start_exclusive, and all
> of the others blocked in exclusive_idle. I look at that and think
> there's a bug in our start_exclusive locking, but I can't prove it.

I don't think this bit of the cover letter is helpful here.
It was just the sigprocmask in process_pending_signals that
was relevant.

Anyway...


> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
> [AJB: expanded commit message from cover letter]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


