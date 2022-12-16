Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC12F64F557
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KT7-0001fg-40; Fri, 16 Dec 2022 18:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KT4-0001f8-5v
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:50:18 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KT0-0002Zn-RR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:50:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id f9so2793605pgf.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UfaAXq2AZAxc8W7ou9ewlz7Sg5inF2nUOenh8B7utq0=;
 b=N/RSNjEKbZFwaojXZ1fZopXAO1u+iiLerskuSWMZCW2ia9omz31poohaEA21LEDm6J
 LDUWb/kmUhiA7RrRrFHVzn7q101eLprtC9lMbfaiEV11VERAjm+ZZOdlkxfrVwkf8wsm
 HQwoJd4QuSAAZ4dIbxnzBO11tH8zDlGenkX1yZAMLzw4C/Y0Mq2bwGTG0Oi59Gn9JSTR
 xIsQOFNwWgRTzF2DCaU9256OlA49aVqZ6Lfryp1Q36ysYXRmuR6YOAG2mDUT8sePdQgP
 K6DUNFpxkuigRWSNJesh5Og04eh5lQkaAU+wOIqcs/3iAXM5H4cX2KeNQoYAUpfSdQty
 VY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UfaAXq2AZAxc8W7ou9ewlz7Sg5inF2nUOenh8B7utq0=;
 b=2q3p9gYVpVQhsEoV+LD2/u2wp53ABUjK8CXbMXvLSYgYjSwyV47HWGzRAkLu6kYMFs
 iU7XE1Zs6P7vgxtdDoHJBhPDwXak/MrRlC1sjw/AbMcfr6zqj7psDoptt8rPX9iHJLvB
 rpdLmGFcfJVLuqecRzn/ZJTE0R3PGcSRTn7wFk0pS7heAvwqJtd1TNyPHc9EVCmKpUGo
 azMyOKqyd2vByhnk/nx7Wud6Npdqs8TCjU/tJ5shTO2JQpqSyvfJu2sdy+bwUKwh/cn5
 AnASf3jGqoL1DqKiE6NZjTKGwy5ZHO1MBFVBI9qTgDCh0XBT58CmwKExFVlV5jnYlTtt
 XmTg==
X-Gm-Message-State: ANoB5pkdHh7U7cTsmvCzueRScsTXHRX1jCnhVc+qBbHhB3yEtFvBs93k
 MMPWxc+/H1gEYxCioDwMaLaycA==
X-Google-Smtp-Source: AA0mqf47DqEZ2fhpEmVVuLqyPSvYHPYa4p9P0rCmCcfiWLLWS50z8dbVbO4PWWa6qv2qmuOURInAIw==
X-Received: by 2002:a05:6a00:26c1:b0:578:101e:ddec with SMTP id
 p1-20020a056a0026c100b00578101eddecmr31450845pfw.11.1671234613070; 
 Fri, 16 Dec 2022 15:50:13 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa797af000000b00574345ee12csm2020759pfq.23.2022.12.16.15.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:50:12 -0800 (PST)
Message-ID: <5880b2c8-1c6c-f117-fab1-5c8f7846c897@linaro.org>
Date: Fri, 16 Dec 2022 15:50:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] meson: Set avx512f option to auto
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Tom Stellard <tstellar@redhat.com>,
 "P. Berrange, Daniel" <berrange@redhat.com>
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-3-richard.henderson@linaro.org>
 <CABgObfbS3BkDJ=wx38LyJJFs+__07MntKSHb2ZNUo3zo-_=Sjg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfbS3BkDJ=wx38LyJJFs+__07MntKSHb2ZNUo3zo-_=Sjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 12/16/22 15:08, Paolo Bonzini wrote:
> Because that's what configure used to do 
> (https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html). 
> <https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg00650.html).>..

Yeah, but I wondered if that was just a bug.

> It can surely be changed but AVX512 is known to limit processor frequency. I am not sure 
> if the limitation is per core or extends to multiple cores, and it would be a pity if 
> guests were slowed down even further during migration.

Hmm.  Should we simply remove it?

> Especially after the bulk phase buffer_is_zero performance matters a lot less so you'd pay 
> the price of AVX512 for little gain. After the bulk phase it may even make sense to just 
> use SSE, since even AVX requires a voltage transition[1] from what I saw at 
> https://travisdowns.github.io/blog/2020/01/17/avxfreq1.html 
> <https://travisdowns.github.io/blog/2020/01/17/avxfreq1.html>.

Ouch, never heard of that.

I'm not going to worry about it, because glibc str* routines make the same choice to use 
AVX2, as does TCG, so I can only imagine that for the most part we're continually in and 
out of 256-bit avx mode.

Anyway, I'll drop this patch.


r~

