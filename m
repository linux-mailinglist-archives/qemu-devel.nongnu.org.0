Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C35FB468
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:17:44 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiG4l-000236-LP
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiG1x-0007yZ-Bo
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiG1s-0007k4-8f
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665497682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68RPABSoFfKyCVhQQn+f/9brULOswmReuuKgUW4g71c=;
 b=R9MrHj2EDivWEbUcSaE3b5BDMQ0f2m/wXNT/WSUGsFmQ/UfbDgc3oGHrQrdK3BultdmSsW
 4/pl8nyI37pVlxKGLc5IAPj2kNqtAD+s+PI3qx1pNuk3i/kg+xNsidGcUHmY/VqK9RtYKw
 6Y8G5CCs6uD4QmDxa6tMIX/5VvO1HPA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-HKaMVo42MIiu6POslBVnOg-1; Tue, 11 Oct 2022 10:14:41 -0400
X-MC-Unique: HKaMVo42MIiu6POslBVnOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so3936609wrd.22
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=68RPABSoFfKyCVhQQn+f/9brULOswmReuuKgUW4g71c=;
 b=7uYoftRNvb1+jNKeaJFiKRCtCx8mntHKoyl/oHkESDvDlsMpIk/3ToOcqUWAMXxee1
 r6gm9tTWvL+jFfa+bLa1QfvcsaEtzhJrjJVYsSuyOcIRCcDjw4rPL76uJho3u2rSuVS8
 PMQujeDWk3+QONsd8F/F+7MbqaKpyjDFGuewz49tQTExmoTk6eA6GZPqPtqk4BrHuIuW
 CLGn4RYETQlpCimvKCqOQr4En+++N4KWWwCyzXzdCWXExAe3mJi2DnHS7FlrWbYiSJzU
 HBCLfABRBEWYdgV7IGw0IYor7V6WcSjrvwDcG8LUrowXDnrL+YJhFsaeCSh2B2RuncVc
 gJ9Q==
X-Gm-Message-State: ACrzQf1a6tUbJaZnHJN2waUpCAer3RsFJnu95jWiA4VkV+FsMAEqV+cV
 HBtEqX1Y7JTH9ZbSncpnrlzQxmniNCRqWRF2KWycJCP1epAGfk7zdNYlJoznM4XXXLdlSXgZSGf
 0v1VYBsQ6dNPMUXc=
X-Received: by 2002:a05:6000:1a88:b0:231:bc2a:4f1b with SMTP id
 f8-20020a0560001a8800b00231bc2a4f1bmr906586wry.291.1665497680398; 
 Tue, 11 Oct 2022 07:14:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uEEIKBqYbKyVWu9CQgQI7NuXyNRNuxAwtisuvRwarS2nZEsf2poZ3f0LGc08DaWCQon69qQ==
X-Received: by 2002:a05:6000:1a88:b0:231:bc2a:4f1b with SMTP id
 f8-20020a0560001a8800b00231bc2a4f1bmr906567wry.291.1665497680141; 
 Tue, 11 Oct 2022 07:14:40 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b003c6cd82596esm233630wmq.43.2022.10.11.07.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 07:14:39 -0700 (PDT)
Message-ID: <4a301dfb-2c85-c7ef-4d1a-e85cc3b9d171@redhat.com>
Date: Tue, 11 Oct 2022 16:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-11-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 10/18] tests/qtest: libqtest: Install signal handler
 via signal()
In-Reply-To: <20221006151927.2079583-11-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/10/2022 17.19, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the codes uses sigaction() to install signal handler with
> a flag SA_RESETHAND. Such usage can be covered by the signal() API
> that is a simplified interface to the general sigaction() facility.
> 
> Update to use signal() to install the signal handler, as it is
> available on Windows which we are going to support.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> Changes in v5:
> - Replace sighandler_t with its actual definition, since it is not
>    available on BSD hosts
> 
>   tests/qtest/libqtest.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 8228262938..54e5f64f20 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -66,7 +66,7 @@ struct QTestState
>   };
>   
>   static GHookList abrt_hooks;
> -static struct sigaction sigact_old;
> +static void (*sighandler_old)(int);
>   
>   static int qtest_query_target_endianness(QTestState *s);
>   
> @@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
>   
>   static void setup_sigabrt_handler(void)
>   {
> -    struct sigaction sigact;
> -
> -    /* Catch SIGABRT to clean up on g_assert() failure */
> -    sigact = (struct sigaction){
> -        .sa_handler = sigabrt_handler,
> -        .sa_flags = SA_RESETHAND,
> -    };
> -    sigemptyset(&sigact.sa_mask);
> -    sigaction(SIGABRT, &sigact, &sigact_old);
> +    sighandler_old = signal(SIGABRT, sigabrt_handler);
>   }
>   
>   static void cleanup_sigabrt_handler(void)
>   {
> -    sigaction(SIGABRT, &sigact_old, NULL);
> +    signal(SIGABRT, sighandler_old);
>   }
>   
>   static bool hook_list_is_empty(GHookList *hook_list)

Hmm, did you notice the error from checkpatch.pl ?

ERROR: use sigaction to establish signal handlers; signal is not portable

... rationale is given in the commit description here:

https://gitlab.com/qemu-project/qemu/-/commit/e8c2091d4c4dd

... but since we likely don't care about continuing running after the first 
signal has been delivered, I guess it's ok here to use signal() instead of 
sigaction?

  Thomas


