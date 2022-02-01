Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193664A5B1A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:23:38 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErG5-0008Qk-68
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEr3i-00022m-Ip
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:10:52 -0500
Received: from [2a00:1450:4864:20::32b] (port=45932
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEr3f-00031u-Ag
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:10:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso1329943wms.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IEy+TQntwbtoGYly1xocft5FBbH3ZzAtbwnUQouh1a0=;
 b=h87D/06i+vDEzBaKP7VqanqCuNJPa2B0p+bf5RhBulWnyJv6Cv13ij8zWSwv6SMPz1
 kTGDNbOkmygqTbA0jaApnXyn/159as83H8Cxp1fT4bq0pzHUuWupEomasahmNxdEfFEi
 9xxKPp9XgCjulNT8qFGjXiKfRVu3SbxUXDJQa3x1yWcnN3pYUSL8ICo/kQvalI0c/pmg
 hhlrbwdePaQsPXruROruVNF3I1rcJ3KbX+1q0wgypr4kDHJYSpQ2iAbed5pGIz0N9RhI
 kcZMtcvZidV2AuiNOXW9Jp7nztX75nVpOosagvfOsTcqQwVJy91a2tZko8vdCNNGn85m
 mgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IEy+TQntwbtoGYly1xocft5FBbH3ZzAtbwnUQouh1a0=;
 b=RB31P5bcGV45lbg03Eqm0x0IO7e2Vcn0N/mBk6Pw09KDV6loPPUN3AN0YFPUitdKmu
 xJUZQdb7QEuiwrbYvJs9hRAIAwaRZVWvhV5+pJMwKw8CfEZHJwp5LBHnKErAU+tdMasN
 odgtWiJooUYng4jPR6kOrv4PNohXOdqFlr3egoQnw2Lv4MXHScjzlgELjgrLDuCEkAOV
 OAl3P5ADNR1MY8LXCan48/wufBeXM43VvV/SdEZPDJtNIoq/af+xn+iYh6ysiq2Q4zEK
 y/GnjHlEoMyRYul/QLT78qgm48Zy8Nf/p5neSoohze1jM3OtXvquWd3s7BEMBCYYXQbk
 NIMw==
X-Gm-Message-State: AOAM531z0Mz0JsRGCJ4Q+tyFSn52MXiOLcZrEaxZfsPJUmXa2w1SaJIB
 X+quCAPR2E2SnoxU6IH0po9C8A==
X-Google-Smtp-Source: ABdhPJwONTxN/Fb6bEU0Rs+eDZqYeJyI8Udi1JwApjBRSahnpv2UerH727ZOP9mxqj048mMIW7Q99Q==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr1282357wmk.139.1643713845361; 
 Tue, 01 Feb 2022 03:10:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm16805832wri.43.2022.02.01.03.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:10:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A9371FFB7;
 Tue,  1 Feb 2022 11:10:43 +0000 (GMT)
References: <20220124111602.671654-1-me@svin.in> <87ilu9e2v4.fsf@linaro.org>
 <7514ada0e90a4fa186b5a0f6d6de8292@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Subject: Re: [PATCH] contrib/plugins: add mask plugin
Date: Tue, 01 Feb 2022 10:57:13 +0000
In-reply-to: <7514ada0e90a4fa186b5a0f6d6de8292@huawei.com>
Message-ID: <875ypyzvt8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Oleg Vasilev <me@svin.in>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> On 1/24/2022 3:26 PM, Alex Benn=C3=A9e wrote:
>
>> Oleg Vasilev <me@svin.in> writes:
>>
>>> From: Oleg Vasilev <vasilev.oleg@huawei.com>
>>>
>>> Plugin can be used to track statistics based on virtual address mask ma=
tching.
>>> Useful for tracking kernel vs user translation blocks.
>> Could we have a bit more detail please, maybe some words for
>> devel/tcg/plugins.rst. Running:
>>
>> ./qemu-system-x86_64 -monitor none -display none -chardev file,path=3Dte=
st.out,id=3Doutput -device isa-debugcon,chardev=3Doutput -device isa-debug-=
exit,iobase=3D0xf4,iosize=3D0x4 -
>> kernel ./tests/tcg/x86_64-softmmu/memory -plugin contrib/plugins/libmask=
.so -d plugin
>> hint: all, mask: 0x0000000000000000, bits: 0x0000000000000000, hit_rate:=
 0.999023, mask_freq: 0.000004, tb_exec: 1024, tb_trans: 1
>> hint: kernel, mask: 0x8000000000000000, bits: 0x8000000000000000, hit_ra=
te: -nan, mask_freq: 0.000000, tb_exec: 0, tb_trans: 0
>> hint: user, mask: 0x8000000000000000, bits: 0x0000000000000000, hit_rate=
: 0.999023, mask_freq: 0.000004, tb_exec: 1024, tb_trans: 1
>> hint: all, mask: 0x0000000000000000, bits: 0x0000000000000000, hit_rate:=
 0.999849, mask_freq: 0.078281, tb_exec: 21013504, tb_trans: 3169
>> hint: kernel, mask: 0x8000000000000000, bits: 0x8000000000000000, hit_ra=
te: -nan, mask_freq: 0.000000, tb_exec: 0, tb_trans: 0
>> hint: user, mask: 0x8000000000000000, bits: 0x0000000000000000, hit_rate=
: 0.999849, mask_freq: 0.078281, tb_exec: 21013504, tb_trans: 3169
>>
>> ends up being a bit incomprehensible.
>>> Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>
>>> Signed-off-by: Oleg Vasilev <me@svin.in>
>>> ---
>>>  contrib/plugins/Makefile |   1 +
>>>  contrib/plugins/mask.c   | 144 +++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 145 insertions(+)
>>>  create mode 100644 contrib/plugins/mask.c
>>>
>>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>>> index 54ac5ccd9f..7e9cb51c9d 100644
>>> --- a/contrib/plugins/Makefile
>>> +++ b/contrib/plugins/Makefile
>>> @@ -20,6 +20,7 @@ NAMES +=3D howvec
>>>  NAMES +=3D lockstep
>>>  NAMES +=3D hwprofile
>>>  NAMES +=3D cache
>>> +NAMES +=3D mask
>>>=20=20
>>>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>>>=20=20
>>> diff --git a/contrib/plugins/mask.c b/contrib/plugins/mask.c
>>> new file mode 100644
>>> index 0000000000..c6d2bd2386
>>> --- /dev/null
>>> +++ b/contrib/plugins/mask.c
>>> @@ -0,0 +1,144 @@
>>> +/*
>>> + * Copyright (C) 2022, Oleg Vasilev <vasilev.oleg@huawei.com>
>>> + *
>>> + * Track statistics based on virtual address mask matching.
>>> + * Useful for tracking kernel vs user translation blocks.
>>> + *
>>> + * License: GNU GPL, version 2 or later.
>>> + *   See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include <assert.h>
>>> +#include <compiler.h>
>>> +#include <glib.h>
>>> +#include <inttypes.h>
>>> +#include <qemu-plugin.h>
>>> +#include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +
>>> +#include <atomic.h>
>>> +
>>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>>> +
>>> +typedef struct {
>>> +    GMutex lock;
>>> +    const char *hint;
>>> +    uint64_t mask;
>>> +    uint64_t bits;
>>> +    uint64_t tb_exec;
>>> +    uint64_t tb_trans;
>>> +    uint64_t isins;
>>> +} MaskCounter;
>>> +
>>> +static GPtrArray *counters;
>>> +
>>> +static uint64_t report_every =3D 1 << 28;
>>> +static uint64_t tb_exec_every =3D 1 << 10;
>>> +static uint64_t total_tb_exec;
>>> +
>>> +static void gen_one_report(MaskCounter *counter, GString *report)
>>> +{
>>> +    g_mutex_lock(&counter->lock);
>>> +    uint64_t tb_exec =3D counter->tb_exec * tb_exec_every;
>>> +
>>> +    double hit_rate =3D (double)counter->tb_trans / tb_exec;
>>> +    hit_rate =3D 1 - hit_rate;
>>> +
>>> +    double mask_freq =3D (double) counter->tb_exec * tb_exec_every / r=
eport_every;
>>> +
>>> +    g_string_append_printf(report,
>>> +                           "hint: %s, mask: 0x%016lx, bits: 0x%016lx, =
hit_rate: %f, "
>>> +                           "mask_freq: %f, tb_exec: %ld, tb_trans: %ld=
\n",
>>> +                           counter->hint, counter->mask, counter->bits=
, hit_rate,
>>> +                           mask_freq, tb_exec, counter->tb_trans);
>> Could aiming for plainer CSV format make this information more
>> digestible by tooling?
>
> Hi, thanks for looking at the patch!
>
> What do you think, tskv would be fine, considering some tooling exists an=
d it is also readable for eyes?=20
>
> Like this:
> hint=3Dkernel     hit_rate=3D0.999923       freq=3D0.110752   execs=3D297=
29792  translations=3D2299
> hint=3Duser       hit_rate=3D0.999952       freq=3D0.889248   execs=3D238=
705664 translations=3D11557

So we should read this as 99% of the time we are executing already
translated code and we spend 88% of our execution in userspace address
ranges? I think a worked example in the docs would be good.

>>
>>> +
>>> +    counter->tb_exec =3D 0;
>>> +    counter->tb_trans =3D 0;
>>> +    counter->isins =3D 0;
>> Would it be worth tracking total lifetime vs period counts?
>
> Probably so, will add a config option to specify period length.
>
>>> +
>>> +    g_mutex_unlock(&counter->lock);
>>> +}
>>> +
>>> +static void report_all(void)
>>> +{
>>> +    g_autoptr(GString) report =3D g_string_new("");
>>> +    g_ptr_array_foreach(counters, (GFunc)gen_one_report, report);
>>> +    qemu_plugin_outs(report->str);
>>> +}
>>> +
>>> +static void plugin_exit(qemu_plugin_id_t id, void *p)
>>> +{
>>> +    report_all();
>>> +}
>>> +
>>> +static bool match(MaskCounter *counter, struct qemu_plugin_tb *tb)
>>> +{
>>> +    return (counter->mask & qemu_plugin_tb_vaddr(tb)) =3D=3D counter->=
bits;
>>> +}
>>> +
>>> +static void tb_exec(MaskCounter *counter, struct qemu_plugin_tb *tb)
>>> +{
>>> +    if (!match(counter, tb)) {
>>> +        return;
>>> +    }
>>> +    g_mutex_lock(&counter->lock);
>>> +    counter->tb_exec++;
>>> +    g_mutex_unlock(&counter->lock);
>>> +}
>>> +
>>> +static void vcpu_tb_exec(unsigned int cpu_index, void *tb)
>>> +{
>>> +    uint64_t cur_tb_exec =3D qatomic_fetch_inc(&total_tb_exec);
>>> +    if ((cur_tb_exec & (tb_exec_every - 1)) =3D=3D 0) {
>>> +        g_ptr_array_foreach(counters, (GFunc)tb_exec, tb);
>>> +    }
>>> +
>>> +    if ((cur_tb_exec & (report_every - 1)) =3D=3D 0) {
>>> +        report_all();
>>> +    }
>>> +}
>>> +
>>> +static void tb_trans(MaskCounter *counter, struct qemu_plugin_tb *tb)
>>> +{
>>> +    if (!match(counter, tb)) {
>>> +        return;
>>> +    }
>>> +    g_mutex_lock(&counter->lock);
>>> +    counter->tb_trans++;
>>> +    g_mutex_unlock(&counter->lock);
>>> +}
>>> +
>>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *=
tb)
>>> +{
>>> +    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
>>> +                                         QEMU_PLUGIN_CB_NO_REGS, tb);
>> You can't pass qemu_plugin_tb to the exec handler like this as it is
>> only valid during the lifetime of translation. You need to extract the
>> information you need (qemu_plugin_tb_vaddr(tb)) and pass that.
>>
>> The restriction is the same as we state for qemu_plugin_tb_get_insn():
>>
>>  The returned handle can be used in follow up helper queries as well
>>  as when instrumenting an instruction. It is only valid for the
>>  lifetime of the callback.
>>
>> but it isn't attached to a API docs, we do mention it in the general
>> principles:
>>
>>   Lifetime of the query handle
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>   Each callback provides an opaque anonymous information handle which
>>   can usually be further queried to find out information about a
>>   translation, instruction or operation. The handles themselves are only
>>   valid during the lifetime of the callback so it is important that any
>>   information that is needed is extracted during the callback and saved
>>   by the plugin.
>>
> If I were to allocate a distinct structure per tb here, how could I
> free it? Or is it fine to just leave it leaked?

In this case I don't think you need to allocate a structure as you only
need to track vaddr so you might as well just use that as pure data
tracked by the plugin. However if you want to track more data you will
need to allocate a structure for it and pass that instead.

Generally you clean-up on plugin_exit. Although it's fairly safe to
assume plugin_exit will run at the end of execution where you can just
rely on the OS to clean-up after you it's good practice to for plugins
to clean-up after themselves. A plugin can for example call
qemu_plugin_uninstall to remove itself once it has collected enough data
and leave the program to continue running.

> Perhaps a new cb helper should be added for flush htable event, when
> we could reset all current tb structures?

Do you mean so the user can trigger an event from HMP/QMP to signal the
plugin to do something with its data? That might be useful but I think
we would need to take some care with the way that works so we don't end
up with a messy ad-hoc interface.

>
>>> +    g_ptr_array_foreach(counters, (GFunc)tb_trans, tb);
>>> +}
>>> +
>>> +static void add_counter(const char *hint, uint64_t mask, uint64_t bits)
>>> +{
>>> +    MaskCounter *counter =3D g_new0(MaskCounter, 1);
>>> +    counter->hint =3D hint;
>>> +    counter->mask =3D mask;
>>> +    counter->bits =3D bits;
>>> +    g_mutex_init(&counter->lock);
>>> +    g_ptr_array_add(counters, counter);
>>> +}
>>> +
>>> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>>> +                                           const qemu_info_t *info, in=
t argc,
>>> +                                           char **argv)
>>> +{
>>> +    counters =3D g_ptr_array_new();
>>> +
>>> +    // Update for a different mask
>>> +    add_counter("all", 0, 0);
>>> +    add_counter("kernel", 0x1ll << 63, 0x1ll << 63);
>>> +    add_counter("user", 0x1ll << 63, 0);
>> These seem very fixed - do they apply for all kernels/architectures?
>> Perhaps we could have sensible defaults based on info->target_name with
>> an option to hand set zones via CLI options?
>
> Generally for linux kernel the highest bit indicated kernel space AFAIK.
>
> Sensible default probably here would be to determine the highest bit
> based on 64 vs 32 bit current architecture.

Do different 64 bit architectures have different splits addresses?

> Regarding the CLI options, I considered adding that, and I am thinking
> those would be too complex. Much easier would be to change the code
> and write the correct mask. Do you think this can be merged without
> the CLI options, expecting users to modify these lines to achieve
> different zoning?

I don't think adding parameters is too complex. We have several plugins
that do that already. However if we have sensible defaults I think
arguments can be deferred to later patches.

>
> Best regards,
> Oleg
>
>>
>> Also what should happen in the case of !info->system_emulation? There is
>> probably a case for something similar tracking execution in various .so
>> libs but that would need a little additional information from the
>> infrastructure to track.
>>
>>> +
>>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>>> +    return 0;
>>> +}


--=20
Alex Benn=C3=A9e

