Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA006B96D1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4zv-0000Kf-Bg; Tue, 14 Mar 2023 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc4zr-0000KH-Id
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc4vc-0001n8-Uv
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678801368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p5tYLxvSctzS4OoiJ0amB3FiPTWh4ZIdlNukeLn7Pu4=;
 b=ZnETctJ7APv1oGJQK9yHPgG8TIfEr/pnq9hP4r5O+evVBpcnfkCln4PHsTF7J0VZk469Qr
 3ifgoFZUpt2C4xm3AhnDlNhrpDpEeKLd38n+bZiN92tLjG0UtCqAMPUDr4xMEB/5+3w+sA
 4fGn09x0Vmv/n6Marjn1aNTDJl0kal4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-1vF_Kg-WMMG50pqBEJgWbw-1; Tue, 14 Mar 2023 09:42:44 -0400
X-MC-Unique: 1vF_Kg-WMMG50pqBEJgWbw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so5705740wmr.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678801363;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5tYLxvSctzS4OoiJ0amB3FiPTWh4ZIdlNukeLn7Pu4=;
 b=qC8Vsccx4y8ObB/5EBlIu61MnYXV2EDuZ66SuN7bQV6l7Zsmb841bKoTyInAjK02Wi
 2E8cV4pIA46ISG23U+Gc3j68f3caBPKP2+9kgMPYiD1yYK26Wgspcyge2waNBVVgOEWf
 oai4D8NlbEOSFIEYJHQP2qvKMUzGOoqGPJCMd7NJ41XEkmkPkTnVcEMuEgXHvuzuKLdZ
 8B+A19ua1Xnahxy+rvWcOpkr/6LtHsVJ+W2sDCA7xZ3gvMQGuJcsXy5BA3zcTah+FKxr
 lWeZpgbpkAFoSFeAJo7A5FysxGZIUvuT4SC/KZFKl/avN+M5n0ljBjFNwRdzYrQ2ytp3
 UTew==
X-Gm-Message-State: AO0yUKXtiP6VIS+GBqr4Dz3tQ2V6WRtIgJe2vLFn8dmyLCihvR5NlpY6
 YzjwlcBi/6sCyvVgvWy0cJQJDLll2hCz7qXaiGRDddsm0XM/ogvefH65SwyWrR9viUikX9qsH2i
 ImsOr5VUYuCOOij4=
X-Received: by 2002:adf:fd91:0:b0:2cf:e3d8:5df9 with SMTP id
 d17-20020adffd91000000b002cfe3d85df9mr3820678wrr.58.1678801363089; 
 Tue, 14 Mar 2023 06:42:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/1o8vwQQeooQpweNj3rvWDhmQIRzY3TZ89G89lJmmz0Ab/I8BNAVCDunEGc0f1KfvLeqEQKQ==
X-Received: by 2002:adf:fd91:0:b0:2cf:e3d8:5df9 with SMTP id
 d17-20020adffd91000000b002cfe3d85df9mr3820664wrr.58.1678801362750; 
 Tue, 14 Mar 2023 06:42:42 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b002c3f81c51b6sm2096220wru.90.2023.03.14.06.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:42:42 -0700 (PDT)
Date: Tue, 14 Mar 2023 13:42:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 peterx@redhat.com
Subject: Re: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
Message-ID: <ZBB50AHuI54twuMS@work-vm>
References: <20230314133310.1177954-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314133310.1177954-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The postcopy/preempt tests seem to have a race which makes them hang
> on the s390x CI runner.  Disable them for the moment, while we
> investigate.  As with the other disabled subtest, you can opt back in
> by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
> 
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d4ab3934ed2..4643f7f49dc 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
>      const char *arch = qtest_get_arch();
>      g_autoptr(GError) err = NULL;
>      int ret;
> +    /*
> +     * Race condition suspected in the postcopy/preempt tests: see
> +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
> +     */
> +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");
>  
>      g_test_init(&argc, &argv, NULL);
>  
> @@ -2500,9 +2505,11 @@ int main(int argc, char **argv)
>          qtest_add_func("/migration/postcopy/plain", test_postcopy);
>          qtest_add_func("/migration/postcopy/recovery/plain",
>                         test_postcopy_recovery);
> -        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
> -        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
> -                       test_postcopy_preempt_recovery);
> +        if (!skip_postcopy_preempt) {
> +            qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
> +            qtest_add_func("/migration/postcopy/preempt/recovery/plain",
> +                           test_postcopy_preempt_recovery);
> +        }
>      }
>  
>      qtest_add_func("/migration/bad_dest", test_baddest);
> @@ -2521,10 +2528,12 @@ int main(int argc, char **argv)
>          qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
>          qtest_add_func("/migration/postcopy/recovery/tls/psk",
>                         test_postcopy_recovery_tls_psk);
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
>      }
>  #ifdef CONFIG_TASN1
>      qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


