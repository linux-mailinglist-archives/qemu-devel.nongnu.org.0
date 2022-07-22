Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB157DE89
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 11:36:24 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEp54-0008Ih-SV
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 05:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEp0a-0006K1-4q
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:31:45 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEp0W-0006VE-D1
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:31:43 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so5735813fac.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8DOwFpEugF5Zrhq5qOW1Ldwrvh0sB80DvIJ+I5Aj3IM=;
 b=J0BocmDNmUDnDMFxbqXHPjL1EbHoCqvn//Ste3PMQaW25z5035qgcGJGbyH7hx5/C6
 7OiXKY6lAQiQ/nECEM4/JL6Lr/wjSRfba8eXplYEoUGsr5QEQZbyPVWowpMipxaS0vtH
 hPEkLZTJysph447HHZBK8mPSxkMN2iNZ53F4dKF0KwIVFynADMmtQmBZ+WH91kOfxjQi
 USsT0EMr1TBR2VLmNM0nu0W/nSRsCHhX1bOIOxLXcPL71iyhWj0xwVdpfkaMGIaRLzWG
 4vJ7ueKpG7tA/MhtmxFg4CdhoOU3KOsQ+BKgaWZZfjoLiVhtgAZucIM++fDR4HOsxYh9
 Q9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8DOwFpEugF5Zrhq5qOW1Ldwrvh0sB80DvIJ+I5Aj3IM=;
 b=3k//35VavzKcWjcOkDv9BwU84xU2g6dEZZH1iSuGHqLJutTv0z237i0dBsJkYcPweE
 F8oBognUdVo/RUZkEm4ZI6JJmH6wisQbWpoUAks/7MM2jzTkaJurRZg5a5zL+CvHv7i3
 T6eLvd/WEkQl7e5G5MBVt+uw2yx3/0I6F1kU7DUcpUQVFctDoj789BRFUCXHhLZzT+Z1
 gC4hjZF7pRwQ00Z7V23C/Pd7arvb4HA+5g8tg/cwzVKsogztrlXZnvtUoIIPrae4p68S
 XDVSYdrMLn+IOy8DnxbODBlpDs8V7/IZD/PDtxv9/WpaW7VPtqCF59maFsWSfhwdjUfd
 UBzA==
X-Gm-Message-State: AJIora9n9llNJLNx/M6CdkBNkKYGF5AHUzOTKDYZAJbWClHTS4dcMwUq
 BrmHbioHT4tgIqIfIfGmJ3I2xQ==
X-Google-Smtp-Source: AGRyM1sftjx9S8oADcp9W3KY7GyNl40SaH1KLUcB3EhSYtj7gLDYDkLYkL40jgnnzX019ZEATgr0gA==
X-Received: by 2002:a05:6870:3282:b0:10d:70f2:2b5d with SMTP id
 q2-20020a056870328200b0010d70f22b5dmr7237145oac.29.1658482299010; 
 Fri, 22 Jul 2022 02:31:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u189-20020acaabc6000000b003263cf0f282sm1563908oie.26.2022.07.22.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 02:31:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 983B31FFB7;
 Fri, 22 Jul 2022 10:31:35 +0100 (BST)
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
 <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
 <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Access target TranslatorOps
Date: Fri, 22 Jul 2022 10:18:33 +0100
In-reply-to: <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
Message-ID: <87pmhxze6g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=alex.bennee@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> I need to determine the set of instruction encodings that the TCG can sup=
port for a given platform. I am not bothered
> whether the target runs at all, and in fact it is better if it
> doesn't, so runtime or translate time doesn't bother me.

Which architectures are you interested in? For the ones that have been
converted to use decode tree it should be easy enough to update the
script to emit the uncovered opcode space. However decode tree targets
regular encoding - I think it has gained support for multiple encoding
modes but I don't know if it can handle the irregular madness of x86.

> Imagine I were adding support for more instructions for a given platform.=
 I would like to check that I'm using the API
> right. It's amazing that it's been so far and there's no way to check tha=
t the correct behavior occurs when a given
> encoding is encountered regarding the TCG. A boolean result from a can_tr=
anslate called just when the target encounters
> the instruction would be good.

Generally when the translator encounters an instruction it can't
translate it would emit a illegal instruction exception. While you might
be able to peek into the TCG opcode stream to see such calls to the
relevant helpers I doubt it would be up-streamable as each front end
will deal with illegal instructions their own way (including
instructions that are illegal due to the current CPU operating mode).

> Additionally, the ability to force the translation of arbitrary encodings=
 would be good. I
> would like to not have to engineer some binary file format.

You don't need a new binary file format - just to construct an ELF with
the stream you want. A possibly adjacent project you might want to look
at is RISU:

  https://git.linaro.org/people/peter.maydell/risu.git/about/

which we've used for testing the range of the translator for a number of
architectures.

>
> On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>
>  On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller
>  <kennethadammiller@gmail.com> wrote:
>  > That I know of, the TCG plugins do not allow me to feed the
>  > QEMU instance dynamically changing opcodes. I wouldn't use
>  > TranslatorOps if I don't have to. I want to facilitate a
>  > use case in which the contents of the target being emulated
>  > are changing, but it is not a self modifying target. I have
>  > to query and interact with the TCG to find out what opcodes
>  > are supported or not.
>
>  I agree that feeding opcodes into the translator isn't what
>  TCG plugins are intended for.
>
>  I'm definitely not clear on what you're trying to do here,
>  so it's hard to suggest some other approach, but linux-user
>  code shouldn't be messing with the internals of the translator
>  by grabbing the TranslatorOps struct. Among other things,
>  linux-user code is runtime and TranslatorOps is for
>  translate-time.
>
>  Sometimes code in linux-user needs to be a bit over-familiar
>  with the CPU state, but we try to keep that to a minimum.
>  Generally that involves code in target/foo/ providing some
>  set of interface functions that code in linux-user/foo/
>  can work with, typically passing it the CPU state struct.
>
>  thanks
>  -- PMM


--=20
Alex Benn=C3=A9e

