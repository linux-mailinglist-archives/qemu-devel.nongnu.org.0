Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A7324FA0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:04:14 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFNN-0007eZ-Il
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFFMT-0006lN-SA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFFMQ-00038G-BO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614254592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzGJXAv/oUh/NMzKU5PGRkE63/gbAFDLFRABYrIFf1c=;
 b=jPqZknlpNcs8pY59rQHwM9eFQX/9BmecERFs4niY0yYfEDLM3LjbnwozXxwoyhbZt8BzqR
 D2kcrGzlKN4stovshDeaUjbr7Vbo4IN12f99xQODzaJH8qhG45up6Yq2jwB3X8W+qtW1x5
 ND5dCr4e+1ozmQC8FH6QrjHlnJn77AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-7tJQIMPNOIuQYQBFJVl8wg-1; Thu, 25 Feb 2021 07:03:06 -0500
X-MC-Unique: 7tJQIMPNOIuQYQBFJVl8wg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A5980403D;
 Thu, 25 Feb 2021 12:03:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C79D660939;
 Thu, 25 Feb 2021 12:02:58 +0000 (UTC)
Date: Thu, 25 Feb 2021 13:02:55 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210225120255.4gfbtsflbdsyxizn@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 04:56:22PM +0800, Ying Fang wrote:
> An accurate cpu topology may help improve the cpu scheduler's decision
> making when dealing with multi-core system. So cpu topology description
> is helpful to provide guest with the right view. Dario Faggioli's talk
> in [0] also shows the virtual topology may has impact on sched performace.
> Thus this patch series is posted to introduce cpu topology support for
> arm platform.
> 
> Both fdt and ACPI are introduced to present the cpu topology. To describe
> the cpu topology via ACPI, a PPTT table is introduced according to the
> processor hierarchy node structure. This series is derived from [1], in
> [1] we are trying to bring both cpu and cache topology support for arm
> platform, but there is still some issues to solve to support the cache
> hierarchy. So we split the cpu topology part out and send it seperately.
> The patch series to support cache hierarchy will be send later since
> Salil Mehta's cpu hotplug feature need the cpu topology enabled first and
> he is waiting for it to be upstreamed.
> 
> This patch series was initially based on the patches posted by Andrew Jones [2].
> I jumped in on it since some OS vendor cooperative partner are eager for it.
> Thanks for Andrew's contribution.
> 
> After applying this patch series, launch a guest with virt-6.0 and cpu
> topology configured with sockets:cores:threads = 2:4:2, you will get the
> bellow messages with the lscpu command.
> 
> -----------------------------------------
> Architecture:                    aarch64
> CPU op-mode(s):                  64-bit
> Byte Order:                      Little Endian
> CPU(s):                          16
> On-line CPU(s) list:             0-15
> Thread(s) per core:              2

What CPU model was used? Did it actually support threads? If these were
KVM VCPUs, then I guess MPIDR.MT was not set on the CPUs. Apparently
that didn't confuse Linux? See [1] for how I once tried to deal with
threads.

[1] https://github.com/rhdrjones/qemu/commit/60218e0dd7b331031b644872d56f2aca42d0ff1e

> Core(s) per socket:              4
> Socket(s):                       2

Good, but what happens if you specify '-smp 16'? Do you get 16 sockets
each with 1 core? Or, do you get 1 socket with 16 cores? And, which do
we want and why? If you look at [2], then you'll see I was assuming we
want to prefer cores over sockets, since without topology descriptions
that's what the Linux guest kernel would do.

[2] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd

> NUMA node(s):                    2

Why do we have two NUMA nodes in the guest? The two sockets in the
guest should not imply this.

Thanks,
drew

> Vendor ID:                       HiSilicon
> Model:                           0
> Model name:                      Kunpeng-920
> Stepping:                        0x1
> BogoMIPS:                        200.00
> NUMA node0 CPU(s):               0-7
> NUMA node1 CPU(s):               8-15
> 
> [0] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02166.html
> [2] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com
> 
> Ying Fang (5):
>   device_tree: Add qemu_fdt_add_path
>   hw/arm/virt: Add cpu-map to device tree
>   hw/arm/virt-acpi-build: distinguish possible and present cpus
>   hw/acpi/aml-build: add processor hierarchy node structure
>   hw/arm/virt-acpi-build: add PPTT table
> 
>  hw/acpi/aml-build.c          | 40 ++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c     | 64 +++++++++++++++++++++++++++++++++---
>  hw/arm/virt.c                | 40 +++++++++++++++++++++-
>  include/hw/acpi/acpi-defs.h  | 13 ++++++++
>  include/hw/acpi/aml-build.h  |  7 ++++
>  include/hw/arm/virt.h        |  1 +
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 45 +++++++++++++++++++++++--
>  8 files changed, 204 insertions(+), 7 deletions(-)
> 
> -- 
> 2.23.0
> 


