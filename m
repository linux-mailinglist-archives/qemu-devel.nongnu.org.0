Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517C70260D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:28:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySd2-0008VV-Md; Mon, 15 May 2023 03:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyScu-0008V2-Jt
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyScp-0003or-KK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684135682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5x8G+nGX7XKAgCviN9B/Gho8UJKXqt4cqLgsdwb/Ok=;
 b=B1V7dG7IoQ+GMPupyD70flsrmRwPmVvVgOQOJAaRaVDIDuoOd8WXf/m3S91VBIpnxZ3LPf
 sY8KPLOV9OUUG1EpY97AWq3Sc8prm/VDensF/5cEVxG8dixKfulWyGjD3h7blpWqaeLKAz
 sc2J0hHihAmK1AQ9PKNyacy5kIt0UxE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-9IUEngJ5P7WKsKomXuThjg-1; Mon, 15 May 2023 03:28:00 -0400
X-MC-Unique: 9IUEngJ5P7WKsKomXuThjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f4221cd284so30448245e9.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 00:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684135679; x=1686727679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5x8G+nGX7XKAgCviN9B/Gho8UJKXqt4cqLgsdwb/Ok=;
 b=P7LSYMC4DV/ABauKgj8CCwZJAtdmeFlh+EjWidMzkqGzH1VcQLnvPnr4EovqO3yAHe
 cxJDJQGbH+YNZzNMy3UHe35Ve2CeMvmFT4W9Kjxs+P5qNeNvczp7UIysV8TekxoSZ7QQ
 vvL8Qlp+FS1ydtu6Vh25xvlQ5WrnAuVvyCiBk5bgLms9LhdJrVdpGhwUxKSOVlqYnboy
 Aw/E6d7GER47snAK66jR6JdGECvOJ3ltocOpxHhrhMkg4Czrs4t8h7uFS3JkTBYQ9HAk
 w3kX0pKf4YpNPMv+eYzgooq9jcFmVrXK184JKPcfzjdRUek3pjy6IMwcrZfuzCXD2PB3
 dMEw==
X-Gm-Message-State: AC+VfDyLI0ktdtu+AMNcjb+4hzFUdV1NdSawpcOgUEvUNP1T5e9dEnoL
 xKjbBKk5lork4J7Xa5vD/kDFi0aKY5wgZNP8VTHPbKQPdmgY9szG7SDCtVu3ykg8CfCkVZ1y9BC
 GpnHUdc7GH30djNU=
X-Received: by 2002:a7b:c3d9:0:b0:3f4:2d31:11b2 with SMTP id
 t25-20020a7bc3d9000000b003f42d3111b2mr14373720wmj.13.1684135679346; 
 Mon, 15 May 2023 00:27:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oD2cIH7JOMDoWqCMXV2zFsNpEGt8gyvKQGuO9HOqqrwXGcb97FN4KzNizuP8lwULkO7TtLg==
X-Received: by 2002:a7b:c3d9:0:b0:3f4:2d31:11b2 with SMTP id
 t25-20020a7bc3d9000000b003f42d3111b2mr14373697wmj.13.1684135679017; 
 Mon, 15 May 2023 00:27:59 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-139.web.vodafone.de.
 [109.43.176.139]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003f42ceb3bf4sm17493278wme.32.2023.05.15.00.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:27:58 -0700 (PDT)
Message-ID: <158a4dd5-80df-b235-fcdc-5ba4433f2c89@redhat.com>
Date: Mon, 15 May 2023 09:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 1/1] util/async-teardown: wire up
 query-command-line-options
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 nsg@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
References: <20230505120051.36605-1-imbrenda@linux.ibm.com>
 <20230505120051.36605-2-imbrenda@linux.ibm.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230505120051.36605-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 05/05/2023 14.00, Claudio Imbrenda wrote:
> Add new -run-with option with an async-teardown=on|off parameter. It is
> visible in the output of query-command-line-options QMP command, so it
> can be discovered and used by libvirt.
> 
> The option -async-teardown is now redundant, deprecate it.
...
> diff --git a/os-posix.c b/os-posix.c
> index 5adc69f560..ef910aaf94 100644
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
> @@ -152,9 +154,20 @@ int os_parse_cmd_args(int index, const char *optarg)
>           daemonize = 1;
>           break;
>   #if defined(CONFIG_LINUX)
> +    /* deprecated */
>       case QEMU_OPTION_asyncteardown:
>           init_async_teardown();
>           break;
> +    case QEMU_OPTION_run_with:
> +        QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
> +                                                 optarg, false);
> +        if (!opts) {
> +            exit(1);
> +        }
> +        if (qemu_opt_get_bool(opts, "async-teardown", false)) {
> +            init_async_teardown();
> +        }
> +        break;
>   #endif

This is causing now a compiler error with GCC 8.5 here:

../../devel/qemu/os-posix.c: In function ‘os_parse_cmd_args’:
../../devel/qemu/os-posix.c:162:9: error: a label can only be part
  of a statement and a declaration is not a statement
          QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
          ^~~~~~~~

I'll fix it up by adding some curly braces on top, no need to resend:

diff --git a/os-posix.c b/os-posix.c
--- a/os-posix.c
+++ b/os-posix.c
@@ -158,7 +158,7 @@ int os_parse_cmd_args(int index, const char *optarg)
      case QEMU_OPTION_asyncteardown:
          init_async_teardown();
          break;
-    case QEMU_OPTION_run_with:
+    case QEMU_OPTION_run_with: {
          QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
                                                   optarg, false);
          if (!opts) {
@@ -168,6 +168,7 @@ int os_parse_cmd_args(int index, const char *optarg)
              init_async_teardown();
          }
          break;
+    }
  #endif
      default:
          return -1;

Thomas


