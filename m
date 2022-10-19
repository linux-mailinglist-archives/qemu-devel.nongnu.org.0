Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4DF6048D3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:10:29 +0200 (CEST)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9m8-0004BO-Ip
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9dD-00065f-6x
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9cy-0006SN-Ad
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666188059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYXp/7z7CxUY/LvjrFaKKhgw5Sd733e6+8BM8y44Kls=;
 b=Q5cVHFUOEUx55YlNNP1imY1XCjKyMetW/FKONqTRKFV0vlVtv0pJ6ieAfvGmiUP1ZwzGpR
 zR7qEiHhZeB3AOvE7MpakE8ep+gv/XLW1XpfHqJj3s71uxMrRdNqrIidLfet2j1EWUJdUo
 2R+5sawN2eECjfJPj+QOLkEfHZZvrEk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-92fkU21IO7-P3JAW_lL_5g-1; Wed, 19 Oct 2022 10:00:55 -0400
X-MC-Unique: 92fkU21IO7-P3JAW_lL_5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35EA080602C;
 Wed, 19 Oct 2022 14:00:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DF22028E98;
 Wed, 19 Oct 2022 14:00:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
In-Reply-To: <20221011231832.149839-7-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 16:00:46 +0200
Message-ID: <87wn8vzze9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:

> After the improvement to high memory region address assignment is
> applied, the memory layout can be changed, introducing possible
> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
> is disabled or enabled when the optimization is applied or not, with
> the following configuration.
>
>   pa_bits              = 40;
>   vms->highmem_redists = false;
>   vms->highmem_ecam    = false;
>   vms->highmem_mmio    = true;
>
>   # qemu-system-aarch64 -accel kvm -cpu host    \
>     -machine virt-7.2,compact-highmem={on, off} \
>     -m 4G,maxmem=511G -monitor stdio
>
>   Region            compact-highmem=off         compact-highmem=on
>   ----------------------------------------------------------------
>   RAM               [1GB         512GB]        [1GB         512GB]
>   HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>   HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>   HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>
> In order to keep backwords compatibility, we need to disable the
> optimization on machines, which is virt-7.1 or ealier than it. It
> means the optimization is enabled by default from virt-7.2. Besides,
> 'compact-highmem' property is added so that the optimization can be
> explicitly enabled or disabled on all machine types by users.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  docs/system/arm/virt.rst |  4 ++++
>  hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 52 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 20442ea2c1..75bf5a4994 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -94,6 +94,10 @@ highmem
>    address space above 32 bits. The default is ``on`` for machine types
>    later than ``virt-2.12``.
>  
> +compact-highmem
> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.

Maybe s/compact space/the compact layout/ ?

> +  The default is ``on`` for machine types later than ``virt-7.2``
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c05cfb5314..8f1dba0ece 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
>   * Note the extended_memmap is sized so that it eventually also includes the
>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>   * index of base_memmap).
> + *
> + * The addresses assigned to these regions are affected by 'compact-highmem'
> + * property, which is to enable or disable the compact space in the Highmem

s/space in/layout for/ ?

> + * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
> + * depending on the property in the following scenario.
> + *
> + * pa_bits              = 40;
> + * vms->highmem_redists = false;
> + * vms->highmem_ecam    = false;
> + * vms->highmem_mmio    = true;
> + *
> + * # qemu-system-aarch64 -accel kvm -cpu host    \
> + *   -machine virt-7.2,compact-highmem={on, off} \
> + *   -m 4G,maxmem=511G -monitor stdio
> + *
> + * Region            compact-highmem=off        compact-highmem=on
> + * ----------------------------------------------------------------
> + * RAM               [1GB         512GB]        [1GB         512GB]
> + * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
> + * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
> + * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>   */
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */

(...)

> @@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>  
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_7_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    /* Compact space for high memory regions was introduced with 7.2 */

s/space/layout/ ?

> +    vmc->no_highmem_compact = true;
>  }
>  DEFINE_VIRT_MACHINE(7, 1)
>  

Other than the wording nits, lgtm.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


