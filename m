Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78720F91B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 18:08:53 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqIoW-0002so-Er
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 12:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jqInQ-0001xk-JV
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 12:07:44 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34037
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jqInO-0001Dj-Ml
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 12:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593533261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnyW6vHNjzMf9ENk5IeWCyH+Mb+VMQz9mwN2NVZ0npM=;
 b=M9itvefTOGIWRIbZl0m+b4RpNXGERu3L0mSfCjohxkQj3L2vKtpP2Z20zgqXdmBWuJfEBk
 jPLCpXjGiu8QS70jx/QDkKNfQcYAaBmuo0fBdm7OvGscilmDOqnfCyosAqyJzSPdmyhVcm
 W8UcD3xkLsp9GpxI7YbO1G06Wp7KxZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-rowWVUQpPVmiTEosv7msHw-1; Tue, 30 Jun 2020 12:07:39 -0400
X-MC-Unique: rowWVUQpPVmiTEosv7msHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8907F1005512;
 Tue, 30 Jun 2020 16:07:38 +0000 (UTC)
Received: from starship (unknown [10.35.206.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7829B5DD63;
 Tue, 30 Jun 2020 16:07:37 +0000 (UTC)
Message-ID: <a945de64247435c6066a76dc79f32df1e6cbd0f6.camel@redhat.com>
Subject: Re: [PATCH] KVM: x86: believe what KVM says about WAITPKG
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 30 Jun 2020 19:07:36 +0300
In-Reply-To: <20200630151150.536580-1-pbonzini@redhat.com>
References: <20200630151150.536580-1-pbonzini@redhat.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-06-30 at 11:11 -0400, Paolo Bonzini wrote:
> Currently, QEMU is overriding KVM_GET_SUPPORTED_CPUID's answer for
> the WAITPKG bit depending on the "-overcommit cpu-pm" setting.  This is a
> bad idea because it does not even check if the host supports it, but it
> can be done in x86_cpu_realizefn just like we do for the MONITOR bit.
> 
> This patch moves it there, of course making it conditional on host
> availability which is not being done for the MONITOR bit.  It also makes
> MONITOR conditional, though not strictly necessary, so that the code
> looks the same for both and generally more natural.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c | 5 ++++-
>  target/i386/kvm.c | 6 ------
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index c44cc510e1..0de8dc569a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6535,7 +6535,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>          if (enable_cpu_pm) {
>              host_cpuid(5, 0, &cpu->mwait.eax, &cpu->mwait.ebx,
>                         &cpu->mwait.ecx, &cpu->mwait.edx);
> -            env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
> +            env->features[FEAT_1_ECX] |=
> +                x86_cpu_get_supported_feature_word(FEAT_1_ECX, cpu->migratable) & CPUID_EXT_MONITOR;
> +            env->features[FEAT_7_0_ECX] |=
> +                x86_cpu_get_supported_feature_word(FEAT_7_0_ECX, cpu->migratable) & CPUID_7_0_ECX_WAITPKG;
> 
After some digging I now understand that these are defaults for 'host/max', which can later be overriden
by the user, so this is correct assuming that we indeed can trust 'x86_cpu_get_supported_feature_word'.


>          }
>          if (kvm_enabled() && cpu->ucode_rev == 0) {
>              cpu->ucode_rev = kvm_arch_get_supported_msr_feature(kvm_state,
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 2b6b7443d2..c9ef27080d 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -411,12 +411,6 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>          if (host_tsx_blacklisted()) {
>              ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>          }
> -    } else if (function == 7 && index == 0 && reg == R_ECX) {
> -        if (enable_cpu_pm) {
> -            ret |= CPUID_7_0_ECX_WAITPKG;
> -        } else {
> -            ret &= ~CPUID_7_0_ECX_WAITPKG;
> -        }

I think we need to keep some form of this hack, since the kernel doesn't report CPUID_7_0_ECX_WAITPKG via
KVM_GET_SUPPORTED_CPUID, so for this to work, we need to fix the kernel to report it. 
But to support older kernels that don't report this bit, we might still need this.
What do you think?

Note that kvm_arch_get_supported_cpuid also has a override for what KVM reports about CPUID_EXT_MONITOR
via KVM_GET_SUPPORTED_CPUID when cpu_pm=on and also does this without checking any conditions,
and it works because MWAIT is very old feature, and I guess it was the inspiration for the above override
that we are trying to remove.

Kernel sadly masks both MWAIT and WAITPKG in KVM_GET_SUPPORTED_CPUID currently
(it is in kvm_set_cpu_caps)


>      } else if (function == 7 && index == 0 && reg == R_EDX) {
>          /*
>           * Linux v4.17-v4.20 incorrectly return ARCH_CAPABILITIES on SVM hosts.

Best regards,
	Maxim Levitsky


