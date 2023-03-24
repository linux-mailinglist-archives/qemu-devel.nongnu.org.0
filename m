Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3796E6C83FE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfleK-0002d2-2Z; Fri, 24 Mar 2023 13:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfleH-0002cR-Qg
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfleD-0003qJ-F9
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679680575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xykc5x3FHcWEsD9PtK1+RFDJ21m1W/R6Wr4E7TS7zEo=;
 b=X0RwhkyrBIfoUlmCH1guyXPqRx0bLcn8POfIXCq7xmh7LP9tevljz13una5BhthwLEHxES
 2HpM66pwsUiCCsoBRoF7eUVdbMcmucGsvAvjEwywX+AiLWsfv3QVrK2nbAmeJ1GN8fdm9G
 gI3LYZVibxqrCqKQXhRsAB6+px13TaY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-OnkEs1UbPU6jwGviRxtodg-1; Fri, 24 Mar 2023 13:56:12 -0400
X-MC-Unique: OnkEs1UbPU6jwGviRxtodg-1
Received: by mail-qk1-f197.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso1141660qkn.21
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679680572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xykc5x3FHcWEsD9PtK1+RFDJ21m1W/R6Wr4E7TS7zEo=;
 b=JXfkOiOLgr4NnoDZxPmSp9GQxx/LS3G6YdwTGJswEkSmJippDO+rOyTdKfZy4RqgXU
 QslEdwBYW3NaWVOCkY2tUS9fB4pf9JOdQXxruWzPZ1mnaCOsbXM9BqojXv3EgDGE/OYn
 OImE0tVVfKns/G83APjkb8zDbH+eWxB00i7ixcR5VlkC8GAX/4ozV3EWLAw2EjSdur/H
 M97wcP5V91g0AcyGvoJhuaz4hVa0nfz5N5vLv1cBp8ONF0YQJ+onbi8+cCxlgbTxroVm
 8djKRU93kiD40+J2nMLLHQz2zECN29fVOwtCvXgfjNW4BUveGjq/LlNxtBP/6yE6RrRy
 enhA==
X-Gm-Message-State: AAQBX9cBNJ9g/Ts+TK6PSpbNdOPRgNeKRS0XUjoXJm68BtFvSuAZtCk9
 hKeG7+3KdwgZUAB7K7GM9pRJfdX3p97iKSMJkUxj53eBLalOH73K4Yb7t0pn6252B8XFuj8t4xp
 qgvGYMfgg2vlCKzw=
X-Received: by 2002:a05:6214:20e7:b0:56e:a96b:a3a1 with SMTP id
 7-20020a05621420e700b0056ea96ba3a1mr5821506qvk.7.1679680572245; 
 Fri, 24 Mar 2023 10:56:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLdg3bHcJ35PDWedWhjy+3yAzF2nGYuGFIBnHwHH0JGUvsTd8Mcd/j7gTmJYfsLE5koGSH+A==
X-Received: by 2002:a05:6214:20e7:b0:56e:a96b:a3a1 with SMTP id
 7-20020a05621420e700b0056ea96ba3a1mr5821479qvk.7.1679680571993; 
 Fri, 24 Mar 2023 10:56:11 -0700 (PDT)
Received: from [192.168.8.106] (tmo-097-234.customers.d1-online.com.
 [80.187.97.234]) by smtp.gmail.com with ESMTPSA id
 c18-20020a0cd612000000b005dd8b9345f0sm850279qvj.136.2023.03.24.10.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:56:11 -0700 (PDT)
Message-ID: <b66a0c91-6041-7125-6291-0aa87510dda2@redhat.com>
Date: Fri, 24 Mar 2023 18:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 nsg@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
References: <20230324174559.44933-1-imbrenda@linux.ibm.com>
 <20230324174559.44933-2-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230324174559.44933-2-imbrenda@linux.ibm.com>
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

On 24/03/2023 18.45, Claudio Imbrenda wrote:
> The recently introduced -async-teardown commandline option was not
> wired up properly and did not show up in the output of the QMP command
> query-command-line-options. This means that libvirt will have no way to
> discover whether the feature is supported.
> 
> This patch fixes the issue by correctly wiring up the commandline
> option so that it appears in the output of query-command-line-options.
> 
> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   os-posix.c            | 14 ++++++++++++++
>   qemu-options.hx       | 35 ++++++++++++++++++++++++-----------
>   util/async-teardown.c | 21 +++++++++++++++++++++
>   3 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/os-posix.c b/os-posix.c
> index 5adc69f560..48acd7acf5 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -36,6 +36,8 @@
>   #include "qemu/log.h"
>   #include "sysemu/runstate.h"
>   #include "qemu/cutils.h"
> +#include "qemu/config-file.h"
> +#include "qemu/option.h"
>   
>   #ifdef CONFIG_LINUX
>   #include <sys/prctl.h>
> @@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
>    */
>   int os_parse_cmd_args(int index, const char *optarg)
>   {
> +    QemuOpts *opts;
> +
>       switch (index) {
>       case QEMU_OPTION_runas:
>           user_pwd = getpwnam(optarg);
> @@ -155,6 +159,16 @@ int os_parse_cmd_args(int index, const char *optarg)
>       case QEMU_OPTION_asyncteardown:
>           init_async_teardown();
>           break;
> +    case QEMU_OPTION_teardown:
> +        opts = qemu_opts_parse_noisily(qemu_find_opts("teardown"),
> +                                       optarg, false);
> +        if (!opts) {
> +            return -1;
> +        }
> +        if (qemu_opt_get_bool(opts, "async", false)) {
> +            init_async_teardown();
> +        }
> +        break;
>   #endif
>       default:
>           return -1;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d42f60fb91..8582980b12 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4766,20 +4766,33 @@ DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>   DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
>       "-async-teardown enable asynchronous teardown\n",
>       QEMU_ARCH_ALL)
> -#endif
>   SRST
>   ``-async-teardown``
> -    Enable asynchronous teardown. A new process called "cleanup/<QEMU_PID>"
> -    will be created at startup sharing the address space with the main qemu
> -    process, using clone. It will wait for the main qemu process to
> -    terminate completely, and then exit.
> -    This allows qemu to terminate very quickly even if the guest was
> -    huge, leaving the teardown of the address space to the cleanup
> -    process. Since the cleanup process shares the same cgroups as the
> -    main qemu process, accounting is performed correctly. This only
> -    works if the cleanup process is not forcefully killed with SIGKILL
> -    before the main qemu process has terminated completely.
> +    Equivalent to -teardown async=on

We should avoid of providing multiple ways of doing the same thing to the 
users if there is no real benefit. So I'd vote for either removing the 
"-async-teardown" option here directly (since it just has been introduced in 
7.2 and there are no known users out there yet), or at least deprecate it 
(put an entry in docs/about/deprecated.rst), so we can remove it again in 
two releases.

  Thomas


