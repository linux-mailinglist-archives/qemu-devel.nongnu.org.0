Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FF302C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 21:10:00 +0100 (CET)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l48BT-0003ss-Gi
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 15:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l488G-0002Lf-2X
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 15:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l488D-0007OZ-6A
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 15:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611605195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VjY+Q6oat1z43JuxPE0IZ3Kv3T5sx064JjJN1c5n1Bk=;
 b=HQyDora+B0fOimEc8AJDA35jB73aGH2/6ETfSjSb9NdM+ROJOqPaHkqpJp52G61TewnJZE
 L5PBQ6PddaI5YYmos1vhznPnIeES5vUCMtjiFr2Q490h02VOZy81QBEzUo4WKVs5u3LSYh
 /Q3INpdzIUtBwH+/KZ1NzHrwvvFws1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-FVduRbMZNhGBClCYTe9zjw-1; Mon, 25 Jan 2021 15:06:31 -0500
X-MC-Unique: FVduRbMZNhGBClCYTe9zjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B9E11005D44;
 Mon, 25 Jan 2021 20:06:28 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3961677707;
 Mon, 25 Jan 2021 20:06:17 +0000 (UTC)
Date: Mon, 25 Jan 2021 20:06:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 4/6] sev/i386: Don't allow a system reset under an
 SEV-ES guest
Message-ID: <20210125200614.GT2925@work-vm>
References: <cover.1610665956.git.thomas.lendacky@amd.com>
 <c1b45c0f74820dffbc28625c9c44f603f44b76ee.1610665956.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1b45c0f74820dffbc28625c9c44f603f44b76ee.1610665956.git.thomas.lendacky@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Slaby <jslaby@suse.cz>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> An SEV-ES guest does not allow register state to be altered once it has
> been measured. When an SEV-ES guest issues a reboot command, Qemu will
> reset the vCPU state and resume the guest. This will cause failures under
> SEV-ES. Prevent that from occuring by introducing an arch-specific
> callback that returns a boolean indicating whether vCPUs are resettable.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Thanks, that looks better than the earlier version.
Needs checking by one of the kvm guys, but I think:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  accel/kvm/kvm-all.c       |  5 +++++
>  include/sysemu/cpus.h     |  2 ++
>  include/sysemu/hw_accel.h |  5 +++++
>  include/sysemu/kvm.h      | 10 ++++++++++
>  softmmu/cpus.c            |  5 +++++
>  softmmu/runstate.c        |  7 +++++--
>  target/arm/kvm.c          |  5 +++++
>  target/i386/kvm/kvm.c     |  6 ++++++
>  target/mips/kvm.c         |  5 +++++
>  target/ppc/kvm.c          |  5 +++++
>  target/s390x/kvm.c        |  5 +++++
>  11 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9db74b465e..9ac44ad018 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2411,6 +2411,11 @@ void kvm_flush_coalesced_mmio_buffer(void)
>      s->coalesced_flush_in_progress = false;
>  }
>  
> +bool kvm_cpu_check_are_resettable(void)
> +{
> +    return kvm_arch_cpu_check_are_resettable();
> +}
> +
>  static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
>  {
>      if (!cpu->vcpu_dirty) {
> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
> index e8156728c6..1cb4f9dbeb 100644
> --- a/include/sysemu/cpus.h
> +++ b/include/sysemu/cpus.h
> @@ -57,6 +57,8 @@ extern int icount_align_option;
>  /* Unblock cpu */
>  void qemu_cpu_kick_self(void);
>  
> +bool cpus_are_resettable(void);
> +
>  void cpu_synchronize_all_states(void);
>  void cpu_synchronize_all_post_reset(void);
>  void cpu_synchronize_all_post_init(void);
> diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
> index ffed6192a3..61672f9b32 100644
> --- a/include/sysemu/hw_accel.h
> +++ b/include/sysemu/hw_accel.h
> @@ -22,4 +22,9 @@ void cpu_synchronize_post_reset(CPUState *cpu);
>  void cpu_synchronize_post_init(CPUState *cpu);
>  void cpu_synchronize_pre_loadvm(CPUState *cpu);
>  
> +static inline bool cpu_check_are_resettable(void)
> +{
> +    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
> +}
> +
>  #endif /* QEMU_HW_ACCEL_H */
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 875ca101e3..3e265cea3d 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -573,4 +573,14 @@ int kvm_get_max_memslots(void);
>  /* Notify resamplefd for EOI of specific interrupts. */
>  void kvm_resample_fd_notify(int gsi);
>  
> +/**
> + * kvm_cpu_check_are_resettable - return whether CPUs can be reset
> + *
> + * Returns: true: CPUs are resettable
> + *          false: CPUs are not resettable
> + */
> +bool kvm_cpu_check_are_resettable(void);
> +
> +bool kvm_arch_cpu_check_are_resettable(void);
> +
>  #endif
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 1dc20b9dc3..89de46eae0 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -194,6 +194,11 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
>      }
>  }
>  
> +bool cpus_are_resettable(void)
> +{
> +    return cpu_check_are_resettable();
> +}
> +
>  int64_t cpus_get_virtual_clock(void)
>  {
>      /*
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0add..7b4f212d19 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -523,8 +523,11 @@ void qemu_system_guest_crashloaded(GuestPanicInformation *info)
>  
>  void qemu_system_reset_request(ShutdownCause reason)
>  {
> -    if (reboot_action == REBOOT_ACTION_SHUTDOWN &&
> -        reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
> +    if (!cpus_are_resettable()) {
> +        error_report("cpus are not resettable, terminating");
> +        shutdown_requested = reason;
> +    } else if (reboot_action == REBOOT_ACTION_SHUTDOWN &&
> +               reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
>          shutdown_requested = reason;
>      } else {
>          reset_requested = reason;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ffe186de8d..00e124c812 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1045,3 +1045,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>  {
>      return (data - 32) & 0xffff;
>  }
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return true;
> +}
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index aaae79557d..bb6bfc19de 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -27,6 +27,7 @@
>  #include "sysemu/kvm_int.h"
>  #include "sysemu/runstate.h"
>  #include "kvm_i386.h"
> +#include "sev_i386.h"
>  #include "hyperv.h"
>  #include "hyperv-proto.h"
>  
> @@ -4788,3 +4789,8 @@ bool kvm_has_waitpkg(void)
>  {
>      return has_msr_umwait;
>  }
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return !sev_es_enabled();
> +}
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 477692566a..a907c59c5e 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -1289,3 +1289,8 @@ int mips_kvm_type(MachineState *machine, const char *vm_type)
>  
>      return -1;
>  }
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return true;
> +}
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index daf690a678..f45ed11058 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2947,3 +2947,8 @@ void kvmppc_svm_off(Error **errp)
>          error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
>      }
>  }
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return true;
> +}
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index b8385e6b95..5c5ba801f1 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -2601,3 +2601,8 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
>  
>      kvm_s390_vcpu_interrupt(cpu, &irq);
>  }
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return true;
> +}
> -- 
> 2.30.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


