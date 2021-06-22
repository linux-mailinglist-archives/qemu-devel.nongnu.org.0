Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30A3AFECA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:09:43 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbTa-0007Ir-L3
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvbSR-0006JP-5s
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:08:31 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvbSP-0002w8-7h
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:08:30 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso20371208oto.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Beo38iuohodlyRGHyjXttlsvIYg9mKSm+zuOAhH7bbI=;
 b=eXFdd6VxuZa/DYPOmOXnXEky4VQsJMT/UQpduHu02BEU1YhAn1pFfY4FaYLDYL+ikC
 uAHK2J/vbGb40UKTAEfT/yo1IYWvbxUDVqFGzgBAydAhPlRO4zmhMwZL5+u7HGavYZKH
 H12WEshODfMx+D7fAubGmbmY9lBoPGpqkW3J/X+5gcKxM/i2xzfNbVMqDiYsTU1158qs
 gg9IWNeR2Yza7A5Ic/pwJaQ449BMitgtZvwr4VOY6PjYgZeq5ar+lh1ej3pCQJ9MnJwZ
 JvE5EgYzJz7WiQzsrYxSPY3I6n1l+xuGf8aj3ziygHc6+Z2EAocVErEEFRefl+xrNi8E
 nKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Beo38iuohodlyRGHyjXttlsvIYg9mKSm+zuOAhH7bbI=;
 b=eNjBLmrrJxVn0pbYOLDap4iWVNBqrz/bN+mhjzf+QbJzDjlRBbghcu43R8EGubmyIU
 gEPo9eCLRdLCvPA7iGwyZL0Yee9JESpv906elDAtaZLBkTIRQ+aeEAWUT3bTj99HabCu
 RHpL9FSvV399SdQ//DDpQ4XO2F2ewdgYiVxjSM1Y2ydX+7qeVXf6f56hp0ELynfWvmhX
 xhcZXNaPXaeQkVlAgYFmhmk1ydlGSACfCsNVrg3CcsRrosiO5nDSxfurFBYGB4R5eq8z
 2WPSNWYqPzAszynNquFAIsbCy3+p2YZuw6VizNSxjsYd/Rlc8uiBS4YgzXGo3A6ps6tJ
 BeRg==
X-Gm-Message-State: AOAM532fn7CxoVU8ThsTGLZ73dQE3ynHS9Fs2Bj5fP/+TK1u9rxbUVgK
 5f1EGgBOxboJZrjvXFCA4J3wC/f9eo/9rhP8wgzbTg==
X-Google-Smtp-Source: ABdhPJyiET1EnWwNel3SWJVHizN68wDafL2KmojvV1sgueaM5ziIuDkR6iIl0gSG5oojwkafjVs4ZM7JoA8uNdQS05g=
X-Received: by 2002:a05:6830:1598:: with SMTP id
 i24mr2089639otr.52.1624349307481; 
 Tue, 22 Jun 2021 01:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-5-steven.price@arm.com>
In-Reply-To: <20210621111716.37157-5-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jun 2021 09:07:51 +0100
Message-ID: <CA+EHjTzuduzTcJo+jjVzVAVUB4i3Nr3mki4jyiNW9K=pr-HPYA@mail.gmail.com>
Subject: Re: [PATCH v17 4/6] KVM: arm64: Expose KVM_ARM_CAP_MTE
To: Steven Price <steven.price@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Will Deacon <will@kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=tabba@google.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -155
X-Spam_score: -15.6
X-Spam_bar: ---------------
X-Spam_report: (-15.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Mon, Jun 21, 2021 at 12:18 PM Steven Price <steven.price@arm.com> wrote:
>
> It's now safe for the VMM to enable MTE in a guest, so expose the
> capability to user space.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/kvm/arm.c      | 9 +++++++++
>  arch/arm64/kvm/reset.c    | 4 ++++
>  arch/arm64/kvm/sys_regs.c | 3 +++
>  3 files changed, 16 insertions(+)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index e720148232a0..28ce26a68f09 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -93,6 +93,12 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>                 r = 0;
>                 kvm->arch.return_nisv_io_abort_to_user = true;
>                 break;
> +       case KVM_CAP_ARM_MTE:
> +               if (!system_supports_mte() || kvm->created_vcpus)
> +                       return -EINVAL;
> +               r = 0;
> +               kvm->arch.mte_enabled = true;
> +               break;
>         default:
>                 r = -EINVAL;
>                 break;
> @@ -237,6 +243,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>                  */
>                 r = 1;
>                 break;
> +       case KVM_CAP_ARM_MTE:
> +               r = system_supports_mte();
> +               break;
>         case KVM_CAP_STEAL_TIME:
>                 r = kvm_arm_pvtime_supported();
>                 break;
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index d37ebee085cf..9e6922b9503a 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -244,6 +244,10 @@ int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>         switch (vcpu->arch.target) {
>         default:
>                 if (test_bit(KVM_ARM_VCPU_EL1_32BIT, vcpu->arch.features)) {
> +                       if (vcpu->kvm->arch.mte_enabled) {
> +                               ret = -EINVAL;
> +                               goto out;
> +                       }
>                         pstate = VCPU_RESET_PSTATE_SVC;
>                 } else {
>                         pstate = VCPU_RESET_PSTATE_EL1;

nit: I was wondering whether this check would be better suited in
kvm_vcpu_set_target, rather than here (kvm_reset_vcpu). kvm_reset_vcpu
is called by kvm_vcpu_set_target, but kvm_vcpu_set_target is where
checking for supported features happens. It might be better to group
all such checks together. I don't think that there is any risk of this
feature being toggled by the other call path to kvm_reset_vcpu (via
check_vcpu_requests).

Cheers,
/fuad

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5c75b24eae21..f6f126eb6ac1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1312,6 +1312,9 @@ static bool access_ccsidr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
>                                    const struct sys_reg_desc *rd)
>  {
> +       if (kvm_has_mte(vcpu->kvm))
> +               return 0;
> +
>         return REG_HIDDEN;
>  }
>
> --
> 2.20.1
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

