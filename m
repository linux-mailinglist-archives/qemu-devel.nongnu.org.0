Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE76C0C9D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 09:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBJR-00055R-F6; Mon, 20 Mar 2023 04:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peBJN-0004xt-SE
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peBJL-0004xA-Tj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679302570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEKn7KLglMFWdc2NmuFhRszMOL181Ip5Sxmfub7GcNI=;
 b=IgTB6SItbRb8yWfQE5Rs3WwglEB2kRJJby/OPOEDxgk06eWkcOeArBwjYXxIoenn5sJX/w
 R2wTfux7F4NCEjYoZdiAkiOVlDfjgBWsuaaguMbtpowyxZ5amtfi/vCj8sR29DbCPVKUMX
 xVKiFoB1Tl3nsGWLu8i+RZC4ZrGQ63Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-7ymT7XU0MtOVlK0ii9lGxg-1; Mon, 20 Mar 2023 04:56:08 -0400
X-MC-Unique: 7ymT7XU0MtOVlK0ii9lGxg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi5-20020a05600c3d8500b003edda1368d7so955696wmb.8
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 01:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679302567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xEKn7KLglMFWdc2NmuFhRszMOL181Ip5Sxmfub7GcNI=;
 b=Sm/C0qtZToDIKe8oIlOdlyX0uBcN1PpO0vGMPq7W08bYJCQAh0Si9lp5C+orvRvnCs
 2p3FK4SxvZtLyYxNvANEQgvBfDN0lvHEfn5Zw6BgQW21X/R20dhXh4SGXWIoLz1opxU0
 fNDIYovokKwMv08VrKp5yhpVB3t8s4n+X8LBlRU1NFWkXxJ5vfKeYrPvS/H8y/hmVuGx
 FMF9GkLP5z7cDJS2zV4va8hhz+T1mRsvsaUHh6Jgh6KNwxUOayIZDp+z/70I3RxtPtoJ
 mk7l9JUqu10tOLJTP4PwL1FAUq+/HaiaDXMeJSa2+SJfTl6mDBhB9xYU86Y0fU9Tdeyo
 Zq9A==
X-Gm-Message-State: AO0yUKUrN/tD+PTNdHt+q9jSMgnPjBuJTUtz1+OFEpthMQlRCcxFQh5/
 AhvaPz0yEg4e316gMqr21LqprZpNhBqEemIMjVoAlvSX959ZuV8WNPQv5q8lIRAH/i3ppoXqjAG
 qdrk8+GidGWBGok4=
X-Received: by 2002:a05:600c:458f:b0:3ea:f873:13aa with SMTP id
 r15-20020a05600c458f00b003eaf87313aamr33721678wmo.40.1679302567523; 
 Mon, 20 Mar 2023 01:56:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ELjreVWQqT1i7YMh/oO/nLSM1g7ps74rY7C/QPKYWDMF0I+fCZpjYJ50jOSOnC/tIQO/SqA==
X-Received: by 2002:a05:600c:458f:b0:3ea:f873:13aa with SMTP id
 r15-20020a05600c458f00b003eaf87313aamr33721665wmo.40.1679302567244; 
 Mon, 20 Mar 2023 01:56:07 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm16348370wmo.28.2023.03.20.01.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 01:56:06 -0700 (PDT)
Message-ID: <5a8a18e1-f4ad-59dd-a2a9-e68684182b6a@redhat.com>
Date: Mon, 20 Mar 2023 09:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 berrange@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
References: <20230320074855.11130-1-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320074855.11130-1-imbrenda@linux.ibm.com>
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

On 20/03/2023 08.48, Claudio Imbrenda wrote:
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
>   util/async-teardown.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/util/async-teardown.c b/util/async-teardown.c
> index 62cdeb0f20..9a2e7bc146 100644
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
> @@ -144,3 +147,18 @@ void init_async_teardown(void)
>       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
>       sigprocmask(SIG_SETMASK, &old_signals, NULL);
>   }
> +
> +static QemuOptsList qemu_async_teardown_opts = {
> +    .name = "async-teardown",
> +    .implied_opt_name = "enable",

Are you sure about the "implied_opt_name" field? If I got that right, it's 
used for options where you can omit the part before the "=" in the first 
paramter, e.g.

  -netdev user

is the same as:

  -netdev type=user

... but as far as I can see, there is no way to use

  -async-teardown enable=off

at the command line?

  Thomas


> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
> +    .desc = {
> +        { /* end of list */ }
> +    },
> +};
> +
> +static void register_async_teardown(void)
> +{
> +    qemu_add_opts(&qemu_async_teardown_opts);
> +}
> +opts_init(register_async_teardown);


