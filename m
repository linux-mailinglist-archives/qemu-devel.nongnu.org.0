Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA72C5DBC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:17:09 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPZc-0000CR-9k
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPWn-0007aR-Mf
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPWm-0005Yo-3c
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606428851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aldWuSz08yhXDleBcJapx+DXR9FbCE2eUJ4lczjx2Dw=;
 b=Mhh87TCrL7Ezue+xPb64VSMpqxmiZMqCRUe2Z9QeofKrkCw2bj581IMcrV45oJCljI98Ng
 JnsYXDLrTVOl9jm7kfJWKw7Afu/Q/WX4jOWd1D+XpxuLpITIuI9CcE6qQxBM/hpTZRG1+Y
 BdubYF+PV0lqv0MQI1Mu9Y4isjYtG0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-oqoftIF7Pw2j__b1wyn0KQ-1; Thu, 26 Nov 2020 17:14:07 -0500
X-MC-Unique: oqoftIF7Pw2j__b1wyn0KQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B6680F052;
 Thu, 26 Nov 2020 22:14:06 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEE281A88B;
 Thu, 26 Nov 2020 22:14:05 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:14:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201126221405.GT2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-9-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:50:17PM +0100, Alexander Graf wrote:
> The Apple M1 only supports up to 36 bits of physical address space. That
> means we can not fit the 64bit MMIO BAR region into our address space.
> 
> To fix this, let's not expose a 64bit MMIO BAR region when running on
> Apple Silicon.
> 
> I have not been able to find a way to enumerate that easily, so let's
> just assume we always have that little PA space on hypervisor.framework
> systems.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  hw/arm/virt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 27dbeb549e..d74053ecd4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -45,6 +45,7 @@
>  #include "hw/display/ramfb.h"
>  #include "net/net.h"
>  #include "sysemu/device_tree.h"
> +#include "sysemu/hvf.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> @@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
>      unsigned int smp_cpus = machine->smp.cpus;
>      unsigned int max_cpus = machine->smp.max_cpus;
>  
> +    /*
> +     * On Hypervisor.framework capable systems, we only have 36 bits of PA
> +     * space, which is not enough to fit a 64bit BAR space
> +     */
> +    if (hvf_enabled()) {
> +        vms->highmem = false;
> +    }

Direct checks for *_enabled() are a pain to clean up later when
we add support to new accelerators.  Can't this be implemented as
(e.g.) a AccelClass::max_physical_address_bits field?

> +
>      /*
>       * In accelerated mode, the memory map is computed earlier in kvm_type()
>       * to create a VM with the right number of IPA bits.
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
Eduardo


