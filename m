Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3C6BC7F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciUK-0001wa-Fj; Thu, 16 Mar 2023 03:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pciUH-0001to-QG
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:57:25 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pciUF-0002H3-Lh
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:57:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id o12so4018654edb.9
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1678953441;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ve7G/yk6ABgQNhhJsrRsf2VrUFnbppAz+0pqsXPFSf0=;
 b=FQkS6KONj0Yib3NhZlVLk2AUbePgJD36xL0FMQz8mu/ZVunJkwQEvPnOLYfg/ylVRS
 8fqcxnf3G+imVnF+p86lvATvgSVm2TS+HZeSY8raQPko2oVlhWzdrXiAectXdX5M+V/d
 8e7j5Pcz+J9pKqFjf1a5VUwmCeyGlZDaaMZ2wyFBIhBGR/mtAOs/jtCtHFGafbXzBpac
 4xl1nXgfpH42CA27vrEuGkMRX9M5/nxaQegxcdzQY/vjpLBId05PDXIgSvgtiLfufOa2
 oqWOp0N6sc1aclSkFvxvj2bYFaHi/T1MR0DHPg9+UO2ktv9wEj6kawcSK15lf9Jlc+MZ
 8E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953441;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve7G/yk6ABgQNhhJsrRsf2VrUFnbppAz+0pqsXPFSf0=;
 b=rsz4dow/31OzXIVji/xxbiy7jVyRzgh0SPpBFnwGp4eCJDXEnZGAJ2ZTqnazqCXtrk
 STm6rN2eNsoIMH7jPKs9lkhI+PP0G2yNLEvtBH7YVRdg3/sAJGM2Hw+dXVPpzjiQWLfE
 GIa0HTCoA0UtAyhFo9i9sIKMjtt5IDuQl9g7F16d1cZmDlQ85rlhVA19e/H5KFKg71Xy
 fuDPQsrAcxzb6vphfiiYj9Fz6jdg+/4ka27AbWXRF3MhWL1IcNmzP/+2yhySsAXG8F+v
 ZmDhTCXLm1r1q2rZ9Ma0GSPszKfav0SVh30N4QXB2f1SrTpmsZqu3wdRUE/3Oxnd1ue7
 mlqw==
X-Gm-Message-State: AO0yUKULsucraQeot3/EO4BKCTTmgP4to9IqL12yz7gbn/obmedg66Yi
 ZziyBGT5xjJeAhKyXAaaJVWtTQ==
X-Google-Smtp-Source: AK7set9b51z6BrmF+MQbBiaYLfSOAXYgNnLwUUi8ONthkt7JhXTpbRGXD8kicHvx/IN5EUpv2jMJjA==
X-Received: by 2002:a17:907:c607:b0:930:a74:52bb with SMTP id
 ud7-20020a170907c60700b009300a7452bbmr2401806ejc.14.1678953441477; 
 Thu, 16 Mar 2023 00:57:21 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a17090634c700b0092be625d981sm3526431ejb.91.2023.03.16.00.57.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:57:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: dropping 32-bit host support
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
Date: Thu, 16 Mar 2023 09:57:19 +0200
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-discuss@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C828A13-12A1-42D5-9DC1-9DB232294798@livius.net>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
 <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



> On 16 Mar 2023, at 09:29, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> Hi Liviu,
>=20
>> or the countless 32-bit Raspberry Pi?
>> my xPack binary tools, which include qemu arm & qemu riscv, are also =
available for arm 32-bit, and the analytics show about the same number =
of downloads for 32-bit as for 64-bit.
>> given the current chip shortages, I estimate that the 32-bit Arm =
binaries will still be useful for a few more years.
>=20
> IIUC xPack uses npm -- so work on any environment where npm works --,
> and fetch/install existing toolchains.

xPacks use `xpm`, which is an extension of `npm`.

If handles C/C++ (actually any language) source packages, and binary =
packages.

> Looking at ARM, all offered
> toolchains are 64-bit host [1] and the deprecated [2]. Toolchains for
> 32-bit hosts are still available but also listed as "deprecated" [3].
>=20
> [1] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> [2] https://developer.arm.com/downloads/-/gnu-a
> [3] https://developer.arm.com/downloads/-/gnu-rm

Nope, xpm does not download the archives provided by ARM, it uses its =
own binaries:

- =
https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/blob/6f6917999b=
9bdd12c4159631f77ae08e10d2d7d2/package.json#L40-L67

There is a full set of development tools =
(arm/aarch64/riscv/gcc/mingw-gcc/clang toolchain, =
cmake/meson/ninja/qemu/etc) which all run on 32-bit Raspberry Pi.

- https://github.com/xpack-dev-tools

> If QEMU is useful to you for testing installing xPack on a 32-bit
> emulated guest, I strongly recommend you to do that on a 64-bit host
> rather than a limited performance 32-bit Raspberry Pi 2,

I'm not targeting RPi2; there are a lot of RPi4 with less than 8GB RAM =
(most of them, actually), and even more RPi3, with even less RAM), and =
people prefer to continue using the 32-bit OS on them, which works quite =
fine; all my development tools are available on them.


You might think this weird, but there are people who use berries as =
their only machine, including for software development, and qemu =
arm/riscv is an important tool for running some of the tests.

Regards,

Liviu




