Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1E583F9D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:09:14 +0200 (CEST)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3GL-0006LT-RT
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oH3Bu-0002QB-AO
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oH3Bo-0000tA-AL
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659013471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBwGlZ/6KjgnfpNW77UvjL6Fwd6a5dnyoSp+ELpscmw=;
 b=Vdwt0BL9HeWUxxLmh2nRGjQDiPZ/UUQLQTYjxCyCk4N/RBFmu41xBOZYK1qjTyMJPYZUsS
 /GZWbbpi3NJRglQcnjfvUftExu5jP9RVnd12TMWdlSeUplequdeCHlqukq/aTCDDpjdTcT
 fQmsLc0s86DRu5Ikr54STXA40+2xcDQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-sjajuMxjMT-ZKb_sKVtSyw-1; Thu, 28 Jul 2022 09:04:30 -0400
X-MC-Unique: sjajuMxjMT-ZKb_sKVtSyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso2471371wmb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WBwGlZ/6KjgnfpNW77UvjL6Fwd6a5dnyoSp+ELpscmw=;
 b=HJBAp8pcwGt9oXfz4/iiE0LIwiJPEKOS0A2AcnXzOpab2tv4tARdG4NZzo76QBZ7M/
 fYOuO0kTjjssP3QK7niKB0o+0t2zCrOl3dz4ixeUPADY42I1ScFr7gJt6EMXk64CoUWA
 dlZT3WEyN1rPKNEiyb1ovBPiaIOKRLERtTtyuE+5qlBwfMvuMYcPJKt/6A9ZoTOqUbkU
 6OpaHBSeWZ9angKDK981SEpcFo9aOM1Vl6AK9jluGG/Qw/JDXGvUP1H/7s70vOWgBz5I
 XgMqoD5wXGCRDyvu5m6Ys5lcPKzapxrmHnDhjm0gI0+tIhv3D+mi2M7H5WSkrsD0opVT
 1SMg==
X-Gm-Message-State: AJIora9T+or3CRKReVgzx3S1k9nCt7ZFBJ7/yZM6ecY4MYQt5dOprxc0
 4hXFI6f5DUn7Wzx0yuRlM6QMLFHkxXjQ7LMkzb9L70RcpeocF7No+gCOscMixEfJ4CZyhAf7NOd
 u0dTdgNexM4n9yqQ=
X-Received: by 2002:a05:600c:4fcf:b0:3a3:40f6:4c4d with SMTP id
 o15-20020a05600c4fcf00b003a340f64c4dmr6363480wmq.60.1659013469147; 
 Thu, 28 Jul 2022 06:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZUNjfwQB0Zx5hShsHiGFDfxc7dIFrxg1mPFODzUw/WUDfXEYOmNA0PgjRqKKM6IjPPhyycQ==
X-Received: by 2002:a05:600c:4fcf:b0:3a3:40f6:4c4d with SMTP id
 o15-20020a05600c4fcf00b003a340f64c4dmr6363450wmq.60.1659013468598; 
 Thu, 28 Jul 2022 06:04:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-134.web.vodafone.de.
 [109.43.176.134]) by smtp.gmail.com with ESMTPSA id
 d6-20020adff2c6000000b0021f0452eca6sm856106wrp.107.2022.07.28.06.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:04:28 -0700 (PDT)
Message-ID: <75f92280-97b9-1ace-be12-ebc2993d2066@redhat.com>
Date: Thu, 28 Jul 2022 15:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] migration-test: Use migrate_ensure_converge() for
 auto-converge
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220722145654.81103-1-peterx@redhat.com>
 <20220722145654.81103-2-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220722145654.81103-2-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22/07/2022 16.56, Peter Xu wrote:
> Thomas reported that auto-converge test will timeout on MacOS CI gatings.
> Use the migrate_ensure_converge() helper too in the auto-converge as when
> Daniel reworked the other test cases.
> 
> Since both max_bandwidth / downtime_limit will not be used for converge
> calculations, make it simple by removing the remaining check, then we can
> completely remove both variables altogether, since migrate_ensure_converge
> is used the remaining check won't make much sense anyway.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   tests/qtest/migration-test.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 71595a74fd..dd50aa600c 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1776,14 +1776,6 @@ static void test_migrate_auto_converge(void)
>        * so we need to decrease a bandwidth.
>        */
>       const int64_t init_pct = 5, inc_pct = 50, max_pct = 95;
> -    const int64_t max_bandwidth = 400000000; /* ~400Mb/s */
> -    const int64_t downtime_limit = 250; /* 250ms */
> -    /*
> -     * We migrate through unix-socket (> 500Mb/s).
> -     * Thus, expected migration speed ~= bandwidth limit (< 500Mb/s).
> -     * So, we can predict expected_threshold
> -     */
> -    const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
>   
>       if (test_migrate_start(&from, &to, uri, &args)) {
>           return;
> @@ -1818,8 +1810,7 @@ static void test_migrate_auto_converge(void)
>       /* The first percentage of throttling should be equal to init_pct */
>       g_assert_cmpint(percentage, ==, init_pct);
>       /* Now, when we tested that throttling works, let it converge */
> -    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
> -    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
> +    migrate_ensure_converge(from);
>   
>       /*
>        * Wait for pre-switchover status to check last throttle percentage
> @@ -1830,11 +1821,6 @@ static void test_migrate_auto_converge(void)
>       /* The final percentage of throttling shouldn't be greater than max_pct */
>       percentage = read_migrate_property_int(from, "cpu-throttle-percentage");
>       g_assert_cmpint(percentage, <=, max_pct);
> -
> -    remaining = read_ram_property_int(from, "remaining");
> -    g_assert_cmpint(remaining, <,
> -                    (expected_threshold + expected_threshold / 100));
> -

I'm getting this on FreeBSD:

../tests/qtest/migration-test.c:1771:13: error: unused variable 'remaining' 
[-Werror,-Wunused-variable]
     int64_t remaining, percentage;
             ^
1 error generated.

Did you try this with -Werror ?

  Thomas




