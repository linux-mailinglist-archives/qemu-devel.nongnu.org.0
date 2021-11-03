Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41D4444B9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:37:54 +0100 (CET)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIKn-000101-Ph
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miI5Y-0006na-TA
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:22:08 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miI5X-000299-37
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:22:08 -0400
Received: by mail-qt1-x829.google.com with SMTP id x10so743619qta.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w+MEWLidMv9Wx1ycpGuOUD7if6+CFau/gBCzNjz7iV0=;
 b=hwUuG5fatCCNlgIQbcJX4TPtGnyhRcQd4WfX3XhqyAxZhBUSBLUrmBdXSQTtZ/hwQI
 vzFljPgC7jGgQwEBrJdML9JCK5iDgLpYMNwpucOmUa15lcCsSEDzRvfdXsiVfDFglO58
 HxXSvRMUMhQjKcwrVx8suNd+UE7HzElM6S5gplqx7nAlTDtsJ9H/Zhe0yRCeTcONfbp6
 OiyiY54WZzzHCbZC2QuVF6DuB3hhUfLvmJY7bpxMM6C3NDyWh/u3e34ndEB7BJMOV7cx
 IIVGZqX8CA8oYbS997j5rBIWhtcGKE+tVuHzqUY73a9EuaJqFIQG7a2pXjTieq/nzNaS
 /uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+MEWLidMv9Wx1ycpGuOUD7if6+CFau/gBCzNjz7iV0=;
 b=t1voINWhw6MB6n1PJZdNmFCl8Z6qnsm7rUQYYekSrSBUSa8MsEBKfQCnpNL7/R7o9+
 +5awSbQNvwOFqL8vv2fgXj3AV6oqzhMpXN4PPXsQSX+AchLHYxOCwMT4SrZeY/1tGK3L
 rszpCvvnn8WhyQ9NpELP/xbJblIJFymKmBkM5OBvoF3I/aNhaCSQVv4K2/kF3vb0gdVT
 m67uKQXgHRg3W0rN1ZSB0op8FhYIjHHI/ng8V563kZwQnEO6aoimrp1GXwJLmT9kUVd3
 SX2Ei7XfYl5R0ptHBEBLAp4HXyieIxJs06sjb0WWG+ryb3YiDdMCON3uMRn33cIrbnPy
 /X9Q==
X-Gm-Message-State: AOAM531lz9PIEYVyU+0LelRfk3jWv8p9ZaXs2xajyC9xe7LAX6zjNAyZ
 mbSCkfofaNtDJQjujQKomkhDfA==
X-Google-Smtp-Source: ABdhPJxNF7elPWGQRNhV+6r/YtOzEvpTIO/FdAUPmPuUHkDK1kPcf/FAyyIXMH/1MUOl79qtgdK6Hg==
X-Received: by 2002:ac8:5fd2:: with SMTP id k18mr47333915qta.379.1635952925901; 
 Wed, 03 Nov 2021 08:22:05 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id g1sm1857384qtb.7.2021.11.03.08.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:22:05 -0700 (PDT)
Subject: Hexagon toolchain update vs linux-user signals
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
 <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
 <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87zgqmjypq.fsf@linaro.org>
 <SN4PR0201MB880807096E4D98700320E4FFDE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87ee7xjqlv.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f65337b-b9ed-dc4c-ac09-025bef5eaa4c@linaro.org>
Date: Wed, 3 Nov 2021 11:22:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87ee7xjqlv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 9:31 AM, Alex Bennée wrote:
>>> Could it be a toolchain thing?
>>
>> Not likely a toolchain problem.  If I can access both of the signals
>> binaries, I can confirm.
> 
> Testing against two signals binaries I see a 4-7% failure rate against the
> new binary versus the original pre-toolchain change one. That's not to
> say the binary is broken - it could be a subtle change that exacerbated
> our existing poor signals support.
> 
>    https://transfer.sh/xA2ejk/signals.old (pre-toolchain change)
>    https://transfer.sh/vSsn5s/signals
> 
> something in the CI ensures it fails much more reliably as U can't get
> it to pass on a retry.

I've had a closer look at the signals failure, and it really could be a toolchain problem.

The sigsegv is at

#0  0x00005555557a387f in stb_p (ptr=0x10000, v=0 '\000')
     at /home/richard.henderson/qemu/src/include/qemu/bswap.h:326
#1  0x00005555557a4bc5 in cpu_stb_mmu (env=0x555555e4eb50, addr=0,
     val=0 '\000', oi=0, ra=93824992935986) at ../src/accel/tcg/user-exec.c:359
#2  0x00005555557a5396 in cpu_stb_mmuidx_ra (env=0x555555e4eb50, addr=0,
     val=0, mmu_idx=0, ra=93824992935986)
     at ../src/accel/tcg/ldst_common.c.inc:83
#3  0x00005555557a57e6 in cpu_stb_data_ra (env=0x555555e4eb50, addr=0, val=0,
     ra=93824992935986) at ../src/accel/tcg/ldst_common.c.inc:183
#4  0x00005555555ff6f0 in helper_commit_store (env=0x555555e4eb50, slot_num=1)
     at ../src/target/hexagon/op_helper.c:151
#5  0x0000555555600032 in check_noshuf (env=0x555555e4eb50, slot=0)
     at ../src/target/hexagon/op_helper.c:407
#6  0x00005555556000e4 in mem_load4 (env=0x555555e4eb50, slot=0, vaddr=305000)
     at ../src/target/hexagon/op_helper.c:431
#7  0x00005555556063c0 in helper_L2_loadri_io (env=0x555555e4eb50, RsV=305000,
     siV=0, slot=0) at target/hexagon/helper_funcs_generated.c.inc:1013
#8  0x00007fffe8034f5a in code_gen_buffer ()

which is a store to address 0, which obviously should fail.

This comes from

IN: nontrivial_free
0x000224c4:  0x78004003 {       R3 = #0x0
0x000224c8:  0xf204d001         P1 = cmp.eq(R4,R16) }
0x000224cc:  0x5c00413e {       if (P1) jump:nt PC+124
0x000224d0:  0x38034000         if (P0) memb(R3+#0x0) = #0x0
0x000224d4:  0x9180c002         R2 = memw(R0+#0x0) }

which is part of the new toolchain's libc.  This is quite obviously a store to address 0 
if P0 is true.  Which looks pretty questionable.  Presumably P0 is not always set, which 
is why the program does not always crash.  But there doesn't appear to be anything wrong 
with the qemu translation.

I'm suspicious of the new compiler.  This looks like some sort of code scheduling bug, 
where R3=0 got moved ahead of the final use of the previous value in R3.

In the short term, I recommend dropping the hexagon toolchain update and that Taylor 
generate a new HVX pull request with the new tests present but disabled in the makefile.


r~

