Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD44466790
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:05:53 +0100 (CET)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoal-0005um-Oo
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msoXf-0003fc-KQ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msoXN-0001F0-P5
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638460939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBbBnKjQ3FItuwlY4fFnRtKboXizO19ihhILu9q6igA=;
 b=ARxdCYKDG1wDVtW/jCbavcnV7vFdW9/e6RJtPNPHJReVj5RwY5S/asK1Hn0AwXJikaVt+d
 IcDTWHB5Op8d/69eiDoSfO+GQsR6euv//XNSHBhqOvMhL9uPrx11ikmbSO9dS0gawdNGUW
 dstnpKES02vJXpRzl6LJgREc3SXsXVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-qbEE5nelMn-St9UyIwzoMA-1; Thu, 02 Dec 2021 11:02:13 -0500
X-MC-Unique: qbEE5nelMn-St9UyIwzoMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB3B0101796C;
 Thu,  2 Dec 2021 16:02:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C915010016F7;
 Thu,  2 Dec 2021 16:02:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9EFD0113865F; Thu,  2 Dec 2021 17:02:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 3/3] cpus-common: implement dirty page limit on vCPU
References: <cover.1638267778.git.huangy81@chinatelecom.cn>
 <cover.1638267948.git.huangy81@chinatelecom.cn>
 <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
Date: Thu, 02 Dec 2021 17:02:06 +0100
In-Reply-To: <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
 (huangy's message of "Tue, 30 Nov 2021 18:28:13 +0800")
Message-ID: <877dcn5729.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Implement dirtyrate calculation periodically basing on
> dirty-ring and throttle vCPU until it reachs the quota
> dirty page rate given by user.
>
> Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
> set/cancel dirty page limit on vCPU.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  cpus-common.c         | 48 +++++++++++++++++++++++++++++++++++++++++++++=
+++
>  include/hw/core/cpu.h |  9 +++++++++
>  qapi/migration.json   | 43 +++++++++++++++++++++++++++++++++++++++++++
>  softmmu/vl.c          |  1 +
>  4 files changed, 101 insertions(+)
>
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e..86c7712 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -23,6 +23,11 @@
>  #include "hw/core/cpu.h"
>  #include "sysemu/cpus.h"
>  #include "qemu/lockable.h"
> +#include "sysemu/dirtylimit.h"
> +#include "sysemu/cpu-throttle.h"
> +#include "sysemu/kvm.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> =20
>  static QemuMutex qemu_cpu_list_lock;
>  static QemuCond exclusive_cond;
> @@ -352,3 +357,46 @@ void process_queued_cpu_work(CPUState *cpu)
>      qemu_mutex_unlock(&cpu->work_mutex);
>      qemu_cond_broadcast(&qemu_work_cond);
>  }
> +
> +void qmp_set_dirty_limit(int64_t idx,
> +                         uint64_t dirtyrate,
> +                         Error **errp)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "setting a dirty page limit requires KVM with"
> +                   " accelerator property 'dirty-ring-size' set'");
> +        return;
> +    }
> +
> +    dirtylimit_calc();
> +    dirtylimit_vcpu(idx, dirtyrate);
> +}
> +
> +void qmp_cancel_dirty_limit(int64_t idx,
> +                            Error **errp)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "KVM with accelerator property 'dirty-ring-size=
'"
> +                   " not set, abort canceling a dirty page limit");
> +        return;
> +    }

Is this check actually needed?  It's not when !dirtylimit_enabled(idx).

> +
> +    if (!dirtylimit_enabled(idx)) {
> +        error_setg(errp, "dirty page limit for the CPU %ld not set", idx=
);

"for CPU"

> +        return;
> +    }
> +
> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {

I don't think unlikely() matters here.

> +        dirtylimit_calc_quit();
> +    }
> +}
> +
> +void dirtylimit_setup(int max_cpus)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        return;
> +    }
> +
> +    dirtylimit_calc_state_init(max_cpus);
> +    dirtylimit_state_init(max_cpus);
> +}
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e948e81..11df012 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -881,6 +881,15 @@ void end_exclusive(void);
>   */
>  void qemu_init_vcpu(CPUState *cpu);
> =20
> +/**
> + * dirtylimit_setup:
> + *
> + * Initializes the global state of dirtylimit calculation and
> + * dirtylimit itself. This is prepared for vCPU dirtylimit which
> + * could be triggered during vm lifecycle.
> + */
> +void dirtylimit_setup(int max_cpus);
> +
>  #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
>  #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
>  #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48c..57c9a63 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1850,6 +1850,49 @@
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> =20
>  ##
> +# @set-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for a virtual CPU.
> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of the virtual CPU.
> +#
> +# @dirty-rate: upper limit for the specified vCPU's dirty page rate (MB/=
s)
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "set-dirty-limit"}
> +#    "arguments": { "cpu-index": 0,
> +#                   "dirty-rate": 200 } }
> +#
> +##
> +{ 'command': 'set-dirty-limit',
> +  'data': { 'cpu-index': 'int', 'dirty-rate': 'uint64' } }
> +
> +##
> +# @cancel-dirty-limit:
> +#
> +# Cancel the dirty page limit for the vCPU which has been set with
> +# set-dirty-limit command. Note that this command requires support from
> +# dirty ring, same as the "set-dirty-limit" command.
> +#
> +# @cpu-index: index of the virtual CPU to cancel the dirty page limit

I'd go with

   # @cpu-index: index of the virtual CPU.

> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "cancel-dirty-limit"}
> +#    "arguments": { "cpu-index": 0 } }
> +#
> +##
> +{ 'command': 'cancel-dirty-limit',
> +  'data': { 'cpu-index': 'int' } }
> +
> +##
>  # @snapshot-save:
>  #
>  # Save a VM snapshot
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1..0f83ce3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_init_displays();
>      accel_setup_post(current_machine);
>      os_setup_post();
> +    dirtylimit_setup(current_machine->smp.max_cpus);
>      resume_mux_open();
>  }

QAPI schema:
Acked-by: Markus Armbruster <armbru@redhat.com>


