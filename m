Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7223AFFC4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:00:02 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcGH-0003fF-RD
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvcDO-0007xl-Dl
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:57:02 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvcDM-0003oi-Du
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:57:02 -0400
Received: by mail-oi1-x22e.google.com with SMTP id 14so354052oir.11
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsnx3WWXGHiAO3TPKJpzIec1T+lt/uyQth3YVlL9pnc=;
 b=rVxG5kaR90ysvW7okvOvabn5lo+ydrxWE4ngLY16gB2qCaPmwTFGDpC/HrF4kLM7Dh
 bmY6PONRopxgaQqJRL8C2B6E6T/6y3QFUi/LNCbq1ZzOp+diERhvt4+bpHMkBCnO0scx
 DXifc9h3lxHiRPbdXOMAzd4bH7KEK2MlM8v/Yd030HIeiNZLuWwbecnSMJiQky1G6Hxp
 sXckYlybo1FVWHHRUsfV4IkBLZh9reVDIGFOp4yR29oG8VOylYV7WmQmcitA1S+SIZE4
 4lZGrcqBU1UQzS9KNoPlW9Z0A2EAej47g0WSs0eME0KQTZMH6T3hP9m4TU2Pmul6yHsG
 rUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsnx3WWXGHiAO3TPKJpzIec1T+lt/uyQth3YVlL9pnc=;
 b=Q4/jLBzqtbCVo+GoImB2YxjWIJqiVT2BzKjsjYnRXTdAWa+C+HX/87THGFB6iBYlHW
 WN9fCnscyv4PBKtdIaJ8Ps0HNMyc/RrSk36iZPHeLpVGCqaQfNkrjbfvspUjSSTYIuqw
 yrXNouleVqGw180UHSAzOLPmZO58lcsJq+1PSHo8BnsqqMhkD1VDQeZiDmZXmXoA4XHh
 Z0zes9giA6SQCjfDVQ9pZinBHar5Art0Y/QuqljaA7TDz/ohHwBvOGuw/VFLbHUUdslH
 PIDDLul2pUwjsBMFjkq/uI9oqUTmdjLjpD3EzhchtMxDCvWp+ZWrZXIWlVz4IvAvHHoP
 SB8g==
X-Gm-Message-State: AOAM530KZxSaLQco93O0VR12i8S52qE+ue9IhJBNDBLPO7DPVfaCCKIA
 hcoz7QjhaSaVJt8D8JocE0wwh8OlrJ8CWnm3CRwxhA==
X-Google-Smtp-Source: ABdhPJzNy4tmmTU4hyu2JtcL2mUCBLsLb91CbtjqvgbJMOuxDhSiRtfNgTHpct2a5+XVH5QglaC1zgDWvalpN5+uc3c=
X-Received: by 2002:aca:b38a:: with SMTP id c132mr2304058oif.90.1624352218925; 
 Tue, 22 Jun 2021 01:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-6-steven.price@arm.com>
In-Reply-To: <20210621111716.37157-6-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jun 2021 09:56:22 +0100
Message-ID: <CA+EHjTx7_atkNMqrUkHr0mM2xDbzBafip3s0JhGrGzsX9N08XQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
To: Steven Price <steven.price@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Will Deacon <will@kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=tabba@google.com; helo=mail-oi1-x22e.google.com
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
> The VMM may not wish to have it's own mapping of guest memory mapped
> with PROT_MTE because this causes problems if the VMM has tag checking
> enabled (the guest controls the tags in physical RAM and it's unlikely
> the tags are correct for the VMM).
>
> Instead add a new ioctl which allows the VMM to easily read/write the
> tags from guest memory, allowing the VMM's mapping to be non-PROT_MTE
> while the VMM can still read/write the tags for the purpose of
> migration.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h |  3 ++
>  arch/arm64/include/asm/mte-def.h  |  1 +
>  arch/arm64/include/uapi/asm/kvm.h | 11 +++++
>  arch/arm64/kvm/arm.c              |  7 +++
>  arch/arm64/kvm/guest.c            | 82 +++++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h          |  1 +
>  6 files changed, 105 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 309e36cc1b42..6a2ac4636d42 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -729,6 +729,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>  int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>                                struct kvm_device_attr *attr);
>
> +long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> +                               struct kvm_arm_copy_mte_tags *copy_tags);
> +
>  /* Guest/host FPSIMD coordination helpers */
>  int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>  void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-def.h
> index cf241b0f0a42..626d359b396e 100644
> --- a/arch/arm64/include/asm/mte-def.h
> +++ b/arch/arm64/include/asm/mte-def.h
> @@ -7,6 +7,7 @@
>
>  #define MTE_GRANULE_SIZE       UL(16)
>  #define MTE_GRANULE_MASK       (~(MTE_GRANULE_SIZE - 1))
> +#define MTE_GRANULES_PER_PAGE  (PAGE_SIZE / MTE_GRANULE_SIZE)
>  #define MTE_TAG_SHIFT          56
>  #define MTE_TAG_SIZE           4
>  #define MTE_TAG_MASK           GENMASK((MTE_TAG_SHIFT + (MTE_TAG_SIZE - 1)), MTE_TAG_SHIFT)
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 24223adae150..b3edde68bc3e 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -184,6 +184,17 @@ struct kvm_vcpu_events {
>         __u32 reserved[12];
>  };
>
> +struct kvm_arm_copy_mte_tags {
> +       __u64 guest_ipa;
> +       __u64 length;
> +       void __user *addr;
> +       __u64 flags;
> +       __u64 reserved[2];
> +};
> +
> +#define KVM_ARM_TAGS_TO_GUEST          0
> +#define KVM_ARM_TAGS_FROM_GUEST                1
> +
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_ARM_COPROC_MASK                0x000000000FFF0000
>  #define KVM_REG_ARM_COPROC_SHIFT       16
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 28ce26a68f09..511f3716fe33 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1359,6 +1359,13 @@ long kvm_arch_vm_ioctl(struct file *filp,
>
>                 return 0;
>         }
> +       case KVM_ARM_MTE_COPY_TAGS: {
> +               struct kvm_arm_copy_mte_tags copy_tags;
> +
> +               if (copy_from_user(&copy_tags, argp, sizeof(copy_tags)))
> +                       return -EFAULT;
> +               return kvm_vm_ioctl_mte_copy_tags(kvm, &copy_tags);
> +       }
>         default:
>                 return -EINVAL;
>         }
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 5cb4a1cd5603..4ddb20017b2f 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -995,3 +995,85 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>
>         return ret;
>  }
> +
> +long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> +                               struct kvm_arm_copy_mte_tags *copy_tags)
> +{
> +       gpa_t guest_ipa = copy_tags->guest_ipa;
> +       size_t length = copy_tags->length;
> +       void __user *tags = copy_tags->addr;
> +       gpa_t gfn;
> +       bool write = !(copy_tags->flags & KVM_ARM_TAGS_FROM_GUEST);
> +       int ret = 0;
> +
> +       if (!kvm_has_mte(kvm))
> +               return -EINVAL;
> +
> +       if (copy_tags->reserved[0] || copy_tags->reserved[1])
> +               return -EINVAL;
> +
> +       if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
> +               return -EINVAL;
> +
> +       if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
> +               return -EINVAL;
> +
> +       gfn = gpa_to_gfn(guest_ipa);
> +
> +       mutex_lock(&kvm->slots_lock);
> +
> +       while (length > 0) {
> +               kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
> +               void *maddr;
> +               unsigned long num_tags;
> +               struct page *page;
> +
> +               if (is_error_noslot_pfn(pfn)) {
> +                       ret = -EFAULT;
> +                       goto out;
> +               }
> +
> +               page = pfn_to_online_page(pfn);
> +               if (!page) {
> +                       /* Reject ZONE_DEVICE memory */
> +                       ret = -EFAULT;
> +                       goto out;
> +               }
> +               maddr = page_address(page);
> +
> +               if (!write) {
> +                       if (test_bit(PG_mte_tagged, &page->flags))
> +                               num_tags = mte_copy_tags_to_user(tags, maddr,
> +                                                       MTE_GRANULES_PER_PAGE);
> +                       else
> +                               /* No tags in memory, so write zeros */
> +                               num_tags = MTE_GRANULES_PER_PAGE -
> +                                       clear_user(tags, MTE_GRANULES_PER_PAGE);
> +                       kvm_release_pfn_clean(pfn);
> +               } else {
> +                       num_tags = mte_copy_tags_from_user(maddr, tags,
> +                                                       MTE_GRANULES_PER_PAGE);
> +                       kvm_release_pfn_dirty(pfn);
> +               }
> +
> +               if (num_tags != MTE_GRANULES_PER_PAGE) {
> +                       ret = -EFAULT;
> +                       goto out;
> +               }
> +
> +               /* Set the flag after checking the write completed fully */
> +               if (write)
> +                       set_bit(PG_mte_tagged, &page->flags);
> +
> +               gfn++;
> +               tags += num_tags;
> +               length -= PAGE_SIZE;
> +       }
> +
> +out:
> +       mutex_unlock(&kvm->slots_lock);
> +       /* If some data has been copied report the number of bytes copied */
> +       if (length != copy_tags->length)
> +               return copy_tags->length - length;

I'm not sure if this is actually an issue, but a couple of comments on
the return value if there is an error after a partial copy has been
done. If mte_copy_tags_to_user or mte_copy_tags_from_user don't return
MTE_GRANULES_PER_PAGE, then the check for num_tags would fail, but
some of the tags would have been copied, which wouldn't be reflected
in length. That said, on a write the tagged bit wouldn't be set, and
on read then the return value would be conservative, but not
incorrect.

That said, even though it is described that way in the documentation
(rather deep in the description though), it might be confusing to
return a non-negative value on an error. The other kvm ioctl I could
find that does something similar, KVM_S390_GET_IRQ_STATE, seems to
always return a -ERROR on error, rather than the number of bytes
copied.

Cheers,
/fuad

> +       return ret;
> +}
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d4da58ddcad7..da1edd2b4046 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1429,6 +1429,7 @@ struct kvm_s390_ucas_mapping {
>  /* Available with KVM_CAP_PMU_EVENT_FILTER */
>  #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
>  #define KVM_PPC_SVM_OFF                  _IO(KVMIO,  0xb3)
> +#define KVM_ARM_MTE_COPY_TAGS    _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
>
>  /* ioctl for vm fd */
>  #define KVM_CREATE_DEVICE        _IOWR(KVMIO,  0xe0, struct kvm_create_device)
> --
> 2.20.1
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

