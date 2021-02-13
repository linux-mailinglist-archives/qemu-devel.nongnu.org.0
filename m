Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D797A31AE2B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:47:01 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2km-0002Cx-Ci
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2if-00018I-O2; Sat, 13 Feb 2021 16:44:49 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB2id-0001e5-U3; Sat, 13 Feb 2021 16:44:49 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M4sD3-1lCyWP4Ab9-001wOb; Sat, 13 Feb 2021 22:44:31 +0100
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20210131061930.14554-1-vfazio@xes-inc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <beab2848-565f-3791-d09b-ba626c4a0e95@vivier.eu>
Date: Sat, 13 Feb 2021 22:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131061930.14554-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fmW0Y//RKb4WX4K/Tf1qbhlT8mHvR6aR1y2uo4XM6zVnBvI/3oO
 6HEWA8Xt9SF8Jq8LsJLfpupGpApISKvbqPz8Kg7MLBWnT4osUBPIo97jk6oE65H/PyPYqTK
 TEj+dwNprjx7MylTuRyq/spu/uWIipAbjiVIpZJYtENlNKDPeKhtYXuAtmReAmqCYB18BQP
 8PT+4SYi3MaixNg1GZlVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fiEnNE75Kvg=:wKHwDM2JTvPKmM3DCXbNEg
 oryrcrTUzyD5JuQvcQbWhMka1WrW3q+Q3vdIiNK/NA/I4B/6u8Sh41XEa4ZSONOAaLFyqQcVd
 qIyhg1L3HoZh1tCTjO2GFKRsxC//np4kKij51Lcg9QkvGLCEdJ+eTF4ygQz+jz6ILzCdL/98q
 7R5yyiK9VI1Wt0PvlUQNezHFKRROmepObR8R5YNnh8Fgol3beHiI/N8CoaRpekxMSI2VmqjtE
 44/ytULOUhMh/IiORNc9mkzy3UsOcPoWmB9mvxDKl7higvNxxIsKuNr9hoDAjg35XHoiGIlRf
 0dUCN8RjpdUdjHXPtxlIF0NEB2DGvlnsGrokLKhbGs15afTrA8940TfBcmHVqfpxH/6FtlGg2
 djf45pz+40SLDhokitueQQz8dVT5z8ZkOpX5iLNYv+9mtB7sa+6y4qRXUQb2glX5exDq1BFCg
 KhZ/1VxgWA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
> Previously, pgd_find_hole_fallback assumed that if the build host's libc
> had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
> match the requested address. This is not a safe assumption for Linux
> kernels prior to 4.17
> 
> Now, we always compare mmap's resultant address with the requested
> address and no longer short-circuit based on MAP_FIXED_NOREPLACE.
> 
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  linux-user/elfload.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5f5f23d2e5..8d425f9ed0 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2217,8 +2217,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
>                                       PROT_NONE, flags, -1, 0);
>              if (mmap_start != MAP_FAILED) {
>                  munmap(mmap_start, guest_size);
> -                if (MAP_FIXED_NOREPLACE != 0 ||
> -                    mmap_start == (void *) align_start) {
> +                if (mmap_start == (void *) align_start) {
>                      return (uintptr_t) mmap_start + offset;
>                  }
>              }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

CC: Alex

Why did you put this checking in first place?

Thanks,
Laurent

