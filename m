Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56EA62C7B9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNGD-0002oq-0f; Wed, 16 Nov 2022 13:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovNG9-0002oW-Ms
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:35:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovNG7-0005TY-Mo
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:35:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so2130595wmb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJpN7lsfPfOCg1p6uwC/6QQV4QcyNVqT4EIUAV0HIuA=;
 b=XramKMFM3lqasBKBTWBDt5hvWCsjo0mO+bKcSra3bl4bPjad+YcTX3KW+Y8FOa7GP3
 5+RA/pW9bPY5l5draI11LiFoQbDmJDp2EJPTw5y8mmCMnLnMZ+Qv/pUgucjOjzi4l9jS
 jla6qaWDttFBbfJaZqeX/VOZcWEDf+w/t6hZ1o9Sx+bich8Hhnv/HMrQF04jRu+AD7sk
 zfZgtvyxmeoy+5omdVyL6Zk2iwCurY8QrgD1VP0C8Y8lh3uQ6MroPC85rlbE30oyefUM
 /p7nJt1VoKUqApkZ6EDnbZ8pxu68gj2RVigcOGaCEL5SmrvMW+Y2GkCX3tOmYGGBAiH4
 QRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PJpN7lsfPfOCg1p6uwC/6QQV4QcyNVqT4EIUAV0HIuA=;
 b=jv2Q0lvb+6VV3Ps+0APfCrvf2OA33sLysDyGuCac3d8hARzXLFmoSG5uRYTvpg09+9
 xqXGvOwT/FCFkedWGUsa1BNEcmCf6R57ShrtuCZTEK0OJLZYT+Oh6Wc6UVPX6P0LZTsD
 AZQsamrRa5M3NDR7VJkBQdkgGdPvwTBEj0Y4gFu3jI6z1C9CoDD+Nk0GsW5tEa18c7T6
 PazFuv+hpw1+7DZXX0x08wu/iZt+a9tWVHJOvNdtVC9x0PF++anHqOI9oPGC17tZdLAe
 5F6pfqPKS6WAmy2VUh04la5ZK2pDnVvoLoX863vpDmD7sPpIx4L+niWU9AwVXLlCCtLi
 ZYAA==
X-Gm-Message-State: ANoB5pkuGCiI4wuyRVzVzLMEz3L6tMYTllxjIZLeKBkJUQtERLDfDmyJ
 TxkLPd1r3/NzcunmyskWSjSG/Q==
X-Google-Smtp-Source: AA0mqf5az4EOpTfmnQG5kC8FRElVSWqWLrOCsp79uhuFjby6f4LOcY2c/3M64WsG8T98mEFI4YS09A==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr3092939wmb.153.1668623737104; 
 Wed, 16 Nov 2022 10:35:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b4c979e6bcsm3351506wms.10.2022.11.16.10.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:35:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3829A1FFB7;
 Wed, 16 Nov 2022 18:35:36 +0000 (GMT)
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
 <CAJSP0QVigz1nDq7JO2ABquzReGWkqY5dwXKrEaufw+FXnvsvkg@mail.gmail.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Huacai Chen <chenhuacai@kernel.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philippe.mathieu-daude@linaro.org>, John Snow <jsnow@redhat.com>
Subject: Failure analysis (was Re: [PULL for 7.2 00/10] testing and doc
 updates)
Date: Wed, 16 Nov 2022 18:20:10 +0000
In-reply-to: <CAJSP0QVigz1nDq7JO2ABquzReGWkqY5dwXKrEaufw+FXnvsvkg@mail.gmail.com>
Message-ID: <87r0y29287.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> This pull request causes the following CI failure:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3328449477
>
> I haven't figured out the root cause of the failure. Maybe the pull
> request just exposes a latent failure. Please take a look and we can
> try again for -rc2.

OK after a lot of digging I've come to the following conclusion:

  * the Fuloong 2E machine never enables the FIFO on the 16550 (s->fcr & UA=
RT_FCR_FE)
  * as a result if qemu_chr_fe_write(&s->chr, &s->tsr, 1) fails with -EAGAIN
    - a serial_watch_cb is queued
    - s->tsr_retry++
  * additional serial_ioport_write's overwrite s->thr
  * the console output gets corrupted

You can see the effect by comparing the serial write and xmit values:

  =E2=9E=9C  grep serial_write alex.log | cut -d ' ' -f 6 | xxd -r -p | hea=
d -n 10
  [    0.000000] Initializing cgroup subsys cpuset
  [    0.000000] Initializing cgroup subsys cpu
  [    0.000000] Initializing cgroup subsys cpuacct
  [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.de=
bian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 =
(2018-05-08)
  [    0.000000] memsize=3D256, highmemsize=3D0
  [    0.000000] CpuClock =3D 533080000
  [    0.000000] bootconsole [early0] enabled
  [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
  [    0.000000] FPU revision is: 00000501
  [    0.000000] Checking for the multiply/shift bug... no.
  =F0=9F=95=9918:27:17 alex@zen:qemu.git/builds/all  on =EE=82=A0 pr/141122=
-misc-for-7.2-1 [$!?=E2=87=95]=20
  =E2=9E=9C  grep serial_xmit alex.log | cut -d ' ' -f 2 | xxd -r -p | head=
 -n 10
  [    0.000000] Initializing cgroup subsys cpuset
  [    0.000000] Initializing cgroup subsys cpu
  [    0.000000] Initializing cgroup subsys cpuacct
  [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.de=
bian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 33 0.000000] boot=
console [early0] enabled
  [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
  [    0.000000] FPU revision is: 00000501
  [    0.000000] Checking for the multiply/shift bug... no.
  [    0.000000] Checking for the daddiu bug... no.
  [    0.000000] Determined physical RAM map:
  [    0.000000]  memory: 000

As a result the check for the pattern fails:

        console_pattern =3D 'Kernel command line: %s' % kernel_command_line
        self.wait_for_console_pattern(console_pattern)

resulting in a timeout and test fail.

In effect the configuration makes the output dependent on how fast the
avocado test can drain the socket as there is no buffering elsewhere in
the system. The changes in:

  Subject: [PULL 02/10] tests/avocado: improve behaviour waiting for login =
prompts

makes this failure more likely to happen - I think because the .peek() and
.readline() behaviour have different buffering strategies. Options
include:

  - enable the 16550 FIFO for the Loognson kernel (command line option?)
  - increase the buffering of the python socket.socket() code

I can get it to pass by shuffling the time.sleep() and a few other
checks around but that seems flaky at best.

--=20
Alex Benn=C3=A9e

