Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128914D49AD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:51:54 +0100 (CET)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSK8u-0000RC-LL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nSK7T-00086c-TR
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:50:23 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:55157
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nSK7P-0003C2-5P
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:50:21 -0500
HMM_SOURCE_IP: 172.18.0.188:54618.766622776
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.5 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 89DAC28009C;
 Thu, 10 Mar 2022 22:50:06 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 2b2a784d83d74648b41f80f79e20d057 for
 peterx@redhat.com; Thu, 10 Mar 2022 22:50:09 CST
X-Transaction-ID: 2b2a784d83d74648b41f80f79e20d057
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <68149542-3db1-6d3d-1cb0-662589fc2aac@chinatelecom.cn>
Date: Thu, 10 Mar 2022 22:50:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/2] tests: Add dirty page rate limit test
To: Peter Xu <peterx@redhat.com>
References: <cover.1646840370.git.huangy81@chinatelecom.cn>
 <b4f2f50fbf6570a07352c6da75ed081db5200b18.1646840370.git.huangy81@chinatelecom.cn>
 <Yim25ARaik4Qg7Vz@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Yim25ARaik4Qg7Vz@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/3/10 16:29, Peter Xu 写道:
> On Wed, Mar 09, 2022 at 11:58:01PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Add dirty page rate limit test if kernel support dirty ring,
>> create a standalone file to implement the test case.
> 
> Thanks for writting this test case.
> 
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   tests/qtest/dirtylimit-test.c | 288 ++++++++++++++++++++++++++++++++++++++++++
>>   tests/qtest/meson.build       |   2 +
>>   2 files changed, 290 insertions(+)
>>   create mode 100644 tests/qtest/dirtylimit-test.c
>>
>> diff --git a/tests/qtest/dirtylimit-test.c b/tests/qtest/dirtylimit-test.c
>> new file mode 100644
>> index 0000000..07eac2c
>> --- /dev/null
>> +++ b/tests/qtest/dirtylimit-test.c
>> @@ -0,0 +1,288 @@
>> +/*
>> + * QTest testcase for Dirty Page Rate Limit
>> + *
>> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
>> + *
>> + * Authors:
>> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqos/libqtest.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "qapi/qmp/qlist.h"
>> +#include "qapi/qobject-input-visitor.h"
>> +#include "qapi/qobject-output-visitor.h"
>> +
>> +#include "migration-helpers.h"
>> +#include "tests/migration/i386/a-b-bootblock.h"
>> +
>> +/*
>> + * Dirtylimit stop working if dirty page rate error
>> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
>> + */
>> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
>> +
>> +static QDict *qmp_command(QTestState *who, const char *command, ...)
>> +{
>> +    va_list ap;
>> +    QDict *resp, *ret;
>> +
>> +    va_start(ap, command);
>> +    resp = qtest_vqmp(who, command, ap);
>> +    va_end(ap);
>> +
>> +    g_assert(!qdict_haskey(resp, "error"));
>> +    g_assert(qdict_haskey(resp, "return"));
>> +
>> +    ret = qdict_get_qdict(resp, "return");
>> +    qobject_ref(ret);
>> +    qobject_unref(resp);
>> +
>> +    return ret;
>> +}
>> +
>> +static void calc_dirty_rate(QTestState *who, uint64_t calc_time)
>> +{
>> +    qobject_unref(qmp_command(who,
>> +                    "{ 'execute': 'calc-dirty-rate',"
>> +                    "'arguments': { "
>> +                    "'calc-time': %ld,"
>> +                    "'mode': 'dirty-ring' }}",
>> +                    calc_time));
>> +}
>> +
>> +static QDict *query_dirty_rate(QTestState *who)
>> +{
>> +    return qmp_command(who, "{ 'execute': 'query-dirty-rate' }");
>> +}
>> +
>> +static void dirtylimit_set_all(QTestState *who, uint64_t dirtyrate)
>> +{
>> +    qobject_unref(qmp_command(who,
>> +                    "{ 'execute': 'set-vcpu-dirty-limit',"
>> +                    "'arguments': { "
>> +                    "'dirty-rate': %ld } }",
>> +                    dirtyrate));
>> +}
>> +
>> +static void cancel_vcpu_dirty_limit(QTestState *who)
>> +{
>> +    qobject_unref(qmp_command(who,
>> +                    "{ 'execute': 'cancel-vcpu-dirty-limit' }"));
>> +}
>> +
>> +static QDict *query_vcpu_dirty_limit(QTestState *who)
>> +{
>> +    QDict *rsp;
>> +
>> +    rsp = qtest_qmp(who, "{ 'execute': 'query-vcpu-dirty-limit' }");
>> +    g_assert(!qdict_haskey(rsp, "error"));
>> +    g_assert(qdict_haskey(rsp, "return"));
>> +
>> +    return rsp;
>> +}
>> +
>> +static int64_t get_dirty_rate(QTestState *who)
>> +{
>> +    QDict *rsp_return;
>> +    gchar *status;
>> +    QList *rates;
>> +    const QListEntry *entry;
>> +    QDict *rate;
>> +    int64_t dirtyrate;
>> +
>> +    rsp_return = query_dirty_rate(who);
>> +    g_assert(rsp_return);
>> +
>> +    status = g_strdup(qdict_get_str(rsp_return, "status"));
>> +    g_assert(status);
>> +    g_assert_cmpstr(status, ==, "measured");
>> +
>> +    rates = qdict_get_qlist(rsp_return, "vcpu-dirty-rate");
>> +    g_assert(rates && !qlist_empty(rates));
>> +
>> +    entry = qlist_first(rates);
>> +    g_assert(entry);
>> +
>> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
>> +    g_assert(rate);
>> +
>> +    dirtyrate = qdict_get_try_int(rate, "dirty-rate", -1);
>> +
>> +    qobject_unref(rsp_return);
>> +    return dirtyrate;
>> +}
>> +
>> +static int64_t get_limit_rate(QTestState *who)
>> +{
>> +    QDict *rsp_return;
>> +    QList *rates;
>> +    const QListEntry *entry;
>> +    QDict *rate;
>> +    int64_t dirtyrate;
>> +
>> +    rsp_return = query_vcpu_dirty_limit(who);
>> +    g_assert(rsp_return);
>> +
>> +    rates = qdict_get_qlist(rsp_return, "return");
>> +    g_assert(rates && !qlist_empty(rates));
>> +
>> +    entry = qlist_first(rates);
>> +    g_assert(entry);
>> +
>> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
>> +    g_assert(rate);
>> +
>> +    dirtyrate = qdict_get_try_int(rate, "limit-rate", -1);
>> +
>> +    qobject_unref(rsp_return);
>> +    return dirtyrate;
>> +}
>> +
>> +static QTestState *start_vm(void)
>> +{
>> +    QTestState *vm = NULL;
>> +    g_autofree gchar *cmd = NULL;
>> +    const char *arch = qtest_get_arch();
>> +    g_autofree char *bootpath = NULL;
>> +
>> +    if (strcmp(arch, "i386") != 0 && strcmp(arch, "x86_64") != 0) {
>> +        return NULL;
>> +    }
> 
> Perhaps assert() on x86_64?  Dirty ring support is checked earlier, so I
> don't see how it'll fail... Very possible i386 will not ever support the
> ring anyway.
Ok.That make code more clean.
> 
>> +
>> +    bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>> +    assert(sizeof(x86_bootsect) == 512);
>> +    init_bootfile(bootpath, x86_bootsect, sizeof(x86_bootsect));
>> +
>> +    cmd = g_strdup_printf("-accel kvm,dirty-ring-size=4096 -accel tcg "
>> +                          "-name dirtylimit-test,debug-threads=on "
>> +                          "-m 150M -smp 1 "
>> +                          "-serial file:%s/vm_serial "
>> +                          "-drive file=%s,format=raw ",
>> +                          tmpfs, bootpath);
>> +
>> +    vm = qtest_init(cmd);
>> +    return vm;
>> +}
>> +
>> +static void stop_vm(QTestState *vm)
>> +{
>> +    qtest_quit(vm);
>> +    cleanup("bootsect");
>> +    cleanup("vm_serial");
>> +}
>> +
>> +static void test_vcpu_dirty_limit(void)
>> +{
>> +    QTestState *vm;
>> +    int64_t origin_rate;
>> +    int64_t quota_rate;
>> +    int64_t rate ;
>> +    int max_try_count = 5;
>> +    int hit = 0;
>> +
>> +    if (!(vm = start_vm())) {
>> +        return;
> 
> If you could change above into assert, then no "if" here.
> 
>> +    }
>> +
>> +    /* Wait for the first serial output from the vm*/
>> +    wait_for_serial("vm_serial");
>> +
>> +    /* Do dirtyrate measurement with calc time equals 1s */
>> +    calc_dirty_rate(vm, 1);
>> +
>> +    /* Sleep a little bit longer than calc time,
>> +     * and ensure dirtyrate measurement has been done
>> +     */
>> +    usleep(1200000);
> 
> Can we avoid using exact sleep numbers?  We need to guarantee the test
> doesn't fail even if the scheduler decides to do weird things..
> 
> How about loop until fetching a result, but with a timeout?
Ok.
> 
>> +
>> +    /* Query original dirty page rate */
>> +    origin_rate = get_dirty_rate(vm);
>> +
>> +    /* VM booted from bootsect should dirty memory */
>> +    assert(origin_rate != 0);
>> +
>> +    /* Setup quota dirty page rate at one-third of origin */
>> +    quota_rate = origin_rate / 3;
>> +
>> +    /* Set dirtylimit and wait a bit to check if it take effect */
>> +    dirtylimit_set_all(vm, quota_rate);
>> +    usleep(2000000);
>> +
>> +    /* Check if set-vcpu-dirty-limit and query-vcpu-dirty-limit
>> +     * works literally */
>> +    g_assert_cmpint(quota_rate, ==, get_limit_rate(vm));
>> +
>> +    /* Check if dirtylimit take effect realistically */
>> +    while (--max_try_count) {
>> +        calc_dirty_rate(vm, 1);
>> +        usleep(1200000);
> 
> Same here.
> 
>> +        rate = get_dirty_rate(vm);
>> +
>> +        /* Assume hitting if current rate is less
>> +         * than quota rate (within accepting error)
>> +         */
>> +        if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
>> +            hit = 1;
>> +            break;
>> +        }
>> +    }
>> +
>> +    g_assert_cmpint(hit, ==, 1);
>> +
>> +    hit = 0;
>> +    max_try_count = 5;
>> +
>> +    /* Check if dirtylimit cancellation take effect */
>> +    cancel_vcpu_dirty_limit(vm);
>> +    while (--max_try_count) {
>> +        calc_dirty_rate(vm, 1);
>> +        usleep(1200000);
> 
> Same here.
> 
>> +        rate = get_dirty_rate(vm);
>> +
>> +        /* Assume dirtylimit be canceled if current rate is
>> +         * greater than quota rate (within accepting error)
>> +         */
>> +        if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
>> +            hit = 1;
>> +            break;
>> +        }
>> +    }
>> +
>> +    g_assert_cmpint(hit, ==, 1);
>> +    stop_vm(vm);
>> +}
> 
> Thanks,
> 
Ok, thanks Peter for commenting. I'll post the next version after 
patchset "support dirty restraint on vCPU" get merged, and hope more 
comments about the patch be given during the time.

