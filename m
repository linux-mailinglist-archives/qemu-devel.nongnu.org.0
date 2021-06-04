Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB839B428
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:41:29 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4SO-00064z-2O
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4RA-0004ap-Nz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4R8-0003nD-TT
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622792410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9JIjoIHMFLv/Qbbi2IiPKefoTF+L+/QnB5WU4u2L2Xs=;
 b=JMkScaz48IYRh6D7o1xwkBGaNlmdPKbLwOc0DF2VUCazz6hDGtAHqBHltKH3tRxUTnzsSk
 Oxu9Jul2U2gv1ln5kGRSHI2yA282sR7OXXznWK57itRLjRFx6+eNF+rydIpufN1EDOGzgB
 QN8AUeUu3iGkxHFTN1URHRXrCQ2KalA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-H7rfLFMyPHacstqfJA1wQg-1; Fri, 04 Jun 2021 03:40:09 -0400
X-MC-Unique: H7rfLFMyPHacstqfJA1wQg-1
Received: by mail-ed1-f69.google.com with SMTP id
 j13-20020aa7de8d0000b029038fc8e57037so4590088edv.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9JIjoIHMFLv/Qbbi2IiPKefoTF+L+/QnB5WU4u2L2Xs=;
 b=UI1ftOnj4zEaK7uPuZUk/EcKjohukHRXPVl72Kr9U9hMPlkG6h9wuN5G8xVffP6xMJ
 SgkJQ5PrTV7nDDt53/vsx765VB+HrYfmk6/6/PxfJycQxY077ff6IpmWEszgy5JdyGGX
 Y1znRzsbBJVtIuArZ+zmWs8XpczrXtdq7bL3CnwPD3lC3dbjZISmM0J5hLwNhf8/WJ68
 6RZ6DWdFtO38yioXmIK/WTN69kJDLDFDrVyS+QDTRSjafd8npuH4FP4vzeDVsiRX7ujg
 h3JOe60HMxyzlM2r2WAYDr370+h2svHGx8RvG55WBDIoxp4ib3QyMx8wbSPsyl0rBrDn
 NEtQ==
X-Gm-Message-State: AOAM532/QSaREGZ6dtNJfeq9h7Z3+UYSKxnGhWAQXuaKe3CT+f/VO6gF
 pgGUVQh/2PSVwx8cJ3g7Mp9yVUd0j6VJa+YuD4O9jQK0PjcUBe7srcOBkPbnEA9CzR7FjLs0/21
 K+scGbshJMIyHTbU=
X-Received: by 2002:a05:6402:1590:: with SMTP id
 c16mr3362861edv.7.1622792407812; 
 Fri, 04 Jun 2021 00:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZWu7l3Qdb+cHhSLxBwnQx8qFbafqG11JHkLvIFyn/t4Laiss9jPiKNik2I53zTNPQeRmqyw==
X-Received: by 2002:a05:6402:1590:: with SMTP id
 c16mr3362837edv.7.1622792407522; 
 Fri, 04 Jun 2021 00:40:07 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id cz14sm2785392edb.84.2021.06.04.00.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 00:40:06 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v7 9/9] qtest/hyperv: Introduce a simple hyper-v test
In-Reply-To: <20210603231746.sirz53n3lxigj4vi@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-10-vkuznets@redhat.com>
 <20210603231746.sirz53n3lxigj4vi@habkost.net>
Date: Fri, 04 Jun 2021 09:40:05 +0200
Message-ID: <87y2bqyt62.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Jun 03, 2021 at 01:48:35PM +0200, Vitaly Kuznetsov wrote:
>> For the beginning, just test 'hv-passthrough' and a couple of custom
>> Hyper-V  enlightenments configurations through QMP. Later, it would
>> be great to complement this by checking CPUID values from within the
>> guest.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  MAINTAINERS               |   1 +
>>  tests/qtest/hyperv-test.c | 225 ++++++++++++++++++++++++++++++++++++++
>>  tests/qtest/meson.build   |   3 +-
>>  3 files changed, 228 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/qtest/hyperv-test.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5f55404f2fae..862720016b3a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1537,6 +1537,7 @@ F: hw/isa/apm.c
>>  F: include/hw/isa/apm.h
>>  F: tests/unit/test-x86-cpuid.c
>>  F: tests/qtest/test-x86-cpuid-compat.c
>> +F: tests/qtest/hyperv-test.c
>
> Maybe it makes sense to keep it here by now, but I believe we
> should eventually create a section for hyperv in MAINTAINERS.
>

If we are to create such a section, I'd like to volunteer myself as a
reviewer so I at least get Cced on the stuff.

> CCing Michael and Marcel, who are the people listed in this
> MAINTAINERS section.
>
>
>>  
>>  PC Chipset
>>  M: Michael S. Tsirkin <mst@redhat.com>
> [...]
>> +int main(int argc, char **argv)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
>
> Is this necessary when the test is already being added to
> qtests_i386/qtests_x86_64 only?
>

Bad copy-paste source I guess, the check is superfluous indeed.

>> +        qtest_add_data_func("/hyperv/hv-all-but-evmcs",
>> +                            NULL, test_query_cpu_hv_all_but_evmcs);
>> +        qtest_add_data_func("/hyperv/hv-custom",
>> +                            NULL, test_query_cpu_hv_custom);
>> +        if (kvm_has_sys_hyperv_cpuid()) {
>> +            qtest_add_data_func("/hyperv/hv-passthrough",
>> +                                NULL, test_query_cpu_hv_passthrough);
>> +       }
>> +    }
>> +
>> +    return g_test_run();
>> +}
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c3a223a83d6a..958a88d0c8b4 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -83,7 +83,8 @@ qtests_i386 = \
>>     'vmgenid-test',
>>     'migration-test',
>>     'test-x86-cpuid-compat',
>> -   'numa-test']
>> +   'numa-test',
>> +   'hyperv-test']
>>  
>>  dbus_daemon = find_program('dbus-daemon', required: false)
>>  if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
>> -- 
>> 2.31.1
>> 

-- 
Vitaly


