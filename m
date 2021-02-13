Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC631AE38
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:49:17 +0100 (CET)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2my-0004Gg-JA
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2mB-0003iy-Se; Sat, 13 Feb 2021 16:48:27 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:52579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2m6-000274-JN; Sat, 13 Feb 2021 16:48:27 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8hEd-1lFjb41UuH-004nOa; Sat, 13 Feb 2021 22:48:07 +0100
Subject: Re: [PATCH] linux-user/elfload: fix address calculation in fallback
 scenario
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20210131061948.15990-1-vfazio@xes-inc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9a208031-b46f-9a28-067b-e2f622784a63@vivier.eu>
Date: Sat, 13 Feb 2021 22:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131061948.15990-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QBQa8+4fQA6rN9B+vBElwPCwq8YG5s/X/UKKNs2YQ0D0csItehq
 MmdIKXFEs0Ha1z6yj2dCgaUu3gh/Q08y1s3fmZfOHuBmnJRys9xXmsjH2yQtITP49LD2EAj
 rJkfZGRzo3i/YRN7ZtMsZycd0rVskMSRRNUPdu78vcbHiYR8VYsUFRiIl42wxhtyN8sufjW
 5c0M/JCmLg1GfjKG7qRBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1H5yrstjO/8=:CtSghyOPyPz9iCZVfdydjd
 m+kfddP3Xuz5aVSw2yR2jW4W6EuYJ4ppUpiiae0+wyeBSB2ZBY5TcL5gsuKcyHgMDz/u19PX8
 SGGlRVBFRJAeEi2R/SLdIKv20hX/qg5qsZiSkRUkgLpwkVXB7cZtlBESuVIKlZS/u+rL90CA9
 KhDNcm/cQg4X80OrLWKQM7VQcUafL0SWJX06x0RyZbxF1zvpc3vA7v6Km+t0l7CRo31Oyg7f4
 loofeScJa1mMB+lab+f2pq8pyURpToD5DyhPCwp1WamO4gm2zpBo2OwJDZGBlJH3w+rWOqWZf
 +d8u1o5DhvhdYkhTNZ+D3rNBo8CjffTb/LPV54RLwGKX/wL/1XekqwY7hB7eLZR+5K5SJnGo+
 ifT9+8zShxRZHMwDaTDcgDYpn6tOhOHjwcWU9TPKHSS1kUjA0db+E9mDwI4TJghS3mErm0gvK
 n+hGtxF4Vg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@gmail.com>
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

CC: Alex

