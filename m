Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220D3330F8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:34:55 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk0E-0003lz-D0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjpy-0007QA-K5; Tue, 09 Mar 2021 16:24:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:47615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjpt-0000EN-Bg; Tue, 09 Mar 2021 16:24:18 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MgwBv-1ly2nS39hd-00hKRY; Tue, 09 Mar 2021 22:23:59 +0100
Subject: Re: [PATCH] linux-user/elfload: fix address calculation in fallback
 scenario
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20210131061948.15990-1-vfazio@xes-inc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <741300f4-7a53-ad07-2bce-2a5583061c54@vivier.eu>
Date: Tue, 9 Mar 2021 22:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210131061948.15990-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aN7vfasOrAIfeva8C+C3AzxZdcDH0Im3t9vzgII+4dNLaYiUWCy
 WOiPTYLtQsZbMikJRVuFkqec9Lg0E8FljswhMClJZVqRvOlQ3X7pyq3ZmUsWHdKDb9eOBy3
 2+hnkwJK9xjFZp3O2vdqPn98GoVVX3Zo+EIeAPL2kqfpeaV9s3ldUxG8zI6C3ePaTqHfjSN
 dB3aH+jmGsw6Pq8Nvxatw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nwJkclL6x+0=:ApunNwt92ern6SmcobUbUa
 FYb1wmQ/RnGLAOvoObCFXx1fukFv2tRc958A/OdIpmpe1h3D9mKC44xSHnOk0/fldiWjQaMpn
 gYkFVTOC6YheWIaqO+JHCBsDYNopMCka1JnJxgf8alroQ4u2FeyEW0f1eBRePTTyYtii5exGv
 8LqaJzbYrDTm6VRkIfAOln97z/JkvwbM8eW3D/4Z02y+THL6Mm8nmsnUosuRy0zeTSh7zMqnj
 QxQzjo40sRK3scITC8kDJP7Alt5/85qNlQZQcmD4bGUPBEMk1ii7ROudqBuZQTOtzptMu5TLG
 fZvy3iadgMD0kqDdPuxjKqD7zyzS8MW3D/xULtcpqUKPCjrHlgzZwnoAqTpkQdhm0UWrb7G//
 CJTAoN6pF4FMe6X7oYdvx1aAzZAsMSSIA16jIHoaTeDE7BTXRV6qNlb808lyVsKryamVhva0H
 wZez/+AcMg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/01/2021 à 07:19, Vincent Fazio a écrit :
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Previously, guest_loaddr was not taken into account when returning an
> address from pgb_find_hole when /proc/self/maps was unavailable which
> caused an improper guest_base address to be calculated.
> 
> This could cause a SIGSEGV later in load_elf_image -> target_mmap for
> ET_EXEC type images since the mmap MAP_FIXED flag is specified which
> could clobber existing mappings at the address returnd by g2h().
> 
>   mmap(0xd87000, 16846912, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE|0x100000, -1, 0) = 0xd87000
>   munmap(0xd87000, 16846912)              = 0
>   write(2, "Locating guest address space @ 0"..., 40Locating guest address space @ 0xd87000) = 40
>   mmap(0x1187000, 16850944, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x1187000
>   --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x2188310} ---
>   +++ killed by SIGSEGV +++
> 
> Now, pgd_find_hole accounts for guest_loaddr in this scenario.
> 
> Fixes: ad592e37dfcc ("linux-user: provide fallback pgd_find_hole for bare chroots")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 8d425f9ed0..6d606b9442 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2242,7 +2242,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
>      brk = (uintptr_t)sbrk(0);
>  
>      if (!maps) {
> -        return pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        return ret - guest_loaddr;
>      }
>  
>      /* The first hole is before the first map entry. */
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


