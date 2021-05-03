Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC83715B6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:07:59 +0200 (CEST)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYIo-0003xq-2n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1ldYHB-0002by-79
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1ldYH6-000413-2f
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id z6so5477255wrm.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D5YvBfeYVrpkTc0vsHsZkGSWiy264z9sbbOmDWbi/h8=;
 b=tgHcCjR+f2mgiPuTewaaQ70nxIniJeua0Jjwl5916BRftL13c+c9wAkyACQrHsVGLV
 CEk8ldjAs5dMc6IBwiq3kxopATJrp+qicQUNCZq4ezt3sNgX8IcFBIZrA2cXkFcvuEr7
 8LIw9zHwlTg7ySilhyAxfYPaNdyJnZl0bAieiJwwDeXGwE5hEfJXxiP2gfZF3LJHGSQh
 7n09kyO4fe2WPCbfjOM9SMkiX/oq1tb+qLUcmUuJiGyETYfwCDprsjNRl0Cf149zQ8Az
 VG5/01CsqdCFTsUBr1Oc2gycJuX0QrmaovCOjinPghSILXzSse76Ag3kpLFTCZJHAqru
 3flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D5YvBfeYVrpkTc0vsHsZkGSWiy264z9sbbOmDWbi/h8=;
 b=LoGxBg/2cW3dOPCSU8jRsnGMB8vCnGKmzFfd1cpzA99of0Hio+onV3pYCRlibG1Q7p
 gwKELhEgY3aWR82kHzh/JpLbRDUSY60U6N+SD763CJP6ydQhAD7Jlsj9inL4F7GX4Y0k
 HXRBk5K1hiqPqSNsajkmQjCBXp+aFu+94qsaNAmaOjviMY8tLDw4SF8vEnmEdKPFSOGa
 1B242uTAZL6JdzZ5wFAFKcK36bllZeUkt6+XGKmngxVRvewclyFs3GvL5c7r2KQ9Smj2
 bmEZoncugKq5hv661Qku6EtRP0rf0ja+NsXHQ259ziUNZlOgVV7/FHlzlzP9fJ3M1Lti
 SyOg==
X-Gm-Message-State: AOAM530Mip0NDQ+RDUbktu3bePPCSysmfy38ttA4PC0BKOn0NoD586Sh
 gMcHFmnozgO0KS8q/vNNdAadmw==
X-Google-Smtp-Source: ABdhPJx5v+FxjjWs7h234pYwvbNRdjbpzbNp7AJ1VjS4Fe/pF/y12+0AcQK5NU/nhg4T1g0VXfonrw==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr1633668wrr.324.1620047169340; 
 Mon, 03 May 2021 06:06:09 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id c5sm11938505wrs.73.2021.05.03.06.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:06:08 -0700 (PDT)
Subject: Re: [RFC 0/1] Implement AVR WDT (watchdog timer)
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20210502201040.52296-1-mrolnik@gmail.com>
 <20210502201040.52296-2-mrolnik@gmail.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d7e981ec-c8fd-f2ee-f2ba-901ca44c7995@adacore.com>
Date: Mon, 3 May 2021 15:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502201040.52296-2-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: me@xcancerberox.com.ar, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

Le 5/2/21 à 10:10 PM, Michael Rolnik a écrit :
> 1.  Initial implementation of AVR WDT

Nice!

>      There are two issues with this implementation so I need your help here
>      a. when I configure the WDT to fire an interrupt every 15ms it actually happens every 6 instructions

Tested with the maximal prescaler: I've ~8 seconds which seems expected
according to the documentation, I don't know how much time it takes to run
through all the timers and go back in the execution loop, maybe 15ms is just too
low?

>      b. when I specify --icount shift=0 qemu stucks

For me it just crashes:
   qemu-system-avr: Bad icount read

(gdb) bt
#0  icount_get_raw_locked () at ../src/softmmu/icount.c:117
#1  0x00000000004e1801 in icount_get_locked () at ../src/softmmu/icount.c:128
#2  0x00000000004e187a in icount_get () at ../src/softmmu/icount.c:154
#3  0x00000000004bc8ff in cpus_get_virtual_clock () at ../src/softmmu/cpus.c:217
#4  0x00000000006f5bd5 in qemu_clock_get_ns (type=QEMU_CLOCK_VIRTUAL) at 
../src/util/qemu-timer.c:637
#5  0x00000000005422d7 in avr_wdt_reset_alarm (wdt=0xe14040) at 
../src/hw/watchdog/avr_wdt.c:74
#6  0x0000000000542536 in avr_wdt_write (opaque=0xe14040, offset=0, val64=57, 
size=1) at ../src/hw/watchdog/avr_wdt.c:134
#7  0x00000000004cdeaa in memory_region_write_accessor (mr=0xe14360, addr=0, 
value=0x7fff76ae9378, size=1, shift=0, mask=255, attrs=...) at 
../src/softmmu/memory.c:491
#8  0x00000000004ce0cd in access_with_adjusted_size (addr=0, 
value=0x7fff76ae9378, size=1, access_size_min=1, access_size_max=1,
     access_fn=0x4cddc7 <memory_region_write_accessor>, mr=0xe14360, attrs=...) 
at ../src/softmmu/memory.c:552


     if (cpu && cpu->running) {
         if (!cpu->can_do_io) {
             error_report("Bad icount read");
             exit(1);
HERE.
         }

I'm not sure icount is supported on avr?  ie: I don't see any gen_io_start();
in target/avr?

> 
> Michael Rolnik (1):
>    Implement AVR watchdog timer
> 
>   hw/avr/Kconfig                |   1 +
>   hw/avr/atmega.c               |  15 ++-
>   hw/avr/atmega.h               |   2 +
>   hw/watchdog/Kconfig           |   3 +
>   hw/watchdog/avr_wdt.c         | 188 ++++++++++++++++++++++++++++++++++
>   hw/watchdog/meson.build       |   2 +
>   hw/watchdog/trace-events      |   5 +
>   include/hw/watchdog/avr_wdt.h |  47 +++++++++
>   target/avr/cpu.c              |   3 +
>   target/avr/cpu.h              |   1 +
>   target/avr/helper.c           |   7 +-
>   11 files changed, 269 insertions(+), 5 deletions(-)
>   create mode 100644 hw/watchdog/avr_wdt.c
>   create mode 100644 include/hw/watchdog/avr_wdt.h
> 

