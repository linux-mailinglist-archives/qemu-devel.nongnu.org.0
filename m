Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015236C1398
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFhN-00030e-Ab; Mon, 20 Mar 2023 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peFhK-00030F-Qe
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:37:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peFhI-0000FF-LZ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:37:14 -0400
Received: by mail-wr1-x436.google.com with SMTP id i9so10385301wrp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319431;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKlKCa2nMjf12/EHAd2WSE5eQKSJnA8Ss8Fjygg/Okk=;
 b=H2hHYa4NYGFf+ETVV7pQSrvVnVMRM0pRZPmO6TsDclQDywp0sKwZRmJayIB57MRZsA
 R0JPGiQSkVnrYnmwbE94ONAeN2vptypnNdTObG4pbctJdMJA3wZZF2tTlxBmweq9Xq8M
 4s50VoU0RYhdkvMvw7gj0uBThFiITUgAJVf8tIIWz069RsaGW3fc+/zQXzWfQ5UfKoWV
 fwSuwKU4J+VozdVzVBH+o9drZWwXrkyUl4knMcwWWt1mBuvPho0DnCVL7R/ySUM7YRMO
 MTOy4qrcFq7mCDhLqOjVGi1l874tXUL9GsjjfYQ323ZFXih5OXhLboinM38XXpf4GVy5
 BRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319431;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WKlKCa2nMjf12/EHAd2WSE5eQKSJnA8Ss8Fjygg/Okk=;
 b=7FdDooeeJPvqQbetWgrvVDs5RMMIYHq6mTQ6/UIILhPAXOT8WsjVn29PhMVwhrZwR7
 sJAIKcqZ/QtwPTJOMds8TrBO/tnVCq+kMaRuhBzJumX4zbT3LCX+FA1ZSaZRiGP2Rq7L
 fxzDoNY58D6Wys5RlqJMHn3Nh5peKZ+nA0cLdrBwmOvWvb6tBF5r/0l3qwwLKuCue5aY
 TWNeM4D+4N7Jt2XUqHxXNGWFQMdsiQdjxMtuTceKCMOvs3qq784+fIVHQeB+oRsm1A75
 ZYG4Dr1kMllQbPVtQ/uGQNp2ZXK8vP3mpSl3/k0OpCRWfwVv/R+uKJUN3OOgqa5sXLyf
 HBiQ==
X-Gm-Message-State: AO0yUKUVUfJzWgpN/2ZYR4zHsQPfs1+L5PeShs4neqYj83656EdyFQLM
 OAZWeTOUuTIH5BBl8fC5l+FQow==
X-Google-Smtp-Source: AK7set/tRHaTxZdjMmcaWuXwW72ucfxDN3ui50j0ayK7pCSlK0CywfFMTAYv56IlAyXZH9GJgB1FvQ==
X-Received: by 2002:adf:f2d1:0:b0:2c5:5a65:79a0 with SMTP id
 d17-20020adff2d1000000b002c55a6579a0mr14768239wrp.53.1679319430870; 
 Mon, 20 Mar 2023 06:37:10 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u13-20020adfdb8d000000b002d2b117a6a6sm8932616wri.41.2023.03.20.06.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 06:37:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DD381FFB7;
 Mon, 20 Mar 2023 13:37:10 +0000 (GMT)
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-3-alex.bennee@linaro.org>
 <c6e1bf23-618f-410d-a53b-6f4cbd007e7b@suse.de>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: Alessandro Di Federico <ale@rev.ng>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fabiano Rosas
 <fabiano.rosas@suse.com>
Subject: Re: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
Date: Mon, 20 Mar 2023 13:32:37 +0000
In-reply-to: <c6e1bf23-618f-410d-a53b-6f4cbd007e7b@suse.de>
Message-ID: <87355z8ry2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Claudio Fontana <cfontana@suse.de> writes:

> How is this conditional on CONFIG_TCG? To me it looks like this breaks !C=
ONFIG_TCG.
> Careful, the meson.build in accel/tcg/meson.build is always recursed.

Surely it shouldn't be in accel/tcg then?

> This code was in tcg_ss before, why not simply add it to tcg_ss and
> then to specific_ss along with the other tcg pieces?

tcg_ss is rebuilt for every target. So far the code in cpu-exec-softmmu
should only need to for softmmu targets and hopefully share the same
binary for all variants.

I guess I'll have to do something more in line with the recent
re-factoring of gdbstub:

  # We build two versions of gdbstub, one for each mode
  gdb_user_ss.add(files('gdbstub.c', 'user.c'))
  gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))

  gdb_user_ss =3D gdb_user_ss.apply(config_host, strict: false)
  gdb_softmmu_ss =3D gdb_softmmu_ss.apply(config_host, strict: false)

  libgdb_user =3D static_library('gdb_user',
                               gdb_user_ss.sources() + genh,
                               name_suffix: 'fa',
                               c_args: '-DCONFIG_USER_ONLY')

  libgdb_softmmu =3D static_library('gdb_softmmu',
                                  gdb_softmmu_ss.sources() + genh,
                                  name_suffix: 'fa')

  gdb_user =3D declare_dependency(link_whole: libgdb_user)
  user_ss.add(gdb_user)
  gdb_softmmu =3D declare_dependency(link_whole: libgdb_softmmu)
  softmmu_ss.add(gdb_softmmu)


>
> Ciao,
>
> C
>
>
> On 3/20/23 11:10, Alex Benn=C3=A9e wrote:
>> This doesn't save much as cpu-exec-common still needs to be built
>> per-target for its knowledge of CPUState but this helps with keeping
>> things organised.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  accel/tcg/cpu-exec-common.c  | 30 ----------------------
>>  accel/tcg/cpu-exec-softmmu.c | 50 ++++++++++++++++++++++++++++++++++++
>>  accel/tcg/meson.build        | 10 ++++++++
>>  3 files changed, 60 insertions(+), 30 deletions(-)
>>  create mode 100644 accel/tcg/cpu-exec-softmmu.c
>>=20
>> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
>> index e7962c9348..c6b0ad303e 100644
>> --- a/accel/tcg/cpu-exec-common.c
>> +++ b/accel/tcg/cpu-exec-common.c
>> @@ -32,36 +32,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
>>      cpu_loop_exit(cpu);
>>  }
>>=20=20
>> -#if defined(CONFIG_SOFTMMU)
>> -void cpu_reloading_memory_map(void)
>> -{
>> -    if (qemu_in_vcpu_thread() && current_cpu->running) {
>> -        /* The guest can in theory prolong the RCU critical section as =
long
>> -         * as it feels like. The major problem with this is that becaus=
e it
>> -         * can do multiple reconfigurations of the memory map within the
>> -         * critical section, we could potentially accumulate an unbound=
ed
>> -         * collection of memory data structures awaiting reclamation.
>> -         *
>> -         * Because the only thing we're currently protecting with RCU i=
s the
>> -         * memory data structures, it's sufficient to break the critica=
l section
>> -         * in this callback, which we know will get called every time t=
he
>> -         * memory map is rearranged.
>> -         *
>> -         * (If we add anything else in the system that uses RCU to prot=
ect
>> -         * its data structures, we will need to implement some other me=
chanism
>> -         * to force TCG CPUs to exit the critical section, at which poi=
nt this
>> -         * part of this callback might become unnecessary.)
>> -         *
>> -         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock=
(), which
>> -         * only protects cpu->as->dispatch. Since we know our caller is=
 about
>> -         * to reload it, it's safe to split the critical section.
>> -         */
>> -        rcu_read_unlock();
>> -        rcu_read_lock();
>> -    }
>> -}
>> -#endif
>> -
>>  void cpu_loop_exit(CPUState *cpu)
>>  {
>>      /* Undo the setting in cpu_tb_exec.  */
>> diff --git a/accel/tcg/cpu-exec-softmmu.c b/accel/tcg/cpu-exec-softmmu.c
>> new file mode 100644
>> index 0000000000..2318dd8c7d
>> --- /dev/null
>> +++ b/accel/tcg/cpu-exec-softmmu.c
>> @@ -0,0 +1,50 @@
>> +/*
>> + *  Emulator main CPU execution loop, softmmu bits
>> + *
>> + *  Copyright (c) 2003-2005 Fabrice Bellard
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see <http://www.gnu.org/lic=
enses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/core/cpu.h"
>> +#include "sysemu/cpus.h"
>> +
>> +void cpu_reloading_memory_map(void)
>> +{
>> +    if (qemu_in_vcpu_thread() && current_cpu->running) {
>> +        /* The guest can in theory prolong the RCU critical section as =
long
>> +         * as it feels like. The major problem with this is that becaus=
e it
>> +         * can do multiple reconfigurations of the memory map within the
>> +         * critical section, we could potentially accumulate an unbound=
ed
>> +         * collection of memory data structures awaiting reclamation.
>> +         *
>> +         * Because the only thing we're currently protecting with RCU i=
s the
>> +         * memory data structures, it's sufficient to break the critica=
l section
>> +         * in this callback, which we know will get called every time t=
he
>> +         * memory map is rearranged.
>> +         *
>> +         * (If we add anything else in the system that uses RCU to prot=
ect
>> +         * its data structures, we will need to implement some other me=
chanism
>> +         * to force TCG CPUs to exit the critical section, at which poi=
nt this
>> +         * part of this callback might become unnecessary.)
>> +         *
>> +         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock=
(), which
>> +         * only protects cpu->as->dispatch. Since we know our caller is=
 about
>> +         * to reload it, it's safe to split the critical section.
>> +         */
>> +        rcu_read_unlock();
>> +        rcu_read_lock();
>> +    }
>> +}
>> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
>> index aeb20a6ef0..bdc086b90d 100644
>> --- a/accel/tcg/meson.build
>> +++ b/accel/tcg/meson.build
>> @@ -1,3 +1,9 @@
>> +#
>> +# Currently most things here end up in specific_ss eventually because
>> +# they need knowledge of CPUState. Stuff that that doesn't can live in
>> +# common user, softmmu or overall code
>> +#
>> +
>>  tcg_ss =3D ss.source_set()
>>  tcg_ss.add(files(
>>    'tcg-all.c',
>> @@ -9,6 +15,7 @@ tcg_ss.add(files(
>>    'translate-all.c',
>>    'translator.c',
>>  ))
>> +
>>  tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
>>  tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
>>  tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
>> @@ -27,3 +34,6 @@ tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG=
'], if_true: files(
>>    'tcg-accel-ops-icount.c',
>>    'tcg-accel-ops-rr.c',
>>  ))
>> +
>> +# Common softmmu code
>> +softmmu_ss.add(files('cpu-exec-softmmu.c'))


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

