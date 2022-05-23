Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F0530C72
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:56:05 +0200 (CEST)
Received: from localhost ([::1]:47812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4nE-0007q4-8U
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt4Eh-0006Hy-Gd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt4Ec-0004kA-N6
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653297609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2WssiX03mpBVHdBN+acen/ASZgo748LXbRvBIixfV0I=;
 b=Up9pi1ruF90HmStn4B5ujx9VQ0NmgaeqDYZ4q4hdfN4CXwTp4y7w8wsPjuv1hCCmT6mlVJ
 mLbStFlUgYZp8TNNFBWbHVJjx3Ged3LujvgW+Kq0yux07hXnd+g6ktlmX7F8+ev30GVhGA
 n3w7FkCV8xsNTe+Y73CyAnpJy2dvun0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-MYPFSuCOOGaWgaaAtYjTQQ-1; Mon, 23 May 2022 05:20:06 -0400
X-MC-Unique: MYPFSuCOOGaWgaaAtYjTQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 073D7101AA42;
 Mon, 23 May 2022 09:20:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E55C27E97;
 Mon, 23 May 2022 09:20:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE71418000B4; Mon, 23 May 2022 11:20:03 +0200 (CEST)
Date: Mon, 23 May 2022 11:20:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 11/36] i386/tdx: Initialize TDX before creating TD
 vcpus
Message-ID: <20220523092003.lm4vzfpfh4ezfcmy@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-12-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-12-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

> +int tdx_pre_create_vcpu(CPUState *cpu)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    X86CPU *x86cpu = X86_CPU(cpu);
> +    CPUX86State *env = &x86cpu->env;
> +    struct kvm_tdx_init_vm init_vm;
> +    int r = 0;
> +
> +    qemu_mutex_lock(&tdx_guest->lock);
> +    if (tdx_guest->initialized) {
> +        goto out;
> +    }
> +
> +    memset(&init_vm, 0, sizeof(init_vm));
> +    init_vm.cpuid.nent = kvm_x86_arch_cpuid(env, init_vm.entries, 0);
> +
> +    init_vm.attributes = tdx_guest->attributes;
> +    init_vm.max_vcpus = ms->smp.cpus;
> +
> +    r = tdx_vm_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
> +    if (r < 0) {
> +        error_report("KVM_TDX_INIT_VM failed %s", strerror(-r));
> +        goto out;
> +    }
> +
> +    tdx_guest->initialized = true;
> +
> +out:
> +    qemu_mutex_unlock(&tdx_guest->lock);
> +    return r;
> +}

Hmm, hooking *vm* initialization into *vcpu* creation looks wrong to me.

take care,
  Gerd


