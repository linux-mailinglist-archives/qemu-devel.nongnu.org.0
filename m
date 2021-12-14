Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2C474C7C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:09:48 +0100 (CET)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxE7Q-0003IW-3Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE4j-0001t0-To
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:07:01 -0500
Received: from [2607:f8b0:4864:20::a2c] (port=45956
 helo=mail-vk1-xa2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE4h-00022P-W6
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:07:01 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id m19so13203202vko.12
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r+Z9/RzpJIt3pY0dK8CFbdkGETru+7nMJCbEWQJZMaI=;
 b=FYyLlDvcEbreeuzFsrs5vwICV0a+6GVLIRJcA+kbEMAfgyZMyBQ/z9OAjHRpk7ZASm
 1KPsyUn+LHI8G3caOCmVlLNGb2OBCalaW7knvkfDYnsr86xpEntwz7j/aefauvEMYv7G
 K+3HEovOtH9sJitYuyvhd4+XiCWr4l0sAiPEQQvHBtDVJXWCg+cK9MeGk7vySFMlejqU
 La71Su37raa8p3gjSGDnMhvJ+3Q9Xw+lyy75tKAzImL532Ca2K2i0SEMWj09E2j2k1wc
 H5TCfG4iffAjVFpyHlIgWqQIpsHYasspfT8PHS1hEODRCSwQYsiaKj3iJMN5/KpvqGJ9
 sV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r+Z9/RzpJIt3pY0dK8CFbdkGETru+7nMJCbEWQJZMaI=;
 b=3VA++xpSKNZElb4S4p9WZ0PjJ/0Lpc534S1jOJqF+umjoME4zadXsqIAZwd8cSrSBA
 0n4E+9uq84o9o0OiCcw5c0UBpaHq71+KJgcXlnkoy+KClh3thDFCCdX/jaCHzjkwTqmv
 5T9ytvpyZ0QLzIxs3dKUL7lG/6kQH0Dq9RgbHHxzZnYxTunlk0k5pHWY9vP9U5liJj3L
 VE7BzW1tdI6D5w1mNFi/JySwA6DgpYrsJ7ncqBcbBqL7EjJ/tGXrVYpLjBOyKQ2PfbI8
 Ae+Zik171d2vOQuVd8GksNEhC7ZTV18gsv4yCGwka7+QM05PuKGJl2TcfOIlvBD64CLv
 3i+g==
X-Gm-Message-State: AOAM532B5ld4/FsYm5iaO5IS3NLjq8xUBuBheXIqA/EsO9ilidQDkZCg
 ozRjzZIlZ8KsK2stJZYaV3sueZnecfnKGw==
X-Google-Smtp-Source: ABdhPJxG6BXjxy7ali1DNRrc0tQZoAwkpXH4xxtLF/8xB4UV5xstg0/6+4vxMQmWZIvTFI+/MDaBLA==
X-Received: by 2002:a05:6122:a13:: with SMTP id 19mr1608383vkn.3.1639512416528; 
 Tue, 14 Dec 2021 12:06:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v81sm178279vsv.14.2021.12.14.12.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 12:06:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96EFF1FF96;
 Tue, 14 Dec 2021 20:06:53 +0000 (GMT)
References: <CADHXGBzqDHgvFJFzk-QydLUyzw00Rgnbw717bZ3hMyFPwHziaw@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?15LXmdeQ?= <avraham.guy@gmail.com>
Subject: Re: error in qemu mac install ..
Date: Tue, 14 Dec 2021 20:05:37 +0000
In-reply-to: <CADHXGBzqDHgvFJFzk-QydLUyzw00Rgnbw717bZ3hMyFPwHziaw@mail.gmail.com>
Message-ID: <87lf0ngdcy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


=D7=92=D7=99=D7=90 <avraham.guy@gmail.com> writes:

> Hey
>
> trying to install for the 1st time and i got a message to contact you.
>
> also, the mouse is caught by the qemu but not moving ... so not possible =
to format the hdd .. and continue.
>
> guy@guyaHP:~/Downloads/macOS-Simple-KVM-master$ sudo ./basic.sh

without seeing the script it is hard to see how QEMU is getting
launched. We need to know host OS and the command line options you are
using.

> Home directory not accessible: Permission denied
> pulseaudio: pa_context_connect() failed
> pulseaudio: Reason: Connection refused
> pulseaudio: Failed to initialize PA contextaudio: Could not init `pa' aud=
io driver
> Home directory not accessible: Permission denied
> ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_card_driver=
 returned error: No such file or directory
> ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat retu=
rned error: No such file or directory
> ALSA lib confmisc.c:1246:(snd_func_refer) error evaluating name
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_refer retur=
ned error: No such file or directory
> ALSA lib conf.c:5007:(snd_config_expand) Evaluate error: No such file or =
directory
> ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_card_driver=
 returned error: No such file or directory
> ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat retu=
rned error: No such file or directory
> ALSA lib confmisc.c:1246:(snd_func_refer) error evaluating name
> ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_refer retur=
ned error: No such file or directory
> ALSA lib conf.c:5007:(snd_config_expand) Evaluate error: No such file or =
directory
> ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> audio: Failed to create voice `dac'
> unknown keycodes `(unnamed)', please report to qemu-devel@nongnu.org
> ./basic.sh: line 30: -device: command not found

that looks like a continuation line got missed in the script.

>
> Thank you
>
> Guy


--=20
Alex Benn=C3=A9e

