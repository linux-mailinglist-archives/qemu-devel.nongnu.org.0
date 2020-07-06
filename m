Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B8215F97
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 21:43:28 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsX1T-0003Xg-MK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 15:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jsWzF-0000cE-Ak
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 15:41:09 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jsWzD-0000Vg-HV
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 15:41:09 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYLqs-1kMelE01tS-00VOfu; Mon, 06 Jul 2020 21:41:06 +0200
Subject: Re: [PATCH v4 2/2] target/m68k: consolidate physical translation
 offset into get_physical_address()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20200701201531.13828-1-mark.cave-ayland@ilande.co.uk>
 <20200701201531.13828-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a66d9fb0-6ef1-db59-7ddf-c74d4498904a@vivier.eu>
Date: Mon, 6 Jul 2020 21:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701201531.13828-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PrR/d2xmI5XF0ZgpI0uQGfq5pFzxvjG3Sfk+83tUdbL1YNszsLx
 FqZmtGZgYuD/3bcChfWxF8UiDLEMcf6RIEDelUIZSuWNMVXsCMx2j4P7jIHpk3NAFUBAk7P
 CXyamF7AL+maEuf885v7btuxsUDnxWutX4NPOYdbdlOU8s7f4Bh9Y4xRInOLPhpTmW8Nb38
 CxxKaIQvrDJPmp55ll5Ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ec0rnP9UJBo=:EacTbezcnE+DmDzYQXtS9H
 n6Qzx6VDBSbZltzwbo/qPgiVglccc+KrfwDRZHK2+da+DYd8bqDek81IuhtkivD0PXEQfYE0O
 Q1LxifO3I+aaqcW7P+Y6/B7YGHf8AI2VBbObNWmbiXfGzgmoeyL7UKyj+2fqPWrB/c0HTQ/lw
 /aXuQzlyFfAFi5JA8FT5M/2CRJVKJ6Yn/DSSEFi1UStvRPQEWDHi/BJZMOdmY5Be9fSmdaO3k
 vsY0W38THG6u1ekdtqsxSysYSuZtGvjsIXZcoSSApdszWnXBpkGe+eCTBJEp8eyfQouZbSEjf
 RdoxdsgOQwGg/GOzm0ZPjarM+kEsAf4wurH9ngpE7xfiAV2frffuK5rOz9usMI5OLpwQBzfUO
 CDUagm5v3t1diQJm7py9ijfo3EvP8yce4jEMGRpVAJkZgKD9jIbTPbbUiM0MVpF0xIZqxUwOY
 tnvi6G75b1m7WPkSgszhTmwMO86RiThf9g+f7exCn3yvv8nhSshufVgaDGT/PNh7qGLRwzDBv
 T8imoOyb5U22rnHKkEtaQeO7wo/nwGXeXiQWdtqJYlDJW5VwZ3MbcPaniiQ8Ornfdh3T2ncMc
 IZX7pKW7qa31GOvYyAUXfR3lVnhBDkDhXoVRAgR9E6XJzeV/PjsVGKPo+ufWC/joLk964/DRM
 V9odzo+HmpQq7CT/QZKyu42Wv38zDuTOU9qtJSMSXc4sA1UoKnnA7pLP7a3aCaKwQystF+/by
 Zz5w4PfexN/xdrMdHlAcCaDpkcCTILbNvNVwR1RVIIIjmWHdsCXHkYYt0r+tGKBNG0k1ci0wW
 /TuzEq8N/Ue9JPG4IYdvSGAn7YuXDoDmV5yIGLdI8IV6UjrkyjdhKtiOS4pemdnLQimh6oj
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 15:41:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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

Le 01/07/2020 à 22:15, Mark Cave-Ayland a écrit :
> Since all callers to get_physical_address() now apply the same page offset to
> the translation result, move the logic into get_physical_address() itself to
> avoid duplication.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/m68k/helper.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 631eab7774..3ff5765795 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -643,7 +643,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
>                  /* Transparent Translation Register bit */
>                  env->mmu.mmusr = M68K_MMU_T_040 | M68K_MMU_R_040;
>              }
> -            *physical = address & TARGET_PAGE_MASK;
> +            *physical = address;
>              *page_size = TARGET_PAGE_SIZE;
>              return 0;
>          }
> @@ -771,7 +771,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
>      }
>      *page_size = 1 << page_bits;
>      page_mask = ~(*page_size - 1);
> -    *physical = next & page_mask;
> +    *physical = (next & page_mask) + (address & (*page_size - 1));
>  
>      if (access_type & ACCESS_PTEST) {
>          env->mmu.mmusr |= next & M68K_MMU_SR_MASK_040;
> @@ -826,8 +826,6 @@ hwaddr m68k_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>          return -1;
>      }
>  
> -    addr &= TARGET_PAGE_MASK;
> -    phys_addr += addr & (page_size - 1);
>      return phys_addr;
>  }
>  
> @@ -891,10 +889,8 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      ret = get_physical_address(&cpu->env, &physical, &prot,
>                                 address, access_type, &page_size);
>      if (likely(ret == 0)) {
> -        address &= TARGET_PAGE_MASK;
> -        physical += address & (page_size - 1);
> -        tlb_set_page(cs, address, physical,
> -                     prot, mmu_idx, TARGET_PAGE_SIZE);
> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> +                     physical & TARGET_PAGE_MASK, prot, mmu_idx, page_size);
>          return true;
>      }
>  
> @@ -1383,9 +1379,8 @@ void HELPER(ptest)(CPUM68KState *env, uint32_t addr, uint32_t is_read)
>      ret = get_physical_address(env, &physical, &prot, addr,
>                                 access_type, &page_size);
>      if (ret == 0) {
> -        addr &= TARGET_PAGE_MASK;
> -        physical += addr & (page_size - 1);
> -        tlb_set_page(env_cpu(env), addr, physical,
> +        tlb_set_page(env_cpu(env), addr & TARGET_PAGE_MASK,
> +                     physical & TARGET_PAGE_MASK,
>                       prot, access_type & ACCESS_SUPER ?
>                       MMU_KERNEL_IDX : MMU_USER_IDX, page_size);
>      }
> 

Applied to my m68k branch.

Thanks,
Laurent

