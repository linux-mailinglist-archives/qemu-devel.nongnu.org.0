Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4CA442A39
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:18:05 +0100 (CET)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpvf-0000kf-SH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kamil@netbsd.org>) id 1mhpqN-0007j5-Ae
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:12:35 -0400
Received: from mail.netbsd.org ([199.233.217.200]:61038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kamil@netbsd.org>) id 1mhpqK-0001vl-HH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:12:34 -0400
Received: from [IPv6:::1] (localhost [127.0.0.1])
 by mail.netbsd.org (Postfix) with ESMTP id 7E4A484F01;
 Tue,  2 Nov 2021 09:12:28 +0000 (UTC)
Subject: Re: [PATCH] nvmm: Fix support for stable version
To: nia <nia@NetBSD.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <YWblCe2J8GwCaV9U@homeworld.netbsd.org>
From: Kamil Rytarowski <kamil@netbsd.org>
Message-ID: <e0e46321-86d8-349a-2850-b82cd8e716a2@netbsd.org>
Date: Tue, 2 Nov 2021 10:12:28 +0100
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YWblCe2J8GwCaV9U@homeworld.netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=199.233.217.200; envelope-from=kamil@netbsd.org;
 helo=mail.netbsd.org
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kamil@netbsd.org, reinoud@netbsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Kamil Rytarowski <kamil@netbsd.org>

Paolo, could you please merge it?

On 13.10.2021 15:54, nia wrote:
> NVMM user version 1 is the version being shipped with netbsd-9,
> which is the most recent stable branch of NetBSD. This makes it
> possible to use the NVMM accelerator on the most recent NetBSD
> release, 9.2, which lacks nvmm_cpu_stop.
> 
> (CC'ing maintainers)
> 
> Signed-off-by: Nia Alarie <nia@NetBSD.org>
> ---
>  meson.build                 |  4 +---
>  target/i386/nvmm/nvmm-all.c | 10 ++++++++++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 15ef4d3c41..6e4d9b919a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -244,9 +244,7 @@ if not get_option('hax').disabled()
>    endif
>  endif
>  if targetos == 'netbsd'
> -  if cc.has_header_symbol('nvmm.h', 'nvmm_cpu_stop', required: get_option('nvmm'))
> -    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
> -  endif
> +  nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
>    if nvmm.found()
>      accelerators += 'CONFIG_NVMM'
>    endif
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index a488b00e90..4a10412427 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -750,7 +750,11 @@ nvmm_vcpu_loop(CPUState *cpu)
>          nvmm_vcpu_pre_run(cpu);
>  
>          if (qatomic_read(&cpu->exit_request)) {
> +#if NVMM_USER_VERSION >= 2
>              nvmm_vcpu_stop(vcpu);
> +#else
> +            qemu_cpu_kick_self();
> +#endif
>          }
>  
>          /* Read exit_request before the kernel reads the immediate exit flag */
> @@ -767,6 +771,7 @@ nvmm_vcpu_loop(CPUState *cpu)
>          switch (exit->reason) {
>          case NVMM_VCPU_EXIT_NONE:
>              break;
> +#if NVMM_USER_VERSION >= 2
>          case NVMM_VCPU_EXIT_STOPPED:
>              /*
>               * The kernel cleared the immediate exit flag; cpu->exit_request
> @@ -775,6 +780,7 @@ nvmm_vcpu_loop(CPUState *cpu)
>              smp_wmb();
>              qcpu->stop = true;
>              break;
> +#endif
>          case NVMM_VCPU_EXIT_MEMORY:
>              ret = nvmm_handle_mem(mach, vcpu);
>              break;
> @@ -888,8 +894,12 @@ nvmm_ipi_signal(int sigcpu)
>  {
>      if (current_cpu) {
>          struct qemu_vcpu *qcpu = get_qemu_vcpu(current_cpu);
> +#if NVMM_USER_VERSION >= 2
>          struct nvmm_vcpu *vcpu = &qcpu->vcpu;
>          nvmm_vcpu_stop(vcpu);
> +#else
> +        qcpu->stop = true;
> +#endif
>      }
>  }
>  
> 


