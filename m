Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB107653359
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 16:27:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80yl-0005Or-0K; Wed, 21 Dec 2022 10:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80yf-0005Oi-QU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80ye-00073l-9t
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671636351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKLQ4CL2Fnag1jLCS7V20VA6ivmCcPLGba3CUbYo2QE=;
 b=Zui9/9x5veAYy6P/UGmno1U7rTR3zSabVj/EALLm5q5iMAbUShGjj5zRoJaNGqMo960zGE
 m/dbKaBm7Kl4XZf2g5jK2mTvE6QfREkeOQht1Qs5iTAfePCsfAGmN0wQ62CdYTQ7lLLFo9
 hAOs2eYe7n6p2ptefVSzklJlQPnsdJA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-xXCP9yv2NmGgggGoLqaIkw-1; Wed, 21 Dec 2022 10:25:42 -0500
X-MC-Unique: xXCP9yv2NmGgggGoLqaIkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E0118A64E0;
 Wed, 21 Dec 2022 15:25:42 +0000 (UTC)
Received: from localhost (unknown [10.22.32.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01E8400D79E;
 Wed, 21 Dec 2022 15:25:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Zenghui
 Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Consolidate GIC finalize logic
In-Reply-To: <20221221092850.61332-2-agraf@csgraf.de>
Organization: Red Hat GmbH
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-2-agraf@csgraf.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 21 Dec 2022 16:25:39 +0100
Message-ID: <87o7rw6aoc.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 21 2022, Alexander Graf <agraf@csgraf.de> wrote:

> Up to now, the finalize_gic_version() code open coded what is essentially
> a support bitmap match between host/emulation environment and desired
> target GIC type.
>
> This open coding leads to undesirable side effects. For example, a VM with
> KVM and -smp 10 will automatically choose GICv3 while the same command
> line with TCG will stay on GICv2 and fail the launch.
>
> This patch combines the TCG and KVM matching code paths by making
> everything a 2 pass process. First, we determine which GIC versions the
> current environment is able to support, then we go through a single
> state machine to determine which target GIC mode that means for us.
>
> After this patch, the only user noticable changes should be consolidated
> error messages as well as TCG -M virt supporting -smp > 8 automatically.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
> ---
>  hw/arm/virt.c         | 199 ++++++++++++++++++++++--------------------
>  include/hw/arm/virt.h |  15 ++--
>  2 files changed, 113 insertions(+), 101 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 04eb6c201d..7b54387958 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1820,6 +1820,85 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      }
>  }
>  
> +static VirtGICType finalize_gic_version_do(const char *accel_name,
> +                                           VirtGICType gic_version,
> +                                           int gics_supported,
> +                                           unsigned int max_cpus)
> +{
> +    /* Convert host/max/nosel to GIC version number */
> +    switch (gic_version) {
> +    case VIRT_GIC_VERSION_HOST:
> +        if (kvm_enabled()) {
> +            /* For KVM, -cpu host means -cpu max */

That should rather be "gic-version" instead of "cpu", I guess?

> +            return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
> +                                           gics_supported, max_cpus);
> +        }
> +
> +        error_report("gic-version=host requires KVM");
> +        exit(1);
> +        break;

I wonder whether reporting an error for !kvm_enabled() and falling
through would be more readable.

...although all of this is already more readable than before :)

> +    case VIRT_GIC_VERSION_MAX:
> +        if (gics_supported & VIRT_GIC_VERSION_4_MASK) {
> +            gic_version = VIRT_GIC_VERSION_4;
> +        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
> +            gic_version = VIRT_GIC_VERSION_3;
> +        } else {
> +            gic_version = VIRT_GIC_VERSION_2;
> +        }
> +        break;
> +    case VIRT_GIC_VERSION_NOSEL:
> +        if ((gics_supported & VIRT_GIC_VERSION_2_MASK) &&
> +            max_cpus <= GIC_NCPU) {
> +            gic_version = VIRT_GIC_VERSION_2;
> +        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
> +            /*
> +             * in case the host does not support v2 emulation or
> +             * the end-user requested more than 8 VCPUs we now default
> +             * to v3. In any case defaulting to v2 would be broken.
> +             */
> +            gic_version = VIRT_GIC_VERSION_3;
> +        } else if (max_cpus > GIC_NCPU) {
> +            error_report("%s only supports GICv2 emulation but more than 8 "
> +                         "vcpus are requested", accel_name);
> +            exit(1);
> +        }
> +        break;
> +    case VIRT_GIC_VERSION_2:
> +    case VIRT_GIC_VERSION_3:
> +    case VIRT_GIC_VERSION_4:
> +        break;
> +    }


