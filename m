Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABB57E339
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 16:48:06 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEtwj-0003PM-Ac
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 10:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEtv6-0001uR-9j
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:46:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEtv4-0001XF-Bi
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:46:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id a5so6790456wrx.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FRc+3FGH7HLv2fHlHYZFeicZwxHDT299zb1qwt5V2Ak=;
 b=nMcvvthxjog7ZeOALUhETjmZls7cuvAuGCgMujY5OXlHR5KyEJDnOjPu0Uzunhh4Tq
 76FpwoGVKK5N0jpNjLqGa9wvir000gQLN5JcvOa028btz6SqGrkl0CMvvs6MmGeKE7/B
 TRqobYW8DFz8MkeMNryPopYJcz9obmyRwx3snhoPrw0QLejExrZvTr9n23XTd6xUM4CX
 RcV1IzRrHr3bf9d7yub0KEEeN3SIkU/BjhSDTVM4VkczQDLQyMesaMV8d4tByg1ITLt5
 X/0ZX2ENbIOBSOZdrULd1zRTOM/kfyqoUkYb+6GIai3oak0iPrwhtOdHzrOyURcCyf4v
 5vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FRc+3FGH7HLv2fHlHYZFeicZwxHDT299zb1qwt5V2Ak=;
 b=Ivrj2YJ0QOgeSFr3KFjeYEGZ+TBIc07z3pQ+rgKiyIC8gt+uoYd66DO3n2aw3lz3Th
 6xhfswbI1ZtZt0eGP4577A1RnL7TKiH+RDlXtLkFXJgT0zHrB/7NF++GQCjPYAMdNmMD
 FPOaB56BSj3ulW6f7TigCYZ9AvR/xmVAabH/88EDPIvoAYOajQLqCr4jrDy/P7FwiP4m
 b6E3bNXMP8jsi4RFHLrabH/hJa66Dfi5VTZWHAiE9a41rdxSpZq8Gba7w6iQ/eyKyrh/
 yYs7mPdgOxe4fCPRWECkMMDcT+09nqhlfs6K8OuG8UcuhT2e/5P2Y2eAoHaibN9itf/Q
 Ybcw==
X-Gm-Message-State: AJIora8cpZ3+f5vyCPguTHYmrWA5ZRFR6hT7GCfUzOfhPA8huUagzFDx
 0qKETYOxEPL0Mek/N8QcWTCWKg==
X-Google-Smtp-Source: AGRyM1sGzczlbXQxpI3S1CNxzWAiETnHO2uLveJygHiQOGvE2EEoc2AxQmj9c5VwoXHam+HD/nspbQ==
X-Received: by 2002:adf:ce0c:0:b0:21d:929e:1522 with SMTP id
 p12-20020adfce0c000000b0021d929e1522mr201803wrn.126.1658501180508; 
 Fri, 22 Jul 2022 07:46:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm16429466wms.3.2022.07.22.07.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 07:46:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B7B51FFB7;
 Fri, 22 Jul 2022 15:46:18 +0100 (BST)
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
 <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
 <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
 <87pmhxze6g.fsf@linaro.org>
 <CAK7rcp_yhCLJCEgMBRyrZFfwWRSmAah=BSLeDLPYtQyhdo8SgA@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Access target TranslatorOps
Date: Fri, 22 Jul 2022 15:38:31 +0100
In-reply-to: <CAK7rcp_yhCLJCEgMBRyrZFfwWRSmAah=BSLeDLPYtQyhdo8SgA@mail.gmail.com>
Message-ID: <87fsitryrp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Oh whoa, I thought I could have an architecture neutral way to
> interface with the TCG to find this out.

While the TCG intermediates are architecture neutral there are enough
difference between the various guest architectures in the way exceptions
are raised there is no common API. Most will generate an exception with
a front end specific helper. We only define a few common exception types
that all CPUs might generate:

  #define EXCP_INTERRUPT  0x10000 /* async interruption */
  #define EXCP_HLT        0x10001 /* hlt instruction reached */
  #define EXCP_DEBUG      0x10002 /* cpu stopped after a breakpoint or sing=
lestep */
  #define EXCP_HALTED     0x10003 /* cpu is halted (waiting for external ev=
ent) */
  #define EXCP_YIELD      0x10004 /* cpu wants to yield timeslice to anothe=
r */
  #define EXCP_ATOMIC     0x10005 /* stop-the-world and emulate atomic */

with the front-ends free to generate any others as they see fit.

>
> Yes, I do have to use the decode tree, and converting the script to outpu=
t the codes would suffice for my case. However,
> I do not know how to do that at the moment. I've tried my best to underst=
and the TCG documentation but this appears to
> not be too straightforward.

We've slowly been moving more stuff into the RST documentation which you
can see rendered here:

  https://qemu.readthedocs.io/en/latest/devel/index-tcg.html

but we could certainly do with adding some more to describe the general
flow of translation and execution. However if there are things that
aren't clear please to ask here and we can do our best to answer.

>
> On Fri, Jul 22, 2022 at 5:31 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
>  > I need to determine the set of instruction encodings that the TCG can =
support for a given platform. I am not
>  bothered
>  > whether the target runs at all, and in fact it is better if it
>  > doesn't, so runtime or translate time doesn't bother me.
>
>  Which architectures are you interested in? For the ones that have been
>  converted to use decode tree it should be easy enough to update the
>  script to emit the uncovered opcode space. However decode tree targets
>  regular encoding - I think it has gained support for multiple encoding
>  modes but I don't know if it can handle the irregular madness of x86.
>
>  > Imagine I were adding support for more instructions for a given platfo=
rm. I would like to check that I'm using the
>  API
>  > right. It's amazing that it's been so far and there's no way to check =
that the correct behavior occurs when a given
>  > encoding is encountered regarding the TCG. A boolean result from a can=
_translate called just when the target
>  encounters
>  > the instruction would be good.
>
>  Generally when the translator encounters an instruction it can't
>  translate it would emit a illegal instruction exception. While you might
>  be able to peek into the TCG opcode stream to see such calls to the
>  relevant helpers I doubt it would be up-streamable as each front end
>  will deal with illegal instructions their own way (including
>  instructions that are illegal due to the current CPU operating mode).
>
>  > Additionally, the ability to force the translation of arbitrary encodi=
ngs would be good. I
>  > would like to not have to engineer some binary file format.
>
>  You don't need a new binary file format - just to construct an ELF with
>  the stream you want. A possibly adjacent project you might want to look
>  at is RISU:
>
>    https://git.linaro.org/people/peter.maydell/risu.git/about/
>
>  which we've used for testing the range of the translator for a number of
>  architectures.
>
>  >
>  > On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>  >
>  >  On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller
>  >  <kennethadammiller@gmail.com> wrote:
>  >  > That I know of, the TCG plugins do not allow me to feed the
>  >  > QEMU instance dynamically changing opcodes. I wouldn't use
>  >  > TranslatorOps if I don't have to. I want to facilitate a
>  >  > use case in which the contents of the target being emulated
>  >  > are changing, but it is not a self modifying target. I have
>  >  > to query and interact with the TCG to find out what opcodes
>  >  > are supported or not.
>  >
>  >  I agree that feeding opcodes into the translator isn't what
>  >  TCG plugins are intended for.
>  >
>  >  I'm definitely not clear on what you're trying to do here,
>  >  so it's hard to suggest some other approach, but linux-user
>  >  code shouldn't be messing with the internals of the translator
>  >  by grabbing the TranslatorOps struct. Among other things,
>  >  linux-user code is runtime and TranslatorOps is for
>  >  translate-time.
>  >
>  >  Sometimes code in linux-user needs to be a bit over-familiar
>  >  with the CPU state, but we try to keep that to a minimum.
>  >  Generally that involves code in target/foo/ providing some
>  >  set of interface functions that code in linux-user/foo/
>  >  can work with, typically passing it the CPU state struct.
>  >
>  >  thanks
>  >  -- PMM
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

