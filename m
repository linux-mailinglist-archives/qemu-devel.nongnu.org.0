Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3983CD52C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:55:08 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Snb-000141-M5
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5SmA-0000DR-3J
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Sm7-0004Fd-6k
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626699214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yqxlw6mw7YT0w4BXXFDRrVBkYJWU+QlGXo6hwvQgxh8=;
 b=KaqXln9/bH7FsTvTn3gZBNc91p2qR3LpiJDNId4+YOqrr55IvKZl5TtmAdlKs37xLbR3Kt
 xvgM0PoF+0Gu9iqXVXEa8BzymYCGDWw+LFZasuVJM+nZ5xcNrRXtzHyb7bfaN7ShA/Ha83
 9HqSLUMPgQr7dieeqGMfgmt9dQAv/gk=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-KHMHel-YM9akrEyvkfjtyQ-1; Mon, 19 Jul 2021 08:53:33 -0400
X-MC-Unique: KHMHel-YM9akrEyvkfjtyQ-1
Received: by mail-il1-f197.google.com with SMTP id
 m15-20020a923f0f0000b02901ee102ac952so10609357ila.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yqxlw6mw7YT0w4BXXFDRrVBkYJWU+QlGXo6hwvQgxh8=;
 b=ZQvcd96ZCLU3sp1JdHBE1qfJ827xlPb8f2prH0AbA+6ThbcWoln2hvUtbQng9KqsbK
 A+QNYI2zvYWcD5hQkwq9QJ0s6LHzsauEDjwPn1i16rml2C14L29hg3lG3lU6VKKZ9kZJ
 WnUgANcAbN9fiLeUVMI4zBEgHwwjV62rIS+Ev9iL3rWOyfY+NIKfjoycY1fJFxv+DOdL
 lICHL6sagoQrheh0o2nz7cWxj/w8zV04v2sLBw1J8oBIMMpaFmI4TKUM5d1hwq1xVE8A
 zTvHwFUvjEqKHy3Rc6wExCw2mWN5nag/wxGKoOy81awlxmzC8u6T5100kXSk9pE0IAfI
 o/aQ==
X-Gm-Message-State: AOAM530AZnNaoBAOlCoaD3093yNtTXV4HprHEMRILxw3S/ZA/yudq1RP
 jriF/7ZCQX6FsCJxT0vswG1JvB4L1tbOYOaPA1NqRVUlcx53h3N/xHt6feQeV9Ket7quNd2FxPg
 hAKXqvfk4fMegMmg=
X-Received: by 2002:a02:c7cc:: with SMTP id s12mr21545055jao.37.1626699212582; 
 Mon, 19 Jul 2021 05:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydNXe0/4w/k2fyUAqTL12IRd6OpvdZiG/CfrZn60rG9vsBU5Y6SR4yEh1Jl7ErI4tAEsQLlw==
X-Received: by 2002:a02:c7cc:: with SMTP id s12mr21545034jao.37.1626699212401; 
 Mon, 19 Jul 2021 05:53:32 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id k21sm10687039ios.0.2021.07.19.05.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 05:53:31 -0700 (PDT)
Date: Mon, 19 Jul 2021 14:53:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210719125329.25izxdzji7z3y3hu@gator>
References: <20210716125528.447915-1-vkuznets@redhat.com>
 <20210716154622.5udvbks3nf6ujrt7@gator>
 <87pmvezm4e.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87pmvezm4e.fsf@vitty.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Jul 19, 2021 at 11:30:41AM +0200, Vitaly Kuznetsov wrote:
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Fri, Jul 16, 2021 at 02:55:28PM +0200, Vitaly Kuznetsov wrote:
> >> For the beginning, just test 'hv-passthrough' and a couple of custom
> >> Hyper-V  enlightenments configurations through QMP. Later, it would
> >> be great to complement this by checking CPUID values from within the
> >> guest.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >> - Changes since "[PATCH v8 0/9] i386: KVM: expand Hyper-V features early":
> >>  make the test SKIP correctly when KVM is not present.
> >> ---
> >>  MAINTAINERS               |   1 +
> >>  tests/qtest/hyperv-test.c | 228 ++++++++++++++++++++++++++++++++++++++
> >>  tests/qtest/meson.build   |   3 +-
> >>  3 files changed, 231 insertions(+), 1 deletion(-)
> >>  create mode 100644 tests/qtest/hyperv-test.c
> >> 
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 148153d74f5b..c1afd744edca 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1576,6 +1576,7 @@ F: hw/isa/apm.c
> >>  F: include/hw/isa/apm.h
> >>  F: tests/unit/test-x86-cpuid.c
> >>  F: tests/qtest/test-x86-cpuid-compat.c
> >> +F: tests/qtest/hyperv-test.c
> >>  
> >>  PC Chipset
> >>  M: Michael S. Tsirkin <mst@redhat.com>
> >> diff --git a/tests/qtest/hyperv-test.c b/tests/qtest/hyperv-test.c
> >> new file mode 100644
> >> index 000000000000..2155e5d90970
> >> --- /dev/null
> >> +++ b/tests/qtest/hyperv-test.c
> >> @@ -0,0 +1,228 @@
> >> +/*
> >> + * Hyper-V emulation CPU feature test cases
> >> + *
> >> + * Copyright (c) 2021 Red Hat Inc.
> >> + * Authors:
> >> + *  Vitaly Kuznetsov <vkuznets@redhat.com>
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >> + * See the COPYING file in the top-level directory.
> >> + */
> >> +#include <linux/kvm.h>
> >> +#include <sys/ioctl.h>
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qemu/bitops.h"
> >> +#include "libqos/libqtest.h"
> >> +#include "qapi/qmp/qdict.h"
> >> +#include "qapi/qmp/qjson.h"
> >> +
> >> +#define MACHINE_KVM "-machine pc-q35-5.2 -accel kvm "
> >> +#define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
> >> +                    "  'arguments': { 'type': 'full', "
> >> +#define QUERY_TAIL  "}}"
> >> +
> >> +static bool kvm_enabled(QTestState *qts)
> >> +{
> >> +    QDict *resp, *qdict;
> >> +    bool enabled;
> >> +
> >> +    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
> >> +    g_assert(qdict_haskey(resp, "return"));
> >> +    qdict = qdict_get_qdict(resp, "return");
> >> +    g_assert(qdict_haskey(qdict, "enabled"));
> >> +    enabled = qdict_get_bool(qdict, "enabled");
> >> +    qobject_unref(resp);
> >> +
> >> +    return enabled;
> >> +}
> >> +
> >> +static bool kvm_has_cap(int cap)
> >> +{
> >> +    int fd = open("/dev/kvm", O_RDWR);
> >> +    int ret;
> >> +
> >> +    if (fd < 0) {
> >> +        return false;
> >> +    }
> >> +
> >> +    ret = ioctl(fd, KVM_CHECK_EXTENSION, cap);
> >> +
> >> +    close(fd);
> >> +
> >> +    return ret > 0;
> >> +}
> >> +
> >> +static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
> >> +{
> >> +    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> >> +                          QUERY_TAIL, cpu_type);
> >> +}
> >> +
> >> +static bool resp_has_props(QDict *resp)
> >> +{
> >> +    QDict *qdict;
> >> +
> >> +    g_assert(resp);
> >> +
> >> +    if (!qdict_haskey(resp, "return")) {
> >> +        return false;
> >> +    }
> >> +    qdict = qdict_get_qdict(resp, "return");
> >> +
> >> +    if (!qdict_haskey(qdict, "model")) {
> >> +        return false;
> >> +    }
> >> +    qdict = qdict_get_qdict(qdict, "model");
> >> +
> >> +    return qdict_haskey(qdict, "props");
> >> +}
> >> +
> >> +static QDict *resp_get_props(QDict *resp)
> >> +{
> >> +    QDict *qdict;
> >> +
> >> +    g_assert(resp);
> >> +    g_assert(resp_has_props(resp));
> >> +
> >> +    qdict = qdict_get_qdict(resp, "return");
> >> +    qdict = qdict_get_qdict(qdict, "model");
> >> +    qdict = qdict_get_qdict(qdict, "props");
> >> +
> >> +    return qdict;
> >> +}
> >> +
> >> +static bool resp_get_feature(QDict *resp, const char *feature)
> >> +{
> >> +    QDict *props;
> >> +
> >> +    g_assert(resp);
> >> +    g_assert(resp_has_props(resp));
> >> +    props = resp_get_props(resp);
> >> +    g_assert(qdict_get(props, feature));
> >> +    return qdict_get_bool(props, feature);
> >> +}
> >> +
> >> +#define assert_has_feature(qts, cpu_type, feature)                     \
> >> +({                                                                     \
> >> +    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> >> +    g_assert(_resp);                                                   \
> >> +    g_assert(resp_has_props(_resp));                                   \
> >> +    g_assert(qdict_get(resp_get_props(_resp), feature));               \
> >> +    qobject_unref(_resp);                                              \
> >> +})
> >> +
> >> +#define resp_assert_feature(resp, feature, expected_value)             \
> >> +({                                                                     \
> >> +    QDict *_props;                                                     \
> >> +                                                                       \
> >> +    g_assert(_resp);                                                   \
> >> +    g_assert(resp_has_props(_resp));                                   \
> >> +    _props = resp_get_props(_resp);                                    \
> >> +    g_assert(qdict_get(_props, feature));                              \
> >> +    g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
> >> +})
> >> +
> >> +#define assert_feature(qts, cpu_type, feature, expected_value)         \
> >> +({                                                                     \
> >> +    QDict *_resp;                                                      \
> >> +                                                                       \
> >> +    _resp = do_query_no_props(qts, cpu_type);                          \
> >> +    g_assert(_resp);                                                   \
> >> +    resp_assert_feature(_resp, feature, expected_value);               \
> >> +    qobject_unref(_resp);                                              \
> >> +})
> >> +
> >> +#define assert_has_feature_enabled(qts, cpu_type, feature)             \
> >> +    assert_feature(qts, cpu_type, feature, true)
> >> +
> >> +#define assert_has_feature_disabled(qts, cpu_type, feature)            \
> >> +    assert_feature(qts, cpu_type, feature, false)
> >
> > All the code above looks like stuff we should share with other tests.
> > Shouldn't we factor that stuff out of those test(s) into some include?
> >
> 
> Probably yes but we'll need to come up with better names for all these
> functions to make it clear they're CPU specific.
>

Some can be given more general names, i.e. s/feature/bool/ as they're not
cpu specific. The ones that take a cpu_type parameter could just get a
cpu_ prefix, I guess.

Thanks,
drew


