Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81B3DA0D6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:08:04 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92xP-0003sG-Gw
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m92wW-0002fj-Mh
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:07:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m92wS-0002eM-9w
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:07:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E799B7462D3;
 Thu, 29 Jul 2021 12:06:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B553D7462FD; Thu, 29 Jul 2021 12:06:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B3B2374570A;
 Thu, 29 Jul 2021 12:06:59 +0200 (CEST)
Date: Thu, 29 Jul 2021 12:06:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Bug in qemu-system-ppc running fedora 12 ppc guest
In-Reply-To: <CABLmASFwffwhuNKTxfxUvHjCxZQHV+BiBTWeu0XoqRC0E1UU9A@mail.gmail.com>
Message-ID: <214af2d-c11e-862d-2c4c-4273ef4cef1b@eik.bme.hu>
References: <CABLmASFwffwhuNKTxfxUvHjCxZQHV+BiBTWeu0XoqRC0E1UU9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: matheus.ferst@eldorado.org.br,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Thu, 29 Jul 2021, Howard Spoelstra wrote:
> Hi,
>
> Qemu-system-ppc built from current master can no longer run Fedora 12 ppc
> as guest. (This the only ppc distro I tested.) Host is Fedora 34. Please
> see screen shot attached.
> Booting from both an installation DVD and from an installed system fail.
>
> To reproduce:
> compile qemu-system-ppc from current master and run:
>
> ./qemu-system-ppc \
> -M mac99,via=pmu \
> -m 1024 \
> -L pc-bios \
> -boot d \
> -cdrom Fedora-12-ppc-DVD.iso \
> -g 1024x768x8
>
> I tracked the issue down to this commit:
>
> 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792 is the first bad commit
> commit 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792

There's a fix for a similar problem I've seen with AROS and pegasos2 
firmware 1.2 that's in today's pull request:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-07/msg00281.html

That should likely fixes this. Can you try with that (either once it's 
merged or from David's for-6.1 branch).

Regards,
BALATON Zoltan

> Author: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Date:   Tue Jun 1 16:35:28 2021 -0300
>
>    target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree
>
>    Additionally, REQUIRE_64BIT when L=1 to match what is specified in The
>    Programming Environments Manual:
>
>    "For 32-bit implementations, the L field must be cleared, otherwise the
>    instruction form is invalid."
>
>    Some CPUs are known to deviate from this specification by ignoring the
>    L bit [1]. The stricter behavior, however, can help users that test
>    software with qemu, making it more likely to detect bugs that would
>    otherwise be silent.
>
>    If deemed necessary, a future patch can adapt this behavior based on
>    the specific CPU model.
>
>    [1] The 601 manual is the only one I've found that explicitly states
>    that the L bit is ignored, but we also observe this behavior in a 7447A
>    v1.2.
>
>    Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>    Message-Id: <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
>    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>    [dwg: Corrected whitespace error]
>    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>
> target/ppc/insn32.decode                   | 14 ++++++++
> target/ppc/translate.c                     | 52
> ------------------------------
> target/ppc/translate/fixedpoint-impl.c.inc | 31 ++++++++++++++++++
> 3 files changed, 45 insertions(+), 52 deletions(-)
>
> Best,
> Howard
>
> [image: Qemu-system-ppc-Fedora-Crashing.png]
>

