Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408AC68FFDC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 06:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPzNN-0003lm-Jp; Thu, 09 Feb 2023 00:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzNL-0003lb-BP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzNJ-0005SS-MI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675920096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZgfY8sTtq4QhkP3QmH/UxFnj3beD38pwl3ma4lbOLs=;
 b=cWSuHLjxuzDlYWweDImqzwU/JWBDGtcUjeuqT9kDxQnLAUUllXr2Z6ltVEdQd3TTI2gaJx
 9OBKbbao4ied5uOWkzLIucjFgNHqqU+J2aeJaSCEGQ8mdkCsaLutgKFz2dyCOK7vs7bQ+0
 pIcOPXHeMiU4L+5KgZay75tpRhMWrJI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-tymLpc3bMrS-ZnTOMAENUw-1; Thu, 09 Feb 2023 00:21:35 -0500
X-MC-Unique: tymLpc3bMrS-ZnTOMAENUw-1
Received: by mail-qv1-f72.google.com with SMTP id
 ec11-20020ad44e6b000000b0056c2005684aso615769qvb.23
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 21:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZgfY8sTtq4QhkP3QmH/UxFnj3beD38pwl3ma4lbOLs=;
 b=MedjgnbOhLuFsLwoU3c6b8ea57kujSa7mzYQD/TXcA9fOdvWwtJDoMvaqvyT8EKx34
 6gHsO86eLkH0UmZ6yOZlmA9hDkJknjgXoL+4hPM0OIdcrQmipUQ2ylc7I2cn66uqTZnl
 d9Wr3rA6xSa7T3N5N4PZftt5UT7MSJIsJTXyJXjwSY3mNt+lyYTrUaLRC88W+TzeA6zk
 1mXpKUElsgJ0Gg/f1C0q3pIKdnvOSzWzFGh+l21RFWpUX3/gTWPo2lVnGos6pGEuFNAO
 AP9Rn0HTn+Ts3Od5q496O/AN+Ne/nmpfd4E7PFxcflluggkwVClk9K1zkjI0m9onPdD1
 s9Eg==
X-Gm-Message-State: AO0yUKVD3jW9WJVEAFt0hy9AuRgKdFgAbgqT89Yfn9JSVJa5WnFBVsr+
 Kds51qchaJfP7L0dB7VkzVvCH4y17SvWs/0qZDBOE0TM5yMnzFl62Mrw64XNVcf1Rrh41FgxBgM
 lxAhLiXcXLD0Ewek=
X-Received: by 2002:a05:622a:493:b0:3b8:3391:bde5 with SMTP id
 p19-20020a05622a049300b003b83391bde5mr17737531qtx.26.1675920094504; 
 Wed, 08 Feb 2023 21:21:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9cD/vSiroOAE+9EqHjgMQPdKwhPDWr8J9ib8kcB5tF4TLXsQ0Ts/0zqbli4j2WOeNqafnASQ==
X-Received: by 2002:a05:622a:493:b0:3b8:3391:bde5 with SMTP id
 p19-20020a05622a049300b003b83391bde5mr17737516qtx.26.1675920094281; 
 Wed, 08 Feb 2023 21:21:34 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 p205-20020a3742d6000000b0072a375c291csm673731qka.30.2023.02.08.21.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 21:21:33 -0800 (PST)
Message-ID: <905f792c-bac7-f88f-a538-b5c10135944d@redhat.com>
Date: Thu, 9 Feb 2023 06:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 07/11] readconfig-test: add test for accelerator
 configuration
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230208171922.95048-1-pbonzini@redhat.com>
 <20230208171922.95048-8-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208171922.95048-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 18.19, Paolo Bonzini wrote:
> Test that it does not cause a SIGSEGV, and cover a valid configuration
> as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
>   tests/qtest/libqtest.h        | 12 ++++++++++
>   tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
>   3 files changed, 70 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index ce5f235e25f1..4fba2bb27f06 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -420,6 +420,26 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
>       return s;
>   }
>   
> +QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)
> +{
> +    QTestState *s = qtest_spawn_qemu("%s", args);
> +
> +    /*
> +     * Stopping QEMU for debugging is not supported on Windows.
> +     *
> +     * Using DebugActiveProcess() API can suspend the QEMU process,
> +     * but gdb cannot attach to the process. Using the undocumented
> +     * NtSuspendProcess() can suspend the QEMU process and gdb can
> +     * attach to the process, but gdb cannot resume it.
> +     */
> +#ifndef _WIN32
> +    if (getenv("QTEST_STOP")) {
> +        kill(s->qemu_pid, SIGSTOP);
> +    }
> +#endif
> +    return s;
> +}

You missed my review comments here:

https://lore.kernel.org/qemu-devel/2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.com/

  Thomas


