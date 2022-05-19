Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A877C52CFDA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:55:10 +0200 (CEST)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcs9-00007H-OB
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrcjL-0002nH-TV
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrcjI-0001lV-T7
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652953560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zPzGGKVSdD0ipxYCJsxuaWo608I5yscWbpKxUqkgpEg=;
 b=BmhNJk3UzOMmNqVS8LiQWUQJtZ4DsK3O+ANBnrvhw2uVz5CQKEyqyl0uYsrTNHq8FN/NwO
 fpeBZjKdSwPSr+HnnF/oYJOibfPXJZDNvCPjbhfIswHb03Stg1eUyIVbCBfwNfnBZa6pOz
 FrwT+8VGgLwG6CLI/NeAx2iVqv69epY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-cqgjCKKvN2ShAD8s4Q5KeQ-1; Thu, 19 May 2022 05:45:59 -0400
X-MC-Unique: cqgjCKKvN2ShAD8s4Q5KeQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x4-20020a5d4444000000b0020d130e8a36so1364023wrr.9
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zPzGGKVSdD0ipxYCJsxuaWo608I5yscWbpKxUqkgpEg=;
 b=VPYZyZiyrIrbI1HRjVVNolYPUskBvFzblxIEBR2ALuVarVTKB6urSqRAid+NAV2Oea
 JmijlexWtJg/4LiaZ8lgFjtWMau288IL+wpeM7AcBQWK3c7ph6EcLWe4DoXOpZgyTYn9
 N7YtUA+PJP2iiyNO4hVOLyEDUuuLgQlsAsXVKca9rIl1Nhce9XRzK0w7La1V0CRepf0J
 hKnW2VL5b1ssHEl7wjazhNTPdmzwc65dBbVJFv0jD3qbVw5kL3sNBRS7PXvoJAdHqKM0
 v0FeNQmsCqNBcMz5DeGkFSf8sJz087oeFEtBGSli1n1qayWZYUKmXC/ylL5H9IdAmsPX
 miJg==
X-Gm-Message-State: AOAM532RK8dFYwZDBXYezFc8cW3eKXmupuoBA9rtyjpPHYFz5NmypAxJ
 qflATXSp48LNeeNtr5hHsZlvBZAz7uOUe28G+gMaRvYB4305gGYv5TlFI61X1g3/mIagQNJWnUF
 regwKBZe5pFjtIck=
X-Received: by 2002:adf:e481:0:b0:20e:5a67:6f9 with SMTP id
 i1-20020adfe481000000b0020e5a6706f9mr3218172wrm.334.1652953557671; 
 Thu, 19 May 2022 02:45:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjq+LPFZ5XqiKTHvJHqigEhZcDwoLra1Xkob1DOrz44VJhIhwymbq++aZpSaVvhNS2PDCS7Q==
X-Received: by 2002:adf:e481:0:b0:20e:5a67:6f9 with SMTP id
 i1-20020adfe481000000b0020e5a6706f9mr3218157wrm.334.1652953557493; 
 Thu, 19 May 2022 02:45:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c159200b003949dbc3790sm3538866wmf.18.2022.05.19.02.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:45:57 -0700 (PDT)
Date: Thu, 19 May 2022 10:45:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 11/13] tests: Add postcopy tls migration test
Message-ID: <YoYR08m9UiHZHzXC@work-vm>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-12-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-12-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We just added TLS tests for precopy but not postcopy.  Add the
> corresponding test for vanilla postcopy.
> 
> Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
> will only use unix sockets as channel.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 50 +++++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d33e8060f9..e8304aa454 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -481,6 +481,10 @@ typedef struct {
>      bool only_target;
>      /* Use dirty ring if true; dirty logging otherwise */
>      bool use_dirty_ring;
> +    /* Whether use TLS channels for postcopy test? */
> +    bool postcopy_tls;
> +    /* Used only if postcopy_tls==true, to cache the data object */
> +    void *postcopy_tls_data;
>      const char *opts_source;
>      const char *opts_target;
>  } MigrateStart;
> @@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>          return -1;
>      }
>  
> +    if (args->postcopy_tls) {
> +        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
> +    }
> +
>      migrate_set_capability(from, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
> @@ -1004,7 +1012,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      return 0;
>  }
>  
> -static void migrate_postcopy_complete(QTestState *from, QTestState *to)
> +static void migrate_postcopy_complete(QTestState *from, QTestState *to,
> +                                      MigrateStart *args)
>  {
>      wait_for_migration_complete(from);
>  
> @@ -1015,19 +1024,38 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
>          read_blocktime(to);
>      }
>  
> +    if (args->postcopy_tls) {
> +        assert(args->postcopy_tls_data);
> +        test_migrate_tls_psk_finish(from, to, args->postcopy_tls_data);
> +        args->postcopy_tls_data = NULL;
> +    }
> +
>      test_migrate_end(from, to, true);
>  }
>  
> -static void test_postcopy(void)
> +static void test_postcopy_common(MigrateStart *args)
>  {
> -    MigrateStart args = {};
>      QTestState *from, *to;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>      migrate_postcopy_start(from, to);
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy(void)
> +{
> +    MigrateStart args = { };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_tls_psk(void)
> +{
> +    MigrateStart args = { .postcopy_tls = true };
> +
> +    test_postcopy_common(&args);
>  }
>  
>  static void test_postcopy_recovery(void)
> @@ -1089,7 +1117,7 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, &args);
>  }
>  
>  static void test_baddest(void)
> @@ -2133,7 +2161,15 @@ int main(int argc, char **argv)
>  
>      module_call_init(MODULE_INIT_QOM);
>  
> -    qtest_add_func("/migration/postcopy/unix", test_postcopy);
> +    qtest_add_func("/migration/postcopy/plain", test_postcopy);
> +#ifdef CONFIG_GNUTLS
> +    /*
> +     * NOTE: psk test is enough for postcopy, as other types of TLS
> +     * channels are tested under precopy.  Here what we want to test is the
> +     * general postcopy path that has TLS channel enabled.
> +     */
> +    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
> +#endif /* CONFIG_GNUTLS */
>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


