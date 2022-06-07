Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592A53FEF9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:37:35 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYSj-0002nH-LN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nyXCo-0008Q4-Lh
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nyXCl-0001ib-GJ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654600617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s6D+tDPL1+VIqSmAaw2F3EdpteVx9cYLBbOFIaNeFvc=;
 b=RwRUhrUsC9i2jpnApM4zKbrOcQ3ia66jY94VoPgCY2y8FnA8wZH8g8Qm2Y1A7vEP6GaHvi
 CBmsPis0GiecZAuaPi5xPateYwX/mGFwLa6X9nM/y+vTQa0K3ASpEy0cgH5CafqZMuYQc2
 4d25sj00zrj9JvehATBPIw0VEQ7zUnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-TQfqeU4POKqoplHVLhA46g-1; Tue, 07 Jun 2022 07:16:54 -0400
X-MC-Unique: TQfqeU4POKqoplHVLhA46g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4C89101A54E;
 Tue,  7 Jun 2022 11:16:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 953CA82882;
 Tue,  7 Jun 2022 11:16:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB5141800081; Tue,  7 Jun 2022 13:16:51 +0200 (CEST)
Date: Tue, 7 Jun 2022 13:16:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
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
Message-ID: <20220607111651.2zjm7mx2gz3irqxo@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-12-xiaoyao.li@intel.com>
 <20220523092003.lm4vzfpfh4ezfcmy@sirius.home.kraxel.org>
 <d3e967f3-917f-27ce-1367-2dba23e5c241@intel.com>
 <20220524065719.wyyoba2ke73tx3nc@sirius.home.kraxel.org>
 <39341481-67b6-aba4-a25a-10abb398bec4@intel.com>
 <20220601075453.7qyd5z22ejgp37iz@sirius.home.kraxel.org>
 <9d00fd58-b957-3b8e-22ab-12214dcbbe97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d00fd58-b957-3b8e-22ab-12214dcbbe97@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

  Hi,

> > I guess it could be helpful for the discussion when you can outine the
> > 'big picture' for tdx initialization.  How does kvm accel setup look
> > like without TDX, and what additional actions are needed for TDX?  What
> > ordering requirements and other constrains exist?
> 
> To boot a TDX VM, it requires several changes/additional steps in the flow:
> 
>  1. specify the vm type KVM_X86_TDX_VM when creating VM with
>     IOCTL(KVM_CREATE_VM);
> 	- When initializing KVM accel
> 
>  2. initialize VM scope configuration before creating any VCPU;
> 
>  3. initialize VCPU scope configuration;
> 	- done inside machine_init_done_notifier;
> 
>  4. initialize virtual firmware in guest private memory before vcpu running;
> 	- done inside machine_init_done_notifier;
> 
>  5. finalize the TD's measurement;
> 	- done inside machine init_done_notifier;
> 
> 
> And we are discussing where to do step 2).
> 
> We can find from the code of tdx_pre_create_vcpu(), that it needs
> cpuid entries[] and attributes as input to KVM.
> 
>   cpuid entries[] is set up by kvm_x86_arch_cpuid() mainly based on
>   'CPUX86State *env'
> 
>   attributes.pks is retrieved from env->features[]
>   and attributes.pmu is retrieved from x86cpu->enable_pmu
> 
> to make VM-socpe data is consistent with VCPU data, we do choose the point
> late enough to ensure all the info/configurations from VCPU are settle down,
> that just before calling KVM API to do VCPU-scope configuration.

So essentially tdx defines (some) vcpu properties at vm scope?  Given
that all vcpus typically identical (and maybe tdx even enforces this)
this makes sense.

A comment in the source code explaining this would be good.

thanks,
  Gerd


