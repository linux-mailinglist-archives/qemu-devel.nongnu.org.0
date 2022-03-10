Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD9E4D428E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 09:32:53 +0100 (CET)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEE8-00014H-8o
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 03:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSEB7-0000Kv-4m
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSEB2-00041j-R5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646900978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33bHIBRLMCAH7xIpykzaRgE5FLPqz9gHAG49f8Edex0=;
 b=P1NElggm5IZT4hlW8kgEmwLArVOig+y0c1UREdApTrBuPd5kfoXicSWMm+oarQUqLfnf9V
 LiQBt0Zx09FirRdzueDbS2WWkHu89FG8PwTcMJlXFh03+xbVDGW5S+0Qe49V5ff73Sjw54
 FNHGvbVBxeSfGbh4JRfw7vvor8RuZsw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-CWIi77fFPKiDYuh8kkA6ag-1; Thu, 10 Mar 2022 03:29:37 -0500
X-MC-Unique: CWIi77fFPKiDYuh8kkA6ag-1
Received: by mail-pj1-f69.google.com with SMTP id
 c14-20020a17090a674e00b001bf1c750f9bso5377567pjm.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 00:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=33bHIBRLMCAH7xIpykzaRgE5FLPqz9gHAG49f8Edex0=;
 b=b2HvRYV5tg4FGMJ+EWrADzbLS1pvsYtjkq2TpDy8ZrhAvCp+L3yu6bMSlaCErNboZK
 tADq/rkJt839AYcvV9EQaadAcpsSftaRA8p88IUbpeIaPUzVFJxup8jaYinqQrrclEGS
 PmmwXxTURUo7rbg1OZBg9qHGVBGqaesUVNzh29K2GJ+mfDe2EcdV58r/q2bGI8xP0sqa
 GAAWERhxoUSq+ZTX8cfNWycjd5xXacSZONsyHposL3ilZkgpya/wwzlXx1bWG49UVQ2X
 FyviC+7HMEL2c1m6e5lBXaUV31hCH+BwTY00b1ngNdpAfNmO3b/HK7xZy0VDta2keZn2
 IMiQ==
X-Gm-Message-State: AOAM532Q7mQmOLRhT53M1mPAX41I6NxdRwY3Op8lYNnqslWdp+dYkHlx
 0dE5s5SSBmxGwOgM6Tjp8tsJCASI5OgMc2I8LEPeS3uySHYktABY51Gd02c+Mjn+qxzjjbc4Suh
 BWe+n0fiTDU29+YY=
X-Received: by 2002:a62:1787:0:b0:4f6:c5d2:1da7 with SMTP id
 129-20020a621787000000b004f6c5d21da7mr3859530pfx.71.1646900976409; 
 Thu, 10 Mar 2022 00:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz8JqzGBZkgdCEQyAGH6A2eqC/UTUUyXgizAuI3ajRMNpu/b1FfWRkxqBrEvYZJSXe8JsyBg==
X-Received: by 2002:a62:1787:0:b0:4f6:c5d2:1da7 with SMTP id
 129-20020a621787000000b004f6c5d21da7mr3859509pfx.71.1646900975984; 
 Thu, 10 Mar 2022 00:29:35 -0800 (PST)
Received: from xz-m1.local ([64.64.123.101]) by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm4625378pgs.92.2022.03.10.00.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 00:29:35 -0800 (PST)
Date: Thu, 10 Mar 2022 16:29:24 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [RFC PATCH 2/2] tests: Add dirty page rate limit test
Message-ID: <Yim25ARaik4Qg7Vz@xz-m1.local>
References: <cover.1646840370.git.huangy81@chinatelecom.cn>
 <b4f2f50fbf6570a07352c6da75ed081db5200b18.1646840370.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <b4f2f50fbf6570a07352c6da75ed081db5200b18.1646840370.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Mar 09, 2022 at 11:58:01PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Add dirty page rate limit test if kernel support dirty ring,
> create a standalone file to implement the test case.

Thanks for writting this test case.

> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  tests/qtest/dirtylimit-test.c | 288 ++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   2 +
>  2 files changed, 290 insertions(+)
>  create mode 100644 tests/qtest/dirtylimit-test.c
> 
> diff --git a/tests/qtest/dirtylimit-test.c b/tests/qtest/dirtylimit-test.c
> new file mode 100644
> index 0000000..07eac2c
> --- /dev/null
> +++ b/tests/qtest/dirtylimit-test.c
> @@ -0,0 +1,288 @@
> +/*
> + * QTest testcase for Dirty Page Rate Limit
> + *
> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
> + *
> + * Authors:
> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qobject-output-visitor.h"
> +
> +#include "migration-helpers.h"
> +#include "tests/migration/i386/a-b-bootblock.h"
> +
> +/*
> + * Dirtylimit stop working if dirty page rate error
> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
> + */
> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
> +
> +static QDict *qmp_command(QTestState *who, const char *command, ...)
> +{
> +    va_list ap;
> +    QDict *resp, *ret;
> +
> +    va_start(ap, command);
> +    resp = qtest_vqmp(who, command, ap);
> +    va_end(ap);
> +
> +    g_assert(!qdict_haskey(resp, "error"));
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    ret = qdict_get_qdict(resp, "return");
> +    qobject_ref(ret);
> +    qobject_unref(resp);
> +
> +    return ret;
> +}
> +
> +static void calc_dirty_rate(QTestState *who, uint64_t calc_time)
> +{
> +    qobject_unref(qmp_command(who,
> +                    "{ 'execute': 'calc-dirty-rate',"
> +                    "'arguments': { "
> +                    "'calc-time': %ld,"
> +                    "'mode': 'dirty-ring' }}",
> +                    calc_time));
> +}
> +
> +static QDict *query_dirty_rate(QTestState *who)
> +{
> +    return qmp_command(who, "{ 'execute': 'query-dirty-rate' }");
> +}
> +
> +static void dirtylimit_set_all(QTestState *who, uint64_t dirtyrate)
> +{
> +    qobject_unref(qmp_command(who,
> +                    "{ 'execute': 'set-vcpu-dirty-limit',"
> +                    "'arguments': { "
> +                    "'dirty-rate': %ld } }",
> +                    dirtyrate));
> +}
> +
> +static void cancel_vcpu_dirty_limit(QTestState *who)
> +{
> +    qobject_unref(qmp_command(who,
> +                    "{ 'execute': 'cancel-vcpu-dirty-limit' }"));
> +}
> +
> +static QDict *query_vcpu_dirty_limit(QTestState *who)
> +{
> +    QDict *rsp;
> +
> +    rsp = qtest_qmp(who, "{ 'execute': 'query-vcpu-dirty-limit' }");
> +    g_assert(!qdict_haskey(rsp, "error"));
> +    g_assert(qdict_haskey(rsp, "return"));
> +
> +    return rsp;
> +}
> +
> +static int64_t get_dirty_rate(QTestState *who)
> +{
> +    QDict *rsp_return;
> +    gchar *status;
> +    QList *rates;
> +    const QListEntry *entry;
> +    QDict *rate;
> +    int64_t dirtyrate;
> +
> +    rsp_return = query_dirty_rate(who);
> +    g_assert(rsp_return);
> +
> +    status = g_strdup(qdict_get_str(rsp_return, "status"));
> +    g_assert(status);
> +    g_assert_cmpstr(status, ==, "measured");
> +
> +    rates = qdict_get_qlist(rsp_return, "vcpu-dirty-rate");
> +    g_assert(rates && !qlist_empty(rates));
> +
> +    entry = qlist_first(rates);
> +    g_assert(entry);
> +
> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
> +    g_assert(rate);
> +
> +    dirtyrate = qdict_get_try_int(rate, "dirty-rate", -1);
> +
> +    qobject_unref(rsp_return);
> +    return dirtyrate;
> +}
> +
> +static int64_t get_limit_rate(QTestState *who)
> +{
> +    QDict *rsp_return;
> +    QList *rates;
> +    const QListEntry *entry;
> +    QDict *rate;
> +    int64_t dirtyrate;
> +
> +    rsp_return = query_vcpu_dirty_limit(who);
> +    g_assert(rsp_return);
> +
> +    rates = qdict_get_qlist(rsp_return, "return");
> +    g_assert(rates && !qlist_empty(rates));
> +
> +    entry = qlist_first(rates);
> +    g_assert(entry);
> +
> +    rate = qobject_to(QDict, qlist_entry_obj(entry));
> +    g_assert(rate);
> +
> +    dirtyrate = qdict_get_try_int(rate, "limit-rate", -1);
> +
> +    qobject_unref(rsp_return);
> +    return dirtyrate;
> +}
> +
> +static QTestState *start_vm(void)
> +{
> +    QTestState *vm = NULL;
> +    g_autofree gchar *cmd = NULL;
> +    const char *arch = qtest_get_arch();
> +    g_autofree char *bootpath = NULL;
> +
> +    if (strcmp(arch, "i386") != 0 && strcmp(arch, "x86_64") != 0) {
> +        return NULL;
> +    }

Perhaps assert() on x86_64?  Dirty ring support is checked earlier, so I
don't see how it'll fail... Very possible i386 will not ever support the
ring anyway.

> +
> +    bootpath = g_strdup_printf("%s/bootsect", tmpfs);
> +    assert(sizeof(x86_bootsect) == 512);
> +    init_bootfile(bootpath, x86_bootsect, sizeof(x86_bootsect));
> +
> +    cmd = g_strdup_printf("-accel kvm,dirty-ring-size=4096 -accel tcg "
> +                          "-name dirtylimit-test,debug-threads=on "
> +                          "-m 150M -smp 1 "
> +                          "-serial file:%s/vm_serial "
> +                          "-drive file=%s,format=raw ",
> +                          tmpfs, bootpath);
> +
> +    vm = qtest_init(cmd);
> +    return vm;
> +}
> +
> +static void stop_vm(QTestState *vm)
> +{
> +    qtest_quit(vm);
> +    cleanup("bootsect");
> +    cleanup("vm_serial");
> +}
> +
> +static void test_vcpu_dirty_limit(void)
> +{
> +    QTestState *vm;
> +    int64_t origin_rate;
> +    int64_t quota_rate;
> +    int64_t rate ;
> +    int max_try_count = 5;
> +    int hit = 0;
> +
> +    if (!(vm = start_vm())) {
> +        return;

If you could change above into assert, then no "if" here.

> +    }
> +
> +    /* Wait for the first serial output from the vm*/
> +    wait_for_serial("vm_serial");
> +
> +    /* Do dirtyrate measurement with calc time equals 1s */
> +    calc_dirty_rate(vm, 1);
> +
> +    /* Sleep a little bit longer than calc time,
> +     * and ensure dirtyrate measurement has been done
> +     */
> +    usleep(1200000);

Can we avoid using exact sleep numbers?  We need to guarantee the test
doesn't fail even if the scheduler decides to do weird things..

How about loop until fetching a result, but with a timeout?

> +
> +    /* Query original dirty page rate */
> +    origin_rate = get_dirty_rate(vm);
> +
> +    /* VM booted from bootsect should dirty memory */
> +    assert(origin_rate != 0);
> +
> +    /* Setup quota dirty page rate at one-third of origin */
> +    quota_rate = origin_rate / 3;
> +
> +    /* Set dirtylimit and wait a bit to check if it take effect */
> +    dirtylimit_set_all(vm, quota_rate);
> +    usleep(2000000);
> +
> +    /* Check if set-vcpu-dirty-limit and query-vcpu-dirty-limit
> +     * works literally */
> +    g_assert_cmpint(quota_rate, ==, get_limit_rate(vm));
> +
> +    /* Check if dirtylimit take effect realistically */
> +    while (--max_try_count) {
> +        calc_dirty_rate(vm, 1);
> +        usleep(1200000);

Same here.

> +        rate = get_dirty_rate(vm);
> +
> +        /* Assume hitting if current rate is less
> +         * than quota rate (within accepting error)
> +         */
> +        if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
> +            hit = 1;
> +            break;
> +        }
> +    }
> +
> +    g_assert_cmpint(hit, ==, 1);
> +
> +    hit = 0;
> +    max_try_count = 5;
> +
> +    /* Check if dirtylimit cancellation take effect */
> +    cancel_vcpu_dirty_limit(vm);
> +    while (--max_try_count) {
> +        calc_dirty_rate(vm, 1);
> +        usleep(1200000);

Same here.

> +        rate = get_dirty_rate(vm);
> +
> +        /* Assume dirtylimit be canceled if current rate is
> +         * greater than quota rate (within accepting error)
> +         */
> +        if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
> +            hit = 1;
> +            break;
> +        }
> +    }
> +
> +    g_assert_cmpint(hit, ==, 1);
> +    stop_vm(vm);
> +}

Thanks,

-- 
Peter Xu


