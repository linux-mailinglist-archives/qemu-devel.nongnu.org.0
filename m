Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37B3F0DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:11:17 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTmG-0005Oc-0a
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTko-0004gb-FB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:09:47 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTkn-00014v-0h
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:09:46 -0400
Received: by mail-oi1-f169.google.com with SMTP id p2so2754930oif.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2cEqisfZavOp95GVldjWCu8Xv4I08FN25tYLPIJ1MR4=;
 b=ggSxIbcIuJWNj+dCOKtqMH/sMsGyPDBQcIe8gy7KOgzyZqc4Q12T9+av2vfE58bl0x
 5LnJhZu9JMNxe46weU6sbQj+cYP8DeVtSteUEGI2eliNtXfJFVnrxbKtWHZRMD9VVkLo
 ij1eT9NUnOKfXX0Flv4BOgFieWkpch3O5JQzriuEV9N+AhEZzBtARA9nXd34JpphUgBv
 9pY/qqSJ0t6Wd94j32CcAqd0PCo277KZ/aaWSThctlT8VfrCdlwl+aXJsnnASvnQs0Gb
 nCPMLbObqcp7r+sLLEJkLV78kOC5vJg2u/AZUhCqryrQg7VU1zcMbDWlmcZPcTxqsVgF
 LImw==
X-Gm-Message-State: AOAM532vm+iWlFdpUeKO6J9gX4QBd8tw7hYF/xX1Jkcd2Vt1WVZEnFFv
 bColRxeDHfht9JQ6lGRXP9y1umTR++J5CHHXi2Y=
X-Google-Smtp-Source: ABdhPJxcZfdRmKGp0k3qafLD3LYfjBlQCU7FecoCFN3UAn+RyCO+nHzA+YOMDY3mJ7xSKvWSxZwopz2JYa5MEgPAL+A=
X-Received: by 2002:a05:6808:1403:: with SMTP id
 w3mr273080oiv.121.1629324583833; 
 Wed, 18 Aug 2021 15:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <c6341c27-f656-da64-271d-487eea49d931@amsat.org>
In-Reply-To: <c6341c27-f656-da64-271d-487eea49d931@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 19 Aug 2021 00:09:32 +0200
Message-ID: <CAAdtpL4Rbc5iVi27xOjwzycUcPKZcPM3PqYjZVnm-4Wgvmhbhg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] tcg/mips: Unaligned access and other cleanup
To: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.169;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, use Huacai's newer email .

On Thu, Aug 19, 2021 at 12:07 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Cc'ing Jiaxun & Huacai.
>
> On 8/18/21 10:19 PM, Richard Henderson wrote:
> > Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
> > ("[PATCH v3 00/66] Unaligned access for user-only")
> >
> > Important points:
> >   * Support unaligned accesses.
> >   * Drop requirement for 256MB alignment of code_gen_buffer.
> >   * Improvements to tcg_out_movi:
> >     - Have a tb-relative register for mips64, reducing the
> >       code size for most pointers,
> >     - Try a few 3-insn sequences,
> >     - Drop everything else into a constant pool.
> >
> >
> > r~
> >
> >
> > Richard Henderson (16):
> >   tcg/mips: Support unaligned access for user-only
> >   tcg/mips: Support unaligned access for softmmu
> >   tcg/mips: Drop inline markers
> >   tcg/mips: Move TCG_AREG0 to S8
> >   tcg/mips: Move TCG_GUEST_BASE_REG to S7
> >   tcg/mips: Unify TCG_GUEST_BASE_REG tests
> >   tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
> >   tcg/mips: Unset TCG_TARGET_HAS_direct_jump
> >   tcg/mips: Drop special alignment for code_gen_buffer
> >   tcg/mips: Create and use TCG_REG_TB
> >   tcg/mips: Split out tcg_out_movi_one
> >   tcg/mips: Split out tcg_out_movi_two
> >   tcg/mips: Use the constant pool for 64-bit constants
> >   tcg/mips: Aggressively use the constant pool for n64 calls
> >   tcg/mips: Try tb-relative addresses in tcg_out_movi
> >   tcg/mips: Try three insns with shift and add in tcg_out_movi
> >
> >  tcg/mips/tcg-target.h     |  17 +-
> >  tcg/region.c              |  91 -----
> >  tcg/mips/tcg-target.c.inc | 730 +++++++++++++++++++++++++++++++-------
> >  3 files changed, 604 insertions(+), 234 deletions(-)
> >
>

