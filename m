Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A92DEE3F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:57:07 +0100 (CET)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZv8-0005s4-0V
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqZtY-0004T5-93
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:28 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqZtU-00074b-P2
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:27 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXpM2-1ka0z53BMK-00YAkH; Sat, 19 Dec 2020 11:55:19 +0100
To: Giuseppe Musacchio <thatlemon@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
Message-ID: <3695fc3b-e477-deb9-fdb3-270ead41e04c@vivier.eu>
Date: Sat, 19 Dec 2020 11:55:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:POyVWDJ/kW/FreRytdfIk4tdnroocPM6vKUQKlv++dr+osKz9qx
 V+0ot4T92t90xFiQsXeeYJucLgA4UPaoxSy7ZwIz6w+Z/YNMMDSUEaZL6d8z7Fba290bnnj
 yzOi8SHt8M+R0lbti9KBvmtj2pdFo0KeCPAghhxu8npL+NwZXcSAAM8M3WWe4anERRoQObN
 i6hjNRsUZvmk4T7+N9Y1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eW2RjpEyv5M=:Fgk5lo2up2PLsNPGFCs2eZ
 IQLrRQ/ycQtrokcR+by7M9wv2ty0efsajn/FPahXhlbAywjY4yBKfLcmywwgv5Mc451roispy
 seWfKEEbb1he7z+eGwGgYxTF8HeDInUvlAPehKdVFZ8p3RXWf92Ctvn8obNcEW6PoISZB9YVX
 rSj8ZUaGdtGL8Pjuv8HRGP/L0wGQ6eP8dpYigAyVcUpT0CtziNaEEEb0e9tTvHXIgRqC9vvdR
 TXhBn6+6u++FCi6AgaWCYujoncZiYcMR2umKvJL6Tf5N5VfM/gOnK0NBQhRI52PdALSeZU7hP
 iy9shBjdnRJVZgK9oKR90bGbhV69REjJnmZCR9k21UMQPDjuEhoH4zNAq4G4IwGb6i6MUES7c
 boWgTBgOB/tjVK9m7UksZfaSIv0UCvsdWEpiNj4K8J2vKJneAyDZML3tIuHVAs8ca0ZHBqJ6p
 u61fqEMYsg==
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/12/2020 à 11:17, Giuseppe Musacchio a écrit :
> Some ELF binaries encode the .bss section as an extension of the data
> ones by setting the segment p_memsz > p_filesz. Some other binaries take
> a different route and encode it as a stand-alone PT_LOAD segment with
> p_filesz = 0 and p_memsz > 0.
> 
> Both the encodings are actually correct per ELF specification but the
> ELF loader had some troubles in handling the former: with the old logic
> it was very likely to get Qemu to crash in zero_bss when trying to
> access unmapped memory.
> 
> zero_bss isn't meant to allocate whole zero-filled segments but to
> "complete" a previously mapped segment with the needed zero bits.
> 
> The fix is pretty simple, if the segment is completely zero-filled we
> simply allocate one or more pages (according to p_memsz) and avoid
> calling zero_bss altogether.

So, the current code manages the bss segment when the memory page has already
been allocated for the data segment by zeroing it:

+----------------------------------+
 PAGE                              |
 ----------+------------+          |
 DATA      |   BSS      |          |

So your patch fixes the case when there is no data segment and thus no page
to complete:

+----------------------------------+
 PAGE                              |
 ----------+                       |
 BSS       |                       |


But could we have a case where the BSS starts in a page allocated for the
data segment but needs more pages?

+----------------------------------+----------------------------------+
 PAGE                              | PAGE                             |
 ------------------------+----------------------------+               |
 DATA                    | BSS                        |               |

In this case we should also allocate the page, and the previous case is only a
special case (data segment = 0) of this one.

so something like (approxymately):

if (eppnt->p_filesz != 0) {
   target_mmap()
   if (vaddr_ef < vaddr_mem) {
       zero_bss(vaddr_ef, MIN(vaddr_mem, vaddr_ps + vaddr_len))
   }
}
if (vaddr_ps + vaddr_len < vaddr_mem) {
  target_mmap(vaddr_ps + vaddr_len, vaddr_ps + vaddr_len - vaddr_mem - 1,
              elf_prot, MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
}

I think your fix is correct, but I'm wondering if we can have something more
generic, if we can cover an other possible case.

If you think we don't need to introduce more complexity for a case that can't
happen I will queue your patch as is.

Thanks,
Laurent

> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/elfload.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 0b02a92602..a16c240e0f 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2776,14 +2776,16 @@ static void load_elf_image(const char *image_name, int image_fd,
>              vaddr = load_bias + eppnt->p_vaddr;
>              vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
>              vaddr_ps = TARGET_ELF_PAGESTART(vaddr);
> -            vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
> +
> +            vaddr_ef = vaddr + eppnt->p_filesz;
> +            vaddr_em = vaddr + eppnt->p_memsz;
>  
>              /*
> -             * Some segments may be completely empty without any backing file
> -             * segment, in that case just let zero_bss allocate an empty buffer
> -             * for it.
> +             * Some segments may be completely empty, with a non-zero p_memsz
> +             * but no backing file segment.
>               */
>              if (eppnt->p_filesz != 0) {
> +                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
>                  error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
>                                      MAP_PRIVATE | MAP_FIXED,
>                                      image_fd, eppnt->p_offset - vaddr_po);
> @@ -2791,14 +2793,22 @@ static void load_elf_image(const char *image_name, int image_fd,
>                  if (error == -1) {
>                      goto exit_mmap;
>                  }
> -            }
>  
> -            vaddr_ef = vaddr + eppnt->p_filesz;
> -            vaddr_em = vaddr + eppnt->p_memsz;
> +                /*
> +                 * If the load segment requests extra zeros (e.g. bss), map it.
> +                 */
> +                if (eppnt->p_filesz < eppnt->p_memsz) {
> +                    zero_bss(vaddr_ef, vaddr_em, elf_prot);
> +                }
> +            } else if (eppnt->p_memsz != 0) {
> +                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_memsz + vaddr_po);
> +                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
> +                                    MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS,
> +                                    -1, 0);
>  
> -            /* If the load segment requests extra zeros (e.g. bss), map it.  */
> -            if (vaddr_ef < vaddr_em) {
> -                zero_bss(vaddr_ef, vaddr_em, elf_prot);
> +                if (error == -1) {
> +                    goto exit_mmap;
> +                }
>              }
>  
>              /* Find the full program boundaries.  */
> 


