Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537666F1774
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:17:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psN21-0000Zh-Io; Fri, 28 Apr 2023 08:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psN1v-0000ZH-UM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psN1t-0004lH-Lo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682684208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hP9CvCKBji8TpSnqIP+pGsRFcTanm9rrLx3NAYRFoU0=;
 b=W3Od9gCX2+v8XqGBIsJlzdn/zZ/afNIkMFSmNCdOT5G38H4AbySKWMCh1jM4g4o3heIgVs
 jQ90cEs52phWB+Aa+aU24CEu+b1s+T1YtMUc0EjtA4xMPJIhCTAjCpNZRDQjgtOZAOI//n
 sMkSx3VEb9fx0RmJkegsdRzzYVtVX3Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-c6NzMQsaPJSJBdC1ZFmdNQ-1; Fri, 28 Apr 2023 08:16:46 -0400
X-MC-Unique: c6NzMQsaPJSJBdC1ZFmdNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30467a7020eso4866468f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684205; x=1685276205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hP9CvCKBji8TpSnqIP+pGsRFcTanm9rrLx3NAYRFoU0=;
 b=jtSRVqoeB6h7T1ZUMUmdkyvjM/kLfVlmpNn1jxMjPzYPWZ5BO4f7T8yAg+c010DLNF
 SRdRY+eLYuLY0FqlIYXOQRRGXEtN2GtW0VA8h0HLNyA+3mkueT96Axq20d+jIydux/dm
 2IqbQPnY2N9pMGF3MLbeDO2wPucTspy9A1pfF28U1mPVPj40PRgwNJcLRbCELsF8rYeC
 v4uQKGA58KPkW6rMNo+cwWXqfD/fNkHQ2g3qQWbd0KLcBZhUJ0Ab0eP18J3glgKGuAle
 EuQk+l2Fp0jNGu9CN2pQpi8e5Q/zGyeVIPV+SRNXAWxOZ52HhujdCRnHZGOH4cfnBjk9
 Bkqw==
X-Gm-Message-State: AC+VfDwStL7FLxsMuGv7bqDWDsy/xwscEMFfKE3/IXOlFL301dLd6EB7
 fBAuMnLJp4OIhRvrPoNuZuvPaNppuo6+Bn4Y7yRlJ9cp1AkeuZpwg+rCZ2z5788tlq4fa5ZvXn0
 lF0WdKb5p2cmX8Q0=
X-Received: by 2002:adf:ed42:0:b0:2d8:708a:d84 with SMTP id
 u2-20020adfed42000000b002d8708a0d84mr3722388wro.19.1682684205340; 
 Fri, 28 Apr 2023 05:16:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lsk8Jxo7T9a7FNt87NxqU47T4FR/o6lQ6XQlGap5FkqFzgYlVjJx3dC9tJOSWUHqZg8+VZw==
X-Received: by 2002:adf:ed42:0:b0:2d8:708a:d84 with SMTP id
 u2-20020adfed42000000b002d8708a0d84mr3722366wro.19.1682684205001; 
 Fri, 28 Apr 2023 05:16:45 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b002e45f6ffe63sm21064681wrx.26.2023.04.28.05.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:16:44 -0700 (PDT)
Message-ID: <e3d52859-7613-0a1d-aa15-36e1f92ff8d6@redhat.com>
Date: Fri, 28 Apr 2023 14:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 nsg@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
References: <20230428111224.37140-1-imbrenda@linux.ibm.com>
 <20230428111224.37140-2-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230428111224.37140-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/04/2023 13.12, Claudio Imbrenda wrote:
> Add new -run-with option with an async-teardown=on|off parameter. It is
> visible in the output of query-command-line-options QMP command, so it
> can be discovered and used by libvirt.
> 
> The option -async-teardown is now redundant, deprecate it.
> 
> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   docs/about/deprecated.rst |  5 +++++
>   os-posix.c                | 15 +++++++++++++++
>   qemu-options.hx           | 34 +++++++++++++++++++++++-----------
>   util/async-teardown.c     | 21 +++++++++++++++++++++
>   4 files changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 1ca9dc33d6..0986db9a86 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -111,6 +111,11 @@ Use ``-machine acpi=off`` instead.
>   The HAXM project has been retired (see https://github.com/intel/haxm#status).
>   Use "whpx" (on Windows) or "hvf" (on macOS) instead.
>   
> +``-async-teardown`` (since 8.1)
> +,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
> +
> +Use ``-run-with async-teardown=on`` instead.
> +
>   
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
> diff --git a/os-posix.c b/os-posix.c
> index 5adc69f560..117ad2bdc1 100644
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

Fails to compile on FreeBSD:

../src/os-posix.c:137:15: error: unused variable 'opts' 
[-Werror,-Wunused-variable]
     QemuOpts *opts;
               ^
1 error generated.

Apart from that, the patch looks fine to me.

  Thomas


