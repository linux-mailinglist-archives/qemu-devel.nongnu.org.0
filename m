Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369533461CC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:48:54 +0100 (CET)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiKz-0003Og-9G
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOi5h-0006Yf-2a; Tue, 23 Mar 2021 10:33:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOi5e-000273-1E; Tue, 23 Mar 2021 10:33:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id 61so20972633wrm.12;
 Tue, 23 Mar 2021 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gh2VXji5Y1oI8vBGS/k6N5w9Quw/ru4X7bPOp8UR7Bc=;
 b=C4PKqFrDLAxK3F254ATi1vvmwnXZQYdkQMiSXspKmj5BJJBQ/bOV/PpzRK/KEiSUb4
 SYQwflTQdhAO9tHiXtC9dZm8DqYgqJlrke9QVtFQ1va8VOvMkGhoO1VlggGRAZCmT0eX
 F3rIsoVmmUfc2U3OYf6L07nyIlEmEJxkqDrEpSozxWMN/lnZ1lo8utDHBsQJG2+ELAB4
 hOs7HKu/I/FHTmcL/emH9dTcRXrnnKRRRSF+WT2nGDDnI61ntrNGzdb8VR9fMnxDOZER
 WFk5cqFkGjoSslsQSuhejVIHPzYI9jNBMQm1gF0Tzyuo+vl5o6O3uelZPhPsEWWjghll
 NJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gh2VXji5Y1oI8vBGS/k6N5w9Quw/ru4X7bPOp8UR7Bc=;
 b=mm/5hTNfbeceEFM1b2rxqRvPUCYtZCXYM8+mUhWFjUcCNEUzZn+hl3eUq+dxhV8ra+
 0Y/x3aW7J2Voc+SRCzr7C2JgLod4MmHzlUUJ2wEw9YmZo4kFC+0XZsWNTiksW0d4caBv
 Q2MP+vZGOJYqJmw7DFLytzU0x7tprG42xfdXzLR7+bY2N5QnK9IzyDLmGik5Vd6Dlq+K
 db2xDoza+6oZcTlf1WXiRdIhLteWbEuURTcyYjU5YVw0X92+rBUXwOIaCnCf7TQoAKkD
 akOFVhrMWp5svfEIEjHftzZKqbtmdlCBq90M3CGDlusfFam7yqIi3ASH6OiqpwKB8NeO
 k8qQ==
X-Gm-Message-State: AOAM532z9hWeZ/hZXdWS7uKTm+iD0Wd8HRxlSFtHKLlgE6ltWYD5OBWV
 rnR7qj7RMZ+9t2pGScebaew=
X-Google-Smtp-Source: ABdhPJxqnMOuxW1auTaxWgk/ekeyiJ+Uwb+CVPrTTWHYowSavcdBxQmaGgnUe10twPvHgLLDEnvUqQ==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr4340509wrp.230.1616509979636; 
 Tue, 23 Mar 2021 07:32:59 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm27338339wrw.63.2021.03.23.07.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 07:32:58 -0700 (PDT)
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210313170131.2116837-1-f4bug@amsat.org>
 <CAFEAcA-8agmT_SpO7MYmWX19XhKrAz9TCgiCzo4S-uL-V4Pf=Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2628b2a4-3a6e-7dd6-8309-4ae1cc3d8570@amsat.org>
Date: Tue, 23 Mar 2021 15:32:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8agmT_SpO7MYmWX19XhKrAz9TCgiCzo4S-uL-V4Pf=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 1:27 PM, Peter Maydell wrote:
> On Sat, 13 Mar 2021 at 17:01, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When QDev objects have their DeviceReset handler set, they
>> shouldn't worry about calling it at realization stage (it
>> is handled by hw/core/qdev.c::device_set_realized).
>>
>> Remove the pointless/confusing bcm2835_fb_reset() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/display/bcm2835_fb.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
>> index 2be77bdd3a0..445e8636770 100644
>> --- a/hw/display/bcm2835_fb.c
>> +++ b/hw/display/bcm2835_fb.c
>> @@ -424,8 +424,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
>>      s->dma_mr = MEMORY_REGION(obj);
>>      address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory");
>>
>> -    bcm2835_fb_reset(dev);
>> -
>>      s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
>>      qemu_console_resize(s->con, s->config.xres, s->config.yres);
>>  }
> 
> With this patch applied, I get a clang-sanitizer-build failure
> in "make check":
> 
> $ QTEST_QEMU_BINARY=./build/arm-clang/qemu-system-arm
> build/arm-clang/tests/qtest/test-hmp
> /arm/hmp/raspi0: ../../hw/display/bcm2835_fb.c:131:13: runtime error:
> store to null pointer of type 'uint32_t' (aka 'unsigned int')
> UndefinedBehaviorSanitizer:DEADLYSIGNAL
> ==23006==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
> 0x000000000000 (pc 0x5599adaf839b bp 0x000000000000 sp 0x7ffd81ee77a0
> T23006)
> ==23006==The signal is caused by a WRITE memory access.
> ==23006==Hint: address points to the zero page.
>     #0 0x5599adaf839a in draw_line_src16
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display/bcm2835_fb.c:131:30
>     #1 0x5599add82e8f in framebuffer_update_display
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display/framebuffer.c:107:13
>     #2 0x5599adaf7844 in fb_update_display
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/display/bcm2835_fb.c:203:5
>     #3 0x5599ad9e7800 in graphic_hw_update
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../ui/console.c:279:9
>     #4 0x5599aea450d3 in aio_bh_poll
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async.c:164:13
>     #5 0x5599ae9e5d73 in aio_poll
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/aio-posix.c:659:17
>     #6 0x5599ad873d2c in handle_hmp_command
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../monitor/hmp.c:1117:9
>     #7 0x5599ae368594 in qmp_human_monitor_command
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../monitor/misc.c:135:5
>     #8 0x5599ae996101 in qmp_marshal_human_monitor_command
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/qapi/qapi-commands-misc.c:266:14
>     #9 0x5599ae9de39c in do_qmp_dispatch_bh
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../qapi/qmp-dispatch.c:131:5
>     #10 0x5599aea450d3 in aio_bh_poll
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async.c:164:13
>     #11 0x5599ae9e332b in aio_dispatch
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/aio-posix.c:381:5
>     #12 0x5599aea4799a in aio_ctx_dispatch
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/async.c:306:5
>     #13 0x7f74a0a35416 in g_main_context_dispatch
> (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x4c416)
>     #14 0x5599ae9dc8f4 in glib_pollfds_poll
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-loop.c:231:9
>     #15 0x5599ae9dc8f4 in os_host_main_loop_wait
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-loop.c:254
>     #16 0x5599ae9dc8f4 in main_loop_wait
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../util/main-loop.c:530
>     #17 0x5599ae42adf6 in qemu_main_loop
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../softmmu/runstate.c:725:9
>     #18 0x5599ad5bbf0a in main
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/../../softmmu/main.c:50:5
>     #19 0x7f749bcf3bf6 in __libc_start_main
> /build/glibc-S9d2JN/glibc-2.27/csu/../csu/libc-start.c:310
>     #20 0x5599ad59c519 in _start
> (/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-arm+0x1335519)
> 
> UndefinedBehaviorSanitizer can not provide additional info.
> ==23006==ABORTING
> Broken pipe
> Aborted (core dumped)
> 
> The patch is correct in that the device shouldn't be resetting itself
> in realize, but this is presumably masking a bug elsewhere in the device
> that we need to fix first before we can make this change.
> 
> It looks as if what happens is that the GraphicHwOps methods can
> get called before the device is reset. I don't know if that is
> something we can arrange to have not happen -- certainly it's
> a bit confusing to have to deal with the device not having been
> reset yet -- or if implementations just have to deal with it.

Thanks for the report.

I don't understand well how graphic works, but I noticed
bcm2835_fb_reconfigure() calls qemu_console_resize() ->
qemu_create_displaysurface() -> pixman_image_create_bits(),
so then when framebuffer_update_display() is called,
surface_data() is not NULL.

So we can trigger the qemu_create_displaysurface() call by
replacing the open-coded bcm2835_fb_reconfigure() in reset():

-- >8 --
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 445e8636770..d7a44771c44 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -396,10 +396,7 @@ static void bcm2835_fb_reset(DeviceState *dev)

     s->pending = false;

-    s->config = s->initial_config;
-
-    s->invalidate = true;
-    s->lock = false;
+    bcm2835_fb_reconfigure(s, &s->initial_config);
 }
---

I'll send a patch.

