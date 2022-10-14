Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891ED5FE876
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 07:37:20 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojDNn-0001K8-7D
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 01:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ojDL7-0007sl-KJ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 01:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ojDL4-0005Y6-F4
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 01:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665725668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8trlJsHTyBYFl3iSoKLkKxiftpMCd5kSe7wrtw8WL4=;
 b=AeDaDqd7mjMHhHjB1TeTpgQVbrlj9sNVaX0kQEhntjZJ8r8pTHDz9h29lz2Hwpblrrc7zK
 LZ+VOf8oXlgMMkbp+G8cGQ1PKl/1rh+yBhEWCV2qLzjDoEqBWa4xV9xp9BOfDBfcZlH87J
 1b1bCQb+kE/JyOTZcP5Q0s3NUmpyZlU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-3uxrHNl_O8CsCHgmyXeaFA-1; Fri, 14 Oct 2022 01:34:26 -0400
X-MC-Unique: 3uxrHNl_O8CsCHgmyXeaFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso2460112wmq.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 22:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8trlJsHTyBYFl3iSoKLkKxiftpMCd5kSe7wrtw8WL4=;
 b=Lig8fF48HpSoJ/S9SDKW95Op8jQaAD1QmwarYR6On3+rQQHA5xVISPMrzHecgdMDY3
 UOLHdYMrjWYvMvdppkC6ZmrbPbyU5HGO7Wv/aIjxGQT24axrklWIYt3xvOZvP6BTD2MC
 94TstbEKKxRlFMZtw9tgaw9g1M+oReenaJptXo/YxfLNS1rPLyHIwnGZKqlq+UHCqQ9v
 i2jQ5q5hdWgoTR1Pecl+3wVHZSEVzEUXDEJryObBNjvYj+dtP6WMOji5CCaTzEwWLc9K
 jzKpSlrKzFLRleFG0dvxNMRfsOvMJm7BdDPI+jLcld6uJ4ro7EDFqPeuc+GxDobVK8pH
 MKRQ==
X-Gm-Message-State: ACrzQf02okKwDo0ILK83fS7U+XLMVTg8f8hmqfwnwxP7zk4+c19GvdPs
 U4+FxgLCYc5sRM2AW7GskLEGYAWFZifboRYMU7IXpyTeD/SHGhOnR+pijfKpylyqU5ZdgDLXck1
 sz6hlheln3kwKNH0=
X-Received: by 2002:a05:600c:4611:b0:3c5:e3a3:942a with SMTP id
 m17-20020a05600c461100b003c5e3a3942amr9049123wmo.82.1665725665709; 
 Thu, 13 Oct 2022 22:34:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bB8zKYPiC5hvp1CsHP3BssllLnc3EpU8ceRce26Epnl3AziK2mHwtoH4iEZ7wcoRzL51/lQ==
X-Received: by 2002:a05:600c:4611:b0:3c5:e3a3:942a with SMTP id
 m17-20020a05600c461100b003c5e3a3942amr9049103wmo.82.1665725665395; 
 Thu, 13 Oct 2022 22:34:25 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b00228de351fc0sm1076394wrb.38.2022.10.13.22.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 22:34:24 -0700 (PDT)
Date: Fri, 14 Oct 2022 01:34:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zeng Guang <guang.zeng@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Gao, Chao" <chao.gao@intel.com>
Subject: Re: [PATCH v3] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Message-ID: <20221014013323-mutt-send-email-mst@kernel.org>
References: <20220825025246.26618-1-guang.zeng@intel.com>
 <2c9d8124-c8f5-5f21-74c5-307e16544143@intel.com>
 <cea2094f-72e7-a63d-ddca-86160240db7b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea2094f-72e7-a63d-ddca-86160240db7b@intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 14, 2022 at 09:01:02AM +0800, Zeng Guang wrote:
> PING again !
> This QEMU patch is to optimize max APIC ID set for current VM session
> introduced since linux v6.0. It's also compatible with previous linux
> version.
> 
> Thanks.
> 
> On 9/5/2022 9:27 AM, Zeng Guang wrote:
> > Kindly PING!
> > 
> > On 8/25/2022 10:52 AM, Zeng Guang wrote:
> > > Specify maximum possible APIC ID assigned for current VM session to KVM
> > > prior to the creation of vCPUs. By this setting, KVM can set up VM-scoped
> > > data structure indexed by the APIC ID, e.g. Posted-Interrupt Descriptor
> > > pointer table to support Intel IPI virtualization, with the most optimal
> > > memory footprint.
> > > 
> > > It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
> > > capability once KVM has enabled it. Ignoring the return error if KVM
> > > doesn't support this capability yet.
> > > 
> > > Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> > > ---
> > >    hw/i386/x86.c              | 4 ++++
> > >    target/i386/kvm/kvm-stub.c | 5 +++++
> > >    target/i386/kvm/kvm.c      | 5 +++++
> > >    target/i386/kvm/kvm_i386.h | 1 +
> > >    4 files changed, 15 insertions(+)
> > > 
> > > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > > index 050eedc0c8..4831193c86 100644
> > > --- a/hw/i386/x86.c
> > > +++ b/hw/i386/x86.c
> > > @@ -139,6 +139,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
> > >            exit(EXIT_FAILURE);
> > >        }
> > > +    if (kvm_enabled()) {
> > > +        kvm_set_max_apic_id(x86ms->apic_id_limit);
> > > +    }
> > > +
> > >        possible_cpus = mc->possible_cpu_arch_ids(ms);
> > >        for (i = 0; i < ms->smp.cpus; i++) {
> > >            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
> > > diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
> > > index f6e7e4466e..e052f1c7b0 100644
> > > --- a/target/i386/kvm/kvm-stub.c
> > > +++ b/target/i386/kvm/kvm-stub.c
> > > @@ -44,3 +44,8 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
> > >    {
> > >        abort();
> > >    }
> > > +
> > > +void kvm_set_max_apic_id(uint32_t max_apic_id)
> > > +{
> > > +    return;
> > > +}
> > > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > > index f148a6d52f..af4ef1e8f0 100644
> > > --- a/target/i386/kvm/kvm.c
> > > +++ b/target/i386/kvm/kvm.c
> > > @@ -5428,3 +5428,8 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
> > >            mask &= ~BIT_ULL(bit);
> > >        }
> > >    }
> > > +
> > > +void kvm_set_max_apic_id(uint32_t max_apic_id)
> > > +{
> > > +    kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID, 0, max_apic_id);
> > > +}
> > > diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> > > index 4124912c20..c133b32a58 100644
> > > --- a/target/i386/kvm/kvm_i386.h
> > > +++ b/target/i386/kvm/kvm_i386.h
> > > @@ -54,4 +54,5 @@ uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
> > >    bool kvm_enable_sgx_provisioning(KVMState *s);
> > >    void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
> > > +void kvm_set_max_apic_id(uint32_t max_apic_id);
> > >    #endif


Looks ok on the surface, but this is Paolo's area.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

-- 
MST


