Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF13CE65C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:54:50 +0200 (CEST)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WXZ-0000i7-GH
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WWJ-0007LF-2k
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WWH-0006AE-76
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wZPyZaPZ57SZ7genxbXT2BzD8JNAj8n/aOyQLcqFAKM=;
 b=Ti6aeccsc5Zs6yeuvKk/IINbymqH+O76y69SrFiZaFLxa2BALc5fcWrLOSGNQvbFkM5R75
 xCSqi+Z8z1zGESmOZVBplEO/3QYnzaeI997xJalcTZxP4R31LFE2e+kn1CPO/ZTqFXMX3I
 ihBrr2FPzjyKv28TuSVGsGbuXUUECIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-Aax6MCQ5OoCGphgSqJnIyw-1; Mon, 19 Jul 2021 12:53:26 -0400
X-MC-Unique: Aax6MCQ5OoCGphgSqJnIyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0BF101AFB9;
 Mon, 19 Jul 2021 16:53:24 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFBC100EBAD;
 Mon, 19 Jul 2021 16:53:17 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:53:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <YPWt+o/kl60Db8kT@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-3-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of multi-dies and the related error reporting code.
> With an arch compat variable "bool smp_dies_supported", we can
> easily make smp_parse generic enough for all arches and the PC
> specific one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 28 ++++++++++-------
>  hw/i386/pc.c        | 76 +--------------------------------------------
>  include/hw/boards.h |  1 +
>  3 files changed, 19 insertions(+), 86 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d73daa10f4..ed6712e964 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>  
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned dies    = config->has_dies ? config->dies : 1;
> @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    if (dies > 1) {
> +    if (!mc->smp_dies_supported && dies > 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
>          return;
>      }
> @@ -772,23 +773,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          threads = threads > 0 ? threads : 1;
>          if (cpus == 0) {
>              sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * sockets;
> +            cpus = sockets * dies * cores * threads;
>          } else {
>              maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads);
> +            sockets = maxcpus / (dies * cores * threads);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * threads);
> +        cores = cpus / (sockets * dies * threads);
>          cores = cores > 0 ? cores : 1;
>      } else if (threads == 0) {
> -        threads = cpus / (cores * sockets);
> +        threads = cpus / (sockets * dies * cores);
>          threads = threads > 0 ? threads : 1;
> -    } else if (sockets * cores * threads < cpus) {
> +    } else if (sockets * dies * cores * threads < cpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>          error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>                     "smp_cpus (%u)",
> -                   sockets, cores, threads, cpus);
> +                   sockets, dies_msg, cores, threads, cpus);

Since we're allowing dies=1 (but not greater), I'm not convinced we
need the conditionally built error message, and could just include
"* dies" all the time.

If we do want it to be conditionally different though, I'd just
sugest calling error_setg twice. Although this duplicates stuff,
it'll be clearer to read which I think is a net win.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


