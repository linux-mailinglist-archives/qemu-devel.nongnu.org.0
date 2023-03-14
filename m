Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C566B9777
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc5Dl-0005Sr-0c; Tue, 14 Mar 2023 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc5Dg-0005SK-HU
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc5De-00060U-Od
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678802496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKym913ECLrc16P8ya8PH2BAsEnChl7p8MIsMzLFS5A=;
 b=clVLdxpIfs0ubBjHb++u+8oZNLVuRz7eCof8EcJJMbTTvp68FKNXPSYTCrP1KngNDo0tMc
 tVWW+SfZl+Jy7II9fycKnKLkWnhWvQ/bwUtfeWPrMp3cLCtiOqTxwSkuzQjTvY4C/F1pu/
 uD379HlzHp0e3h0G70BaRy9rq5Y9KPY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-YOgylbOJPPqSEmhm_LqsYA-1; Tue, 14 Mar 2023 10:01:33 -0400
X-MC-Unique: YOgylbOJPPqSEmhm_LqsYA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a056000024500b002ceaa6f78a0so1152835wrz.12
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 07:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678802492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VKym913ECLrc16P8ya8PH2BAsEnChl7p8MIsMzLFS5A=;
 b=uIXd/KPWw7bpwtB+0LVYkqrWZGtfW+Z2Nmd9tSftPsScrwXlm32DVouByv0OFSOCQX
 NxcuplsS3LmpI4AxzdXl7Ie74muIINwSLSZk9lzLRhaSsXjAwFttfI/D2d/k4s4fiIMq
 p6PC4U2RarzgagO3GGp8lZiMXiWORiT5hVk51HTmnCHmA5ZconpYnYr0+lN4xRc6uKoH
 MCwNHL5AnR0ZwFtTHpSUg+bzYgufIf2bPZXbsLC4fpY5xFhVtkRRzmI4FUNFzul+noCG
 Wzq8ScD/BOFr5rT3nU413B9WMje7RtbJvapwwNcbFU0mkolGv1Gmg0Sw3gC5N0UUNm2G
 t99g==
X-Gm-Message-State: AO0yUKUcFhbz1S0J8XUUlg2hY/ITvDkN+G+mSOgcZR2pGAckq/S2y9te
 CaYFEu4tHECRvI1zYzgE9gEo0KPB1dGoyXNJ2KeHZWPnIZ4hHfNDtSpEZI9515vzhuo0Mascigd
 L8QWjt0VCJf9dUJs=
X-Received: by 2002:a05:600c:35ce:b0:3d0:6a57:66a5 with SMTP id
 r14-20020a05600c35ce00b003d06a5766a5mr14187261wmq.0.1678802492061; 
 Tue, 14 Mar 2023 07:01:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set84Xxoa0/G+mA+2ibCQDZkgbidzTVTb/r4F7XnljOQb/VNlG6rJtlMBt5U0CC9i9qMiagAUqA==
X-Received: by 2002:a05:600c:35ce:b0:3d0:6a57:66a5 with SMTP id
 r14-20020a05600c35ce00b003d06a5766a5mr14187215wmq.0.1678802491663; 
 Tue, 14 Mar 2023 07:01:31 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-184.web.vodafone.de.
 [109.43.176.184]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0ac600b003eb68bb61c8sm2937611wmr.3.2023.03.14.07.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 07:01:30 -0700 (PDT)
Message-ID: <a21f9c5f-d67f-8d88-d825-07d4175c56ef@redhat.com>
Date: Tue, 14 Mar 2023 15:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peterx@redhat.com
References: <20230314133310.1177954-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314133310.1177954-1-peter.maydell@linaro.org>
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

On 14/03/2023 14.33, Peter Maydell wrote:
> The postcopy/preempt tests seem to have a race which makes them hang
> on the s390x CI runner.  Disable them for the moment, while we
> investigate.  As with the other disabled subtest, you can opt back in
> by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
> 
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/migration-test.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d4ab3934ed2..4643f7f49dc 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
>       const char *arch = qtest_get_arch();
>       g_autoptr(GError) err = NULL;
>       int ret;
> +    /*
> +     * Race condition suspected in the postcopy/preempt tests: see
> +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
> +     */
> +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");

Shouldn't that be "!getenv(...)" ?

  Thomas


>       g_test_init(&argc, &argv, NULL);
>   
> @@ -2500,9 +2505,11 @@ int main(int argc, char **argv)
>           qtest_add_func("/migration/postcopy/plain", test_postcopy);
>           qtest_add_func("/migration/postcopy/recovery/plain",
>                          test_postcopy_recovery);
> -        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
> -        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
> -                       test_postcopy_preempt_recovery);
> +        if (!skip_postcopy_preempt) {
> +            qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
> +            qtest_add_func("/migration/postcopy/preempt/recovery/plain",
> +                           test_postcopy_preempt_recovery);
> +        }
>       }
>   
>       qtest_add_func("/migration/bad_dest", test_baddest);
> @@ -2521,10 +2528,12 @@ int main(int argc, char **argv)
>           qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
>           qtest_add_func("/migration/postcopy/recovery/tls/psk",
>                          test_postcopy_recovery_tls_psk);
> -        qtest_add_func("/migration/postcopy/preempt/tls/psk",
> -                       test_postcopy_preempt_tls_psk);
> -        qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
> -                       test_postcopy_preempt_all);
> +        if (!skip_postcopy_preempt) {
> +            qtest_add_func("/migration/postcopy/preempt/tls/psk",
> +                           test_postcopy_preempt_tls_psk);
> +            qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
> +                           test_postcopy_preempt_all);
> +        }
>       }
>   #ifdef CONFIG_TASN1
>       qtest_add_func("/migration/precopy/unix/tls/x509/default-host",


