Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C733300C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:39:10 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJj8H-0004sN-4E
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJihP-0006eQ-2w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:11:24 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:53881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJihJ-0001eI-4T
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:11:22 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNtny-1l8dw045l2-00OGeS; Tue, 09 Mar 2021 21:11:13 +0100
Subject: Re: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
To: Nicolas Surbayrole <nsurbayrole@quarkslab.com>, qemu-devel@nongnu.org
References: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <331c0372-e8ed-43a3-a3f3-a41d2503d57e@vivier.eu>
Date: Tue, 9 Mar 2021 21:11:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i2BVds2k9tP++FMswYcO9ciBh0WToyHNisopxLHROlAjtsHKqbj
 HD7iNaBa4dZLO4fx6GTHfrCzy277hfu/LHtfC4EOcdK1jclKgQ05sZwoy0EIGtOREhcFRLd
 VdlmEvQXKr2TTVuiIqwEQico8iCN7a4oE6bam+bq3XChYsN7fJqPw/RFuBxwz2GQEDICGhm
 +HeOdV/czAdKqdkMyDXMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lE5lL4zMcWY=:ekkv7nUCfYaSHxmBwm6dz6
 ZW82pvlBGDwP1X+hAiuswVGjUnmiLGWLOTRGq4lhJ40X4KLUj4J6xeUtNIIQOhyw8+ETlnQ5o
 eGUbNkNGpgAL0hStv3qF5GyPVqGc+jH3ZFwhhkqMYuIpwrEovIHOrOgVcNq8CP/q2Bfnyx5Bc
 my8KbKzigotKCYmYWVfT1AKxFbZTNVyLW1IGyUxkB+MHRryVdC7wsu7dbTY6x8lYCZSj7AKbL
 9/jjs/r4SJbehJC+iG0GSukf9XQ8HWEQBTzU+35t3HhS4qMMyQdvJVYcGS7277e3mC/9AvMIP
 UU+XY31emdk1rXeeNWJcaBTWRaL2HL0nuhLHPOZbgQd+gKQVVgBhnLhLYBtJPnDsz6ZEfBM4z
 YOV8iloFgoA/NANRCrmthhHeBRxfl/WZK3bm6xcxANx1Lq+HUdIJHv6vE+nqMgVbfwGrX1scH
 YTGIglCi4g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 10:19, Nicolas Surbayrole a écrit :
> The guest binary and libraries are not always map with the
> executable bit in the host process. The guest may read a
> /proc/self/maps with no executable address range. The
> perm fields should be based on the guest permission inside
> Qemu.
> 
> Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
> ---
>  linux-user/syscall.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 389ec09764..0bbb2ff9c7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
>              count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
>                              " %c%c%c%c %08" PRIx64 " %s %"PRId64,
>                              h2g(min), h2g(max - 1) + 1,
> -                            e->is_read ? 'r' : '-',
> -                            e->is_write ? 'w' : '-',
> -                            e->is_exec ? 'x' : '-',
> +                            (flags & PAGE_READ) ? 'r' : '-',
> +                            (flags & PAGE_WRITE_ORG) ? 'w' : '-',
> +                            (flags & PAGE_EXEC) ? 'x' : '-',
>                              e->is_priv ? 'p' : '-',
>                              (uint64_t) e->offset, e->dev, e->inode);
>              if (path) {
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


