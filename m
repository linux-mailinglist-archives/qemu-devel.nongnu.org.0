Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F7B58C318
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:57:54 +0200 (CEST)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKvlx-0000Va-7h
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKvk7-0007ZW-Rg
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKvk4-00083q-6c
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659938154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDozATwlXk52UoPm0d73GiyFbXiBF9yldbt2zNJu7kI=;
 b=C88IJfIIPFI2jBdTR8T1Goj4sdW6FqMRbhDgmpacgWCoia76Jfr6W79F3PsQ6hC0HZCOiw
 cXsmjN4yrj3WZ7NFviv/TUrXhR+6NigCmPnJ6kPWgDVLP7gnBOny4YsZDCk4er44Lulaer
 g8tlI2IxlbTL9nylyBlcdPgniGEfRnM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-lkymFG_COmiWePLFvQ9VnQ-1; Mon, 08 Aug 2022 01:55:53 -0400
X-MC-Unique: lkymFG_COmiWePLFvQ9VnQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r5-20020a1c4405000000b003a534ec2570so1043822wma.7
 for <qemu-devel@nongnu.org>; Sun, 07 Aug 2022 22:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UDozATwlXk52UoPm0d73GiyFbXiBF9yldbt2zNJu7kI=;
 b=suJU83he4VJ+YKBHwQeI8ZOoc2qjR+qo6jCavfewg8jN42kWGQ083IkYxK75xd0K8N
 7hIFVda4LNqNjzgeQOy13/7MaLzXYjZAozpyY2f6NHu4syGJ3tc4FwK2UW3iltVcu2Rc
 iB/ashc1rW8CgXY3cDLUa0cO9tLZZYTvVUJHlKUQPeqrC2sv1tXyfpCemek+2hzszGDa
 qaid/+JtAn1NcoibKHmvRyHRltV/M9wh2Npi2HMqTKkOLFaPQ7AEhuONurZRmoAk8Uaa
 tS8DSO0xlMwpLzCRz5vHVyAQurJN7KHtfW8pxo8MCkvfQvTkZuFucYR8zTQqIpBZWxum
 pcWg==
X-Gm-Message-State: ACgBeo0SvoICgpOBRWEJC0Dm35rbQVvRBqH+xLJ8HDDtup3cczu70dx6
 ak4NCd5eSbHhd4p5M2GfKJHWtIixgRRUpaLwCMJ1z1jOIqK1xGpMd9xUVPiiMjVDNzttaHfe9kK
 QB3dMG7nRE8G5W/4=
X-Received: by 2002:a05:6000:1a8e:b0:222:3141:97ea with SMTP id
 f14-20020a0560001a8e00b00222314197eamr5381879wry.57.1659938151943; 
 Sun, 07 Aug 2022 22:55:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NkK0v3Wzl/yeaC0X4BiHSOoeD2cmIYvmf5VKxnYWPioguzDwX6ZMVzTKy4X86x/9e+HJ3tg==
X-Received: by 2002:a05:6000:1a8e:b0:222:3141:97ea with SMTP id
 f14-20020a0560001a8e00b00222314197eamr5381869wry.57.1659938151723; 
 Sun, 07 Aug 2022 22:55:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003a537dc0b16sm4567234wms.44.2022.08.07.22.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Aug 2022 22:55:51 -0700 (PDT)
Message-ID: <0d00fbb9-3b47-6041-4afa-63bb618689f0@redhat.com>
Date: Mon, 8 Aug 2022 07:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220805115529.124544-1-berrange@redhat.com>
 <20220805115529.124544-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/1] tests/qtest: add scenario for -readconfig handling
In-Reply-To: <20220805115529.124544-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/08/2022 13.55, Daniel P. Berrangé wrote:
> This test of -readconfig validates the last three regressions we
> have fixed with -readconfig:
> 
>   * Interpretation of memory size units as MiB not bytes
>   * Allow use of [spice]
>   * Allow use of [object]

Good idea!

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/meson.build       |   1 +
>   tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++
>   2 files changed, 196 insertions(+)
>   create mode 100644 tests/qtest/readconfig-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 3a474010e4..be4b30dea2 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -26,6 +26,7 @@ qtests_generic = [
>     'qom-test',
>     'test-hmp',
>     'qos-test',
> +  'readconfig-test',
>   ]
>   if config_host.has_key('CONFIG_MODULES')
>     qtests_generic += [ 'modules-test' ]
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> new file mode 100644
> index 0000000000..2e604d7c2d
> --- /dev/null
> +++ b/tests/qtest/readconfig-test.c
> @@ -0,0 +1,195 @@
> +/*
> + * Validate -readconfig
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-visit-machine.h"
> +#include "qapi/qapi-visit-qom.h"
> +#include "qapi/qapi-visit-ui.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qemu/units.h"
> +
> +static QTestState *qtest_init_with_config(const char *cfgdata)
> +{
> +    GError *error = NULL;
> +    g_autofree char *args = NULL;
> +    int cfgfd = -1;
> +    g_autofree char *cfgpath = NULL;
> +    QTestState *qts;
> +    ssize_t ret;
> +
> +    cfgfd = g_file_open_tmp("readconfig-test-XXXXXX", &cfgpath, &error);
> +    g_assert_no_error(error);
> +    g_assert_cmpint(cfgfd, >=, 0);
> +
> +    ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
> +    if (ret < 0) {
> +        unlink(cfgpath);
> +    }
> +    g_assert_cmpint(ret, ==, strlen(cfgdata));
> +
> +    close(cfgfd);

Maybe move the close() before the "if (ret < 0)"

> +    args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
> +
> +    qts = qtest_init(args);
> +
> +    unlink(cfgpath);
> +
> +    return qts;
> +}
> +
> +static void test_x86_memdev_resp(QObject *res)
> +{
> +    Visitor *v;
> +    g_autoptr(MemdevList) memdevs = NULL;
> +    Memdev *memdev;
> +
> +    g_assert(res);
> +    v = qobject_input_visitor_new(res);
> +    visit_type_MemdevList(v, NULL, &memdevs, &error_abort);
> +
> +    g_assert(memdevs);
> +    g_assert(memdevs->value);
> +    g_assert(!memdevs->next);
> +
> +    memdev = memdevs->value;
> +    g_assert_cmpstr(memdev->id, ==, "ram");
> +    g_assert_cmpint(memdev->size, ==, 200 * MiB);
> +
> +    visit_free(v);
> +}
> +
> +static void test_x86_memdev(void)
> +{
> +    QDict *resp;
> +    QTestState *qts;
> +    const char *cfgdata =
> +        "[memory]\n"
> +        "size = \"200\"";
> +
> +    qts = qtest_init_with_config(cfgdata);
> +   /* Test valid command */

Comment has bad indentation.

> +    resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
> +    test_x86_memdev_resp(qdict_get(resp, "return"));
> +    qobject_unref(resp);
> +
> +    qtest_quit(qts);
> +}
> +
> +
> +#ifdef CONFIG_SPICE
> +static void test_spice_resp(QObject *res)
> +{
> +    Visitor *v;
> +    g_autoptr(SpiceInfo) spice = NULL;
> +
> +    g_assert(res);
> +    v = qobject_input_visitor_new(res);
> +    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);

That "spcie" looks like a typo?

> +    g_assert(spice);
> +    g_assert(spice->enabled);
> +
> +    visit_free(v);
> +}
> +
> +static void test_spice(void)
> +{
> +    QDict *resp;
> +    QTestState *qts;
> +    const char *cfgdata =
> +        "[spice]\n"
> +        "disable-ticketing = \"on\"\n"
> +        "unix = \"on\"\n";
> +
> +    qts = qtest_init_with_config(cfgdata);
> +   /* Test valid command */

Bad indentation again.

> +    resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
> +    test_spice_resp(qdict_get(resp, "return"));
> +    qobject_unref(resp);
> +
> +    qtest_quit(qts);
> +}
> +#endif
> +
> +static void test_object_rng_resp(QObject *res)
> +{
> +    Visitor *v;
> +    g_autoptr(ObjectPropertyInfoList) objs = NULL;
> +    ObjectPropertyInfoList *tmp;
> +    ObjectPropertyInfo *obj;
> +    bool seen_rng = false;
> +
> +    g_assert(res);
> +    v = qobject_input_visitor_new(res);
> +    visit_type_ObjectPropertyInfoList(v, NULL, &objs, &error_abort);
> +
> +    g_assert(objs);
> +    tmp = objs;
> +    while (tmp) {
> +        g_assert(tmp->value);
> +
> +        obj = tmp->value;
> +        if (g_str_equal(obj->name, "rng0") &&
> +            g_str_equal(obj->type, "child<rng-builtin>")) {
> +            seen_rng = true;

Do a "break;" here to speed things up?

> +        }
> +
> +        tmp = tmp->next;
> +    }
> +
> +    g_assert(seen_rng);
> +
> +    visit_free(v);
> +}
> +
> +static void test_object_rng(void)
> +{
> +    QDict *resp;
> +    QTestState *qts;
> +    const char *cfgdata =
> +        "[object]\n"
> +        "qom-type = \"rng-builtin\"\n"
> +        "id = \"rng0\"\n";
> +
> +    qts = qtest_init_with_config(cfgdata);
> +   /* Test valid command */

Bad indentation again.

> +    resp = qtest_qmp(qts,
> +                     "{ 'execute': 'qom-list',"
> +                     "  'arguments': {'path': '/objects' }}");
> +    test_object_rng_resp(qdict_get(resp, "return"));
> +    qobject_unref(resp);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    const char *arch;
> +    g_test_init(&argc, &argv, NULL);
> +
> +    arch = qtest_get_arch();
> +
> +    if (g_str_equal(arch, "i386") ||
> +        g_str_equal(arch, "x86_64")) {
> +        qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
> +    }
> +#ifdef CONFIG_SPICE
> +    qtest_add_func("readconfig/spice", test_spice);
> +#endif
> +
> +    qtest_add_func("readconfig/object-rng", test_object_rng);
> +
> +    return g_test_run();
> +}

  Thomas


