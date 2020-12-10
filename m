Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888DA2D5BBD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:29:28 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM0d-0007fw-6U
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLZq-0002wR-U1
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:01:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLZZ-0004K2-Vp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607605289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxSuvfv7yH2H2/Ts5h81QIBbjNN2AvRI+rc2sIBMt90=;
 b=MDRlqo7JrRIVDJkNgnJFgKsLu/X8DQSTsHWgZ0uL5LelV5DdX1glK6AjOhPzglIkBNWsaR
 0d5S9eLun/3nK1+8id+iskbvR3wAZVyomlDtenIW09aoxGh+7DJ38LvWpxnY4BjFwv5SY2
 VINnxTJ6VFp8B5nRQPq8zkwO4iwicBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-GBG0F0AwOn6c6Ur0SzBhZw-1; Thu, 10 Dec 2020 08:01:27 -0500
X-MC-Unique: GBG0F0AwOn6c6Ur0SzBhZw-1
Received: by mail-wr1-f72.google.com with SMTP id w17so1904462wrp.11
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxSuvfv7yH2H2/Ts5h81QIBbjNN2AvRI+rc2sIBMt90=;
 b=hVJQtpsqCYLnTeMG5loxRdDsIDj8ibiGV2bgpxHa3a6VX6zN2x6jj1Mb43jVlke71/
 22S/s2068fQ4DcJHFIetojJQ3UIf8h4Gcfkq5FWA7ROO37A4bIQTEX3HBvx/X0RiLSQd
 7G3gNHdOLTFtoch97aWgjH44wVCUt9slB9oMJz60ICxeMdb9EyjylDbJQtyPuD/Bi7oc
 uZFnSbUtEm9HGPBr+kjCjYBKsg/CnShd4XnaxaVKLHIk5yp02PADt8dqZ5qPEo/5m0Np
 t0MorM6YcQ07LnnMqrLSXC1cn8vGBzJ8t/1mh4i0WpHOmF4xbQJcyCm1VXpwi9UG8zSV
 /NvQ==
X-Gm-Message-State: AOAM530gicbjPCwZZMnFdAADFTdq27rvFkfwZUBzWn7MEDNbOP1xzksJ
 T2ux7Bbu/bjFGpHJIf1gI5KA4HtNLezV8fM9bWdV9VHJed9eyGUOgdMk7p96qfyrGCiSmy1ST/W
 It+qp99EwB/O/djo=
X-Received: by 2002:adf:d085:: with SMTP id y5mr2512309wrh.41.1607605286265;
 Thu, 10 Dec 2020 05:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoTOSkcGjtXW3qhyIz1l02316YY6AAuYfEVLfURUaYjUfbQOBhp5QIeXXhJdvG8xKO9DTQnw==
X-Received: by 2002:adf:d085:: with SMTP id y5mr2512260wrh.41.1607605286040;
 Thu, 10 Dec 2020 05:01:26 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n189sm8712088wmf.20.2020.12.10.05.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:01:25 -0800 (PST)
Subject: Re: [PATCH v10 25/32] cpu: move do_unaligned_access to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <20201210121226.19822-26-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a69f4101-5b0f-7ca5-d39a-7ad8b68a92bf@redhat.com>
Date: Thu, 10 Dec 2020 14:01:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210121226.19822-26-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 1:12 PM, Claudio Fontana wrote:
> make it consistently SOFTMMU-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h           | 17 +++--------------
>  include/hw/core/tcg-cpu-ops.h   |  7 +++++++
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/hppa/cpu.c               |  4 +++-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  3 ++-
>  target/nios2/cpu.c              |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  14 files changed, 25 insertions(+), 26 deletions(-)
...

> -#ifdef CONFIG_SOFTMMU
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>                                          MMUAccessType access_type,
>                                          int mmu_idx, uintptr_t retaddr)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -    cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
> +    cc->tcg_ops.do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>  }
> -#ifdef CONFIG_TCG
>  static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>                                            vaddr addr, unsigned size,
>                                            MMUAccessType access_type,
> @@ -858,10 +850,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>                                            mmu_idx, attrs, response, retaddr);
>      }
>  }
> -#endif /* CONFIG_TCG */
> -#endif /* CONFIG_SOFTMMU */
> -
> -#endif /* NEED_CPU_H */
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>  
>  /**
>   * cpu_set_pc:
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 3cc2733410..bac0165db6 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -50,6 +50,13 @@ typedef struct TcgCpuOperations {
>                                    unsigned size, MMUAccessType access_type,
>                                    int mmu_idx, MemTxAttrs attrs,
>                                    MemTxResult response, uintptr_t retaddr);
> +    /**
> +     * @do_unaligned_access: Callback for unaligned access handling, if
> +     * the target defines #TARGET_ALIGNED_ONLY.
> +     */
> +    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> +                                MMUAccessType access_type,
> +                                int mmu_idx, uintptr_t retaddr);

Similarly to previous patch, don't we want to restrict this
to system-mode?

>  
>      /**
>       * @tlb_fill: Handle a softmmu tlb miss or user-only address fault


