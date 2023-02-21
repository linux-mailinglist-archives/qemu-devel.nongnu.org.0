Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902169E346
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUSh-0001NP-HT; Tue, 21 Feb 2023 10:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pUUSa-0001MF-Um
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pUUSW-00077A-BJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676992892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cH0LQ4yCLqHvU2q1i3Wtb2F+lt25Ophu5W10jHFnviA=;
 b=DDDs/B6O0wF5hNvQkpbNu1J7lDPX/7l3vDN96JA0UoulDUCSe1417XJs3RfumfivHwtmUW
 g+BFQfi2alyIUPhUZkmBGnRnwmEfaQJUsQxya2lPz/kvWNbOaa0p8BfGHDHTmw0/WrV4Z5
 Dg5mth8C207iavhI90kDEmWK86qT4Cs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-eYxy6b-JONGAEPEecRDuwQ-1; Tue, 21 Feb 2023 10:21:23 -0500
X-MC-Unique: eYxy6b-JONGAEPEecRDuwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so2136242wma.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cH0LQ4yCLqHvU2q1i3Wtb2F+lt25Ophu5W10jHFnviA=;
 b=ovranwGlOHzanfXnkcEWKJQPyswRE2o2MO9Rg+44Xllz35eSMnH4I74U1/q/eeQ0/q
 enDNgFII0HcZU0AgGe+Q+TD2vXMjdGP4/wZxcFgmmshwBiwSHSB2nrlccOtX/CLZ7cIE
 PrhwxFEhrPsGRQruwmk9dZwmc/VuoKhY1nEmnWj9Y9HIUHa757C/KOO5cX7jM5VyEM0y
 9CLaR8SjRbCJjaOF+fSBj7o8n5bnVHf+Qj6xc7/lSMR+2/00Cz/ygdYzohRBzOlqLTyU
 kE0YVU0ocN3Jm0gagPy3YFXArVT9h++d1ddjhTmD5u34P5NxAN8ieKFIgl6OKBJghEd/
 na2A==
X-Gm-Message-State: AO0yUKWCFSc19rMPwaimEa6F2GoOERxv1o948UgZYtDXqC4twlXkn9H1
 cfePMySUC6czkSv3WoGSsC5qB/Le9LbDmzUql2RA18xNwI5+H0Bfv4NjJRK+GRZ5lYTMrrUIWX1
 XzP2c2Nan1FYjyOs=
X-Received: by 2002:a05:600c:511b:b0:3da:2ba4:b97 with SMTP id
 o27-20020a05600c511b00b003da2ba40b97mr4280072wms.19.1676992877202; 
 Tue, 21 Feb 2023 07:21:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/QrQGuFBPf5gxXQoUxMANFCFruy3AS1JElOqiXzCY86ldNaENH0IlnEaoVuNMm9hYkMah1yg==
X-Received: by 2002:a05:600c:511b:b0:3da:2ba4:b97 with SMTP id
 o27-20020a05600c511b00b003da2ba40b97mr4280056wms.19.1676992876943; 
 Tue, 21 Feb 2023 07:21:16 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003e896d953a8sm42195wms.17.2023.02.21.07.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:21:16 -0800 (PST)
Date: Tue, 21 Feb 2023 15:21:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: Disable migration-test
Message-ID: <Y/Thas4efx14JsBi@work-vm>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221132726.2892383-1-peter.maydell@linaro.org>
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
> The migration-test is annoyingly flaky. Examples:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> (a FreeBSD job)
>   32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 
> on a local macos x86 box:
> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_
> str_equal(status, "failed")) ERROR
>  34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-i386: Failed to peek at channel
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> ▶  37/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>  37/621 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test                     ERROR          174.37s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> I've seen this on other CI jobs as well, but Gitlab's UI makes it
> pretty much impossible to re-find failed jobs, since you can't
> search for them by failure reason at all.
> 
> I've also seen this fail on the OpenBSD vm build.
> 
> I've seen the migration-test hang on the s390 private CI runner
> in such a way that even though the CI job has timed out, the
> stale QEMU and migration-test processes are still lying around on
> the host.
> 
> I've complained about these before, but nobody has either investigated
> or suggested improvements to the test program that would let us gather
> more information about what's happening when these fail.
>  https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/

Damn this is really going to impact the stability of migration if we
don't regularly test.
But fundamentally, I've never been able to debug much of the reports
that come from flakyness in gitlab ci; we're not getting the most basic
information like which subtest or where we're upto in the test which
makes it very very hard to debug.

Dave

> So this is the big hammer: disable the test entirely, so that we
> don't keep getting CI job intermittent failures because of it.
> When somebody has time to investigate, we can fix the underlying
> cause and reenable the job.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is an "if you don't want this, propose something else" patch :-)
> ---
>  tests/qtest/meson.build | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c24..0e362fcb1e0 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -11,6 +11,12 @@ slow_qtests = {
>    'test-hmp' : 120,
>  }
>  
> +# Temporarily disabled tests can be listed here
> +qtests_disabled = [
> +  # This test is currently flaky and fails intermittently
> +  'migration-test',
> +]
> +
>  qtests_generic = [
>    'cdrom-test',
>    'device-introspect-test',
> @@ -343,6 +349,9 @@ foreach dir : target_dirs
>    endif
>  
>    foreach test : target_qtests
> +    if test in qtests_disabled
> +      continue
> +    endif
>      # Executables are shared across targets, declare them only the first time we
>      # encounter them
>      if not qtest_executables.has_key(test)
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


