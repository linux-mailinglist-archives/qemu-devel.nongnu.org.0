Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE52F8FB2
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:27:57 +0100 (CET)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0u32-00064D-Q7
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0u1s-0005K5-UO; Sat, 16 Jan 2021 17:26:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0u1q-0003Yi-BS; Sat, 16 Jan 2021 17:26:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w5so12846590wrm.11;
 Sat, 16 Jan 2021 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FW88776lj+jpH+NkWSrDf2uf0l8cGjL0eAe/epUB6N4=;
 b=udv8hDVfKvpCo8J9cGRAgVvx8RTPkJWVxIKfbGGEZ7p0W/RXpOckGrCNopg1jiA13h
 dNmqY/fywIZ62V1Z2gqzNdAD9FBVnex/dSngGRvdl3OO4YuY7T81C6nHoBv5L1rVu6ea
 UclNPVAntPdQhJtUO1GoqEP/DH4PeU6satXsa7CKg9Q51BKl6gYIv9MQPQ4JyHJ66ZUe
 G+F/E4cUGwaXdxaRowyLzs09N4nvbyKngcL0ptBsYZSv/2CbpjWEzTQEgvS4ICkz04tU
 u1Psm03Iz53B5EonfDg3pRrTwpx839mUzWf86AvfgD47MwGcTGxflgyJ0NVFOwOe9PrB
 ryGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FW88776lj+jpH+NkWSrDf2uf0l8cGjL0eAe/epUB6N4=;
 b=CZ59+sT0H/pkt5oYTJeipeugKJgkDXX7ovQzuMWUqy0V0nN2a8XU8mBXLZV7s7OELu
 gClkP3pWMdHsAaGC01EBbCF2bGECzhIbEKhLbWM35zgD3G1CWGb+VB2EH40//EEAEov2
 Gre55qIC+Y9hG55+UiI7FVM+D18nCBm1Mn+048kf41aw9O8yiBS81nuWDRNVREYOuiNq
 S7VdZYVr2K42K9M9i0JgdDtW9RYTazHvz1jetun6Sqa1SvDOxA2S6DR0s79Xa+52nlot
 7pmKyFWB174niOXUhs75b2f2WOFxiTnfen9t6aC9Lhyk1L0WQsZLjbyMigxl44p+m5lU
 hTlg==
X-Gm-Message-State: AOAM532Xfl3+OJVSceIdPeHrYmADk4GwJH3sykRPAt/K8U8xR6MIPkXc
 fsbLO/ohzaiTxcLPF6IvGVT+jlmhWL0=
X-Google-Smtp-Source: ABdhPJwsh7CGGe3xx7hnLXWBNN9lggdos/fc3EYTnAZD4/trEUIZU17TgehxBEkAV94luEmyuf7Gtw==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr19611521wrs.72.1610835999627; 
 Sat, 16 Jan 2021 14:26:39 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d187sm16338039wmd.8.2021.01.16.14.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 14:26:38 -0800 (PST)
Subject: Re: Recent TCG commit breaks PPC
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
 <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
 <42de183-3c50-562a-d22-6e61dbbe893f@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f527c38b-14d0-a192-0834-a7ab2196d082@amsat.org>
Date: Sat, 16 Jan 2021 23:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <42de183-3c50-562a-d22-6e61dbbe893f@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 8:46 PM, BALATON Zoltan wrote:
> On Sat, 16 Jan 2021, Richard Henderson wrote:
>> On 1/16/21 4:38 AM, BALATON Zoltan wrote:
>>>
>>> Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with
>>> constant
>>> folding) seems to break PPC emulation for me:
>>>
>>> Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>>> [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
>>> 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90,
>>> ts1=0x7fff8c001510) at
>>> ../tcg/optimize.c:68
>>> 68        return ts_info(ts)->next_copy != ts;
>>
>> I don't replicate this assertion.
>>
>> Interestingly, I replicate a different assertion:
>>
>> qemu-system-ppc: ../qemu/tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n
>> < 512'
>> failed.
>> Aborted (core dumped)
>>
>> What compiler version(s) are you guys using?
> 
> With --enable-debug (that I don't normally use because it makes PPC
> emulation too slow) I get the same assertion:
> 
> qemu-system-ppc: ../tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512'
> failed.
> 
> Thread 3 "qemu-system-ppc" received signal SIGABRT, Aborted.
> 
> (gdb) bt
> #0  0x00007ffff6b29a7a in raise () at /lib64/libc.so.6
> #1  0x00007ffff6b12524 in abort () at /lib64/libc.so.6
> #2  0x00007ffff6b1240f in _nl_load_domain.cold.0 () at /lib64/libc.so.6
> #3  0x00007ffff6b1e9a2 in  () at /lib64/libc.so.6
> #4  0x0000555555c5e7a6 in tcg_temp_alloc (s=0x7fff50000b60) at
> tcg/tcg.c:1210
> #5  0x0000555555c5efcb in tcg_constant_internal (type=TCG_TYPE_I32,
> val=-7401584) at tcg/tcg.c:1436
> #6  0x0000555555c7f921 in tcg_opt_gen_movi
>     (s=0x7fff50000b60, temps_used=0x7ffff51e94c0, op=0x7fff505d6308,
> dst=140734535570720, val=18446744073702150032)
>     at tcg/optimize.c:247
> #7  0x0000555555c81e4b in tcg_optimize (s=0x7fff50000b60) at
> tcg/optimize.c:1178
> #8  0x0000555555c6580a in tcg_gen_code (s=0x7fff50000b60,
> tb=0x7fffb3181a00) at tcg/tcg.c:4490
> #9  0x0000555555c34f9c in tb_gen_code (cpu=0x5555567851e0,
> pc=4287582720, cs_base=0, flags=24576, cflags=-16777216)
>     at accel/tcg/translate-all.c:1952
> #10 0x0000555555c79842 in tb_find (cpu=0x5555567851e0, last_tb=0x0,
> tb_exit=0, cf_mask=0) at accel/tcg/cpu-exec.c:454
> #11 0x0000555555c7a109 in cpu_exec (cpu=0x5555567851e0) at
> accel/tcg/cpu-exec.c:810
> #12 0x0000555555c6e906 in tcg_cpus_exec (cpu=0x5555567851e0) at
> accel/tcg/tcg-cpus.c:57
> #13 0x0000555555cbf18e in rr_cpu_thread_fn (arg=0x5555567851e0) at
> accel/tcg/tcg-cpus-rr.c:217
> #14 0x0000555555ea8531 in qemu_thread_start (args=0x5555567c63d0) at
> util/qemu-thread-posix.c:521
> #15 0x00007ffff6cc004c in start_thread () at /lib64/libpthread.so.0
> #16 0x00007ffff6bf13af in clone () at /lib64/libc.so.6
> 
> Previous one was when configuring without --enable-debug, so maybe it
> depends on compiler flags (-O2 vs. -O0).

--debug enables CONFIG_DEBUG_TCG (the n < 512 assertion).

