Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666759B6CC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:44:11 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuby-0002e6-97
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuYS-000676-Ho
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:40:32 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuYM-0002rY-Hm
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:40:31 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e19so8155822pju.1
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LbPXNTQ/ZKNE7vU5ZetuurngTL7raF4uVivcKFOBCTc=;
 b=mAP3yoVH5g8LS1imOLDQQK7drgSuMEkLvv+LhDgvrms2qKKBqnzzUH4xy2DOPI7lx0
 bwu8fWhSsdrvlD5gFdwPbX8n3693zUqMddLoFBV3DOIdACPQrIhWWeWt0rHUYcvBoFbk
 OSjgaFtQUiTYmKR4az43irrLvHh78tycw6z9ugPn8jy5r8KhGCCtb3d+ngGlMzTeKbmc
 b6OzD1Gm7F3KJCUwaGlKngdxyKzyoc6imWbj/3wrpb2Taipw703b/wdDwb2MO48uzUw1
 jiJjWhiwLdXdkScr4dh0YstyV6OBSU1YBH6Gt/hg0xkSByRvGJ1ijg0urfgWXm9AsqXt
 3XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LbPXNTQ/ZKNE7vU5ZetuurngTL7raF4uVivcKFOBCTc=;
 b=V4RvALRqfljiHYWyy4SDHd9jI8E65Mh3+G64HMJcIVM3bTIMvk4rbagj1LC3/ZO0ol
 U2jM0MuIlPp3yevvJJsVuuc2FGdOQQixwMu/IBhTd8eMqIK6AAn4qvRXuM0cCK083KrI
 xcrn+EKVbmnlSK3lRlCDsDIvyEqRHsecGXdyzIDdeGGVGIP0DTlE/UG6i7NRUtyBzTsy
 iAWlOrRryqmY4h6YPSmiZE3coOHb4GVebF+UUbddBD8EoNNUpPB4onvCpXGVxJP8Vshc
 vFr4r+arhRjP2OzmN4wj3dgPYKUHJ15ZtNJtxhVMeHEdZ0aUPHWSJQult5I00Ka0WRoZ
 BibQ==
X-Gm-Message-State: ACgBeo3sZ9kNL1OY8dZ+2V3aNyFSxzSdx5dFKEowFIpTCJhisAuBcKkQ
 Zbow2xDxNpikXXfbk6GqbHU7jlb/SbZiOUYlvsE=
X-Google-Smtp-Source: AA6agR6+IEyDhY/kd638YejzMa+U5GaHpCuts3doWNCO+MZs6DwcZdCI7kUBkuR5TSzVjYcy33+y3VlRtX1mcUIptYA=
X-Received: by 2002:a17:90a:bc47:b0:1fa:e634:739c with SMTP id
 t7-20020a17090abc4700b001fae634739cmr14435590pjv.120.1661125212727; Sun, 21
 Aug 2022 16:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-9-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:39:46 +1000
Message-ID: <CAKmqyKN5NWhK2OaayRACWo20kNE+eHwwxufHO2CBHQnt1KUiOg@mail.gmail.com>
Subject: Re: [PATCH v6 08/21] accel/tcg: Properly implement get_page_addr_code
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Fri, Aug 19, 2022 at 1:40 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current implementation is a no-op, simply returning addr.
> This is incorrect, because we ought to be checking the page
> permissions for execution.
>
> Make get_page_addr_code inline for both implementations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/exec-all.h | 85 ++++++++++++++---------------------------
>  accel/tcg/cputlb.c      |  5 ---
>  accel/tcg/user-exec.c   | 15 ++++++++
>  3 files changed, 43 insertions(+), 62 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 311e5fb422..0475ec6007 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -598,43 +598,44 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
>                                               hwaddr index, MemTxAttrs attrs);
>  #endif
>
> -#if defined(CONFIG_USER_ONLY)
> -void mmap_lock(void);
> -void mmap_unlock(void);
> -bool have_mmap_lock(void);
> -
>  /**
> - * get_page_addr_code() - user-mode version
> + * get_page_addr_code_hostp()
>   * @env: CPUArchState
>   * @addr: guest virtual address of guest code
>   *
> - * Returns @addr.
> + * See get_page_addr_code() (full-system version) for documentation on the
> + * return value.
> + *
> + * Sets *@hostp (when @hostp is non-NULL) as follows.
> + * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
> + * to the host address where @addr's content is kept.
> + *
> + * Note: this function can trigger an exception.
> + */
> +tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> +                                        void **hostp);
> +
> +/**
> + * get_page_addr_code()
> + * @env: CPUArchState
> + * @addr: guest virtual address of guest code
> + *
> + * If we cannot translate and execute from the entire RAM page, or if
> + * the region is not backed by RAM, returns -1. Otherwise, returns the
> + * ram_addr_t corresponding to the guest code at @addr.
> + *
> + * Note: this function can trigger an exception.
>   */
>  static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
>                                                  target_ulong addr)
>  {
> -    return addr;
> +    return get_page_addr_code_hostp(env, addr, NULL);
>  }
>
> -/**
> - * get_page_addr_code_hostp() - user-mode version
> - * @env: CPUArchState
> - * @addr: guest virtual address of guest code
> - *
> - * Returns @addr.
> - *
> - * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
> - * is kept.
> - */
> -static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
> -                                                      target_ulong addr,
> -                                                      void **hostp)
> -{
> -    if (hostp) {
> -        *hostp = g2h_untagged(addr);
> -    }
> -    return addr;
> -}
> +#if defined(CONFIG_USER_ONLY)
> +void mmap_lock(void);
> +void mmap_unlock(void);
> +bool have_mmap_lock(void);
>
>  /**
>   * adjust_signal_pc:
> @@ -691,36 +692,6 @@ G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
>  static inline void mmap_lock(void) {}
>  static inline void mmap_unlock(void) {}
>
> -/**
> - * get_page_addr_code() - full-system version
> - * @env: CPUArchState
> - * @addr: guest virtual address of guest code
> - *
> - * If we cannot translate and execute from the entire RAM page, or if
> - * the region is not backed by RAM, returns -1. Otherwise, returns the
> - * ram_addr_t corresponding to the guest code at @addr.
> - *
> - * Note: this function can trigger an exception.
> - */
> -tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
> -
> -/**
> - * get_page_addr_code_hostp() - full-system version
> - * @env: CPUArchState
> - * @addr: guest virtual address of guest code
> - *
> - * See get_page_addr_code() (full-system version) for documentation on the
> - * return value.
> - *
> - * Sets *@hostp (when @hostp is non-NULL) as follows.
> - * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
> - * to the host address where @addr's content is kept.
> - *
> - * Note: this function can trigger an exception.
> - */
> -tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> -                                        void **hostp);
> -
>  void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
>  void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a46f3a654d..43bd65c973 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1544,11 +1544,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>      return qemu_ram_addr_from_host_nofail(p);
>  }
>
> -tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
> -{
> -    return get_page_addr_code_hostp(env, addr, NULL);
> -}
> -
>  static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
>                             CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
>  {
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 20ada5472b..a20234fb02 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -199,6 +199,21 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> +tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> +                                        void **hostp)
> +{
> +    int flags;
> +
> +    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
> +    if (unlikely(flags)) {
> +        return -1;
> +    }
> +    if (hostp) {
> +        *hostp = g2h_untagged(addr);
> +    }
> +    return addr;
> +}
> +
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>
>  /*
> --
> 2.34.1
>
>

