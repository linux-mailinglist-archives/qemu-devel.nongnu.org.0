Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435DC4A476C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:43:44 +0100 (CET)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEW23-0005nn-2T
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1nEVpL-0002wV-DU
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:30:37 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1nEVpH-0001OO-71
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:30:35 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JnS4M5QV1z8wW0;
 Mon, 31 Jan 2022 20:27:15 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 31 Jan 2022 20:30:18 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.021;
 Mon, 31 Jan 2022 20:30:18 +0800
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, Oleg Vasilev
 <me@svin.in>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Alexandre Iooss
 <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH] contrib/plugins: add mask plugin
Thread-Topic: [PATCH] contrib/plugins: add mask plugin
Thread-Index: AQHYERPstKcp/RS/0EuN6ckVKSxA4w==
Date: Mon, 31 Jan 2022 12:30:18 +0000
Message-ID: <7514ada0e90a4fa186b5a0f6d6de8292@huawei.com>
References: <20220124111602.671654-1-me@svin.in> <87ilu9e2v4.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.163.112]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=vasilev.oleg@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Vasilev Oleg <vasilev.oleg@huawei.com>
From:  Vasilev Oleg via <qemu-devel@nongnu.org>

On 1/24/2022 3:26 PM, Alex Benn=E9e wrote:=0A=
=0A=
> Oleg Vasilev <me@svin.in> writes:=0A=
>=0A=
>> From: Oleg Vasilev <vasilev.oleg@huawei.com>=0A=
>>=0A=
>> Plugin can be used to track statistics based on virtual address mask mat=
ching.=0A=
>> Useful for tracking kernel vs user translation blocks.=0A=
> Could we have a bit more detail please, maybe some words for=0A=
> devel/tcg/plugins.rst. Running:=0A=
>=0A=
> ./qemu-system-x86_64 -monitor none -display none -chardev file,path=3Dtes=
t.out,id=3Doutput -device isa-debugcon,chardev=3Doutput -device isa-debug-e=
xit,iobase=3D0xf4,iosize=3D0x4 -=0A=
> kernel ./tests/tcg/x86_64-softmmu/memory -plugin contrib/plugins/libmask.=
so -d plugin=0A=
> hint: all, mask: 0x0000000000000000, bits: 0x0000000000000000, hit_rate: =
0.999023, mask_freq: 0.000004, tb_exec: 1024, tb_trans: 1=0A=
> hint: kernel, mask: 0x8000000000000000, bits: 0x8000000000000000, hit_rat=
e: -nan, mask_freq: 0.000000, tb_exec: 0, tb_trans: 0=0A=
> hint: user, mask: 0x8000000000000000, bits: 0x0000000000000000, hit_rate:=
 0.999023, mask_freq: 0.000004, tb_exec: 1024, tb_trans: 1=0A=
> hint: all, mask: 0x0000000000000000, bits: 0x0000000000000000, hit_rate: =
0.999849, mask_freq: 0.078281, tb_exec: 21013504, tb_trans: 3169=0A=
> hint: kernel, mask: 0x8000000000000000, bits: 0x8000000000000000, hit_rat=
e: -nan, mask_freq: 0.000000, tb_exec: 0, tb_trans: 0=0A=
> hint: user, mask: 0x8000000000000000, bits: 0x0000000000000000, hit_rate:=
 0.999849, mask_freq: 0.078281, tb_exec: 21013504, tb_trans: 3169=0A=
>=0A=
> ends up being a bit incomprehensible.=0A=
>> Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>=0A=
>> Signed-off-by: Oleg Vasilev <me@svin.in>=0A=
>> ---=0A=
>>  contrib/plugins/Makefile |   1 +=0A=
>>  contrib/plugins/mask.c   | 144 +++++++++++++++++++++++++++++++++++++++=
=0A=
>>  2 files changed, 145 insertions(+)=0A=
>>  create mode 100644 contrib/plugins/mask.c=0A=
>>=0A=
>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile=0A=
>> index 54ac5ccd9f..7e9cb51c9d 100644=0A=
>> --- a/contrib/plugins/Makefile=0A=
>> +++ b/contrib/plugins/Makefile=0A=
>> @@ -20,6 +20,7 @@ NAMES +=3D howvec=0A=
>>  NAMES +=3D lockstep=0A=
>>  NAMES +=3D hwprofile=0A=
>>  NAMES +=3D cache=0A=
>> +NAMES +=3D mask=0A=
>>  =0A=
>>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))=0A=
>>  =0A=
>> diff --git a/contrib/plugins/mask.c b/contrib/plugins/mask.c=0A=
>> new file mode 100644=0A=
>> index 0000000000..c6d2bd2386=0A=
>> --- /dev/null=0A=
>> +++ b/contrib/plugins/mask.c=0A=
>> @@ -0,0 +1,144 @@=0A=
>> +/*=0A=
>> + * Copyright (C) 2022, Oleg Vasilev <vasilev.oleg@huawei.com>=0A=
>> + *=0A=
>> + * Track statistics based on virtual address mask matching.=0A=
>> + * Useful for tracking kernel vs user translation blocks.=0A=
>> + *=0A=
>> + * License: GNU GPL, version 2 or later.=0A=
>> + *   See the COPYING file in the top-level directory.=0A=
>> + */=0A=
>> +=0A=
>> +#include <assert.h>=0A=
>> +#include <compiler.h>=0A=
>> +#include <glib.h>=0A=
>> +#include <inttypes.h>=0A=
>> +#include <qemu-plugin.h>=0A=
>> +#include <stdio.h>=0A=
>> +#include <stdlib.h>=0A=
>> +#include <string.h>=0A=
>> +#include <unistd.h>=0A=
>> +=0A=
>> +#include <atomic.h>=0A=
>> +=0A=
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;=0A=
>> +=0A=
>> +typedef struct {=0A=
>> +    GMutex lock;=0A=
>> +    const char *hint;=0A=
>> +    uint64_t mask;=0A=
>> +    uint64_t bits;=0A=
>> +    uint64_t tb_exec;=0A=
>> +    uint64_t tb_trans;=0A=
>> +    uint64_t isins;=0A=
>> +} MaskCounter;=0A=
>> +=0A=
>> +static GPtrArray *counters;=0A=
>> +=0A=
>> +static uint64_t report_every =3D 1 << 28;=0A=
>> +static uint64_t tb_exec_every =3D 1 << 10;=0A=
>> +static uint64_t total_tb_exec;=0A=
>> +=0A=
>> +static void gen_one_report(MaskCounter *counter, GString *report)=0A=
>> +{=0A=
>> +    g_mutex_lock(&counter->lock);=0A=
>> +    uint64_t tb_exec =3D counter->tb_exec * tb_exec_every;=0A=
>> +=0A=
>> +    double hit_rate =3D (double)counter->tb_trans / tb_exec;=0A=
>> +    hit_rate =3D 1 - hit_rate;=0A=
>> +=0A=
>> +    double mask_freq =3D (double) counter->tb_exec * tb_exec_every / re=
port_every;=0A=
>> +=0A=
>> +    g_string_append_printf(report,=0A=
>> +                           "hint: %s, mask: 0x%016lx, bits: 0x%016lx, h=
it_rate: %f, "=0A=
>> +                           "mask_freq: %f, tb_exec: %ld, tb_trans: %ld\=
n",=0A=
>> +                           counter->hint, counter->mask, counter->bits,=
 hit_rate,=0A=
>> +                           mask_freq, tb_exec, counter->tb_trans);=0A=
> Could aiming for plainer CSV format make this information more=0A=
> digestible by tooling?=0A=
=0A=
Hi, thanks for looking at the patch!=0A=
=0A=
What do you think, tskv would be fine, considering some tooling exists and =
it is also readable for eyes? =0A=
=0A=
Like this:=0A=
hint=3Dkernel     hit_rate=3D0.999923       freq=3D0.110752   execs=3D29729=
792  translations=3D2299=0A=
hint=3Duser       hit_rate=3D0.999952       freq=3D0.889248   execs=3D23870=
5664 translations=3D11557=0A=
=0A=
>=0A=
>> +=0A=
>> +    counter->tb_exec =3D 0;=0A=
>> +    counter->tb_trans =3D 0;=0A=
>> +    counter->isins =3D 0;=0A=
> Would it be worth tracking total lifetime vs period counts?=0A=
=0A=
Probably so, will add a config option to specify period length.=0A=
=0A=
>> +=0A=
>> +    g_mutex_unlock(&counter->lock);=0A=
>> +}=0A=
>> +=0A=
>> +static void report_all(void)=0A=
>> +{=0A=
>> +    g_autoptr(GString) report =3D g_string_new("");=0A=
>> +    g_ptr_array_foreach(counters, (GFunc)gen_one_report, report);=0A=
>> +    qemu_plugin_outs(report->str);=0A=
>> +}=0A=
>> +=0A=
>> +static void plugin_exit(qemu_plugin_id_t id, void *p)=0A=
>> +{=0A=
>> +    report_all();=0A=
>> +}=0A=
>> +=0A=
>> +static bool match(MaskCounter *counter, struct qemu_plugin_tb *tb)=0A=
>> +{=0A=
>> +    return (counter->mask & qemu_plugin_tb_vaddr(tb)) =3D=3D counter->b=
its;=0A=
>> +}=0A=
>> +=0A=
>> +static void tb_exec(MaskCounter *counter, struct qemu_plugin_tb *tb)=0A=
>> +{=0A=
>> +    if (!match(counter, tb)) {=0A=
>> +        return;=0A=
>> +    }=0A=
>> +    g_mutex_lock(&counter->lock);=0A=
>> +    counter->tb_exec++;=0A=
>> +    g_mutex_unlock(&counter->lock);=0A=
>> +}=0A=
>> +=0A=
>> +static void vcpu_tb_exec(unsigned int cpu_index, void *tb)=0A=
>> +{=0A=
>> +    uint64_t cur_tb_exec =3D qatomic_fetch_inc(&total_tb_exec);=0A=
>> +    if ((cur_tb_exec & (tb_exec_every - 1)) =3D=3D 0) {=0A=
>> +        g_ptr_array_foreach(counters, (GFunc)tb_exec, tb);=0A=
>> +    }=0A=
>> +=0A=
>> +    if ((cur_tb_exec & (report_every - 1)) =3D=3D 0) {=0A=
>> +        report_all();=0A=
>> +    }=0A=
>> +}=0A=
>> +=0A=
>> +static void tb_trans(MaskCounter *counter, struct qemu_plugin_tb *tb)=
=0A=
>> +{=0A=
>> +    if (!match(counter, tb)) {=0A=
>> +        return;=0A=
>> +    }=0A=
>> +    g_mutex_lock(&counter->lock);=0A=
>> +    counter->tb_trans++;=0A=
>> +    g_mutex_unlock(&counter->lock);=0A=
>> +}=0A=
>> +=0A=
>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *t=
b)=0A=
>> +{=0A=
>> +    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,=0A=
>> +                                         QEMU_PLUGIN_CB_NO_REGS, tb);=
=0A=
> You can't pass qemu_plugin_tb to the exec handler like this as it is=0A=
> only valid during the lifetime of translation. You need to extract the=0A=
> information you need (qemu_plugin_tb_vaddr(tb)) and pass that.=0A=
>=0A=
> The restriction is the same as we state for qemu_plugin_tb_get_insn():=0A=
>=0A=
>  The returned handle can be used in follow up helper queries as well=0A=
>  as when instrumenting an instruction. It is only valid for the=0A=
>  lifetime of the callback.=0A=
>=0A=
> but it isn't attached to a API docs, we do mention it in the general=0A=
> principles:=0A=
>=0A=
>   Lifetime of the query handle=0A=
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0A=
>=0A=
>   Each callback provides an opaque anonymous information handle which=0A=
>   can usually be further queried to find out information about a=0A=
>   translation, instruction or operation. The handles themselves are only=
=0A=
>   valid during the lifetime of the callback so it is important that any=
=0A=
>   information that is needed is extracted during the callback and saved=
=0A=
>   by the plugin.=0A=
>=0A=
If I were to allocate a distinct structure per tb here, how could I free it=
? Or is it fine to just leave it leaked?=0A=
=0A=
Perhaps a new cb helper should be added for flush htable event, when we cou=
ld reset all current tb structures?=0A=
=0A=
>> +    g_ptr_array_foreach(counters, (GFunc)tb_trans, tb);=0A=
>> +}=0A=
>> +=0A=
>> +static void add_counter(const char *hint, uint64_t mask, uint64_t bits)=
=0A=
>> +{=0A=
>> +    MaskCounter *counter =3D g_new0(MaskCounter, 1);=0A=
>> +    counter->hint =3D hint;=0A=
>> +    counter->mask =3D mask;=0A=
>> +    counter->bits =3D bits;=0A=
>> +    g_mutex_init(&counter->lock);=0A=
>> +    g_ptr_array_add(counters, counter);=0A=
>> +}=0A=
>> +=0A=
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,=0A=
>> +                                           const qemu_info_t *info, int=
 argc,=0A=
>> +                                           char **argv)=0A=
>> +{=0A=
>> +    counters =3D g_ptr_array_new();=0A=
>> +=0A=
>> +    // Update for a different mask=0A=
>> +    add_counter("all", 0, 0);=0A=
>> +    add_counter("kernel", 0x1ll << 63, 0x1ll << 63);=0A=
>> +    add_counter("user", 0x1ll << 63, 0);=0A=
> These seem very fixed - do they apply for all kernels/architectures?=0A=
> Perhaps we could have sensible defaults based on info->target_name with=
=0A=
> an option to hand set zones via CLI options?=0A=
=0A=
Generally for linux kernel the highest bit indicated kernel space AFAIK.=0A=
=0A=
Sensible default probably here would be to determine the highest bit based =
on 64 vs 32 bit current architecture.=0A=
=0A=
Regarding the CLI options, I considered adding that, and I am thinking thos=
e would be too complex. Much easier would be to change the code and write t=
he correct mask. Do you think this can be merged without the CLI options, e=
xpecting users to modify these lines to achieve different zoning?=0A=
=0A=
Best regards,=0A=
Oleg=0A=
=0A=
>=0A=
> Also what should happen in the case of !info->system_emulation? There is=
=0A=
> probably a case for something similar tracking execution in various .so=
=0A=
> libs but that would need a little additional information from the=0A=
> infrastructure to track.=0A=
>=0A=
>> +=0A=
>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);=0A=
>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);=0A=
>> +    return 0;=0A=
>> +}=0A=
=0A=

