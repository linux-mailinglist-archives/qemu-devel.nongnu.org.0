Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915BB31AD2D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:43:00 +0100 (CET)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAy0Z-0006mk-N6
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxzc-0006KO-1p
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:42:00 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:59169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxzY-00011c-Sc
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:41:59 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0G5h-1m8Jhm3k0t-00xLzP; Sat, 13 Feb 2021 17:41:54 +0100
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
To: Giuseppe Musacchio <thatlemon@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c19a9448-4bfc-9865-06fb-a7b5e9ba9011@vivier.eu>
Date: Sat, 13 Feb 2021 17:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xR3LZsHmNVf5jp71QvBHZPqkuUQX11hGAFGPiJ7HdYORRmpKYOA
 Pad/VUFy7zwRtZzIOsNONV1nZRchro2GubAzqZgo3ZLiH+LIGVH9RwOF5hXCigVzMIwCoJp
 xOgVOOi4CPMx9IcVFWHjqFM5cmhV2wqK875AjdTk91KeMB9yTPn11j0Kp5W5DudYAtmpRK3
 5domB0eoOzU1XmuItyVvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mlxlm+rubUE=:02/5m9SRZY/W8MouJF4bFX
 iDZbkqDhA9vErGlA3Kmagvr3wPBnaswGXwEG8uHQjMg383zLAbkL/kbKNxmFs6lXBRiQg78MS
 +465aLiMN2HST6CoPsJbR6uleQ6H9h1by/iv6UukirQb+vKDeCmpw911Meg7U6t709CHLgiC7
 8fMShobxCfuk/ydQxcGUu94wfKiqZOmO6/enbeYyPMP/s5H6Oz7XnCMmlBnjuT1qlZ71NMky/
 8of3uPmEz3miLDY87nqLn77Km9OoTPLDoRBvK40n/qdrJauC2QHwaRbV+thRogFEKgZOMJ0Nu
 c1Y3P6Ajg3JWyhFF7Fqf56DKYScLAeHrbRZ5AQRUPx0ydePMNe4pU+jOpWl+L3uDxNMkTYOni
 3htSdN7aJeAF0WXWejACDuvcuPkD/dCdGV1ivT5WqyGZ9iuwjdR3jz0W3Z987Jo7hmWLAk+bN
 zbqTjNfTew==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
> 
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

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

