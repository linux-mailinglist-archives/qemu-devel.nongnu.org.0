Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC9441A1D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:44:58 +0100 (CET)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUoD-0006Tj-6e
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhUnC-0005lF-5T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhUnA-00050I-D1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635763430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/T7hkbtnop+IucRrZsmGTa3SxYOXDWNVYfI7FZhZtc=;
 b=YSAnYgF9ukLOdwW5E2s8qM5MLfvzGBR4OaZJETab9pPwTNON1cVGdwpnxzAW6jke2dp2iI
 bWSNpe23sH8mw7wI1XG6By8yzeusLQAylMW4H4A5VDskUIS4nP/Pto1b/eCgDZLp2iFXkH
 sOCOZq2qJEwqfkBPhXMSko+FR5Ady5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-lggxS8LvNAmKKL8zCXiNkA-1; Mon, 01 Nov 2021 06:43:50 -0400
X-MC-Unique: lggxS8LvNAmKKL8zCXiNkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso3454652wmb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S/T7hkbtnop+IucRrZsmGTa3SxYOXDWNVYfI7FZhZtc=;
 b=6QlnFDxskX6ZQkhkydah3yklEoDCKMV6msex+/9QDUjpe/hYIzxZOKDCgdJDjgUql7
 +c+nKdbQDy5PlXRznTqVmzfU7Dtc9+CO39z1Y6Dci+Apweb/ALd/m57ARxTIDCVY3SQ/
 OoOLyLgV6d7l40kI7ljmsoHF/0dl2CCOh8gjV0w37Gy6aCG2FHfQXEgRx2a3dcF2g7xC
 /4BplA/pAbkUQExpqlYOaGuWts3VLJxpgAI08GjIASySAvCmRgbzvJmC3QRLAd/wh5I2
 HLkbclUJeMjGfvbI30lmzhF8oLDSnxKc6zZJMKI6INM6dUFfQZhdfDLt1SGyoApN21/e
 A8gg==
X-Gm-Message-State: AOAM530MjDRLS950ivsRRAqWol+h6G2kvS42DUZpIZ91NocbaMozS9O9
 WgsPWxZoz7ZAc0IDFMJK11LcSxKtGnvuA65AKMVUUaeVurOpOmT2N8sjl6IAU7RoI+2WhngjpzD
 YxYnslAi/HtCyWkY=
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr37430805wrs.190.1635763428168; 
 Mon, 01 Nov 2021 03:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6PLG6+LZqh+WjXK88chKXpIJdU2cH64bIRBfs9c9EwD0qWmrQKZej4bfpbI/Bft/8NwSKhg==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr37430779wrs.190.1635763427959; 
 Mon, 01 Nov 2021 03:43:47 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t9sm7741069wrx.72.2021.11.01.03.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:43:47 -0700 (PDT)
Message-ID: <f916ad9f-38af-059c-97d8-3aa3d5030e2d@redhat.com>
Date: Mon, 1 Nov 2021 11:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
 <bfed7144-af86-7098-e7a6-731ff13c2cf7@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <bfed7144-af86-7098-e7a6-731ff13c2cf7@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.592, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/31/21 13:02, wangyanan (Y) wrote:
> Hi Philippe,
> 
> I saw that there are some cross-build failures and a clang complain
> about this patch in your triggered CI pipeline. I believe the minor
> diff below will resolve them. If you are going to resend v2 of the
> "qdev-hotplug" patches, I would very much appreciate it if you
> can also help to respin v5 of this series with the diff applied.
> Sorry for the extra work included. :)

Sure, thanks for running the CI pipeline, you saved me time (I'll still
run it again, but with your diff applied).

> 
> Thanks,
> Yanan
> 
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index e96abe9ba4..61985094f5 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -347,12 +347,12 @@ static char *smp_config_to_string(SMPConfiguration
> *config)
>  {
>      return g_strdup_printf(
>          "(SMPConfiguration) {\n"
> -        "    .has_cpus    = %5s, cpus    = %ld,\n"
> -        "    .has_sockets = %5s, sockets = %ld,\n"
> -        "    .has_dies    = %5s, dies    = %ld,\n"
> -        "    .has_cores   = %5s, cores   = %ld,\n"
> -        "    .has_threads = %5s, threads = %ld,\n"
> -        "    .has_maxcpus = %5s, maxcpus = %ld,\n"
> +        "    .has_cpus    = %5s, cpus    = %" PRId64 ",\n"
> +        "    .has_sockets = %5s, sockets = %" PRId64 ",\n"
> +        "    .has_dies    = %5s, dies    = %" PRId64 ",\n"
> +        "    .has_cores   = %5s, cores   = %" PRId64 ",\n"
> +        "    .has_threads = %5s, threads = %" PRId64 ",\n"
> +        "    .has_maxcpus = %5s, maxcpus = %" PRId64 ",\n"
>          "}",
>          config->has_cpus ? "true" : "false", config->cpus,
>          config->has_sockets ? "true" : "false", config->sockets,
> @@ -495,7 +495,7 @@ static void test_generic(void)
>      Object *obj = object_new(TYPE_MACHINE);
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){0};
> +    SMPTestData *data = &(SMPTestData){{0}};
>      int i;
> 
>      smp_machine_class_init(mc);
> @@ -531,7 +531,7 @@ static void test_with_dies(void)
>      Object *obj = object_new(TYPE_MACHINE);
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
> -    SMPTestData *data = &(SMPTestData){0};
> +    SMPTestData *data = &(SMPTestData){{0}};
>      unsigned int num_dies = 2;
>      int i;
> 
> On 2021/10/28 23:09, Philippe Mathieu-Daudé wrote:
>> From: Yanan Wang <wangyanan55@huawei.com>
>>
>> Now that we have a generic parser smp_parse(), let's add an unit
>> test for the code. All possible valid/invalid SMP configurations
>> that the user can specify are covered.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS                 |   1 +
>>   tests/unit/meson.build      |   1 +
>>   3 files changed, 596 insertions(+)
>>   create mode 100644 tests/unit/test-smp-parse.c


