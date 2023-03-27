Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26466C9BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:22:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgh9y-0002Gw-3F; Mon, 27 Mar 2023 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pgh9v-0002GT-Hd
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pgh9s-0000Ul-0s
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679901646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/wBbnxfVjSGfiwYbQPRzmr68IqO9olg8wauwvn0A08=;
 b=PrdUnyN+JIcWnSZSTHUrWzhRao3zZZZT7SLztAU58CzDqoPvNSac6xQQ0nugRv0xugU6vw
 WhfmEUntpmxh/pzjcBCTlsgfrVV28f08NpFwqbR+WMvEAtMuaoacpHUSFGCrw2SfCVK9Mf
 laJn8mCBqe4w0Rk0NIR8Zk+PB1cEoMU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-2G5fLzm4PgWrDnIAGVeaiQ-1; Mon, 27 Mar 2023 03:20:44 -0400
X-MC-Unique: 2G5fLzm4PgWrDnIAGVeaiQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 q143-20020a374395000000b0074690a17414so3595830qka.7
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 00:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679901644;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M/wBbnxfVjSGfiwYbQPRzmr68IqO9olg8wauwvn0A08=;
 b=F/E5wNCY96e500u+uT9LnyhW1dCTAZusEy9PuNXmm9xdAaRC9bfYmV39OUDFszLr91
 wajAR4aT1rhot27WPa9meOExxvsJdLa0p+Zg5O12LjqclPOM2vsqnu+C2TIG49bsTb3g
 sBTAGXuaYCSFMYFSNDP9mHVIHGqqkVRJi9hGCWW5qghwPdSPheZadImMbuSsjsh6Nm81
 JoYOW5OosR31DWyMs4H3zcShKtPNfsqNvhV1xZhluUCjpYbem+yyvEu8SoQDeB0vJTXm
 ax9yGLZBduEDD//P789bQzuN52QD2qwqJrExhBNX1KzCdK9cdYHqkD30I28ByxvhDVjx
 tNdA==
X-Gm-Message-State: AO0yUKX2DxpJ0mmM15cqmpdBx4pAr4uXL0vQHKqYmC4KBh5lgFttzWPy
 EZqblx4kTq87ejnpjjDiiRZa+9iNMW8fFOOY66XmzLiyGPrNYD1wF+BWxY28sFODvRBxaO99ZJS
 VK9xV7tkwahnCSIg=
X-Received: by 2002:a05:6214:20a6:b0:5c2:7de9:ec97 with SMTP id
 6-20020a05621420a600b005c27de9ec97mr27556841qvd.13.1679901644317; 
 Mon, 27 Mar 2023 00:20:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set/WHXPVJtOyRtAZDibDr4lcYQ3CEX1HZ7jw5J7DuSBF5CswE2bNsC84OwXfUhFGaCEg5/YrQQ==
X-Received: by 2002:a05:6214:20a6:b0:5c2:7de9:ec97 with SMTP id
 6-20020a05621420a600b005c27de9ec97mr27556828qvd.13.1679901644023; 
 Mon, 27 Mar 2023 00:20:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-5.web.vodafone.de. [109.43.177.5])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a0cefd2000000b005dd8b93456esm2747853qvt.6.2023.03.27.00.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:20:43 -0700 (PDT)
Message-ID: <7dcafe17-987f-4d6f-387d-d5994720d2f4@redhat.com>
Date: Mon, 27 Mar 2023 09:20:40 +0200
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Maybe it's better to use exit(1) here (like it is done in the -runas part), 
otherwise you get a somewhat weird second error message:

$ ./qemu-system-s390x -teardown aysnc=on
qemu-system-s390x: -teardown aysnc=on: Invalid parameter 'aysnc'
qemu-system-s390x: -teardown aysnc=on: Option not supported in this build

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
> +ERST
> +
> +DEF("teardown", HAS_ARG, QEMU_OPTION_teardown,
> +    "-teardown async[=on|off]\n"
> +    "                process teardown options\n"
> +    "                async=on enables asynchronous teardown\n"
> +   ,
> +    QEMU_ARCH_ALL)
> +SRST
> +``-teardown``
> +    Set process teardown options.
> +
> +    ``async=on`` enables asynchronous teardown.  A new process called
> +    "cleanup/<QEMU_PID>" will be created at startup sharing the address
> +    space with the main qemu process, using clone.  It will wait for the

While you're at it, we officially spell QEMU with capital letters, so I'd 
maybe do a s/qemu/QEMU/g here.

> +    main qemu process to terminate completely, and then exit.  This allows
> +    qemu to terminate very quickly even if the guest was huge, leaving the
> +    teardown of the address space to the cleanup process.  Since the cleanup
> +    process shares the same cgroups as the main qemu process, accounting is
> +    performed correctly.  This only works if the cleanup process is not
> +    forcefully killed with SIGKILL before the main qemu process has
> +    terminated completely.
>   ERST
> +#endif
>   
>   DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>       "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
> diff --git a/util/async-teardown.c b/util/async-teardown.c
> index 62cdeb0f20..4a5dbce958 100644
> --- a/util/async-teardown.c
> +++ b/util/async-teardown.c
> @@ -12,6 +12,9 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/config-file.h"
> +#include "qemu/option.h"
> +#include "qemu/module.h"
>   #include <dirent.h>
>   #include <sys/prctl.h>
>   #include <sched.h>
> @@ -144,3 +147,21 @@ void init_async_teardown(void)
>       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
>       sigprocmask(SIG_SETMASK, &old_signals, NULL);
>   }
> +
> +static QemuOptsList qemu_teardown_opts = {
> +    .name = "teardown",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_teardown_opts.head),
> +    .desc = {
> +        {
> +            .name = "async",
> +            .type = QEMU_OPT_BOOL,
> +        },
> +        { /* end of list */ }
> +    },
> +};
> +
> +static void register_teardown(void)
> +{
> +    qemu_add_opts(&qemu_teardown_opts);
> +}
> +opts_init(register_teardown);

  Thomas


