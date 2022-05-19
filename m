Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFED52D2B9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:43:47 +0200 (CEST)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfVJ-0000HB-Jz
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfPm-0005kX-DT
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfPj-00051R-FU
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652963878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooXy62Hk5UIolIn739nYxWhogJuzneb7edsCPxC3GZk=;
 b=ITimvj7n42LN4E2N3tiH1TlP2LibC6rLEIr0/rYwy51AYxRjPOiB91z6FHDhN/isa3S6lI
 izp/AmM4paakVSYxLiBF/IKtGrUGpygG1ZACkVyM4anDkwecR39E8+UFSMA5dqUR5Q2WtB
 Zajp/3Eu1zaphgg7izFBTe82Wpk2Vr4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-pyhWe45IMO6xuSaZ6IsaRA-1; Thu, 19 May 2022 08:37:57 -0400
X-MC-Unique: pyhWe45IMO6xuSaZ6IsaRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso4463127wmb.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooXy62Hk5UIolIn739nYxWhogJuzneb7edsCPxC3GZk=;
 b=n5baaQpqzOsIB4dRnJUlV1Y9oqRI2UunjFjB6juhdJMjCYvGUcqPfqXsMbnpv/hzjT
 HzgSsvhRQBkMIC8YybmOUTESXYxD3JNurYCq2KyB0FMVWSzO/JoiGV8Yt9nJY6Jo8fGp
 QQBGTHdx1DqpKxHumLNL9Lnwpe5DZqV/sCZ0/HYMU79RnD9e4dQCuLc49U5jytiUOhF5
 QhrRj3rFbmmlwHX5jQqylA+76vYHQDB+ihJcPnVmrC4F6OitrBTtD8el+G5J2VTh0vF6
 zTN6tMZPXHwz/ghOjKJfqSRJJOztCqXkOQ0nCzY3YZvpoe46zyqLkw8w4xJ3xJV0KmYY
 GaQg==
X-Gm-Message-State: AOAM533IQYFdq4umbo1dWHpgkjsDUp6on+1bpWqP1a+MHRKIOIHe98dc
 eOIlW9HaFYlibhmUVlovnzel6Cpcd2mdvoIe9oyM0NYQHQJK7Wid48d2lhnlKj+jiCIKWjmb6cA
 9PTOKE7J6E3DKB3k=
X-Received: by 2002:a05:600c:1989:b0:394:8dc0:b57f with SMTP id
 t9-20020a05600c198900b003948dc0b57fmr4100062wmq.110.1652963876155; 
 Thu, 19 May 2022 05:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZurGK55aOxwDs8GUH802k74wXHc/P9rPHHxGWxNxApFNWQgHlpMMq1ZVpay7s8Z2vAIuItg==
X-Received: by 2002:a05:600c:1989:b0:394:8dc0:b57f with SMTP id
 t9-20020a05600c198900b003948dc0b57fmr4100049wmq.110.1652963875973; 
 Thu, 19 May 2022 05:37:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b00396f8c79d22sm4025257wmb.11.2022.05.19.05.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:37:55 -0700 (PDT)
Date: Thu, 19 May 2022 14:37:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, jon.grimm@amd.com
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220519143754.42b200d4@redhat.com>
In-Reply-To: <2cec4bba-4400-ae74-231e-c064f03df691@amd.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
 <20220513072007-mutt-send-email-mst@kernel.org>
 <2cec4bba-4400-ae74-231e-c064f03df691@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 May 2022 13:53:49 +0700
Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:

> On 5/13/22 6:23 PM, Michael S. Tsirkin wrote:
> > On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:  
> >> On Wed, 4 May 2022 08:16:39 -0500
> >> Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>  wrote:
> >>  
> >>> This is the maximum number of vCPU supported by
> >>> the AMD x2APIC virtualization.
> >>>
> >>> Signed-off-by: Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>
> >>> ---
> >>>   hw/i386/pc_q35.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >>> index 302288342a..e82b1c690d 100644
> >>> --- a/hw/i386/pc_q35.c
> >>> +++ b/hw/i386/pc_q35.c
> >>> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> >>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> >>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> >>> -    m->max_cpus = 288;
> >>> +    m->max_cpus = 512;  
> >> Maybe we should bump it to KVM VCPU maximum,
> >> and make sure we error out if asked for combination of
> >> hardware/irqchip is not usable.  
> >
> > So what happens if one does 710 and then tries to use AMD x2APIC?
> > We'd like that to error out, right?
> >   
> 
> Since the AMD SVM x2AVIC can support only upto 512 vCPUs,
> KVM would return error when QEMU tries to create more than 512 vcpus
> in the following call-path:
> 
>    kvm_vm_ioctl_create_vcpu
>      kvm_arch_vcpu_create
>        svm_vcpu_create
>          avic_init_vcpu

what is actual error message that end user will get from that failure?

 
> Also, I tried to find a way to get the KVM VCPU max value via KVM_CAP_MAX_VCPUS ioctl,
> but the accel/kvm/kvm-all.c:kvm_init() is called later than hw/core/machine-smp.c:
> machine_parse_smp_config(), where it checks the specified QEMU -smp option.
> 
> So, if there is no objection, I will send out a patch to change m->max_cpus = 1024
> to match current KVM limit.
> 
> Best Regards,
> Suravee
> 


