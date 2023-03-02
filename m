Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C96A87FB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:38:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmsA-00025d-Fz; Thu, 02 Mar 2023 12:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXms7-00024w-98
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:37:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXms5-0008EY-DM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677778653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2V1DNWw9JWarKnBJJe+tGEVA+rttNoJrDCC8TGy6+g=;
 b=FU2PrwTO848toKf+Cy71A+z2XW4RTtmru1NTu2h4MSIC1v3vvytrShMgWBgSBs4sD+cOeP
 VgQeW2ISbXHr5pHg/WXqjX0O4NjF8+UF1iuDw2eCw0YbMfjjbBNrO2mJ1+Fe+W1Hk1Cclk
 siL90n6mAOVqHLAJ2Ovjb9QfZNgKgCc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-0IvQFo7jM0utmhsBgLyxDw-1; Thu, 02 Mar 2023 12:37:32 -0500
X-MC-Unique: 0IvQFo7jM0utmhsBgLyxDw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m15-20020adfa3cf000000b002be0eb97f4fso3341389wrb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 09:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2V1DNWw9JWarKnBJJe+tGEVA+rttNoJrDCC8TGy6+g=;
 b=n2d2PiTn1i/kkCqaZW/3pOuhj6GrQ3E4vI5uRGEzDbNLAmDTmtEQJGc2fbb3LnqI80
 IApQ8e/x8Kf2qKF6ZX44B7aT78OdEYoEly8yqL0OFzeqioAaOm4CQu5u/UwDCybOFwhP
 yvlte9eGAjNjGW5zYLf8/NyBKYCxnEDomYw2bvvqoTNqUABRHo+A9MZax6qXfwxfoejU
 5Q88kKan2Z1riz2KwCau0RclwMob+uTMF3iC3IMm13Z5mb7yXAC1XuqIcMK6ECI461Df
 ApLuCOq1h7zshhBeUV1olqXU1TBQAJaE9+Mjls+kWk7br4aC4GHbYPoQU/iO2IRMtyNh
 vCjg==
X-Gm-Message-State: AO0yUKVxHIeaLBcRqzafqE1lncGBtM7lSz1/4fc+M6cuOtB0aJOCmZMi
 I99TUbeJGyuZUoYXeYBmamk2kIXqZkjb76YS8GQjIvj2+lyBD3NJPzu8b020rNc07hXKazTnh76
 kW7hlczEU5845z9A=
X-Received: by 2002:adf:cd8f:0:b0:2c5:4c7d:53ab with SMTP id
 q15-20020adfcd8f000000b002c54c7d53abmr7613581wrj.20.1677778651121; 
 Thu, 02 Mar 2023 09:37:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+kq4tnhEtWu8wk96gm00oMQU2V4Hwr2G4FIjRt06rUBXq+vBvFXjv7NIZxC91OJtOt//qxQA==
X-Received: by 2002:adf:cd8f:0:b0:2c5:4c7d:53ab with SMTP id
 q15-20020adfcd8f000000b002c54c7d53abmr7613572wrj.20.1677778650831; 
 Thu, 02 Mar 2023 09:37:30 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003e203681b26sm161350wmo.29.2023.03.02.09.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:37:30 -0800 (PST)
Date: Thu, 2 Mar 2023 17:37:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZADe2HMuRNUwCVxW@work-vm>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302172211.4146376-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> migration-test has been flaky for a long time, both in CI and
> otherwise:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> (a FreeBSD job)
>   32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 
> on a local macos x86 box:
> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
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
> 
> In the cases where I've looked at the underlying log, this seems to
> be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
> specific subtest by default until somebody can track down the
> underlying cause. Enthusiasts can opt back in by setting
> QEMU_TEST_FLAKY_TESTS=1 in their environment.
> 
> We might need to disable more parts of this test if this isn't
> sufficient to fix the flakiness.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a slightly more targeted variation on my original
> modest proposal.
> ---
>  tests/qtest/migration-test.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 109bc8e7b13..d4ab3934ed2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2572,8 +2572,14 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
>      qtest_add_func("/migration/multifd/tcp/plain/none",
>                     test_multifd_tcp_none);
> -    qtest_add_func("/migration/multifd/tcp/plain/cancel",
> -                   test_multifd_tcp_cancel);
> +    /*
> +     * This test is flaky and sometimes fails in CI and otherwise:
> +     * don't run unless user opts in via environment variable.
> +     */
> +    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
> +        qtest_add_func("/migration/multifd/tcp/plain/cancel",
> +                       test_multifd_tcp_cancel);
> +    }

OK, that seems reasonably selective.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


(Cancel tests are always a pain; they can be racy with the test
completing before you fire the cancel; or 'cancel' itself
can hit lots of races inside the migration code if it's not written
carefully enough to expect a cancel).

Dave


>      qtest_add_func("/migration/multifd/tcp/plain/zlib",
>                     test_multifd_tcp_zlib);
>  #ifdef CONFIG_ZSTD
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


