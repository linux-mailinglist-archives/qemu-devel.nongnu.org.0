Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035A4EDD44
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:36:06 +0200 (CEST)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwqB-0007Bb-1U
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:36:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwgD-0004NG-12
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwg9-0005HV-Ow
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648740340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nslR/r5IsdOlgZTL0HuSvIfv7XrmfdxbegxKtjVbf/o=;
 b=gF4kuvRL89hpZ0a2iJvd+Uo2r5JlE5rdxVIBtsKxkEHA7OqWlrX85u9ThHOmIh7CwDBu6O
 Wta6SjZT8HsXIZW/4uQ5UURXjvqKmp0cf6/tylVbS0KYn4DqUQIO4cAMR3bnpRGPF/Rdsz
 pf8beLNM+SP7GrccDttxAbAYW8m9+64=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-yD3unDxSN72pWygvjwCs7g-1; Thu, 31 Mar 2022 11:25:38 -0400
X-MC-Unique: yD3unDxSN72pWygvjwCs7g-1
Received: by mail-qv1-f70.google.com with SMTP id
 g13-20020ad4480d000000b004436a155886so6720903qvy.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nslR/r5IsdOlgZTL0HuSvIfv7XrmfdxbegxKtjVbf/o=;
 b=XH7ijnfRDeE70/+W6tjdnlxWACBcteCCMZxEkTfhBqd30uqWC6N4q/lIy0dEQNCoiV
 HSVu+BEolkyusJJKn2qebQd22LjrgI5bYeWiq2VuZBFT4xkjPX3V0YPv0M4+tWIhEh7G
 EDiacD4Zur96rHxkzGBKQbKe2wWZAi05rBjkXVI738gJ5q6Nre8jLDtk43EK+fKLU1Er
 J9ZOzwHmHEklRyzll9cClLvCLrFLMEHCdfVL1Lf8ua7xyFT5YYVPM8J42WmGcGCBP8Go
 zzIegkoVi04Sk+ICVC7Fn0fBMh2C15/cHHVn0bV/b6F0L3Rjqc9LhqFeCNyQky+Tv2Qi
 70cQ==
X-Gm-Message-State: AOAM533aTC77/ttcBoH01XJvqVjefYF2KfwQmGRs7nE4HJl6o3W6Me5h
 ob38HiJb2tTRJBL0IUKaQCutildkEJMYIyU44ds+kV+xiG72cKdQYpI+jIPL5aq1bjBKC+9iInV
 ISkHv3PmCkcplgMx8vrWrO4c26qOaZw+nQMc+bX+CY41TNufXS2iT0AeaUf6Dhfat
X-Received: by 2002:a05:622a:311:b0:2e1:c5eb:f52f with SMTP id
 q17-20020a05622a031100b002e1c5ebf52fmr4766641qtw.468.1648740338119; 
 Thu, 31 Mar 2022 08:25:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZrVpYsaDPfI9VYfWRKR4K+lkd5lPpzdfcr92zLJIBvhkLrqk4KsDv3/Z7w9SDsm+atXU7jQ==
X-Received: by 2002:a05:622a:311:b0:2e1:c5eb:f52f with SMTP id
 q17-20020a05622a031100b002e1c5ebf52fmr4766608qtw.468.1648740337763; 
 Thu, 31 Mar 2022 08:25:37 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 e7-20020ac85987000000b002e1b7fa2201sm19523348qte.56.2022.03.31.08.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:25:37 -0700 (PDT)
Date: Thu, 31 Mar 2022 11:25:36 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 19/19] tests: Add postcopy preempt tests
Message-ID: <YkXH8EJSjUQi+ENP@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-20-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331150857.74406-20-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:57AM -0400, Peter Xu wrote:
> Four tests are added for preempt mode:
> 
>   - Postcopy default
>   - Postcopy tls
>   - Postcopy recovery
>   - Postcopy tls+recovery
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 49 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 7288c64e97..7188503ae1 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -477,6 +477,7 @@ typedef struct {
>       */
>      bool hide_stderr;
>      bool use_shmem;
> +    bool postcopy_preempt;
>      /* only launch the target process */
>      bool only_target;
>      /* Use dirty ring if true; dirty logging otherwise */
> @@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
>  
> +    if (args->postcopy_preempt) {
> +        migrate_set_capability(from, "postcopy-preempt", true);
> +        migrate_set_capability(to, "postcopy-preempt", true);
> +    }
> +
>      /* We want to pick a speed slow enough that the test completes
>       * quickly, but that it doesn't complete precopy even on a slow
>       * machine, so also set the downtime.
> @@ -1058,6 +1064,25 @@ static void test_postcopy_tls(void)
>      test_postcopy_common(&args);
>  }
>  
> +static void test_postcopy_preempt(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_preempt_tls(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +        .postcopy_tls = true,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
>  static void test_postcopy_recovery_common(MigrateStart *args)
>  {
>      QTestState *from, *to;
> @@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls(void)
>      test_postcopy_recovery_common(&args);
>  }
>  
> +static void test_postcopy_preempt_recovery(void)
> +{
> +    MigrateStart args = { .postcopy_preempt = true };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +/* This contains preempt+recovery+tls test altogether */
> +static void test_postcopy_preempt_all(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +        .postcopy_tls = true,
> +    };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
>  static void test_baddest(void)
>  {
>      MigrateStart args = {
> @@ -2176,6 +2219,12 @@ int main(int argc, char **argv)
>  
>      qtest_add_func("/migration/postcopy/unix", test_postcopy);
>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
> +    qtest_add_func("/migration/postcopy/preempt/recovery",
> +                   test_postcopy_preempt_recovery);
> +    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
> +    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
> +                   test_postcopy_preempt_all);
>  #ifdef CONFIG_GNUTLS
>      qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
>      qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);

Ehh, the latter two need to be put into CONFIG_GNUTLS block..

---8<---
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7188503ae1..3d4fe89f52 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2222,12 +2222,12 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
     qtest_add_func("/migration/postcopy/preempt/recovery",
                    test_postcopy_preempt_recovery);
-    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
-    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
-                   test_postcopy_preempt_all);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
     qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
+    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
+    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
+                   test_postcopy_preempt_all);
 #endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
---8<---

Sorry for the noise.

-- 
Peter Xu


