Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00334B28C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 00:15:36 +0100 (CET)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPvfz-0004Ff-7P
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 19:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPve8-0003Kv-5G; Fri, 26 Mar 2021 19:13:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPve6-0003RQ-M1; Fri, 26 Mar 2021 19:13:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id 12so3722812wmf.5;
 Fri, 26 Mar 2021 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EVbtssKqg+FCT9xpS2SC0d/PsgZ7a3X+eLgulFz/9gA=;
 b=MRl0DMZWdeSwZpw9jRqQyru+s4MS4kmny+UPGgvnKy46o/qB8RUf7FXgeOFzebGQhI
 XFtneMj3FhBsDjnRfUWPE/bbQ57tQeE+qFbVg+L8oyAf3i6LPejSyeCaQBFaHSapqIIw
 9O5B7a8ciP/iPpcyfOrBvUepvM9Ou0xrCQxWAQxcWnEylHCYYT5WxydnJAS78LDFqVae
 AY7P+RS+rLnuymHoGA+9YduJFqvQfgCetXTrg+750svuef5yP7MkQXb9wlgvwVCx31X8
 JCXbdQU+KwfYzNRPvaRPbjKRebWpg8jSYrwOsCtSTTpLVwIt5xakBh2efr2XZWog1Db0
 /kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EVbtssKqg+FCT9xpS2SC0d/PsgZ7a3X+eLgulFz/9gA=;
 b=sbXd1B72tPXxx7T6RrLrlaMAZyHUFZPdmgPvdpC8WOyb9Lo1Bm5IAYQqv7BitqyvfJ
 b21Ra9Dp3c+hVlxHcnAkmnCLOBfyTkuXIVB53+fc/dn03na6vVY4IzsQjtdpXGX/ODHr
 ItoV+Ff4+qFblmVm1o10qDOFqdG1BHrV3b+E6jHFu5mlOLqR/9QH/6ssFMJOzv2468hH
 oalElbCSBup54ZySjx84QVZc7pbFt57jrkk8D+5HMQUjbopPiZlgixpt7xtBAH+XHu/H
 7kM+qGLJDDGOFFRBxc9MqE1DlUpw6tJ39l4+gxGS/yH2R945D7AtMB61DLOKj6W77dHK
 +c0g==
X-Gm-Message-State: AOAM531SGIgywMWchaNFzY+huW1gnt3S8ueOkG8cAV9aKTJUDVSDXkvg
 cHs0Gr+Gb/8U/bTk0YiEMBY=
X-Google-Smtp-Source: ABdhPJzEoOe/fBOG7SSqf8/REGgNCe/xndNhgbPvR1zcQgYy8skIs8oMsI2ZMUpmhbl4ryGusH6evg==
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr14241603wmc.89.1616800416650; 
 Fri, 26 Mar 2021 16:13:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 9sm12868889wmf.13.2021.03.26.16.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 16:13:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210323161443.245636-1-f4bug@amsat.org>
 <20210323161443.245636-2-f4bug@amsat.org>
 <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2953bd3c-bdde-0a51-8938-eb3fa4808213@amsat.org>
Date: Sat, 27 Mar 2021 00:13:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 3:27 PM, Peter Maydell wrote:
> On Tue, 23 Mar 2021 at 16:14, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We want to remove the bcm2835_fb_reset() call in bcm2835_fb_realize()
>> but doing triggers:
>>
>>   hw/display/bcm2835_fb.c:131:13: runtime error: store to null pointer of type 'uint32_t' (aka 'unsigned int')
>>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/display/bcm2835_fb.c:131:13 in
>>   AddressSanitizer:DEADLYSIGNAL
>>   =================================================================
>>   ==195864==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000000 (pc 0x555d1d51e6d6 bp 0x7ffd25a31160 sp 0x7ffd25a30fb0 T0)
>>   ==195864==The signal is caused by a WRITE memory access.
>>   ==195864==Hint: address points to the zero page.
>>      #0 0x555d1d51e6d6 in draw_line_src16 hw/display/bcm2835_fb.c:131:30
>>      #1 0x555d1dd88d5f in framebuffer_update_display hw/display/framebuffer.c:107:13
>>      #2 0x555d1d51d081 in fb_update_display hw/display/bcm2835_fb.c:203:5
>>      #3 0x555d1ccb93d6 in graphic_hw_update ui/console.c:279:9
>>      #4 0x555d1dbc92cb in gd_refresh ui/gtk.c:492:5
>>      #5 0x555d1ccef1fc in dpy_refresh ui/console.c:1734:13
>>      #6 0x555d1ccee09c in gui_update ui/console.c:209:5
>>      #7 0x555d201f3cf2 in timerlist_run_timers util/qemu-timer.c:586:9
>>      #8 0x555d201f4061 in qemu_clock_run_timers util/qemu-timer.c:600:12
>>      #9 0x555d201f5029 in qemu_clock_run_all_timers util/qemu-timer.c:682:25
>>     #10 0x555d200c6f6c in main_loop_wait util/main-loop.c:541:5
>>     #11 0x555d1f06ba93 in qemu_main_loop softmmu/runstate.c:725:9
>>     #12 0x555d1cafe6ae in main softmmu/main.c:50:5
>>     #13 0x7f6e6991b081 in __libc_start_main (/lib64/libc.so.6+0x27081)
>>     #14 0x555d1ca249ed in _start (/mnt/scratch/qemu/sanitizer_aa64/qemu-system-aarch64+0x22999ed)
>>
>>   AddressSanitizer can not provide additional info.
>>   SUMMARY: AddressSanitizer: SEGV hw/display/bcm2835_fb.c:131:30 in draw_line_src16
>>   ==195864==ABORTING
>>
>> The graphic console timer kicks before the display device is realized.
>> By calling qemu_console_resize() in bcm2835_fb_reset() we force the
>> creation of the graphic console surface early enough.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/display/bcm2835_fb.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
>> index 2be77bdd3a0..3e63d58e0b2 100644
>> --- a/hw/display/bcm2835_fb.c
>> +++ b/hw/display/bcm2835_fb.c
>> @@ -399,6 +399,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
>>      s->config = s->initial_config;
>>
>>      s->invalidate = true;
>> +    qemu_console_resize(s->con, s->initial_config.xres, s->initial_config.yres);
>>      s->lock = false;
>>  }
> 
> I don't really understand how the commit message and the code
> change relate.

The commit message is inconsistent, indeed. I tried to justify
the next patch.

> reset happens after realize,

Yes, so this patch is incorrect.

> and realize
> already calls qemu_console_resize(), so how can adding a
> call to resize here in reset cause the console surface to
> be created any earlier than it already is ?
> 
> I also don't understand how the GUI timer can call us before
> the device is realized, given that we only register ourselves
> via graphics_console_init() in the device realize.
> 
> More generally, I think we should probably start by figuring out
> what the requirements on graphics devices vs the UI layer
> are or should be.

Agreed.

> Is it possible to get the UI layer to
> not start calling into graphics devices until after the
> system has been reset for the first time, for instance?

I have no clue, so deferring to Gerd.

> Gerd, do you have any views here ?
> 
> thanks
> -- PMM
> 

