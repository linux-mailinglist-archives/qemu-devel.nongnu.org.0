Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0794CFB6B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:38:05 +0100 (CET)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAkf-0003tp-0J
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAGi-0001Ws-IR
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAGh-0003YR-3b
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+xwrqJJei8RPJd1YR+bnhPbq3wSNwuQVOrLtpuovoc=;
 b=KDZkSZezHE1whIsr5O2d26pMGva0Rj3nDeUbBoALWyL+xIXNQoHjtZlriFRhFw1JdMe1pW
 NrIiMaDPZ4VoQIIrCNUjQU1JkKoLrnDMD7KWrIoqN/RKbX3IkdkROITTQczhrXCoK7tPdV
 J8ElFmUe2B419utXWIMA4StxRuNuTrc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-kObqCjm9MnWycd3NSpM8_w-1; Mon, 07 Mar 2022 05:07:00 -0500
X-MC-Unique: kObqCjm9MnWycd3NSpM8_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 r133-20020a1c448b000000b00385c3f3defaso4655422wma.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n+xwrqJJei8RPJd1YR+bnhPbq3wSNwuQVOrLtpuovoc=;
 b=tFuh2yqJR/LRYFj5Um+oke5EIizOcYIXZDTX7coG7pzDkQGbQjoDQrfY8HqDvrzy05
 +ymiURrYyQTtKhy3l1WDjBMgHAFzFLMAr2X4L7Uhr9xVDVSzOYevw+sL2pmu6P+i+Sz3
 LOuASM3z8UCzpj73CCSbOCg+w9bFX1+1P7XsK5VENCQCa7ow2lWaIzzs3r6e5xUVBHFo
 ILtU6Ebev+uxhXpAkxXGJR+7UZlKA8Lr9iQhBlaYjIw8N5HitI/cAHCdr/TlmkvicGTN
 +GuvNm+vUXMgyVsK9k6pHEYRUWHA3u5lmrfPYDudr5VPbTeGKLNKKQkvV5dyEWNSw9Qv
 WHDw==
X-Gm-Message-State: AOAM531Sw226+DVPi9Kmbsa+M5WwhdhWQIC28iAMk/D2pXDxPyIIUYOF
 t+OZ7oRPXfKd4WFxLVNYL1KRowa8PCxNCoi56giTIaCPuC2e2/xzAXCgO4BUs0GVfd3nua8W8Hi
 JrmPOyfO8DQo3eEw=
X-Received: by 2002:adf:d1cc:0:b0:1f0:4570:bf75 with SMTP id
 b12-20020adfd1cc000000b001f04570bf75mr7759161wrd.656.1646647619086; 
 Mon, 07 Mar 2022 02:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsivL3xmwQhVAYFVNWPrnmp/VanfsN2Kbai3S6wGzDJBEG21ZX6DGi6witj8yStceU+OOPMg==
X-Received: by 2002:adf:d1cc:0:b0:1f0:4570:bf75 with SMTP id
 b12-20020adfd1cc000000b001f04570bf75mr7759142wrd.656.1646647618853; 
 Mon, 07 Mar 2022 02:06:58 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm22571570wmq.17.2022.03.07.02.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:06:58 -0800 (PST)
Message-ID: <ac5660e6-9c4b-0e18-25da-51a25a87ce14@redhat.com>
Date: Mon, 7 Mar 2022 11:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 03/18] tests: support QTEST_TRACE env variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220302174932.2692378-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/2022 18.49, Daniel P. Berrangé wrote:
> When debugging failing qtests it is useful to be able to turn on trace
> output to stderr. The QTEST_TRACE env variable contents get injected
> as a '-trace <str>' command line arg
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/libqtest.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 41f4da4e54..a85f8a6d05 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -260,6 +260,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>       gchar *qmp_socket_path;
>       gchar *command;
>       const char *qemu_binary = qtest_qemu_binary();
> +    const char *trace = g_getenv("QTEST_TRACE");
> +    g_autofree char *tracearg = trace ?
> +        g_strdup_printf("-trace %s ", trace) : g_strdup("");
>   
>       s = g_new(QTestState, 1);
>   
> @@ -282,14 +285,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>   
>       qtest_add_abrt_handler(kill_qemu_hook_func, s);
>   
> -    command = g_strdup_printf("exec %s "
> +    command = g_strdup_printf("exec %s %s"
>                                 "-qtest unix:%s "
>                                 "-qtest-log %s "
>                                 "-chardev socket,path=%s,id=char0 "
>                                 "-mon chardev=char0,mode=control "
>                                 "-display none "
>                                 "%s"
> -                              " -accel qtest", qemu_binary, socket_path,
> +                              " -accel qtest",
> +                              qemu_binary, tracearg, socket_path,
>                                 getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
>                                 qmp_socket_path,
>                                 extra_args ?: "");

Reviewed-by: Thomas Huth <thuth@redhat.com>


