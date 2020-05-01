Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696461C12B0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 15:14:46 +0200 (CEST)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUVV7-0004Bk-GG
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 09:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jUVSr-0000zy-QX
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jUVS4-0001kt-C3
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:12:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jUVS3-0001YN-Lt
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:11:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D193A746353;
 Fri,  1 May 2020 15:11:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B5CE6746351; Fri,  1 May 2020 15:11:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B47FB746344;
 Fri,  1 May 2020 15:11:31 +0200 (CEST)
Date: Fri, 1 May 2020 15:11:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] target/m68k: Allow movec only on 68010+
In-Reply-To: <20200114202226.E859E745702@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2005011511210.62443@zero.eik.bme.hu>
References: <20200114202226.E859E745702@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 07:58:18
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On Tue, 14 Jan 2020, BALATON Zoltan wrote:
> The movec opcode does not exist on 68000 and should raise an
> exception. Fix the feature mask to only allow movec on newer 68k CPUs.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> target/m68k/translate.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index fcdb7bc8e4..f19da064c8 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -5988,7 +5988,7 @@ void register_m68k_insns (CPUM68KState *env)
>     BASE(stop,      4e72, ffff);
>     BASE(rte,       4e73, ffff);
>     INSN(cf_movec,  4e7b, ffff, CF_ISA_A);
> -    INSN(m68k_movec, 4e7a, fffe, M68000);
> +    INSN(m68k_movec, 4e7a, fffe, FPU);
> #endif
>     BASE(nop,       4e71, ffff);
>     INSN(rtd,       4e74, ffff, RTD);
>

