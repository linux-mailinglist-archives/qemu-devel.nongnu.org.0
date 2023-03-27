Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBE6C9BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:08:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pggwK-0007rG-4z; Mon, 27 Mar 2023 03:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pggwH-0007r2-Cg
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:06:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pggwE-0007CQ-Mr
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679900800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wFJE34SBVBkoaj1jCe32Okaf9tnAw6R2tJjtZyYeEc=;
 b=BKRK4Y82yzAdivvs4NiSvlE2aPaYsdoLnyZ9Vlk4qdmTAzcP+nZSCmnKf8i4+hmP5Yilqc
 P+H0KNdEnj5SCLLL5E0tHvAvsMemjKXl+kx9SBFU3VOOlTvzjivDJ67+h9A5LolwGCuaPf
 pOTzhrLHtBY8H8iwJCEPd/0Sjy8T4SQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Qoj3ni4wMrWFDsni3gr8Gg-1; Mon, 27 Mar 2023 03:06:38 -0400
X-MC-Unique: Qoj3ni4wMrWFDsni3gr8Gg-1
Received: by mail-qv1-f71.google.com with SMTP id
 dl18-20020ad44e12000000b005a4d5420bc6so3151531qvb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679900798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+wFJE34SBVBkoaj1jCe32Okaf9tnAw6R2tJjtZyYeEc=;
 b=ZVDasJkkFbboIilP+gBU4zJFROLZsLrfv6/6+VneiUqhE8LT6nCongg9lfcrQ500Kp
 WRa4rDWe9XBE9P9YDGBL+qlNbeZxrJ+5EDP3bv9DGeyBoi86746fO1Zh9si7VGC7MX5y
 3TRVpQSwx4vxEbsYOZInFy1iewiu5X3KPXW+jkvcKEIrX78ygEca7URRO1Fcpn0SjjKO
 t+F0+gH+InC3U5cTz6/tgmqSaAcL7AijiJGUZXdPJ1E0ps0xQ0Hw/04K0oETDDXhtyER
 u2q/aS66RMDmN008460umrPR75buJDTUVfuNY6v7aykGmRcqUC0RLjAyJFWx/V3fYjJQ
 3Fiw==
X-Gm-Message-State: AO0yUKWTflNWzU2a7iBHVCYU+CtenLGO3e40u2RR2Aligq2cFaBoxgy/
 /7ig1R+lub1gLNPv90M+PQLGnG/65N92dAFTXSQmrdm3RCZXHqzBYP+gwhMXNbs+CruxmDmeqY4
 3XUIT9E8i9OLEJ8E=
X-Received: by 2002:ac8:5702:0:b0:3e0:8c58:1dd with SMTP id
 2-20020ac85702000000b003e08c5801ddmr19763008qtw.55.1679900797755; 
 Mon, 27 Mar 2023 00:06:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set87pvaMXUjYVBwWzcY4VlXEZiZDQTb1vsHT58ghKA82OS+mPvZFImbcwhNZcaOsPajsyBQDbQ==
X-Received: by 2002:ac8:5702:0:b0:3e0:8c58:1dd with SMTP id
 2-20020ac85702000000b003e08c5801ddmr19762987qtw.55.1679900797494; 
 Mon, 27 Mar 2023 00:06:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-5.web.vodafone.de. [109.43.177.5])
 by smtp.gmail.com with ESMTPSA id
 141-20020a370793000000b0074672975d5csm12267505qkh.91.2023.03.27.00.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:06:36 -0700 (PDT)
Message-ID: <ead2773c-2de0-3ca0-8500-e473ac3a99a6@redhat.com>
Date: Mon, 27 Mar 2023 09:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
References: <20230324174559.44933-1-imbrenda@linux.ibm.com>
 <20230324174559.44933-2-imbrenda@linux.ibm.com>
 <b66a0c91-6041-7125-6291-0aa87510dda2@redhat.com>
 <20230324201029.2864d04e@p-imbrenda>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230324201029.2864d04e@p-imbrenda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/03/2023 20.10, Claudio Imbrenda wrote:
> On Fri, 24 Mar 2023 18:56:06 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 24/03/2023 18.45, Claudio Imbrenda wrote:
>>> The recently introduced -async-teardown commandline option was not
>>> wired up properly and did not show up in the output of the QMP command
>>> query-command-line-options. This means that libvirt will have no way to
>>> discover whether the feature is supported.
>>>
>>> This patch fixes the issue by correctly wiring up the commandline
>>> option so that it appears in the output of query-command-line-options.
>>>
>>> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
>>> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
>>> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
>>> ---
>>>    os-posix.c            | 14 ++++++++++++++
>>>    qemu-options.hx       | 35 ++++++++++++++++++++++++-----------
>>>    util/async-teardown.c | 21 +++++++++++++++++++++
>>>    3 files changed, 59 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/os-posix.c b/os-posix.c
>>> index 5adc69f560..48acd7acf5 100644
>>> --- a/os-posix.c
>>> +++ b/os-posix.c
>>> @@ -36,6 +36,8 @@
>>>    #include "qemu/log.h"
>>>    #include "sysemu/runstate.h"
>>>    #include "qemu/cutils.h"
>>> +#include "qemu/config-file.h"
>>> +#include "qemu/option.h"
>>>    
>>>    #ifdef CONFIG_LINUX
>>>    #include <sys/prctl.h>
>>> @@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
>>>     */
>>>    int os_parse_cmd_args(int index, const char *optarg)
>>>    {
>>> +    QemuOpts *opts;
>>> +
>>>        switch (index) {
>>>        case QEMU_OPTION_runas:
>>>            user_pwd = getpwnam(optarg);
>>> @@ -155,6 +159,16 @@ int os_parse_cmd_args(int index, const char *optarg)
>>>        case QEMU_OPTION_asyncteardown:
>>>            init_async_teardown();
>>>            break;
>>> +    case QEMU_OPTION_teardown:
>>> +        opts = qemu_opts_parse_noisily(qemu_find_opts("teardown"),
>>> +                                       optarg, false);
>>> +        if (!opts) {
>>> +            return -1;
>>> +        }
>>> +        if (qemu_opt_get_bool(opts, "async", false)) {
>>> +            init_async_teardown();
>>> +        }
>>> +        break;
>>>    #endif
>>>        default:
>>>            return -1;
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index d42f60fb91..8582980b12 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -4766,20 +4766,33 @@ DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>>>    DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
>>>        "-async-teardown enable asynchronous teardown\n",
>>>        QEMU_ARCH_ALL)
>>> -#endif
>>>    SRST
>>>    ``-async-teardown``
>>> -    Enable asynchronous teardown. A new process called "cleanup/<QEMU_PID>"
>>> -    will be created at startup sharing the address space with the main qemu
>>> -    process, using clone. It will wait for the main qemu process to
>>> -    terminate completely, and then exit.
>>> -    This allows qemu to terminate very quickly even if the guest was
>>> -    huge, leaving the teardown of the address space to the cleanup
>>> -    process. Since the cleanup process shares the same cgroups as the
>>> -    main qemu process, accounting is performed correctly. This only
>>> -    works if the cleanup process is not forcefully killed with SIGKILL
>>> -    before the main qemu process has terminated completely.
>>> +    Equivalent to -teardown async=on
>>
>> We should avoid of providing multiple ways of doing the same thing to the
>> users if there is no real benefit. So I'd vote for either removing the
>> "-async-teardown" option here directly (since it just has been introduced in
>> 7.2 and there are no known users out there yet), or at least deprecate it
>> (put an entry in docs/about/deprecated.rst), so we can remove it again in
> 
> both are fine for me (although I have a slight preference for removing
> it altogether)

If nobody objects, i.e. if we feel certain that nobody is really using the 
old option yet, I'd also prefer if we'd remove it immediately.

  Thomas



