Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8499734A9BD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:31:10 +0100 (CET)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnUT-0001Vv-JT
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPnRm-0007sw-5c
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:28:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPnRk-0003Nx-DI
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:28:21 -0400
Received: by mail-ej1-x634.google.com with SMTP id jy13so8726642ejc.2
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vLMn8xhrRdrsk18NxgS6s3dNqz6uk8Tg1YM50czx3I8=;
 b=fpOqzneZ9YZOtgK/iiNdnxxaz3WuSEAvHqyBWL7TIJDSG0qCLUoGKIhgkR4EvTmmEE
 TbTT8tjfpu5LXw0oLquE7WZSowNcpVIo3XvX1R6H3MJ4hAbT9Z6JVEcWjLXTAeX3vp83
 Dm/fZ5eckZmlwn/9TznjM4Am9B3l5UPeIrVl3hxSEVD+EIFXH0nCloMJuqfDPcYdevjW
 VB7HJSm2KnhG5pyRcjMSVxDo5c851lwJQD9olU543oJvE5AwwN1PZR2Otx4xeX1ZNxur
 j1884s/zqt08+vZki+X5cJB9QyOldMIIdmXZOfay1nYcbj6/RjKgqbljgLPY65A7GFnS
 vuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vLMn8xhrRdrsk18NxgS6s3dNqz6uk8Tg1YM50czx3I8=;
 b=KALL1LZppSoU9ytzcDZbuYZ2yYM0bzWQXjIgedU+1wbZrahazv4HvXleAxpXsBorHJ
 86hHgaP7hhktYSka1kD42FvVnUoHkFSdcp5lPQbzAi3RGUZ3QGU/1pfBiSb00OUY2TrO
 3g38hwdidt3Hi2cHQbc439uMBWVXUsPsMUUDH9PEs4nKCAcp5LJ+ppvofC8kz9HJ425c
 NwVMhOhIungXkSELk4TYdh0hyb0kjX9dJxGqLSqByud1bYoKsn15H8xQV7rpXaXxIg4x
 7Q7d6iYtGLAs3YF1bSwKmADgEbvc7ZoRj6mt6n3IIndVazpb2tsdPrBgsLeFruoLFcN6
 PDaA==
X-Gm-Message-State: AOAM5305uG+MuclDWo9F10mGPY6Vd/a7nI3SubK5cgj5Izz7WQAzzh68
 dmxmHw8VggjkXI8idyUiVE/0aVLEnSUOBNd/nGDKDA==
X-Google-Smtp-Source: ABdhPJx4/bmpZQGPuDv4PUGM/orpfHJMPONQq4/4bDtvUvG/pkdMKdLUQ4pd8ceOJmFjWGM/wO9hGP7Fs4LDaICYiqo=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr15463675ejc.407.1616768898526; 
 Fri, 26 Mar 2021 07:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210323161443.245636-1-f4bug@amsat.org>
 <20210323161443.245636-2-f4bug@amsat.org>
In-Reply-To: <20210323161443.245636-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 14:27:49 +0000
Message-ID: <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 23 Mar 2021 at 16:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to remove the bcm2835_fb_reset() call in bcm2835_fb_realize()
> but doing triggers:
>
>   hw/display/bcm2835_fb.c:131:13: runtime error: store to null pointer of=
 type 'uint32_t' (aka 'unsigned int')
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/display/bcm2=
835_fb.c:131:13 in
>   AddressSanitizer:DEADLYSIGNAL
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D195864=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00=
0000000000 (pc 0x555d1d51e6d6 bp 0x7ffd25a31160 sp 0x7ffd25a30fb0 T0)
>   =3D=3D195864=3D=3DThe signal is caused by a WRITE memory access.
>   =3D=3D195864=3D=3DHint: address points to the zero page.
>      #0 0x555d1d51e6d6 in draw_line_src16 hw/display/bcm2835_fb.c:131:30
>      #1 0x555d1dd88d5f in framebuffer_update_display hw/display/framebuff=
er.c:107:13
>      #2 0x555d1d51d081 in fb_update_display hw/display/bcm2835_fb.c:203:5
>      #3 0x555d1ccb93d6 in graphic_hw_update ui/console.c:279:9
>      #4 0x555d1dbc92cb in gd_refresh ui/gtk.c:492:5
>      #5 0x555d1ccef1fc in dpy_refresh ui/console.c:1734:13
>      #6 0x555d1ccee09c in gui_update ui/console.c:209:5
>      #7 0x555d201f3cf2 in timerlist_run_timers util/qemu-timer.c:586:9
>      #8 0x555d201f4061 in qemu_clock_run_timers util/qemu-timer.c:600:12
>      #9 0x555d201f5029 in qemu_clock_run_all_timers util/qemu-timer.c:682=
:25
>     #10 0x555d200c6f6c in main_loop_wait util/main-loop.c:541:5
>     #11 0x555d1f06ba93 in qemu_main_loop softmmu/runstate.c:725:9
>     #12 0x555d1cafe6ae in main softmmu/main.c:50:5
>     #13 0x7f6e6991b081 in __libc_start_main (/lib64/libc.so.6+0x27081)
>     #14 0x555d1ca249ed in _start (/mnt/scratch/qemu/sanitizer_aa64/qemu-s=
ystem-aarch64+0x22999ed)
>
>   AddressSanitizer can not provide additional info.
>   SUMMARY: AddressSanitizer: SEGV hw/display/bcm2835_fb.c:131:30 in draw_=
line_src16
>   =3D=3D195864=3D=3DABORTING
>
> The graphic console timer kicks before the display device is realized.
> By calling qemu_console_resize() in bcm2835_fb_reset() we force the
> creation of the graphic console surface early enough.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2be77bdd3a0..3e63d58e0b2 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -399,6 +399,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
>      s->config =3D s->initial_config;
>
>      s->invalidate =3D true;
> +    qemu_console_resize(s->con, s->initial_config.xres, s->initial_confi=
g.yres);
>      s->lock =3D false;
>  }

I don't really understand how the commit message and the code
change relate. reset happens after realize, and realize
already calls qemu_console_resize(), so how can adding a
call to resize here in reset cause the console surface to
be created any earlier than it already is ?

I also don't understand how the GUI timer can call us before
the device is realized, given that we only register ourselves
via graphics_console_init() in the device realize.

More generally, I think we should probably start by figuring out
what the requirements on graphics devices vs the UI layer
are or should be. Is it possible to get the UI layer to
not start calling into graphics devices until after the
system has been reset for the first time, for instance?
Gerd, do you have any views here ?

thanks
-- PMM

