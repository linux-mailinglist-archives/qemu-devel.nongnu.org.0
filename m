Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38632335E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:44:46 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEfU5-0005HH-CS
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfT7-0004pU-6L
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:43:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfT5-0003hs-EG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:43:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u14so24069239wri.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uapBLOomuCV/uC3d5ky8n3WORQutm9oG0Cs8yqLlFxQ=;
 b=W2gG7zbkedbBQrKNcxoMj5ecl5ipOqXlC12pm6y5CEfoQYOMQEqf6RKl84nAKzE+I9
 aj7l9R4hU0w+jH8+dD8dweFar9WbTyLid7KNlfWfcA7Xbx3eWEP+CJV4rkEwbr2s1gs3
 wts63Nk3TKn/59/UKyxQrv3UKkZPxbsSYfgkpUNYTecBc5HMqYIkUYi81si/2CD887Zw
 JqSoS7KnL/OFaQKL3z67FCzCTy7wq5sBF5wtKIpZaREmKyxZVgg2cHG23qJJ6Z+nubnp
 lY8beH8gmvW0q6Szigd0Ki6Ac53f/B1Xn+7ZZUj/ehjiAq7ofz00ENHQF3i3OyBKaAcE
 0gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uapBLOomuCV/uC3d5ky8n3WORQutm9oG0Cs8yqLlFxQ=;
 b=YKXzeu89+2fBdJUZlC490ig+n/YffScLQZ5HOvojCGStBgsOBc5V2vXU1zHkimyXj9
 Ry0s+x1dTLh8oPE+xHlz49nsnXs7s++K/3sz69r3j/xYXo+UgXqkPbVVICR/xquQVvX3
 iSaL9JQT4PZeMEQDNAiNmYXat6fInqRuaPAJjPYo4+3iUymtsXWWIvwCqrueb6yJw04K
 NcOhA9zUUkyDSCtp0hab8EVSMyqqXAj4zzUow90TzryVq3abXHo5g062+9vVgT5NpI2E
 EEwDXYSmsrceZx/TPRQ98cCw/HmpXG9SWoMDxD+TkySEwGaHO84b0wRWmv6hdE6VvrCZ
 s07Q==
X-Gm-Message-State: AOAM533xAYFxWp1VcDL1TBe78JswqyamXk6CdwQ0YAukhX7x96WF1aK+
 KqAKIBb2OFYlS/Uq1AGS03k=
X-Google-Smtp-Source: ABdhPJzWcJehpYqCcZgLtfoN4h+a9fGGZ9/kPRnL9eZnG853G09dOEzcNbjAFwqj5RUuJrXdempnvQ==
X-Received: by 2002:adf:b313:: with SMTP id j19mr4988961wrd.188.1614116621039; 
 Tue, 23 Feb 2021 13:43:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm76869wrn.0.2021.02.23.13.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:43:40 -0800 (PST)
Subject: Re: [PULL 38/46] cpu: move cc->transaction_failed to tcg_ops
To: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <20210205225650.1330794-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e3c017b9-9f3a-78bd-7406-41a02ca6a597@amsat.org>
Date: Tue, 23 Feb 2021 22:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205225650.1330794-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 11:56 PM, Richard Henderson wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> [claudio: wrap target code around CONFIG_TCG and !CONFIG_USER_ONLY]
> 
> avoiding its use in headers used by common_ss code (should be poisoned).
> 
> Note: need to be careful with the use of CONFIG_USER_ONLY,
> Message-Id: <20210204163931.7358-11-cfontana@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h     | 28 +++++++++++++---------------
>  hw/mips/jazz.c            |  9 +++++++--
>  target/alpha/cpu.c        |  2 +-
>  target/arm/cpu.c          |  4 ++--
>  target/m68k/cpu.c         |  2 +-
>  target/microblaze/cpu.c   |  2 +-
>  target/mips/cpu.c         |  4 +++-
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu_helper.c |  2 +-
>  target/sparc/cpu.c        |  2 +-
>  target/xtensa/cpu.c       |  2 +-
>  target/xtensa/helper.c    |  4 ++--
>  12 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 60cf20bf05..41ce1daefc 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -122,6 +122,14 @@ typedef struct TcgCpuOperations {
>      /** @debug_excp_handler: Callback for handling debug exceptions */
>      void (*debug_excp_handler)(CPUState *cpu);
>  
> +    /**
> +     * @do_transaction_failed: Callback for handling failed memory transactions
> +     * (ie bus faults or external aborts; not MMU faults)
> +     */
> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> +                                  unsigned size, MMUAccessType access_type,
> +                                  int mmu_idx, MemTxAttrs attrs,
> +                                  MemTxResult response, uintptr_t retaddr);
>  } TcgCpuOperations;
>  
>  /**
> @@ -133,8 +141,6 @@ typedef struct TcgCpuOperations {
>   * @has_work: Callback for checking if there is work to do.
>   * @do_unaligned_access: Callback for unaligned access handling, if
>   * the target defines #TARGET_ALIGNED_ONLY.
> - * @do_transaction_failed: Callback for handling failed memory transactions
> - * (ie bus faults or external aborts; not MMU faults)
>   * @virtio_is_big_endian: Callback to return %true if a CPU which supports
>   * runtime configurable endianness is currently big-endian. Non-configurable
>   * CPUs can use the default implementation of this method. This method should
> @@ -203,10 +209,6 @@ struct CPUClass {
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
> -    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> -                                  unsigned size, MMUAccessType access_type,
> -                                  int mmu_idx, MemTxAttrs attrs,
> -                                  MemTxResult response, uintptr_t retaddr);
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
> @@ -879,9 +881,6 @@ CPUState *cpu_by_arch_id(int64_t id);
>  
>  void cpu_interrupt(CPUState *cpu, int mask);
>  
> -#ifdef NEED_CPU_H
> -
> -#ifdef CONFIG_SOFTMMU
>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>                                          MMUAccessType access_type,
>                                          int mmu_idx, uintptr_t retaddr)
> @@ -900,14 +899,13 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
> -        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
> -                                  mmu_idx, attrs, response, retaddr);
> +    if (!cpu->ignore_memory_transaction_failures &&
> +        cc->tcg_ops.do_transaction_failed) {
> +        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size,
> +                                          access_type, mmu_idx, attrs,
> +                                          response, retaddr);
>      }
>  }
> -#endif
> -
> -#endif /* NEED_CPU_H */
>  
>  /**
>   * cpu_set_pc:
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index f9442731dd..46c71a0ac8 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -116,6 +116,8 @@ static const MemoryRegionOps dma_dummy_ops = {
>  #define MAGNUM_BIOS_SIZE_MAX 0x7e000
>  #define MAGNUM_BIOS_SIZE                                                       \
>          (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
> +
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
>                                            vaddr addr, unsigned size,
>                                            MMUAccessType access_type,
> @@ -137,6 +139,7 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
>                                    mmu_idx, attrs, response, retaddr);
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>  
>  static void mips_jazz_init(MachineState *machine,
>                             enum jazz_model_e jazz_model)
> @@ -205,8 +208,10 @@ static void mips_jazz_init(MachineState *machine,
>       * memory region that catches all memory accesses, as we do on Malta.
>       */
>      cc = CPU_GET_CLASS(cpu);
> -    real_do_transaction_failed = cc->do_transaction_failed;
> -    cc->do_transaction_failed = mips_jazz_do_transaction_failed;
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> +    real_do_transaction_failed = cc->tcg_ops.do_transaction_failed;
> +    cc->tcg_ops.do_transaction_failed = mips_jazz_do_transaction_failed;
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */

Why CONFIG_USER_ONLY isn't poisoned under hw/ ?

