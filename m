Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD503F4723
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:09:12 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5x9-0003vA-4y
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5w1-0003E9-3V
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5vy-0006ZV-1w
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629709676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aISp5M1izx4NH4v0Hn06V3ODxv34YeYXayvZgVqi7XI=;
 b=VVC0xQ88CHPih/Hasxu6hGx0QckDyJoNwYwMGrvYnFDEy5DtbU3KQ7PeM1oJuW+GnzhcI1
 5IIBpbZ9sBPsSlyEE0iAteqBgUr3Cd9tblZCM9U/gBwGw6qdR2R1R8w3/IJBfonqCpMeGY
 zW5FCYvq3kvwQwR/VP9mBF0NzDoYzUg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-rGhnkSxPO42hDHRNOEa_Cg-1; Mon, 23 Aug 2021 05:07:55 -0400
X-MC-Unique: rGhnkSxPO42hDHRNOEa_Cg-1
Received: by mail-ej1-f69.google.com with SMTP id
 bx10-20020a170906a1ca00b005c341820edeso2474938ejb.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aISp5M1izx4NH4v0Hn06V3ODxv34YeYXayvZgVqi7XI=;
 b=WCbrko3VdaYpJ1mNxmWwYgrhnyw9aAL9QZMMT8QpEU6Z4qJlSr942B24hAbA6DADQ2
 r4fyh847oLReJzgcSQyYqvSnR0IXsrLi2I9xRnwySUa/vsNl86+nI4yGqqIRkc7ITb4h
 EH9nSbdhiI19hDCEihJfNkskdebGnBW/5khthRZHBmfQ/j+UtFcLjzWVN3Mw5KkSKLGM
 DowGtx0U/ABCwCQksGS5LkXguzR0V+gXFQkXPcZ4UoQ1+v6iN9pSKJttuxngMQJzkCp2
 k/6/pwNKm2uS2v+ggcf4b34JuWqg3CM8S2q40rROngEqsLof1Wd5Pvy8b4cWDNjn/lTb
 3ApA==
X-Gm-Message-State: AOAM532Y3Yh2kzhx8H4xHJ5EiSm/KAIVijMYSiIvKzYAcAZMeTkDhHcV
 /PXcYUOdl82D5BbPkJ/OhL5Lg9izV2m4VsfFrxaOHcPHJZD0ELn3kuS59t+YoheS57iJobRZjoo
 zB+X39jOCkT/Kavg=
X-Received: by 2002:a05:6402:1907:: with SMTP id
 e7mr8322344edz.201.1629709674331; 
 Mon, 23 Aug 2021 02:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB8djTuJSNghEDmXQfwZUrFrUJ+XhpXaA6T6sK1VZ2LMR5UNf4tuXRgxUvxp5oivYQUoq5rg==
X-Received: by 2002:a05:6402:1907:: with SMTP id
 e7mr8322319edz.201.1629709674115; 
 Mon, 23 Aug 2021 02:07:54 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id ks20sm6977968ejb.101.2021.08.23.02.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:07:53 -0700 (PDT)
Date: Mon, 23 Aug 2021 11:07:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/3] hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE
 when creating scratch VM
Message-ID: <20210823090752.nanm4wttyefg3txh@gator.home>
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-2-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210822144441.1290891-2-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 22, 2021 at 03:44:39PM +0100, Marc Zyngier wrote:
> Although we probe for the IPA limits imposed by KVM (and the hardware)
> when computing the memory map, we still use the old style '0' when
> creating a scratch VM in kvm_arm_create_scratch_host_vcpu().
> 
> On systems that are severely IPA challenged (such as the Apple M1),
> this results in a failure as KVM cannot use the default 40bit that
> '0' represents.
> 
> Instead, probe for the extension and use the reported IPA limit
> if available.
> 
> Cc: Andrew Jones <drjones@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  target/arm/kvm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index d8381ba224..cc3371a99b 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -70,12 +70,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        struct kvm_vcpu_init *init)
>  {
>      int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    int max_vm_pa_size;
>  
>      kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
>          goto err;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
> +    max_vm_pa_size = ioctl(kvmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE);
> +    if (max_vm_pa_size < 0) {
> +        max_vm_pa_size = 0;
> +    }
> +    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>      if (vmfd < 0) {
>          goto err;
>      }
> -- 
> 2.30.2
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


