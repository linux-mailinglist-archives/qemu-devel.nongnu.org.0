Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186FC5F1100
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:38:02 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJxY-00064z-Uh
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeJvF-0004LQ-HE
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:35:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeJvD-0004wM-CP
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:35:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so4835785pjr.5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=nDUu4Tt2mdoFdSZ+HSUozKXcCghmUdpAubawrtZmTss=;
 b=Rp83lxRI9ghw3sqPvmOkkDAXCNgTDgSyQd7ik5xlDK/ECgoCehpPzBSolsXgYhAWo5
 SzboZpMs6kRFZnE7kD6RsP5btpfuU97bSQxwbjdIj+F6wgv+LixilG/B7fPfkDLDbjk/
 Ckoqf7MTSTLsrQ7pIwH8HRYMY8JLvr9XJiEoyUIJNRYe07nl2uyE/T79z9Ai/tCYLyJD
 wGGCrZO8CXh1NYv9joClfWV2mwwVpHezZa2DH128cd6sUjKV3151YV+GXwcSYWlz+MJM
 jEwA9//akYAIjhol5jFGij9axD3qL89mJFRhC64xND9nFsEOAtuH10dNkdWZqxKmNEO2
 5lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nDUu4Tt2mdoFdSZ+HSUozKXcCghmUdpAubawrtZmTss=;
 b=0fuPw7Metksmlfnz52Ud+KvR9zyW3N0h6ws5VvPjDKUYlhxWzGigz8TdssmAHzmSiJ
 aG3LOPgZzMbKtfb02YRH7iqgo8spVmjl6Wwf/5fwmxgzVXXfzzS61XK+9QymQbFGyMuG
 WVhEyo0T1kzkCgXSLdeVkwl+Sf7X/OcQJcZyvBHr2Du6NJVc7ufI7/My0cDhteS/EMMD
 O8alxBTWPhjOgTcTSYTIE5b7+KRAteiuJXpPEsuZc/lMJALwwSzA6NWyfRgynhEmeL50
 A0T6EyLboL307dGlsvPzLxWDKEsgASyJm+0KmPIWVhIzX7d67Ld1uYENWXCMXbCZn/is
 dfJQ==
X-Gm-Message-State: ACrzQf0neW5zLROavKYszglnAmF8DO16OfGC86Dw5j6wEeBZjTWcKIVm
 h6CddSE3MbAV9qa7Rif+mXQDkQ==
X-Google-Smtp-Source: AMsMyM74Sk6cNSftETp7foUz/cgx5fk0S3rlRzCVmExI+m4LMjmz/GpEwL650Q18XGpBFGPmemy7WQ==
X-Received: by 2002:a17:903:41cb:b0:178:36c2:a98 with SMTP id
 u11-20020a17090341cb00b0017836c20a98mr9820561ple.47.1664559332648; 
 Fri, 30 Sep 2022 10:35:32 -0700 (PDT)
Received: from [192.168.235.227] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090332c200b00176c89243fcsm2181353plr.179.2022.09.30.10.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 10:35:32 -0700 (PDT)
Message-ID: <a4543dc2-b952-92ad-328a-e704ce215197@linaro.org>
Date: Fri, 30 Sep 2022 10:35:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
 <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
 <87pmfdxagx.fsf@linaro.org>
 <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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

On 9/30/22 06:25, Peter Maydell wrote:
> On Fri, 30 Sept 2022 at 14:23, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> This is going to break previously working setups involving
>>> the "filter logging to a particular address range" and also
>>> anybody post-processing logfiles and expecting to see
>>> the virtual address in -d exec logging, I think.
>>
>> To be honest I've never found -exec logging that useful for system
>> emulation (beyond check-tcg tests) because it just generates so much
>> data.
> 
> It can be very useful for "give me a list of all the
> PC values where we executed an instruction", for shorter
> test cases. You can then (given several of these) look at
> where two runs diverge, and similar things. I use it,
> so please don't break it :-)

Ok, I'm reworking the patchset to always have the proper virtual pc for logging.


r~

