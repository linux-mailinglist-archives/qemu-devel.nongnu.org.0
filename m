Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7AE3087D5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:32:40 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5R4x-0005Oi-4a
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5R2a-0004Oc-IE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:30:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5R2Y-00029e-SE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:30:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id c127so6730905wmf.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TYG3s7aMAuLa4SiAs3xSN+s+PNUtIC35yEb0MYdU3Oo=;
 b=U2pZfILDbJ/oTYlIn8eBS7AWfCh3kyEPMRXl36aDJWCJn2ZNm77u7WFQ6veIlthFPl
 0Ohk84V+gbo1oMUmiIBEA8ACl3zRkWR2JsxnrIEy4hQOYJhY5DggcVqMYDdRCSXwUkPM
 +m2G64GpVTHhcP7IT+9PkO6fB7OnIeAbXBJu0/4B2PGGFGjqnUYZf+OSb9noI60Fmepo
 rZBmUkbkY/RTRm1UiMboblKIfvssc9hviDDhUMeJm7cXmCvT4UAIgHxe5g7zljXuYnFj
 qtBTiG3oULttsET5g2MYfDchCYmXuh4Wvynq2ELmEmCjj0EnSiu+dmnq0dr2uBkv81k5
 0VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TYG3s7aMAuLa4SiAs3xSN+s+PNUtIC35yEb0MYdU3Oo=;
 b=mtS57yH4AfcNV3mD9mQUUMhmG+8VE8OWIq4OvXrf2Bxz9ysYmGu27p1/wQyiTDOyn8
 CPfZ4VMPH1/xcV3N73P88R6QZ+TDi1fWKU0bDqk9lWxuSyrVDZAklNy1taEO/jqf813U
 i16+kRwTYChPJxuZhtcaAWtxw250TTx2ceSCIuNe6R3Fi9GDlpr9KXNEAv4K6JhTNd0y
 /nkepWjjUXmrLPx7FUK2kNCe9fytYNhEU0OGQnn8M6afGlVy+BoodZz3JkB/KsH2uw80
 flXTvCPeKj4BQwDsD+XY7/1oE2Q3Idu/TWTgnSx99eEsh7g6+lMISydBxSHNDYrvE2ST
 OmCQ==
X-Gm-Message-State: AOAM5303czdQXdTgg7EDlMuNKzmP3OTC5IjvW/TH8cIZwv+vsFEzBaiz
 YUNnqbbHfeP7u22M742FtJQ=
X-Google-Smtp-Source: ABdhPJw19NlWUNcCOmQTjbFgn3/SmbxSeuJ1pxEYbyY98QS0rXgpCYeQHEvhPAyOZFyISlJgwE1A+g==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr2645226wma.29.1611916208834; 
 Fri, 29 Jan 2021 02:30:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e12sm11058702wrs.67.2021.01.29.02.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:30:07 -0800 (PST)
Subject: Re: [Bug 1913669] [NEW] FPE in npcm7xx_adc_convert
To: Bug 1913669 <1913669@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161188777664.14361.8613380647852564408.malonedeb@wampee.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ed66733-957f-2eed-3839-f9b97a681034@amsat.org>
Date: Fri, 29 Jan 2021 11:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161188777664.14361.8613380647852564408.malonedeb@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing supporters:

$ ./scripts/get_maintainer.pl -f hw/arm/npcm7xx.c
Havard Skinnemoen <hskinnemoen@google.com> (supporter:Nuvoton NPCM7xx)
Tyrone Ting <kfting@nuvoton.com> (supporter:Nuvoton NPCM7xx)

On 1/29/21 3:36 AM, Alexander Bulekov wrote:
> Public bug reported:
> 
> Reproducer:
> cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
> -accel qtest -qtest stdio
> write 0xf000c000 0x4 0x02400200
> clock_step
> EOF
> 
> Trace:
> ../hw/adc/npcm7xx_adc.c:60:51: runtime error: division by zero
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/adc/npcm7xx_adc.c:60:51 in
> AddressSanitizer:DEADLYSIGNAL
> =================================================================
> ==717962==ERROR: AddressSanitizer: FPE on unknown address 0x55901aa6e67a (pc 0x55901aa6e67a bp 0x7fff0ac087e0 sp 0x7fff0ac087a0 T0)
> #0 0x55901aa6e67a in npcm7xx_adc_convert /hw/adc/npcm7xx_adc.c:60:51
> #1 0x55901aa6e67a in npcm7xx_adc_convert_done /hw/adc/npcm7xx_adc.c:106:15
> #2 0x55901ceb847e in timerlist_run_timers /util/qemu-timer.c:574:9
> #3 0x55901c05d804 in qtest_clock_warp /softmmu/qtest.c:356:9
> #4 0x55901c059781 in qtest_process_command /softmmu/qtest.c:752:9
> #5 0x55901c051b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
> #6 0x55901c8a2286 in fd_chr_read /chardev/char-fd.c:68:9
> #7 0x7fa5c43f1aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x51aae)
> #8 0x55901cefd363 in glib_pollfds_poll /util/main-loop.c:232:9
> #9 0x55901cefd363 in os_host_main_loop_wait /util/main-loop.c:255:5
> #10 0x55901cefd363 in main_loop_wait /util/main-loop.c:531:11
> #11 0x55901bfb8599 in qemu_main_loop /softmmu/runstate.c:721:9
> #12 0x55901a2451fd in main /softmmu/main.c:50:5
> #13 0x7fa5c3e96cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
> #14 0x55901a198bc9 in _start (/home/alxndr/Development/qemu/build/qemu-system-aarch64+0x3350bc9)
> 
> AddressSanitizer can not provide additional info.
> SUMMARY: AddressSanitizer: FPE /hw/adc/npcm7xx_adc.c:60:51 in npcm7xx_adc_convert

The ADC realization in npcm7xx_realize is incomplete, vref/iref
properties are not set, thus 0.

Looking at the qtests (npcm7xx_adc-test.c) these are set via
'qom-set' QMP calls.

Assuming vref/iref are constant on a board, shouldn't we have
a npcm7xx_adc_realize() method checking these properties are
set, returning a proper error message if not?

Thanks,

Phil.

