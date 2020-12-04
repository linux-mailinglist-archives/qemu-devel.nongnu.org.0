Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD42CF535
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:00:40 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHFv-0005kP-Qb
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEgW-0008Bl-0a
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:16:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEdn-0007mB-5H
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYB0C6aF0qsTDmyydOayUIylWHJ9qMij8eh6vDumBmE=;
 b=PeSP+LxvnkvZ/OG47UH7Xdd/1s0yFrdV3pEbDYrPLBde3lsvHEOyT5fAngjqa5Hkc+heeZ
 v6ULzBpTeG+q2rlZN1jjQ+cIrmUHEx3ARahw1CaSVWwZpd8sjC05AITKgUmFRrH0r4nvZE
 nJKNjpPBffq1pTsFU1lGLSlg97fNwNk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Y2ERDA9YPL699mw9erb3Tw-1; Fri, 04 Dec 2020 12:12:07 -0500
X-MC-Unique: Y2ERDA9YPL699mw9erb3Tw-1
Received: by mail-ej1-f70.google.com with SMTP id u25so2309834ejf.3
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zYB0C6aF0qsTDmyydOayUIylWHJ9qMij8eh6vDumBmE=;
 b=RktnF6if7yTszAHQT4ZQP88DdoFawNzRnEm2jDINgPZApyaRVSW5V9j1mgJhT0Vs63
 M5KScMZvstXCuIqPQEjVIyWPMGPe4nugJY9WypeddyEfXkSGRXtsufrMSJEJeH3Sfc0I
 6wHywa2EaOIxF4s4Xios5i7iNcS2p+tJxF7KKaTCaUIJWfppRPGJCcSg/S2J9crRlhiU
 nx+HjiNP6JfgrPkoWfw4kPn0dOf1Kr2/dTUigokKQItJftsQrBltaUJZeLxiAvrpjtbS
 Ofn9KaYmH4ZIzjfyJ+o+kAqS6E6D+VVXqjE1MkR8gIwgeXOIllMgZ5GQdGqXQ+FqQQOl
 prTA==
X-Gm-Message-State: AOAM5339eK2y/eYAtS2qTNA/CQdDP00drlEHYjQi8hjKJXRQkH7RBlLI
 EYyEOU6NWEKSVzAdyWXqVAusBUN0POXf0Sf4/LjnncHHf+hDyrE5KHcuf0paeW0ZDgt3eP5Sji4
 beFN/Epuil8UqPes=
X-Received: by 2002:a17:906:bcf9:: with SMTP id
 op25mr8174519ejb.223.1607101926082; 
 Fri, 04 Dec 2020 09:12:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVEMTThkrfCGe/qVOjQm91C98ys9eD55FPEXakmGN0EOnUbAQmOreGlwf1AuuWfr1h8kv7ug==
X-Received: by 2002:a17:906:bcf9:: with SMTP id
 op25mr8174475ejb.223.1607101925800; 
 Fri, 04 Dec 2020 09:12:05 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w17sm3761712edu.90.2020.12.04.09.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:12:05 -0800 (PST)
Subject: Re: [RFC v7 13/22] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-14-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87d91771-bdee-eece-5dcd-1649ba2be234@redhat.com>
Date: Fri, 4 Dec 2020 18:12:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130023535.16689-14-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 3:35 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  accel/tcg/cpu-exec.c          |  4 ++--
>  include/hw/core/cpu.h         |  8 --------
>  include/hw/core/tcg-cpu-ops.h | 14 +++++++++++---
>  target/arm/cpu.c              |  2 +-
>  target/avr/cpu.c              |  2 +-
>  target/hppa/cpu.c             |  2 +-
>  target/i386/tcg-cpu.c         |  2 +-
>  target/microblaze/cpu.c       |  2 +-
>  target/mips/cpu.c             |  2 +-
>  target/riscv/cpu.c            |  2 +-
>  target/rx/cpu.c               |  2 +-
>  target/sh4/cpu.c              |  2 +-
>  target/sparc/cpu.c            |  2 +-
>  target/tricore/cpu.c          |  2 +-
>  14 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 64cba89356..816ef29f68 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -192,8 +192,8 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
>                                 TARGET_FMT_lx "] %s\n",
>                                 last_tb->tc.ptr, last_tb->pc,
>                                 lookup_symbol(last_tb->pc));
> -        if (cc->synchronize_from_tb) {
> -            cc->synchronize_from_tb(cpu, last_tb);
> +        if (cc->tcg_ops.synchronize_from_tb) {
> +            cc->tcg_ops.synchronize_from_tb(cpu, last_tb);
>          } else {
>              assert(cc->set_pc);
>              cc->set_pc(cpu, last_tb->pc);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c93b08a0fb..19211cb409 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -110,13 +110,6 @@ struct TranslationBlock;
>   *       If the target behaviour here is anything other than "set
>   *       the PC register to the value passed in" then the target must
>   *       also implement the synchronize_from_tb hook.
> - * @synchronize_from_tb: Callback for synchronizing state from a TCG
> - *       #TranslationBlock. This is called when we abandon execution
> - *       of a TB before starting it, and must set all parts of the CPU
> - *       state which the previous TB in the chain may not have updated.
> - *       This always includes at least the program counter; some targets
> - *       will need to do more. If this hook is not implemented then the
> - *       default is to call @set_pc(tb->pc).
>   * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>   *       address fault.  For system mode, if the access is valid, call
>   *       tlb_set_page and return true; if the access is invalid, and
> @@ -193,7 +186,6 @@ struct CPUClass {
>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>                                 Error **errp);
>      void (*set_pc)(CPUState *cpu, vaddr value);
> -    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>      bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr);
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 4475ef0996..109291ac52 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -10,9 +10,6 @@
>  #ifndef TCG_CPU_OPS_H
>  #define TCG_CPU_OPS_H
>  
> -/**
> - * struct TcgCpuOperations: TCG operations specific to a CPU class
> - */
>  typedef struct TcgCpuOperations {
>      /**
>       * @initialize: Initalize TCG state
> @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
> +     *
> +     * This is called when we abandon execution of a TB before
> +     * starting it, and must set all parts of the CPU state which
> +     * the previous TB in the chain may not have updated. This
> +     * will need to do more. If this hook is not implemented then
> +     * the default is to call
> +     * @set_pc(tb->pc).
> +     */
> +    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>  } TcgCpuOperations;
>  
>  #endif /* TCG_CPU_OPS_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1fa9382a7c..e29601d7db 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2242,7 +2242,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
>      cc->dump_state = arm_cpu_dump_state;
>      cc->set_pc = arm_cpu_set_pc;
> -    cc->synchronize_from_tb = arm_cpu_synchronize_from_tb;
> +    cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;

Similar comment than previous patch, please keep cc->tcg_ops.*
guarded withing #ifdef CONFIG_TCG.

With this change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


