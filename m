Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A51CD65B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 12:20:08 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY5Xb-0008KH-2R
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 06:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1jY5W9-0007OJ-2N
 for qemu-devel@nongnu.org; Mon, 11 May 2020 06:18:37 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1jY5W7-0002gk-SH
 for qemu-devel@nongnu.org; Mon, 11 May 2020 06:18:36 -0400
Received: by mail-oi1-f193.google.com with SMTP id j16so14599319oih.10
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 03:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhHEh+pNrtrDrMKnU82n0ghqaec/6dzj+ojpD1sC6tU=;
 b=E5P7PQBNBaDhe9TYH+zBQ5mxloSU6IsAR+Z25Fw1v5UpO1s0ZjO2EYuB1OMRxG2yNW
 1c3ZFKVgdAWrA2ug3ynT36yIi5543npJrSEUNwPDsY/63H6JhBhDP/ikY1O808GLBOGU
 tT2JsrdvT7WeTwTwqPMEv4HnIs02uDlOKNmfmbL0xxt61AnvNyVrHn498UkWtvctnsK/
 3MnkL0xxuZ49cbR10ufcJgnqPm1E5dIlA1XkXocasFmoIJCAKTZxkDOkfcypOp5onCCl
 nhVQ1fY0fu7o8k+sfTkl1ciocvP7i4aUoABNNFeBxuSgcqPE6VjwLuTx9sCP199Km592
 uwBg==
X-Gm-Message-State: AGi0PuY8szG/JYs2Hd24W2wEqc3ALTSZesv07QHerLu1KMyF1Lzp6Six
 3tfCYUrs8dwzsrKhc9c7e4+lC2nRoWpsA9FwsbQ=
X-Google-Smtp-Source: APiQypLbjyTZbvqRLGoc90pFkCHUbFvz5HgFxZ0FoH+dKrKDX/RlQwLNKA9fzQii+Qv4ryb+mU1sZeCNokwWcDCIukA=
X-Received: by 2002:aca:f541:: with SMTP id t62mr18420359oih.148.1589192313970; 
 Mon, 11 May 2020 03:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
 <20200324135653.6676-4-geert+renesas@glider.be>
 <CACRpkdbN82n3B+Q-QVjB1jLpJAYS19fKukkDXQm3gZsuFFFM_w@mail.gmail.com>
In-Reply-To: <CACRpkdbN82n3B+Q-QVjB1jLpJAYS19fKukkDXQm3gZsuFFFM_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 12:18:22 +0200
Message-ID: <CAMuHMdXskE8_A4gbFVWfPVdcxBO-CfaMDEehSxGAK_aC0MQ7=A@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] gpiolib: Add support for GPIO lookup by line name
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.193;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-oi1-f193.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 06:18:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Phil Reid <preid@electromag.com.au>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <marc.zyngier@arm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Harish Jenny K N <harish_kandiga@mentor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Linus,

On Thu, Mar 26, 2020 at 10:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently a GPIO lookup table can only refer to a specific GPIO by a
> > tuple, consisting of a GPIO controller label and a GPIO offset inside
> > the controller.
> >
> > However, a GPIO may also carry a line name, defined by DT or ACPI.
> > If present, the line name is the most use-centric way to refer to a
> > GPIO.  Hence add support for looking up GPIOs by line name.
> >
> > Implement this by reusing the existing gpiod_lookup infrastructure.
> > Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> > that this field can have two meanings, and update the kerneldoc and
> > GPIO_LOOKUP*() macros.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> I kind of like this approach, however there are things here that
> need to be considered: the line name is in no way globally unique,
> and I think there are already quite a few GPIO chips that
> have the same line names assigned for every instance of that
> chip.
>
> gpiochip_set_desc_names() only warns if there is a line with
> the same name on the same gpio_chip.

on a _different_ gpio chip.

> I suppose we need to document that the line name look-up
> will be on a first-come-first-served basis: whatever line
> we find first with this name is what you will get a reference
> to, no matter what chip it is on, and it is possible albeit
> not recommended that some other chip has a line with the
> same name.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

