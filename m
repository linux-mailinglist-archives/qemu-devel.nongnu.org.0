Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D9587A1F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:54:32 +0200 (CEST)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIobf-0002to-As
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoXC-0000b7-FH
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIoXA-00028U-LX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433792;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qILDvFq0JE1nYEx2OKXCR/KNctto2Ey2a6Aj4h5FseE=;
 b=ZHd0LgNAQhSPN7jbf3ELjwZdH+2KUG4fuwdKwTSd6kPnDtBmTNheR4p52l9TcG9WN1avk9
 TiA3y9ZJ0FUQbLelUemctEqUPMHftu4e1H297/NPSEO+kq7dQqyWiuz4GDmUzY/olQVC4O
 fOK7E6jCkxQoLBS99PFVOclhvqjo1wE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-R-6ShOiFM_qnD7YkuQfObw-1; Tue, 02 Aug 2022 05:49:51 -0400
X-MC-Unique: R-6ShOiFM_qnD7YkuQfObw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A728381078D;
 Tue,  2 Aug 2022 09:49:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC53E2166B26;
 Tue,  2 Aug 2022 09:49:47 +0000 (UTC)
Date: Tue, 2 Aug 2022 10:49:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [PATCH v1 00/40] TDX QEMU support
Message-ID: <YujzOUjMbBZRi/e6@redhat.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 02, 2022 at 03:47:10PM +0800, Xiaoyao Li wrote:
> This is the first version that removes RFC tag since last RFC gots
> several acked-by. Hope more people and reviewers can help review it.
> 
> 
> This patch series aims to enable TDX support to allow creating and booting a
> TD (TDX VM) with QEMU. It needs to work with corresponding KVM patch [1].
> TDX related documents can be found in [2].
> 
> this series is also available in github:
> 
> https://github.com/intel/qemu-tdx/tree/tdx-qemu-upstream-v1
> 
> To boot a TDX VM, it requires several changes/additional steps in the flow:
> 
>  1. specify the vm type KVM_X86_TDX_VM when creating VM with
>     IOCTL(KVM_CREATE_VM);
>  2. initialize VM scope configuration before creating any VCPU;
>  3. initialize VCPU scope configuration;
>  4. initialize virtual firmware (TDVF) in guest private memory before
>     vcpu running;
> 
> Besides, TDX VM needs to boot with TDVF (TDX virtual firmware) and currently
> upstream OVMF can serve as TDVF. This series adds the support of parsing TDVF,
> loading TDVF into guest's private memory and preparing TD HOB info for TDVF.
> 
> [1] KVM TDX basic feature support v7
> https://lore.kernel.org/all/cover.1656366337.git.isaku.yamahata@intel.com/
> 
> [2] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
> 
> == Limitation and future work ==


> - CPU model
> 
>   We cannot create a TD with arbitrary CPU model like what for non-TDX VMs,
>   because only a subset of features can be configured for TD.
>   
>   - It's recommended to use '-cpu host' to create TD;
>   - '+feature/-feature' might not work as expected;
> 
>   future work: To introduce specific CPU model for TDs and enhance +/-features
>                for TDs.

Which features are incompatible with TDX ?

Presumably you have such a list, so that KVM can block them when
using '-cpu host' ? If so, we should be able to sanity check the
use of these features in QEMU for the named CPU models / feature
selection too.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


