Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C911C508744
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:45:07 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8le-0002le-UH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8kM-0001QY-C2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8kK-0001q1-Fi
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650455023;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LfJnzvIp4OsWPhgRTzYU6f5nTel7OUyBt7Z19eixxa0=;
 b=JYwdFNF7jZtWLPr3zDEAwsdFBj4LmZb8B/DRS4AkfVOIoaYzZntxvYrCL2qYNctD8hLSYC
 LyBn7FacISELXoqURxAtYddkEshM437ztnhbY0//O6/8VZ2ISsTqFOyli0p/KvdcmC/T6Y
 ignHoYHUqwAmY9i665uej7xCwNfQ2pU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-CMHUfU0sNdy2o1I6KSTFcw-1; Wed, 20 Apr 2022 07:43:42 -0400
X-MC-Unique: CMHUfU0sNdy2o1I6KSTFcw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E5ED1C05132
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:43:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DB5572334;
 Wed, 20 Apr 2022 11:43:41 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:43:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 19/19] tests: Add postcopy preempt tests
Message-ID: <Yl/x69PnL3RkzTnz@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-20-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-20-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
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

On test naming again I think we want these four tests to have names

    /migration/postcopy/preempt/plain
    /migration/postcopy/preempt/tls/psk
    /migration/postcopy/preempt/recovery/plain
    /migration/postcopy/preempt/recovery/tls/psk


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


