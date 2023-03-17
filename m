Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE56BEDD4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCjQ-00075f-AG; Fri, 17 Mar 2023 12:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdCjO-00074x-0y
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:15:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdCjM-0007Kq-0a
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:15:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id j2so4925948wrh.9
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679069697;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+ZMtt2tNQNA7w5Hxe1OjrVVL6nDbw/jp+A5wl86/aE=;
 b=OtLuND8wUCOdMCeCSPpjPCISeauWMbM5zf+pfaCASm06tGhcI4nnffE50aT1uGg3jj
 ovYqmSMvkAPCxnuiGOQHQgCxCZeiEJEtxc4Bg/Bh/MhFDKKfNSrksg3i0jRm8IKrfEmR
 97S+mT2d7TyZe8d4+Ksz9V735NGfcyBPhWteGgSq0epS7tQkQxWwdQNKBmiVQvdLL93j
 0o7xOVcUXsxRHWj4c+ncOPuMbWoCxeMn/jMeV0uL72ShkQA5ia6VdfD7gA5uwW35rDZH
 h0I2NS2tBTz+6dKa+QMvv1mNuVRXudC+Hhk7k72iPbtQSPbUgdYdhulECxOwODlkBxWi
 YLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679069697;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/+ZMtt2tNQNA7w5Hxe1OjrVVL6nDbw/jp+A5wl86/aE=;
 b=fYg5KJCeBSEVuUnTpg/0+ftLfkg4sBOLKbkIzyn1fkDiMa37k5hBXFKfHaV9S62tn3
 X09U/8Lvx1BZvmX9xnvyYZNdAi49xgQBpNexFhTodrDfAOw1A1FlX3jxCOiGUImQXTLE
 9Kb96CTuy85KPyxa6q6gu/fKM+aq/8D9fjUbAjy40N8934P0+ON8QajputBrVsbdFFvz
 9SnsuUt9S6DikBEhKS/WuLqiCfZTPnLe9l1OZBcE+sg5ut5gKh0gKKamqzak1VCwd+lD
 ywLrTEdInI+QrEPattFWP2NfM3c8BoHqm99R0cJDdmkcGplCJ7Aozj9+bgINhbt+qIkK
 4qeA==
X-Gm-Message-State: AO0yUKUNHNkfjDBqPItuJKMehi4cVAvMr2rwpRn1Nv/YJwO9NyeUMW3M
 yOwtQni5O7pt9PIXcemp280/mg==
X-Google-Smtp-Source: AK7set+OMnrvtih7O4O01XbtsY4TcpuNvxytzbt2AitwwDgp32YeS2etvGBT79MtszPTPqsQaRghkg==
X-Received: by 2002:a5d:4ed1:0:b0:2ce:a944:2c6a with SMTP id
 s17-20020a5d4ed1000000b002cea9442c6amr7005974wrv.70.1679069697633; 
 Fri, 17 Mar 2023 09:14:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u13-20020adfdb8d000000b002d2b117a6a6sm2295879wri.41.2023.03.17.09.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 09:14:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 076B81FFB7;
 Fri, 17 Mar 2023 16:14:57 +0000 (GMT)
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Abhishek Singh Dagur <abhishek@drut.io>
Cc: openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
Date: Fri, 17 Mar 2023 16:06:43 +0000
In-reply-to: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
Message-ID: <87mt4b73sv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Abhishek Singh Dagur <abhishek@drut.io> writes:

(cc aspeed maintainers)

> Hi all,
>
> We are using obmc-phosphor-image on an ast2500 board which is trying to c=
ommunicate with other devices
> over serial port /dev/ttyS2.
> As we are trying to emulate the machine on qemu we need to redirect the r=
equest to the host machine so
> that it can handle this request and return appropriately.
> We tried using QEMU options like -serial ,-chardev but still not the
> concrete way we get to do it.

Yeah I'm afraid its non-obvious, certainly for built in serial ports.
Try something like:

  ./qemu-system-aarch64 -M ast2500-evb \
    -serial null -serial null -serial chardev:myserial \
    -chardev file,id=3Dmyserial,path=3Doutput.txt \
    $MORE_OPTIONS

You have to add a -serial for each serial port up to the one you care
about and then set the chardev for it.

If you where adding a device to the system then you can explicitly set
the target chardev for it with something like:

  -device isa-serial,iobase=3Dnnn,irq=3Dnnn,chardev=3DID

> It will be very helpful if you can provide us some guidance on this.

Another quirk for the aspeed boards seems to be the default uart can be
an arbitrary one depending on the board model:

334:    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));=20
336:        if (uart =3D=3D amc->uart_default) {=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
1112:    amc->uart_default =3D ASPEED_DEV_UART5;=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
1407:    amc->uart_default =3D ASPEED_DEV_UART1;=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20

as a result ASPEED_DEV_UART5 will always be the first serial port
(serial_hd(0)). I don't know how Linux numbers them but worth being
aware of.

>
> Thank you,
> Abhishek


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

