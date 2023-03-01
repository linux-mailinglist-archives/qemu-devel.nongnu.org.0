Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9B6A75B8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTXD-0003Vd-5O; Wed, 01 Mar 2023 15:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTXB-0003UY-W9; Wed, 01 Mar 2023 15:58:46 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXTXA-00041O-9K; Wed, 01 Mar 2023 15:58:45 -0500
Received: by mail-ed1-x52d.google.com with SMTP id h16so59274678edz.10;
 Wed, 01 Mar 2023 12:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677704322;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adY/ucAz/7u+VTFXXfzui4HOttHKIsubsqwDD9d2xjs=;
 b=U/9lICrXvOqaMelDLMR7S0i551ukJrCXyUxRinc/ekAQ8qgIq9LDpP82ahw3LkHY5H
 xbJbuFyZYGG28+S7KEeXxRaZmKCUkmZxoSpqCfDl/bQza68KNK1EyI3P6HhMFsYfKrJG
 jZDwA1nUHQ6IU8GLnexe/zVStk/hUbCG6hCN3pcKZJbT5Fftx6n29b6eC/gVyn7jmvNR
 FpLkMNRCM/23oY60rnX+N357IrnAn0KXVnh4Lu67qmOdm8GmyZHgXgw5Ol+w1dJpN96t
 UhnXpSOeaNVh6ISVmu02glBGHIWniNM3uomzRNjF1AAnT5GyAVl32TtBwXebEJx6mfXt
 +fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704322;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adY/ucAz/7u+VTFXXfzui4HOttHKIsubsqwDD9d2xjs=;
 b=5eojeyD2zMBT5CpBBx4wTu7bh3Qkz9fzHPRG5mbxJcnvQGxhC6jTTI0IiCEw5aE28K
 /1eTr+yeKuwwYyaMyyG4qd/9dzz5tftTRCnsqxf4TpeUJaBEox2nuNsaRBt0aAXkwPNe
 Y/YoHZ6k978BfZrhZ+mQdvSsewqMi4cpJDZa4EJDGASNdBZwksiMEOIiVR0V1a5U9Y4B
 sJjRN2OHGMunCnXw84Zv8thhYRjO9wsFlU381Jdc9q6SpP/3deXyF7/Uza0LLozYXsJp
 WTN5pqw9dcNTeynjuL1Vb8ktt/QZ46el2riWM5PKguuMD5TNzXbybJRcay04bTOMS8Mg
 YGOw==
X-Gm-Message-State: AO0yUKU3ToR5LhqCY9OMl8KOREoIrzQUBuicdxHw9/iIeqmZKkABuhLE
 O6QTPFI8JWgxbW+W1t0kPWM=
X-Google-Smtp-Source: AK7set8bMA0l8XSUWu/Lr9GLFMsalSjkig1L2LYgfJ2i7pYgz0md/9j2fraNPSHX14+lQsmo4zAyUw==
X-Received: by 2002:a05:6402:2803:b0:49e:1f0e:e209 with SMTP id
 h3-20020a056402280300b0049e1f0ee209mr10453030ede.10.1677704322216; 
 Wed, 01 Mar 2023 12:58:42 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-068-061.77.188.pool.telefonica.de.
 [77.188.68.61]) by smtp.gmail.com with ESMTPSA id
 og42-20020a1709071dea00b008e8e9859905sm6149308ejc.184.2023.03.01.12.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 12:58:41 -0800 (PST)
Date: Wed, 01 Mar 2023 20:58:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_5/7=5D_hw/isa/vt82c686=3A_Work_arou?=
 =?US-ASCII?Q?nd_missing_level_sensitive_irq_in_i8259_model?=
In-Reply-To: <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
 <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
 <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
 <1c9daa28-b4b0-5227-ea94-90035a8bed7a@eik.bme.hu>
 <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
Message-ID: <F67683AF-8739-499E-8B09-B5A1E595052A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 1=2E M=C3=A4rz 2023 14:05:31 UTC schrieb David Woodhouse <dwmw2@infrade=
ad=2Eorg>:
>On Wed, 2023-03-01 at 14:18 +0100, BALATON Zoltan wrote:
>> > Are you sure the PIC ELCR is actually set for the lines you're having
>> > trouble with? Is that something the Pegasos SmartFirmware would have
>> > done, and MorphOS is expecting to inherit but isn't actually setting =
up
>> > for itself?
>>=20
>> No, it works with other guests like Linux and AmigaOS that use PIC as s=
et=20
>> up by the firmware but MorphOS tries to use it in level sensitive mode =
and=20
>> likely has an IRQ handler which expects this to work=2E This is where I=
've=20
>> debugged it and came to this workaround:
>>=20
>> https://lists=2Enongnu=2Eorg/archive/html/qemu-ppc/2023-02/msg00403=2Eh=
tml
>>=20
>> When booting MorphOS with -d unimp I see these logs:
>>=20
>> i8259: level sensitive irq not supported
>> i8259: level sensitive irq not supported
>>=20
>> which is I guess when it tries to set it for both PICs=2E (If you want =
to=20
>> try this MorphOS iso is downloadable and instructions how to boot it is=
=20
>> here: http://zero=2Eeik=2Ebme=2Ehu/~balaton/qemu/amiga/#morphos
>
>
>Wow=2E Even looking at the PIIX3 datasheet from 1996, That 'Edge/Level
>Bank Select (LTIM)' bit was documented as 'This bit is disabled=2E Its
>function is replaced by the Edge/Level Triggerede Control (ELCR)
>Registers=2E
>
>We've been able to set the edge/level on a per-pin basis ever since the
>ELCR was introduced with the IBM PS/2, I think=2E
>
>It isn't a *correct* fix without a little bit more typing, but does
>this make it work?
>
>diff --git a/hw/intc/i8259=2Ec b/hw/intc/i8259=2Ec
>index 17910f3bcb=2E=2E36ebcff025 100644
>--- a/hw/intc/i8259=2Ec
>+++ b/hw/intc/i8259=2Ec
>@@ -246,6 +246,7 @@ static void pic_ioport_write(void *opaque, hwaddr add=
r64,
>             if (val & 0x08) {
>                 qemu_log_mask(LOG_UNIMP,
>                               "i8259: level sensitive irq not supported\=
n");
>+                s->elcr =3D 0xff;

Thanks so much, David! You're a genious=2E=2E=2E

Best regards,

Bernhard

>             }
>         } else if (val & 0x08) {
>             if (val & 0x04) {
>
>
>

