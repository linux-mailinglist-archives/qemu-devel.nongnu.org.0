Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741442D5C1B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:40:05 +0100 (CET)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMAu-0001ic-DQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLdp-0006NF-BC
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLdn-0005jH-Cs
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607605550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ejnqun2RRA1zTm2SvqvQzJik0iadKoQxysOlrE8T+3A=;
 b=fSBHj41H4wQFjqz0tFTYP0ycWoHN2wZ7VJfL0DSnB6AO2igwaha0MWnC9py1x3haAqGEeT
 5cEhJQXQi4jvh2JffIkgq2yWa2XenAgPPoYxg1MtuvAg0CVu/XCUBUipNglNj3HPmvzNhF
 co0QejJd8+3dS4+Ul4zEhPv5kRLaUPk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438--TwUgwdBNLKutLudrn965A-1; Thu, 10 Dec 2020 08:05:48 -0500
X-MC-Unique: -TwUgwdBNLKutLudrn965A-1
Received: by mail-wm1-f72.google.com with SMTP id d16so420771wmd.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ejnqun2RRA1zTm2SvqvQzJik0iadKoQxysOlrE8T+3A=;
 b=R8TWIZWmRxbewvQzhyp8qcyWICXJnj6+WHyLOjfpWplbbYnZ2Ti1BTCVjs2KTgMyad
 YxoOx620oimamUmESCGfYmjQNhzZRUmqQn/sMuuqFMcLRskdWEIAh10Zbf2TWotKYWUX
 LiT2daNWfyPIvEHUnV26RFbG+OXhX1ByjvugC/BjSG2ZzJ9AYd6HaPjf6IWEy+OEzXdH
 QBuwm8DR5MRs7MjCAJ9q/s1UYEmkgTo6xcCCMH8znwWzEPudzhxROUkuva3LLGf+GW4H
 pKXSAeY1t5mO8t5ajOx4WTpNw3kCQj9ZDqwQa/We+yDQL2ZoTqDhw4uUVGFxpjxGTn05
 HGZQ==
X-Gm-Message-State: AOAM531JBGg3uWoD6XC04kgRaUxmax3NNSDodu40L0iZBdxEwdVVCjHP
 jl+mHZL6vGPeuXS4I+BPuPn0YTrHcS3qmW71xaux71jutMFFGAydXUgHfZ29KaTXgaXZHovGaLP
 PwBbcx1o3ZcHwpfU=
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr8172839wme.189.1607605547492; 
 Thu, 10 Dec 2020 05:05:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIjKtb480G1YAdBa5tsLm0cvN7uoP/oSDYRGyL20YNlc7nvC+SVleXZwrCxgAiMpHuzAHaWQ==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr8172793wme.189.1607605547274; 
 Thu, 10 Dec 2020 05:05:47 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l1sm8981054wrq.64.2020.12.10.05.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:05:46 -0800 (PST)
Subject: Re: [PATCH v10 00/32] i386 cleanup
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b70ca52-8b06-42c3-1187-9cf700a506f3@redhat.com>
Date: Thu, 10 Dec 2020 14:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210121226.19822-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio,

On 12/10/20 1:11 PM, Claudio Fontana wrote:
> Hello, this is version 10 of the cleanup, changed from RFC to PATCH.
> 
> v9 -> v10: minor tweaks and fixes
> 
> * in "i386: split cpu accelerators from cpu.c",
> 
> use kvm/kvm-cpu.c, hvf/hvf-cpu.c, tcg/tcg-cpu.c.
> Easier to understand compared to editing multiple cpu.c files,
> and matches the header files if needed (kvm-cpu.h).
> 
> * in "accel: replace struct CpusAccel with AccelOpsClass",
> 
> make it a bit more consistent, by naming the files defining
> the AccelOpsClass types "...-accel-ops.c" instead of the old
> naming "...-cpus.c".
> 
> * in "cpu: move cc->transaction_failed to tcg_ops",
> 
> protect with CONFIG_TCG the use of tcg_ops for hw/misc/jazz.c,
> 
>  #include "exec/memattrs.h" (Philippe, Eduardo)
> 
> * in "cpu: Move synchronize_from_tb() to tcg_ops",
> 
>  #include "hw/core/cpu.h" (Philippe, Eduardo)
> 
> do not remove the comment about struct TcgCpuOperations (Philippe)
> 
> * in "accel/tcg: split TCG-only code from cpu_exec_realizefn",
> 
> invert tcg_target_initialized set order (Alex)
> 
> * in "i386: move TCG cpu class initialization out of helper.c",
> 
> extract helper-tcg.h, tcg-cpu.c, and tcg-cpu.h directly into
> tcg/, avoiding the extra move later to tcg/ (Alex)
> 
...

> Claudio Fontana (23):
>   accel/tcg: split CpusAccel into three TCG variants
>   accel/tcg: split tcg_start_vcpu_thread
>   accel/tcg: rename tcg-cpus functions to match module name
>   i386: move kvm accel files into kvm/
>   i386: move whpx accel files into whpx/
>   i386: move hax accel files into hax/
>   i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
>   i386: move TCG accel files into tcg/
>   i386: move cpu dump out of helper.c into cpu-dump.c
>   i386: move TCG cpu class initialization out of helper.c
>   target/riscv: remove CONFIG_TCG, as it is always TCG
>   accel/tcg: split TCG-only code from cpu_exec_realizefn
>   target/arm: do not use cc->do_interrupt for KVM directly
>   cpu: move cc->do_interrupt to tcg_ops
>   cpu: move cc->transaction_failed to tcg_ops
>   cpu: move do_unaligned_access to tcg_ops

To be honest this is a lot to digest... I'd split your
series in 2, the first part until here, almost ready;

And this second part, the accel refactor:

>   accel: extend AccelState and AccelClass to user-mode
>   accel: replace struct CpusAccel with AccelOpsClass
>   accel: introduce AccelCPUClass extending CPUClass
>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>   cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
>   hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
>   cpu: introduce cpu_accel_instance_init


