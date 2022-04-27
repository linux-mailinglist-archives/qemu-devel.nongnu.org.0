Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFF510EA3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:21:11 +0200 (CEST)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXIk-0002bV-G4
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1njXHq-0001tG-Ns
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:20:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1njXHl-0004h3-TX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:20:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so3823494pjq.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JBEck0eZfunlgydBxrnMtDgPMmvndDpR2yeT/EWK+G8=;
 b=oaeV2vz9Hp+gQc9pd3fIHB7se2vGDwIRqj+dRAzOh9RICJoiJyunceiVBfKyzA7lBd
 A6PtanwAVGTDAbj3HAmjw25Od1JiqyUbsc7RrTj+EKm86Hd/Mk4yRrk3JWrvUYUp3cA5
 SJPPRj4Ii4+ZJep3RNwvgQIhGF8NtGZrHP09Cd8BC7KyqknkzQ1QWEi+MXS+/7SHIDRv
 ylxS1qbw0y+7AzYsHMFCbVhTf4JsxW2HqSPClEBqvIt9ee6lns5vrkn89w0Zza1ZdPNz
 GTvdH3Mg3PfroYyulMjzOAI3FM/Y22gOhtr/Bzkh4IJZ+FxIx2uqlb9ltzNStQU1eymI
 zxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JBEck0eZfunlgydBxrnMtDgPMmvndDpR2yeT/EWK+G8=;
 b=K3V2W0BzDXYG4wId9WZzWxpAtfxSXySKPXNRWqPQ7d2u0lLMF+qHvYX2lEf1h7DOrF
 89Fg9Qp5HwMVD/g1oDeSYssfvRgRetBG5DVUT0Z1a41Ntq+JJrVj58faMxfHVbPrE929
 f+Ro+t7OziDlMdTpR9HHanuLMdHfz9KHhSrReTtbfkCxS+U6kZXlUoSWI2Ceu/ogFGEZ
 ahYq8qMmPo4gW9X1Jp8WMA6NeWb3/BhuO3vVSg3+rm/QqlIH6r9ma3LpsOiFJjNvXRQ9
 N3TpP4odlP4No9B0n9EU2pGo8ruw4nu0Re87QauFbjq9ViJaq4TCQYuXoj4slyiwwmEj
 Dk+w==
X-Gm-Message-State: AOAM533XvuZ2Z0XmLU4nxo/SCeTifUB+XfDT6jrez1kvtGpVjzQqPflB
 lvctlpIfERroLbeKH8Per+Jvzg==
X-Google-Smtp-Source: ABdhPJwoWGWtzGrXdMPSm0vyj8T+XpUOnjfyNDPm7Yld1QcS+RvJMc3znjCDnG77ukIGvQQj/s94Hw==
X-Received: by 2002:a17:902:e054:b0:15c:ed0d:f13f with SMTP id
 x20-20020a170902e05400b0015ced0df13fmr19042016plx.76.1651026007546; 
 Tue, 26 Apr 2022 19:20:07 -0700 (PDT)
Received: from [10.255.73.91] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a17090a390a00b001cda0b69a30sm325224pjb.52.2022.04.26.19.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:20:06 -0700 (PDT)
Message-ID: <61e9dfd1-a663-549e-112b-761398996c2d@bytedance.com>
Date: Wed, 27 Apr 2022 10:16:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: PING: [PATCH] KVM: HWPoison: Fix memory address&size during remap
Content-Language: en-US
To: pbonzini@redhat.com, peter.maydell@linaro.org, mtosatti@redhat.com
References: <20220420064542.423508-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220420064542.423508-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Paolo & Peter

Could you please review this patch?

On 4/20/22 14:45, zhenwei pi wrote:
> qemu exits during reset with log:
> qemu-system-x86_64: Could not remap addr: 1000@22001000
> 
> Currently, after MCE on RAM of a guest, qemu records a ram_addr only,
> remaps this address with a fixed size(TARGET_PAGE_SIZE) during reset.
> In the hugetlbfs scenario, mmap(addr...) needs page_size aligned
> address and correct size. Unaligned address leads mmap to fail.
> 
> What's more, hitting MCE on RAM of a guest, qemu records this address
> and try to fix it during reset, this should be a common logic. So
> remove kvm_hwpoison_page_add from architecture dependent code, record
> this in SIGBUS handler instead. Finally poisoning/unpoisoning a page
> gets static in kvm-all.c,
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   accel/kvm/kvm-all.c      | 47 ++++++++++++++++++++++++++++++----------
>   include/sysemu/kvm_int.h | 12 ----------
>   target/arm/kvm64.c       |  1 -
>   target/i386/kvm/kvm.c    |  1 -
>   4 files changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 5f1377ca04..2a91c5a461 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1167,11 +1167,14 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
>       return ret;
>   }
>   
> +#ifdef KVM_HAVE_MCE_INJECTION
>   typedef struct HWPoisonPage {
>       ram_addr_t ram_addr;
> +    size_t page_size; /* normal page or hugeTLB page? */
>       QLIST_ENTRY(HWPoisonPage) list;
>   } HWPoisonPage;
>   
> +/* hwpoison_page_list stores the poisoned pages, unpoison them during reset */
>   static QLIST_HEAD(, HWPoisonPage) hwpoison_page_list =
>       QLIST_HEAD_INITIALIZER(hwpoison_page_list);
>   
> @@ -1181,25 +1184,48 @@ static void kvm_unpoison_all(void *param)
>   
>       QLIST_FOREACH_SAFE(page, &hwpoison_page_list, list, next_page) {
>           QLIST_REMOVE(page, list);
> -        qemu_ram_remap(page->ram_addr, TARGET_PAGE_SIZE);
> +        qemu_ram_remap(page->ram_addr, page->page_size);
>           g_free(page);
>       }
>   }
>   
> -void kvm_hwpoison_page_add(ram_addr_t ram_addr)
> +static void kvm_hwpoison_page_add(CPUState *cpu, int sigbus_code, void *addr)
>   {
>       HWPoisonPage *page;
> +    ram_addr_t ram_addr, align_ram_addr;
> +    ram_addr_t offset;
> +    hwaddr paddr;
> +    size_t page_size;
> +
> +    assert(sigbus_code == BUS_MCEERR_AR || sigbus_code == BUS_MCEERR_AO);
> +    ram_addr = qemu_ram_addr_from_host(addr);
> +    if (ram_addr == RAM_ADDR_INVALID ||
> +        !kvm_physical_memory_addr_from_host(cpu->kvm_state, addr, &paddr)) {
> +        /* only deal with valid guest RAM here */
> +        return;
> +    }
>   
> +    /* get page size of RAM block, test it's a normal page or huge page */
> +    page_size = qemu_ram_block_from_host(addr, false, &offset)->page_size;
> +    align_ram_addr = QEMU_ALIGN_DOWN(ram_addr, page_size);
>       QLIST_FOREACH(page, &hwpoison_page_list, list) {
> -        if (page->ram_addr == ram_addr) {
> +        if (page->ram_addr == align_ram_addr) {
> +            assert(page->page_size == page_size);
>               return;
>           }
>       }
> -    page = g_new(HWPoisonPage, 1);
> -    page->ram_addr = ram_addr;
> +
> +    page = g_new0(HWPoisonPage, 1);
> +    page->ram_addr = align_ram_addr;
> +    page->page_size = page_size;
>       QLIST_INSERT_HEAD(&hwpoison_page_list, page, list);
>   }
>   
> +static __thread void *pending_sigbus_addr;
> +static __thread int pending_sigbus_code;
> +static __thread bool have_sigbus_pending;
> +#endif
> +
>   static uint32_t adjust_ioeventfd_endianness(uint32_t val, uint32_t size)
>   {
>   #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
> @@ -2601,7 +2627,9 @@ static int kvm_init(MachineState *ms)
>           s->kernel_irqchip_split = mc->default_kernel_irqchip_split ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>       }
>   
> +#if defined KVM_HAVE_MCE_INJECTION
>       qemu_register_reset(kvm_unpoison_all, NULL);
> +#endif
>   
>       if (s->kernel_irqchip_allowed) {
>           kvm_irqchip_create(s);
> @@ -2782,12 +2810,6 @@ void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu)
>       run_on_cpu(cpu, do_kvm_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
>   }
>   
> -#ifdef KVM_HAVE_MCE_INJECTION
> -static __thread void *pending_sigbus_addr;
> -static __thread int pending_sigbus_code;
> -static __thread bool have_sigbus_pending;
> -#endif
> -
>   static void kvm_cpu_kick(CPUState *cpu)
>   {
>       qatomic_set(&cpu->kvm_run->immediate_exit, 1);
> @@ -2883,6 +2905,8 @@ int kvm_cpu_exec(CPUState *cpu)
>   #ifdef KVM_HAVE_MCE_INJECTION
>           if (unlikely(have_sigbus_pending)) {
>               qemu_mutex_lock_iothread();
> +            kvm_hwpoison_page_add(cpu, pending_sigbus_code,
> +                                  pending_sigbus_addr);
>               kvm_arch_on_sigbus_vcpu(cpu, pending_sigbus_code,
>                                       pending_sigbus_addr);
>               have_sigbus_pending = false;
> @@ -3436,6 +3460,7 @@ int kvm_on_sigbus(int code, void *addr)
>        * we can only get action optional here.
>        */
>       assert(code != BUS_MCEERR_AR);
> +    kvm_hwpoison_page_add(first_cpu, code, addr);
>       kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
>       return 0;
>   #else
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index 1f5487d9b7..52ec8ef99c 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -40,16 +40,4 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>                                     AddressSpace *as, int as_id, const char *name);
>   
>   void kvm_set_max_memslot_size(hwaddr max_slot_size);
> -
> -/**
> - * kvm_hwpoison_page_add:
> - *
> - * Parameters:
> - *  @ram_addr: the address in the RAM for the poisoned page
> - *
> - * Add a poisoned page to the list
> - *
> - * Return: None.
> - */
> -void kvm_hwpoison_page_add(ram_addr_t ram_addr);
>   #endif
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index ccadfbbe72..a3184eb3d2 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1450,7 +1450,6 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>           ram_addr = qemu_ram_addr_from_host(addr);
>           if (ram_addr != RAM_ADDR_INVALID &&
>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> -            kvm_hwpoison_page_add(ram_addr);
>               /*
>                * If this is a BUS_MCEERR_AR, we know we have been called
>                * synchronously from the vCPU thread, so we can easily
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 9cf8e03669..fb72b349ed 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -622,7 +622,6 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>           ram_addr = qemu_ram_addr_from_host(addr);
>           if (ram_addr != RAM_ADDR_INVALID &&
>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> -            kvm_hwpoison_page_add(ram_addr);
>               kvm_mce_inject(cpu, paddr, code);
>   
>               /*

-- 
zhenwei pi

