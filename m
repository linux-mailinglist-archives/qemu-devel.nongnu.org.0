Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE243EDC5D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:25:09 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgMF-0006Al-KR
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFgLB-0005T8-AO
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFgL7-0002ET-I4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629134636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nSfEWJW5VOF1+UGUOs92UACFZJr9fBBVMgZfpcfs9E8=;
 b=cofzQxJ4xeVPVi5wyHNmGxTYVRiBzGhwE50N328zHbuEUQO9HaRST0tnYKgA0UFfyLRn4F
 AWxJAJb6EcN6wcfTT0j5RkTsmgXAREZKs+xKN1/RepkcxKNnTaENtlRYihd95oe8dKoIni
 y0hxgBMgAr2v6pz0fcVooVK4DGD8a7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-Bkx8BsYHOPucrXBVGpma4g-1; Mon, 16 Aug 2021 13:23:53 -0400
X-MC-Unique: Bkx8BsYHOPucrXBVGpma4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so6428206wmj.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nSfEWJW5VOF1+UGUOs92UACFZJr9fBBVMgZfpcfs9E8=;
 b=ZgbUfLUIxP5I6QmE7A7aXEoeO22u4rQdKYIHdHl9fe3Ce4e0zZTBfvuIrUYIsqCLOq
 KPIOS5oubgT36rIld0mg/7oIE6GmK6+hrbsv2EuHWsKhmnG03u9sNVIjevusvSSC+JeW
 Uai1FsNT/JgLU4RcjeFps5vOLrts8raCYPKPlocVOniSI3KSRet4hrJD4Zhb+OdmlLeu
 YmLbbE+MfO8sPcDLsM/GkISBD1Hf0Eyr0xUGg8baeJpbOCIqkiHB+FFYZ3muf5s2gNuT
 Zm6uWBO8LMqFJZ548juCd75pJjzWPNf07NZKPcJvwvLZsQqF6Y5R1NeZrZQGVrJ17G8e
 Hytw==
X-Gm-Message-State: AOAM531pkJL+BimPuSXes/gHB0eUJoYYlZiJCzF2+SRBrUY8BY92+sSO
 gw1rhsxKACFU6i01qb7RQAe4cpVveGT0LLu2/tIEvT9boR892SIpdWHI7zjm/kW1ih8x9N2Y8qm
 a87hKLRrfq6SW1Vo=
X-Received: by 2002:a5d:5228:: with SMTP id i8mr19797584wra.391.1629134631912; 
 Mon, 16 Aug 2021 10:23:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr/EULMz4YbGdtxkphQbMYTUQwPQrwSV/ywAqLyZsVMQ2DuH8UYDSePKurq0qGPBM/cdYDjg==
X-Received: by 2002:a5d:5228:: with SMTP id i8mr19797558wra.391.1629134631711; 
 Mon, 16 Aug 2021 10:23:51 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u16sm129532wmc.41.2021.08.16.10.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 10:23:49 -0700 (PDT)
Date: Mon, 16 Aug 2021 18:23:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YRqfI0YlNZ6Xowwt@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, frankeh@us.ibm.com,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 16/08/21 15:25, Ashish Kalra wrote:
> > From: Ashish Kalra<ashish.kalra@amd.com>
> > 
> > This is an RFC series for Mirror VM support that are
> > essentially secondary VMs sharing the encryption context
> > (ASID) with a primary VM. The patch-set creates a new
> > VM and shares the primary VM's encryption context
> > with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> > The mirror VM uses a separate pair of VM + vCPU file
> > descriptors and also uses a simplified KVM run loop,
> > for example, it does not support any interrupt vmexit's. etc.
> > Currently the mirror VM shares the address space of the
> > primary VM.
> > 
> > The mirror VM can be used for running an in-guest migration
> > helper (MH). It also might have future uses for other in-guest
> > operations.
> 
> Hi,
> 
> first of all, thanks for posting this work and starting the discussion.
> 
> However, I am not sure if the in-guest migration helper vCPUs should use the
> existing KVM support code.  For example, they probably can just always work
> with host CPUID (copied directly from KVM_GET_SUPPORTED_CPUID),

Doesn't at least one form of SEV have some masking of CPUID that's
visible to the guest; so perhaps we have to match the main vCPUs idea of
CPUIDs?

>  and they do
> not need to interface with QEMU's MMIO logic.  They would just sit on a
> "HLT" instruction and communicate with the main migration loop using some
> kind of standardized ring buffer protocol; the migration loop then executes
> KVM_RUN in order to start the processing of pages, and expects a
> KVM_EXIT_HLT when the VM has nothing to do or requires processing on the
> host.
> 
> The migration helper can then also use its own address space, for example
> operating directly on ram_addr_t values with the helper running at very high
> virtual addresses.  Migration code can use a RAMBlockNotifier to invoke
> KVM_SET_USER_MEMORY_REGION on the mirror VM (and never enable dirty memory
> logging on the mirror VM, too, which has better performance).

How does the use of a very high virtual address help ?

> With this implementation, the number of mirror vCPUs does not even have to
> be indicated on the command line.  The VM and its vCPUs can simply be
> created when migration starts.  In the SEV-ES case, the guest can even
> provide the VMSA that starts the migration helper.
> 
> The disadvantage is that, as you point out, in the future some of the
> infrastructure you introduce might be useful for VMPL0 operation on SEV-SNP.
> My proposal above might require some code duplication. However, it might
> even be that VMPL0 operation works best with a model more similar to my
> sketch of the migration helper; it's really too early to say.
> 

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


