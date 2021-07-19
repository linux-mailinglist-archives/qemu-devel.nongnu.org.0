Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B563CD0ED
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:33:02 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Pe1-0000Up-4O
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m5Pbu-0007VN-B3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m5Pbs-0002HS-1c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626687047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2gOkjj9vtdT/z6F3umFkrLSEoV04C8MBhPwv8yNkAQo=;
 b=YySZIz7DRRQ/8UD9FN5qZd8ZKEHKZs0VPLkVKXO5ZfT6WVoZRa4X1jhTVQMrhmoVA6sffu
 4nBQX9JLlzSrwXpaCjXCcdl0JyLEcLn7iPSKhS4degdWkMv3f+gzwNI+SxP/IrPfTef0n0
 uP4kDZtbxRF9Z1VkgdaT+92QPApaJVg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-i0cnYMfOMNquTUXJQG0Eag-1; Mon, 19 Jul 2021 05:30:45 -0400
X-MC-Unique: i0cnYMfOMNquTUXJQG0Eag-1
Received: by mail-ej1-f72.google.com with SMTP id
 lb20-20020a1709077854b02904c5f93c0124so5073128ejc.14
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2gOkjj9vtdT/z6F3umFkrLSEoV04C8MBhPwv8yNkAQo=;
 b=iBIL/Rr9RjNaNXeqHX6YNMhaFQopguOMLY7aHKR16aIF0hBFnfgdM2ohLnhZ/HJQxq
 3/J/91T062NhCGdvIHhbzn0RmOREwAaeT18Kd5vcFd86STy1wwHBA19EnCgHLmQX5scS
 vYWv9WfhyZ3p7oz4gPH+b/MzSFLSASFcjOh1BdJrYX4DFEKPciOl58Tiyf0FVuU1sK3C
 FisN/QoXo9ZM0XPxl8CGZ25aYZUmbd7Afq4r1AFd/8vr/M3G8KiOIhgvPdWnwmDshOV/
 n3dGuf0GBx2of8FDks2kqQL3NOY/P1aNXGKcn5y3mE5JbvA8iS0WqT5L5VlNPwhyyZOx
 xzMg==
X-Gm-Message-State: AOAM531Pn1jRbVEAglrYsYlHhoPnnNnoR+bQvca8sqzdZbNMu+Ev/O/2
 XcO7HpcommWOQLQDY7dXZxXCoVE45hoJ0Sg2Fx2yJ+RTg7NRsUjhOI4oPxOOU6Wt+eJumehJe4x
 9dmxOFsy7g4QV6S8=
X-Received: by 2002:a17:906:288d:: with SMTP id
 o13mr25860431ejd.120.1626687044338; 
 Mon, 19 Jul 2021 02:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz34PDj5UAd5JqIG1+hfnkDrnnEEJcKH9Sa75r8sRy4yBpFVQaSNVsFrRDIHZ041TMujcNaqw==
X-Received: by 2002:a17:906:288d:: with SMTP id
 o13mr25860414ejd.120.1626687044142; 
 Mon, 19 Jul 2021 02:30:44 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q9sm5690836ejf.70.2021.07.19.02.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 02:30:43 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] qtest/hyperv: Introduce a simple hyper-v test
In-Reply-To: <20210716154622.5udvbks3nf6ujrt7@gator>
References: <20210716125528.447915-1-vkuznets@redhat.com>
 <20210716154622.5udvbks3nf6ujrt7@gator>
Date: Mon, 19 Jul 2021 11:30:41 +0200
Message-ID: <87pmvezm4e.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Jones <drjones@redhat.com> writes:

> On Fri, Jul 16, 2021 at 02:55:28PM +0200, Vitaly Kuznetsov wrote:
>> For the beginning, just test 'hv-passthrough' and a couple of custom
>> Hyper-V  enlightenments configurations through QMP. Later, it would
>> be great to complement this by checking CPUID values from within the
>> guest.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>> - Changes since "[PATCH v8 0/9] i386: KVM: expand Hyper-V features early":
>>  make the test SKIP correctly when KVM is not present.
>> ---
>>  MAINTAINERS               |   1 +
>>  tests/qtest/hyperv-test.c | 228 ++++++++++++++++++++++++++++++++++++++
>>  tests/qtest/meson.build   |   3 +-
>>  3 files changed, 231 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/qtest/hyperv-test.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 148153d74f5b..c1afd744edca 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1576,6 +1576,7 @@ F: hw/isa/apm.c
>>  F: include/hw/isa/apm.h
>>  F: tests/unit/test-x86-cpuid.c
>>  F: tests/qtest/test-x86-cpuid-compat.c
>> +F: tests/qtest/hyperv-test.c
>>  
>>  PC Chipset
>>  M: Michael S. Tsirkin <mst@redhat.com>
>> diff --git a/tests/qtest/hyperv-test.c b/tests/qtest/hyperv-test.c
>> new file mode 100644
>> index 000000000000..2155e5d90970
>> --- /dev/null
>> +++ b/tests/qtest/hyperv-test.c
>> @@ -0,0 +1,228 @@
>> +/*
>> + * Hyper-V emulation CPU feature test cases
>> + *
>> + * Copyright (c) 2021 Red Hat Inc.
>> + * Authors:
>> + *  Vitaly Kuznetsov <vkuznets@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#include <linux/kvm.h>
>> +#include <sys/ioctl.h>
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/bitops.h"
>> +#include "libqos/libqtest.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "qapi/qmp/qjson.h"
>> +
>> +#define MACHINE_KVM "-machine pc-q35-5.2 -accel kvm "
>> +#define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>> +                    "  'arguments': { 'type': 'full', "
>> +#define QUERY_TAIL  "}}"
>> +
>> +static bool kvm_enabled(QTestState *qts)
>> +{
>> +    QDict *resp, *qdict;
>> +    bool enabled;
>> +
>> +    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>> +    g_assert(qdict_haskey(resp, "return"));
>> +    qdict = qdict_get_qdict(resp, "return");
>> +    g_assert(qdict_haskey(qdict, "enabled"));
>> +    enabled = qdict_get_bool(qdict, "enabled");
>> +    qobject_unref(resp);
>> +
>> +    return enabled;
>> +}
>> +
>> +static bool kvm_has_cap(int cap)
>> +{
>> +    int fd = open("/dev/kvm", O_RDWR);
>> +    int ret;
>> +
>> +    if (fd < 0) {
>> +        return false;
>> +    }
>> +
>> +    ret = ioctl(fd, KVM_CHECK_EXTENSION, cap);
>> +
>> +    close(fd);
>> +
>> +    return ret > 0;
>> +}
>> +
>> +static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>> +{
>> +    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>> +                          QUERY_TAIL, cpu_type);
>> +}
>> +
>> +static bool resp_has_props(QDict *resp)
>> +{
>> +    QDict *qdict;
>> +
>> +    g_assert(resp);
>> +
>> +    if (!qdict_haskey(resp, "return")) {
>> +        return false;
>> +    }
>> +    qdict = qdict_get_qdict(resp, "return");
>> +
>> +    if (!qdict_haskey(qdict, "model")) {
>> +        return false;
>> +    }
>> +    qdict = qdict_get_qdict(qdict, "model");
>> +
>> +    return qdict_haskey(qdict, "props");
>> +}
>> +
>> +static QDict *resp_get_props(QDict *resp)
>> +{
>> +    QDict *qdict;
>> +
>> +    g_assert(resp);
>> +    g_assert(resp_has_props(resp));
>> +
>> +    qdict = qdict_get_qdict(resp, "return");
>> +    qdict = qdict_get_qdict(qdict, "model");
>> +    qdict = qdict_get_qdict(qdict, "props");
>> +
>> +    return qdict;
>> +}
>> +
>> +static bool resp_get_feature(QDict *resp, const char *feature)
>> +{
>> +    QDict *props;
>> +
>> +    g_assert(resp);
>> +    g_assert(resp_has_props(resp));
>> +    props = resp_get_props(resp);
>> +    g_assert(qdict_get(props, feature));
>> +    return qdict_get_bool(props, feature);
>> +}
>> +
>> +#define assert_has_feature(qts, cpu_type, feature)                     \
>> +({                                                                     \
>> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
>> +    g_assert(_resp);                                                   \
>> +    g_assert(resp_has_props(_resp));                                   \
>> +    g_assert(qdict_get(resp_get_props(_resp), feature));               \
>> +    qobject_unref(_resp);                                              \
>> +})
>> +
>> +#define resp_assert_feature(resp, feature, expected_value)             \
>> +({                                                                     \
>> +    QDict *_props;                                                     \
>> +                                                                       \
>> +    g_assert(_resp);                                                   \
>> +    g_assert(resp_has_props(_resp));                                   \
>> +    _props = resp_get_props(_resp);                                    \
>> +    g_assert(qdict_get(_props, feature));                              \
>> +    g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
>> +})
>> +
>> +#define assert_feature(qts, cpu_type, feature, expected_value)         \
>> +({                                                                     \
>> +    QDict *_resp;                                                      \
>> +                                                                       \
>> +    _resp = do_query_no_props(qts, cpu_type);                          \
>> +    g_assert(_resp);                                                   \
>> +    resp_assert_feature(_resp, feature, expected_value);               \
>> +    qobject_unref(_resp);                                              \
>> +})
>> +
>> +#define assert_has_feature_enabled(qts, cpu_type, feature)             \
>> +    assert_feature(qts, cpu_type, feature, true)
>> +
>> +#define assert_has_feature_disabled(qts, cpu_type, feature)            \
>> +    assert_feature(qts, cpu_type, feature, false)
>
> All the code above looks like stuff we should share with other tests.
> Shouldn't we factor that stuff out of those test(s) into some include?
>

Probably yes but we'll need to come up with better names for all these
functions to make it clear they're CPU specific.

-- 
Vitaly


