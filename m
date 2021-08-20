Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1A3F277D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:18:06 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGymz-0001Lj-EJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mGyll-0000gn-TP
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:16:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mGylj-00084z-ET
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:16:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 930756108F
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629443804;
 bh=aIoierq1qWA4P6prqhbsvCAl0lPF1wQ36v7Ma9fWAIw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CzEyUS74yiVEBxVUf23wn5tK9AYL6I0UwHOV2Z1DbwuvkCN0xlQigb/xmEjqutDJN
 S8PGuuvhhNgl3wxhUSvyZxm+yJ/6cnrRT5QSPksu8+7sSCPo3zqvQHCqQmXednuh5/
 JGo6xdovjfhq9JKvPWfsaGbU9pR8lnc8XzIFsZECBOqd1OL223zdW5LZZlaIiI3BDV
 VCLFpFZbMPVavFSEvbjMHB3JeKQkXt1RMKY/dBgH7hQmyrv4WU3Zr9CmKWGM74pZuB
 BWQaGQDccjqzBGXKfs7hUgVSZ1sUMwC+2inyV5P2QqosR6pfxrSFrE5+0K042c8/B7
 zCZKwVcfXLrFQ==
Received: by mail-io1-f42.google.com with SMTP id z1so10995745ioh.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 00:16:44 -0700 (PDT)
X-Gm-Message-State: AOAM533hS5RuvGZDbovQ05APYwKG3oQtr5Xaf9bNd8ogbUOQ/BpAx+Ne
 5HYY4wskkN+f8EuqjORtiYYuNySnZ5Xegv/K+Ek=
X-Google-Smtp-Source: ABdhPJzwa+QeNif4RjLFpCab/2io8AoxI0DZqA7j+A2dooRhC97dwJbuYVRA9knxuYdWUR55EAGbuE/gl/a5q7S0inc=
X-Received: by 2002:a05:6602:1210:: with SMTP id
 y16mr14518905iot.159.1629443804001; 
 Fri, 20 Aug 2021 00:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <c6341c27-f656-da64-271d-487eea49d931@amsat.org>
 <CAAdtpL4Rbc5iVi27xOjwzycUcPKZcPM3PqYjZVnm-4Wgvmhbhg@mail.gmail.com>
In-Reply-To: <CAAdtpL4Rbc5iVi27xOjwzycUcPKZcPM3PqYjZVnm-4Wgvmhbhg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Aug 2021 15:16:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6yAN3+YvCRutNAm1z4QNUrJgQAPw_jcc28CtJSrNGGmA@mail.gmail.com>
Message-ID: <CAAhV-H6yAN3+YvCRutNAm1z4QNUrJgQAPw_jcc28CtJSrNGGmA@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] tcg/mips: Unaligned access and other cleanup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Jiaxun,

I'm not familiar with TCG, please review, thanks.

Huacai

On Thu, Aug 19, 2021 at 6:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Sorry, use Huacai's newer email .
>
> On Thu, Aug 19, 2021 at 12:07 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >
> > Cc'ing Jiaxun & Huacai.
> >
> > On 8/18/21 10:19 PM, Richard Henderson wrote:
> > > Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
> > > ("[PATCH v3 00/66] Unaligned access for user-only")
> > >
> > > Important points:
> > >   * Support unaligned accesses.
> > >   * Drop requirement for 256MB alignment of code_gen_buffer.
> > >   * Improvements to tcg_out_movi:
> > >     - Have a tb-relative register for mips64, reducing the
> > >       code size for most pointers,
> > >     - Try a few 3-insn sequences,
> > >     - Drop everything else into a constant pool.
> > >
> > >
> > > r~
> > >
> > >
> > > Richard Henderson (16):
> > >   tcg/mips: Support unaligned access for user-only
> > >   tcg/mips: Support unaligned access for softmmu
> > >   tcg/mips: Drop inline markers
> > >   tcg/mips: Move TCG_AREG0 to S8
> > >   tcg/mips: Move TCG_GUEST_BASE_REG to S7
> > >   tcg/mips: Unify TCG_GUEST_BASE_REG tests
> > >   tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
> > >   tcg/mips: Unset TCG_TARGET_HAS_direct_jump
> > >   tcg/mips: Drop special alignment for code_gen_buffer
> > >   tcg/mips: Create and use TCG_REG_TB
> > >   tcg/mips: Split out tcg_out_movi_one
> > >   tcg/mips: Split out tcg_out_movi_two
> > >   tcg/mips: Use the constant pool for 64-bit constants
> > >   tcg/mips: Aggressively use the constant pool for n64 calls
> > >   tcg/mips: Try tb-relative addresses in tcg_out_movi
> > >   tcg/mips: Try three insns with shift and add in tcg_out_movi
> > >
> > >  tcg/mips/tcg-target.h     |  17 +-
> > >  tcg/region.c              |  91 -----
> > >  tcg/mips/tcg-target.c.inc | 730 +++++++++++++++++++++++++++++++-----=
--
> > >  3 files changed, 604 insertions(+), 234 deletions(-)
> > >
> >

