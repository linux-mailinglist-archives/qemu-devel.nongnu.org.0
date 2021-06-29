Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BB3B6FD2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:03:13 +0200 (CEST)
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9eC-0006X8-5b
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9bp-0004T0-Gg
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:00:45 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9bn-0001TE-N7
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:00:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id o11so21919630ejd.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EV/YShrgVBIXY9rrW+QcE5JiZQxVV9CfNmmanlpYlIE=;
 b=WGSqHKBTUxmOc2hnU8v3DIHKrzskGy9umJaMzXccTI0SS+VRVQyvIR/bYgbBk6ds6I
 MCDbb5IFOJ+SmwiycTdOF/HQZCcR5vVmZnwoGzjihD1sYJeEemLVLeXibdYx2SJDohvz
 4MUZ9dHH31cvPQZ4JrAMSC24edm0Nhgcs/n0TBz1QofnSy2yeiwn6Cygr6H7/JDPkwKP
 gs8oCIGElwI1jcIb2wAbUXwW4CpiPChLuIMwEGktJbdIEYpFhcxGJXCDIl4lLQUovIuD
 EOFd6jJucfsDlD4r7hlcZfBAf7OTXZUS8EyRaA5IxSlXgPG6+p0Jc37UdS8rvk7u/+ay
 I53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EV/YShrgVBIXY9rrW+QcE5JiZQxVV9CfNmmanlpYlIE=;
 b=WcyTAf6NwdPvo+Ok7CvHHKbcgIq1Rcbee2VfqXl620qOG+v9oaoJtS5Iecqbh3+xyO
 aIMqCnJw4j1FCGpDDRL/qm33Iv7gYkBoY7tdojriH4o2WsixpGgfUtFEiIij37VwFduK
 4sFe5jtDtRVbisEkHPHDIj4L9alX0wEAfjIILZHYzj3IKaiibwbfQ4DVy3yZ51cwm+k0
 uP5QOTzknTFR75A/O8W5nDlFVm8ZyPUWEPfXItgVc7PwxIyTL3Fl7eXo1FlQhrKEM0Hw
 EUv9zCIWsX8ZkCLZrc8u3BXBZ7ZIxLqqtfJSaODRiu4BdgfMXjWzrtpv/9i6vKB0RuQM
 7t5w==
X-Gm-Message-State: AOAM532mDi5hudArCJ9TXdc/F7RYgNqKdonS5TR8C8ZiNuJnA6qYnT5A
 IjaKvbmXP6bgLMNYV356uTeS8pYbxAHjSMfOrOXAoQ==
X-Google-Smtp-Source: ABdhPJzrGG/Frim5dVeCcqg01MNLmNyIJiioLCLAnYaqC6wHfo3qKrgiDYUMd4UnzsU9KUBsCSEGc6bcE/71TK1P65k=
X-Received: by 2002:a17:906:a38d:: with SMTP id
 k13mr29672612ejz.250.1624957242272; 
 Tue, 29 Jun 2021 02:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210629053704.2584504-1-f4bug@amsat.org>
In-Reply-To: <20210629053704.2584504-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:00:04 +0100
Message-ID: <CAFEAcA_gmmhWAA3vej7OyOVn1eKNJE-zSeur49wr_Bek8cG0jg@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/jazz: Map the UART devices unconditionally
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 06:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When using the Magnum ARC firmware we can see accesses to the
> UART1 beeing rejected, because the device is not mapped:

"being"

>
>   $ qemu-system-mips64el -M magnum -d guest_errors,unimp -bios NTPROM.RAW
>   Invalid access at addr 0x80007004, size 1, region '(null)', reason: rej=
ected
>   Invalid access at addr 0x80007001, size 1, region '(null)', reason: rej=
ected
>   Invalid access at addr 0x80007002, size 1, region '(null)', reason: rej=
ected
>   Invalid access at addr 0x80007003, size 1, region '(null)', reason: rej=
ected
>   Invalid access at addr 0x80007004, size 1, region '(null)', reason: rej=
ected
>
> Since both UARTs are present (soldered on the board) regardless there

"regardless of whether there are"

> are character devices connected, map them unconditionally.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(This code pre-dated commit 12051d82f004 which made it safe to pass NULL
in as a chardev to serial devices.)

thanks
-- PMM

