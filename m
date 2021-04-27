Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820236C15F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:58:03 +0200 (CEST)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJXe-0003qm-6k
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJVZ-0002h6-Rr
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJVU-00019E-VO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619513745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=azG+qV26VcF9f6xbZZgR1KQtP5vd4my8e2fzwYn6VQ0=;
 b=B4fvoG18/nMJH/pePJ2nLAMgkxbGZD4ARAojkDSX6aMWeLLCg2YFdSEpo5pM2Ro+kSeZqt
 VTeqBBLmsa7q/tfB91qXnmgyX/UG/4lx6IeZ9RX5631W/Tk1tWhfJlDalSzRdnKDdzi7qC
 TXTWLLfyecUgOGRakUK1f7tE+5ma3bM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-oIM8Qht4PdCegBdTgAg8EA-1; Tue, 27 Apr 2021 04:55:41 -0400
X-MC-Unique: oIM8Qht4PdCegBdTgAg8EA-1
Received: by mail-ej1-f72.google.com with SMTP id
 r14-20020a1709062cceb0290373a80b4002so10988991ejr.20
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=azG+qV26VcF9f6xbZZgR1KQtP5vd4my8e2fzwYn6VQ0=;
 b=RRjwqUB+9oXMf/uRRnHbxcyIS0c9Yj8YAXMt5pnssC6fNjxnh7ZyoAubaq3PrYSoEt
 kKF1a7DPJetFSUReNNqOAliByc47vM2KyAQPISPv8TcnVrW3eXkw+1VzAy3MlyGamMWZ
 muEJmUNAyGfCneuzryUm1Ff7R2z+suKX6yCVHV0QP/4mKWDQFsxPHMapHoL0FZCRI6do
 IHF4IBJJjjzKiF1gDg48K2OEq776I5TAn8bKrMIzBg02nM+DHoTHQPFrmnbbnmfinB0k
 qXPcdrr+WuSn0XlXtODrAwNytiwQT+tuTn0PDx2qWYF/pjWVsebfvHRhq5LDJYaWoP8t
 iwpg==
X-Gm-Message-State: AOAM532idR2QxcSfvXFumxTGefTTq7CSIFjfjqjegAMbClcXwuMDblVy
 JnlymG//0r9xKEsE+/UXbe4ptyveqagTaomw27FrF8+lsYfzbLuihsDfGeDH/ibAL11irhg5CxM
 wrQlTlGHQAJGn8A4=
X-Received: by 2002:a05:6402:22af:: with SMTP id
 cx15mr3030040edb.317.1619513740505; 
 Tue, 27 Apr 2021 01:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvthk7qNH2XcaWzw03zsvWp0KcyebBGHKMFGfgXMLdURf9t+DV/EPwMiFW7PR//UzzN4yQ0A==
X-Received: by 2002:a05:6402:22af:: with SMTP id
 cx15mr3030014edb.317.1619513740321; 
 Tue, 27 Apr 2021 01:55:40 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b6sm1822387edd.18.2021.04.27.01.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:55:39 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:55:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 4/6] hw/intc/arm_gicv3: Enable support for
 setting vGIC maintenance IRQ
Message-ID: <20210427085527.fvzbmxppceutdugn@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <49a4944e2f148c56938380b981afe154b7a8b7ee.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <49a4944e2f148c56938380b981afe154b7a8b7ee.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:36AM -0700, Haibo Xu wrote:
> Using the new VGIC KVM device attribute to set the maintenance IRQ.
> This is fixed to use IRQ 25(PPI 9), as a platform decision matching
> the arm64 SBSA recommendation.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c                      |  5 +++++
>  hw/intc/arm_gicv3_common.c         |  1 +
>  hw/intc/arm_gicv3_kvm.c            | 16 ++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e0..92d46ebcfe 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -663,6 +663,11 @@ static void create_gic(VirtMachineState *vms)
>              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>          }
> +
> +        if (kvm_irqchip_in_kernel()) {
> +            bool el2 = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);
> +            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions", el2);
> +        }
>      } else {
>          if (!kvm_irqchip_in_kernel()) {
>              qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..3ac10c8e61 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -495,6 +495,7 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
> +    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
>      DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
>                        redist_region_count, qdev_prop_uint32, uint32_t),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 65a4c880a3..1e1ca66e2c 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -826,6 +826,22 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>      kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
>                        KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
>  
> +    if (s->virt_extn) {
> +        bool maint_irq_allowed;
> +        uint32_t maint_irq = 25;

Please use KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ + 16, or better would be
something like PPI(KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ). We have a PPI() macro
in virt.h. I'm not sure if/where we could move that, though.

> +
> +        maint_irq_allowed =
> +            kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
> +        if (!maint_irq_allowed) {

I'll defer to the maintainers, but I'd rather see

        if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0)) {

which is slightly longer than 80 chars, then require the use of a local
variable and the broken assignment line.

> +            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
> +                             "supported by this host kernel");

"VGICv3 maintenance IRQ setting is not supported by this host kernel"

Also, I think we're trying not to brake error lines like this. It makes
grepping harder.

> +            return;
> +        }
> +
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
> +                          0, &maint_irq, true, &error_abort);
> +    }
> +
>      kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>                              KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
>  
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 91491a2f66..921ddc2c5f 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -220,6 +220,7 @@ struct GICv3State {
>      uint32_t num_irq;
>      uint32_t revision;
>      bool security_extn;
> +    bool virt_extn;
>      bool irq_reset_nonsecure;
>      bool gicd_no_migration_shift_bug;
>  
> -- 
> 2.17.1
> 
>

Thanks,
drew 


