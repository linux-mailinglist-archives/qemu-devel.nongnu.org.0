Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B4393801
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:32:42 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNcP-0000Gz-F1
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNPM-00041d-7L
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmNPK-0000VT-Nr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IOiqHmB3sE4YKZVADtoGdi5WfIRzpaieuQqaZUBueQQ=;
 b=NigsrIYkK3liuMxu02IwJPazCWbwrYDAnBMnlWDOYELlfS1HmBBiwEPv5aJLY2aPRWAI5K
 MZQB+3nMzvtUbNuddkRPfqWGX8U3HJ7imuXECVB/iNj9GHCFY90eU42R3GKoFbbmsKy8u4
 GRxuYz7FXPz6K3c8zYtZZyDpizK5WQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-4uNeGTuwNnynYb_Hr-QcjQ-1; Thu, 27 May 2021 17:19:06 -0400
X-MC-Unique: 4uNeGTuwNnynYb_Hr-QcjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789AF5131;
 Thu, 27 May 2021 21:19:05 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 219F15C22B;
 Thu, 27 May 2021 21:19:04 +0000 (UTC)
Date: Thu, 27 May 2021 17:19:04 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210527211904.sjmkely4t4ragxva@habkost.net>
References: <20210521043820.29678-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210521043820.29678-1-chenyi.qiang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 12:38:20PM +0800, Chenyi Qiang wrote:
[...]
> @@ -4222,6 +4247,15 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
>      }
>  }
>  
> +static void kvm_rate_limit_on_bus_lock(void)
> +{
> +    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
> +
> +    if (delay_ns) {
> +        g_usleep(delay_ns / SCALE_US);
> +    }
> +}
> +
>  MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>  {
>      X86CPU *x86_cpu = X86_CPU(cpu);
> @@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>      } else {
>          env->eflags &= ~IF_MASK;
>      }
> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {

Does the KVM API guarantee that KVM_RUN_X86_BUS_LOCK will never
be set if KVM_BUS_LOCK_DETECTION_EXIT isn't enabled?  (Otherwise
we risk crashing in ratelimit_calculate_delay() above if rate
limiting is disabled).

If that's guaranteed, the patch looks good to me now.

> +        kvm_rate_limit_on_bus_lock();
> +    }
>  
>      /* We need to protect the apic state against concurrent accesses from
>       * different threads in case the userspace irqchip is used. */
> @@ -4595,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>          ioapic_eoi_broadcast(run->eoi.vector);
>          ret = 0;
>          break;
> +    case KVM_EXIT_X86_BUS_LOCK:
> +        /* already handled in kvm_arch_post_run */
> +        ret = 0;
> +        break;
>      default:
>          fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>          ret = -1;
> -- 
> 2.17.1
> 

-- 
Eduardo


