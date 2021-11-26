Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8645E82F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 08:05:18 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqVIL-0005nT-Je
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 02:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVH1-00058l-20
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVGx-0001Wj-Gu
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637910230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00QKBZEjXLC39T4MU86KnwMehT2dQkhH4//03VpbCYM=;
 b=hLnChQVk/VhA+pC5zobXjuz9/Bnsc8820/nko7cr65d3AlnNT52Ov5CQ48AQUVaRbDnupL
 BwaqzuGBU9D98qlmNOhq5TeVegCikuel2icnTXhyIivZv+OSoVJETuIuhicVD2m8Ma4hmN
 SWIXbwPwXpeJtsp2t+B73KtW6iv74Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-XexZy2AvM_-XEnSLBNtO6A-1; Fri, 26 Nov 2021 02:03:48 -0500
X-MC-Unique: XexZy2AvM_-XEnSLBNtO6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40EB81CCB4;
 Fri, 26 Nov 2021 07:03:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AAD960C7F;
 Fri, 26 Nov 2021 07:03:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F36A11380A7; Fri, 26 Nov 2021 08:03:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v6 3/3] cpus-common: implement dirty page limit on vCPU
References: <cover.1637856472.git.huangy81@chinatelecom.cn>
 <cover.1637857372.git.huangy81@chinatelecom.cn>
 <91286fcfc24795385fe4df0d69a48c34f8eac942.1637857372.git.huangy81@chinatelecom.cn>
Date: Fri, 26 Nov 2021 08:03:43 +0100
In-Reply-To: <91286fcfc24795385fe4df0d69a48c34f8eac942.1637857372.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 26 Nov 2021 00:27:52 +0800")
Message-ID: <87tufzbdps.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
>  cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/core/cpu.h |  9 +++++++++
>  qapi/migration.json   | 47 +++++++++++++++++++++++++++++++++++++++++++++=
++
>  softmmu/vl.c          |  1 +
>  4 files changed, 98 insertions(+)
>
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e..3c156b3 100644
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
> @@ -352,3 +357,39 @@ void process_queued_cpu_work(CPUState *cpu)
>      qemu_mutex_unlock(&cpu->work_mutex);
>      qemu_cond_broadcast(&qemu_work_cond);
>  }
> +
> +void qmp_set_dirty_limit(int64_t idx,
> +                         uint64_t dirtyrate,
> +                         Error **errp)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "setting a dirty page limit requires support fr=
om dirty ring");

Can we phrase the message in a way that gives the user a chance to guess
what he needs to do to avoid it?

Perhaps: "setting a dirty page limit requires KVM with accelerator
property 'dirty-ring-size' set".

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

Three cases:

Case 1: enable is impossible, so nothing to do.

Case 2: enable is possible and we actually enabled.

Case 3: enable is possible, but we didn't.  Nothing to do.

> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "no need to cancel a dirty page limit as dirty =
ring not enabled");
> +        return;

This is case 1.  We error out.

> +    }
> +
> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {

I don't think unlikely() matters here.

> +        dirtylimit_calc_quit();
> +    }

In case 2, dirtylimit_calc_quit() returns zero if this was the last
limit, else non-zero.  If the former, we request the thread to stop.

In case 3, dirtylimit_calc_quit() returns zero, and we do nothing.

Why is case 1 and error, but case 3 isn't?

Both could silently do nothing, like case 3 does now.

Both could error out, like case 1 does now.  A possible common error
message: "there is no dirty page limit to cancel".

I'd be okay with consistently doing nothing, and with consistently
erroring out.

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
> index bbfd48c..2b0fe19 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1850,6 +1850,53 @@
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> =20
>  ##
> +# @set-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for a vCPU.
> +#
> +# This command could be used to cap the vCPU memory load, which is also

"Could be used" suggests there are other uses.  I don't think there are.

> +# refered as "dirty page rate". Users can use set-dirty-limit unconditio=
nally,
> +# but if one want to know which vCPU is in high memory load and which vC=
PU

"one wants"

> +# should be limited, using calc-dirty-rate command with dirty-ring mode =
maybe

"may be"

> +# an availiable method. Note that this command requires support from dir=
ty

"available".  Consider using a spell checker.

> +# ring, which means property "dirty-ring-size" of accelerator object "kv=
m"
> +# must be set.

Please limit doc comment line length to approximately 70 characters for
legibility.

Here's my try:

   ##
   # @set-dirty-limit:
   #
   # Set the upper limit of dirty page rate for a virtual CPU.
   #
   # Requires KVM with accelerator property "dirty-ring-size" set.
   # A virtual CPU's dirty page rate is a measure of its memory load.
   # To observe dirty page rates, use @calc-dirty-rate.

> +#
> +# @cpu-index: vCPU index to set dirty page limit.

I'd go with

   # @cpu-index: index of the virtual CPU.

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
> +# @cpu-index: vCPU index to cancel the dirty page limit
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


