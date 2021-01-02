Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED62E879D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:26:50 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhrl-0003GA-QE
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhHe-0008HA-GT
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:49:30 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhHb-0002kK-Pp
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:49:30 -0500
Received: by mail-ed1-x534.google.com with SMTP id i24so22196768edj.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXYsc3V9gdGdBav4QnbscS2SJSHtSd4TDJY0y3f2tfc=;
 b=ZvuxcmAZTKWnkDaKqQQseGe2AJumUaFKvVP0ERiBMwvvL3gUhfZmc+g/A02OwHC31s
 BJDpOpekQXEZLFZAGgQwZYT9PjdZr3uW1IhZK+iKp3183r2d01mE7XPM8OmeNQV/sQhZ
 re2451OTMv9EzTzLL2wXPJgi6PJjiMqiqvACHGlD15GtJD0ofDlh08h8mQvOCZSS3zYY
 WwuzPwm/g6A8Kuubwm8PD9dWQ5VOqbab0p+jfuMfrVAJV2ceMs4utq30WmlbdtA2TQV2
 IYbUfWGNM4E4CU8CevlJVr4RxhbtNDAoXqUapKgYWgA2cKmILYCuEsL3RxQi72VUZj7S
 qWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXYsc3V9gdGdBav4QnbscS2SJSHtSd4TDJY0y3f2tfc=;
 b=AG2cSmBkzMkdz8lsgnhKp4JrIGHiXrJi9r9dsMiUtTNQPd0yiUsyVDFre6BbJ9bXHj
 glin3JdUYf47j11Oy29Rjm1wJUaAlGiRxXOaq0/ERVaIDjHwk0fTtzOuCVDfhC89fXEE
 AcB1U/RN5Xgf4GmzM+OXLntkGekhSyIiN02mquUyQBCKCE5HtF3tpdCUiyKbAwIp7knc
 j0+lmzUKx3PH73F+XWAd495NEW9SCL9tRjZcW9kcu0halfi+p0utt8DGxXKCBoRz9n2/
 t1OzpK8wgIB3WFFjE0Hp7XqoZKpVYE9qa+YaBy0EBKZVFV38aIvvbQ+DM7/4Er4e1Zuu
 KCYA==
X-Gm-Message-State: AOAM5327MAg1WO5z6aro++HjtUEN9Yq2eCNLRwqCabF7rXRPzj/JSa/s
 BmJDEwoiDtz9A1RR+SYkNBR49KaGP0rPNZ80h3r+eg==
X-Google-Smtp-Source: ABdhPJyGKnwTN8YFjGj1Qo16OvsmVtDez0ihFTHRXkYLqTCI5mW+119HBeyndwnn7IaVygfGbWiLjRtFR9qCuMNR0zY=
X-Received: by 2002:a50:fe0e:: with SMTP id f14mr64414601edt.159.1609595366226; 
 Sat, 02 Jan 2021 05:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-4-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-4-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:19:13 +0530
Message-ID: <CAN8ut8+z=qJtzACufKcRBoAp-LH4+nKBwaYuGJxOJ-3Mushtzw@mail.gmail.com>
Subject: Re: [PATCH 03/22] hw/sd: ssi-sd: Fix incorrect card response sequence
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jan 2021 09:24:39 -0500
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 31, 2020 at 5:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
> "Command/Response", there is a minimum 8 clock cycles (Ncr) before
> the card response shows up on the data out line. However current
> implementation jumps directly to the sending response state after
> all 6 bytes command is received, which is a spec violation.
>
> Add a new state PREP_RESP in the ssi-sd state machine to handle it.
>
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/sd/ssi-sd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

