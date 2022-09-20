Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3B5BE295
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:01:21 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaa48-0005xa-GQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaZRK-0001G4-MM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaZR4-0000bj-ET
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663665657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0A1Fbf6omgug2sG9LDxjI+g5Kloni4am99uZHmShoZ4=;
 b=YPEgB+u50Ovf0wuMtQdcxHoPtNoR2vT1Lz0qGDPbSKaKQ+XUlHFFF4etXcTLvj48N+UE3g
 SnirhzzyjU4L7kGNppAukmDiKKEvBDnOGxr7sqgC1Gusk9BBZgAwb29LgVQ0BiqPLtQ6aK
 NMXMWEPv1l4IWpEAq4zCtPjQcuNwO0I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-0qIiTtGeM0SrVtjp9VtpPw-1; Tue, 20 Sep 2022 05:20:56 -0400
X-MC-Unique: 0qIiTtGeM0SrVtjp9VtpPw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g19-20020adfa493000000b0022a2ee64216so904345wrb.14
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 02:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0A1Fbf6omgug2sG9LDxjI+g5Kloni4am99uZHmShoZ4=;
 b=NiOscayRCCTlCVWAmFQFmaO1URpUUwaXQdzLw7Ltln/ieD6ntvXPIu/6SqXmSbjG4b
 4ilj6DwAuO8tdFYpI+l0XeJ2nylwUJ8kb3xZEOS376V5EGt+bgsiu0sgsVSiXmoEp4+k
 hzk/IQSl6CkdcNfT6yxSSO9a9uKX6Y83Xwc4En4LeS5PB05hk4vbhMA6IaWjE813ZNup
 R7eQYbNzVDKb0R0DaqPEpRnEjPUmnmz09nl1xvqwFJkUnr11AXDZiFcIuDWjF5XmybuX
 pH8oKZj8Ru8hSOC67pyY+h8rc+eJ7wxCawFnjw0SpysgZwNAGBEkYBHKTLgFMUB5MZiR
 SkHQ==
X-Gm-Message-State: ACrzQf0eoe/1o1pPCXAt8egDwAsdrV266ERjSWU2MnIC5Wy7Fu3trpEJ
 wCsVm0ikELOPRBfQKcKLoQD+rmoQG+fJrvYszvtY4Wt5uVema0N2lSI0LRDCJgl7OG/R3JCtdoU
 BMZ6FXHLhqmAMFfU=
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr13407741wrr.251.1663665655094; 
 Tue, 20 Sep 2022 02:20:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5inzAK+/pwNi8XymvaI3KYrrOTREd/v2k8z+QiT9ZJST6uloLsjVibBJEe5+hS/44uUfmHlg==
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr13407706wrr.251.1663665654820; 
 Tue, 20 Sep 2022 02:20:54 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm17881934wmq.21.2022.09.20.02.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 02:20:54 -0700 (PDT)
Message-ID: <14c08e0c-4770-0e0c-3c12-b5ed484fe35f@redhat.com>
Date: Tue, 20 Sep 2022 11:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/8] qtest: "-display none" is set in qtest_init()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902165126.1482-2-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902165126.1482-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.952, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 02/09/2022 18.51, Juan Quintela wrote:
> So we don't need to set anywhere else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
...
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index afc1d20355..94b00288d9 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -981,8 +981,7 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
>       if (!getenv("QEMU_FUZZ_ARGS")) {
>           usage();
>       }
> -    g_string_append_printf(cmd_line, " -display none \
> -                                      -machine accel=qtest, \
> +    g_string_append_printf(cmd_line, " -machine accel=qtest, \
>                                         -m 512M %s ", getenv("QEMU_FUZZ_ARGS"));
>       return cmd_line;
>   }
> diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
> index b17fc725df..f2c729493f 100644
> --- a/tests/qtest/fuzz/i440fx_fuzz.c
> +++ b/tests/qtest/fuzz/i440fx_fuzz.c
> @@ -157,7 +157,7 @@ static void i440fx_fuzz_qos_fork(QTestState *s,
>   }
>   
>   static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
> -                                       " -m 0 -display none";
> +                                       " -m 0";
>   static GString *i440fx_argv(FuzzTarget *t)
>   {
>       return g_string_new(i440fx_qtest_argv);
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index 3a3d9c16dd..fd431849a5 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -85,7 +85,7 @@ static GString *qos_build_main_args(void)
>       }
>       /* Prepend the arguments that we need */
>       g_string_prepend(cmd_line,
> -            TARGET_NAME " -display none -machine accel=qtest -m 64 ");
> +            TARGET_NAME " -machine accel=qtest -m 64 ");
>       return cmd_line;
>   }
>   

This seems to break the build-oss-fuzz CI job:

  https://gitlab.com/thuth/qemu/-/jobs/3052856828#L3774

Please double-check whether it's ok to remove the "-display none" here.

  Thomas


