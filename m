Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1FB45C8D4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:35:35 +0100 (CET)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuJ4-0005MQ-HS
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:35:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpuHU-0004RI-PE
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpuHQ-0001wK-TJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637768031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eaAn5JpBZ/BfxOi4lP5LR7nObaV6uFMjizd/CSWRyG8=;
 b=alFn1dc4KmxE/EbQr9Iawpidy70otXWsC09XgOT9QM9CdLDm4RTt+9beE14nK2i2XU3GyX
 Zh6CmZUOZceNtO7mHA4eAdNFpjDfm/3pcI8O7Br0g4e/nl1NMGjb/Mjn4hpnoOvLRk3uni
 MYKaZoedgGkPy1lvki21UVYCWfIUMUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-9wHSec3OPu-gbR5zrnqdxA-1; Wed, 24 Nov 2021 10:33:48 -0500
X-MC-Unique: 9wHSec3OPu-gbR5zrnqdxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A4621054F98;
 Wed, 24 Nov 2021 15:33:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AAF460854;
 Wed, 24 Nov 2021 15:33:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EEDB11380A7; Wed, 24 Nov 2021 16:33:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v5 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637759139.git.huangy81@chinatelecom.cn>
 <cover.1637759139.git.huangy81@chinatelecom.cn>
 <5b05962093b000b2e9d417d9de41d2cd6f272073.1637759139.git.huangy81@chinatelecom.cn>
Date: Wed, 24 Nov 2021 16:33:45 +0100
In-Reply-To: <5b05962093b000b2e9d417d9de41d2cd6f272073.1637759139.git.huangy81@chinatelecom.cn>
 (huangy's message of "Wed, 24 Nov 2021 21:17:13 +0800")
Message-ID: <87r1b5tvom.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
> dirtyrate given by user.
>
> Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
> set/cancel dirty limit on vCPU.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/core/cpu.h |  9 +++++++++
>  qapi/migration.json   | 43 +++++++++++++++++++++++++++++++++++++++++++
>  softmmu/vl.c          |  1 +
>  4 files changed, 94 insertions(+)
>
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e..43b0078 100644
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
> +    if (!kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "dirty ring not enable, needed by dirty restrai=
nt!");

"not enabled"

What is a "dirty restraint"?

Drop the exclamation point, please.  See error.h:

 * The resulting message should be a single phrase, with no newline or
 * trailing punctuation.

What about "setting a dirty page limit requires ...".

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
> +    if (!kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "dirty ring not enable, needed by dirty restrai=
nt!");
> +        return;
> +    }
> +
> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {
> +        dirtylimit_calc_quit();
> +    }
> +}
> +
> +void dirtylimit_setup(int max_cpus)
> +{
> +    if (!kvm_dirty_ring_enabled()) {

This crashes unless the accelerator is kvm.  Reproducer:

    $ qemu-system-x86_64 -display none -accel tcg
    Segmentation fault (core dumped)

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
> index bbfd48c..42b260e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1850,6 +1850,49 @@
>  { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
> =20
>  ##
> +# @set-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for the interested vCPU.

"for a vCPU"

> +#
> +# This command could be used to cap the vCPU memory load, which is also
> +# refered as "dirty page rate". Users can use set-dirty-limit unconditio=
nally,
> +# but if one want to know which vCPU is in high memory load and which vC=
PU
> +# should be limited, "calc-dirty-rate" with "dirty-ring" mode maybe an
> +# availiable method.

I think you should mention that the command fails unless dirty ring is
enabled, and a pointer to its documentation.

> +#
> +# @idx: vCPU index to set dirtylimit.

Please rename to @cpu-index for consistency with query-cpus-fast.  Same
for cancel-dirty-limit below.

> +#
> +# @dirtyrate: upper limit for the specified vCPU's dirty page rate (MB/s=
)

In QMP, we separate words with hyphens, like @dirty-rate.  Please
rename.

> +#
> +# Since: 6.3

7.0

> +#
> +# Example:
> +#   {"execute": "set-dirty-limit"}
> +#    "arguments": { "idx": 0,
> +#                   "dirtyrate": 200 } }
> +#
> +##
> +{ 'command': 'set-dirty-limit',
> +  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
> +
> +##
> +# @cancel-dirty-limit:
> +#
> +# Cancel the dirtylimit for the vCPU which has been set with set-dirty-l=
imit.

"the dirty page limit"

> +#
> +# @idx: vCPU index to canceled the dirtylimit
> +#
> +# Since: 6.3

7.0

> +#
> +# Example:
> +#   {"execute": "cancel-dirty-limit"}
> +#    "arguments": { "idx": 0 } }
> +#
> +##
> +{ 'command': 'cancel-dirty-limit',
> +  'data': { 'idx': 'int' } }
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


