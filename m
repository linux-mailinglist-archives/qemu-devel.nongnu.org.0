Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C10508743
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:44:12 +0200 (CEST)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8kl-0001Hl-EG
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8j2-0000Ds-H0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8iz-0001kG-83
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650454940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=srYFGktOFKlc4jTpeRFXlmE8a+izWwAo7N7rjA3Bn3g=;
 b=DU92cAlaNjE2MW4V9/amhVCzNDfvW8BGFzzc4Qdt4FKxbNQP0KVQzlgojHBU8Qi4CjfUpy
 CHts4mbF5UkTXDa8vXROmo4siwLxLMz3S8PXkT2FXvtyBBe1+GhTndDBgCkUSALzSl3AbG
 x1gOcDc1GBNrjM+IU+j5iNwkuX0rGyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-VYcVggbfOdy01pwey71SVw-1; Wed, 20 Apr 2022 07:42:19 -0400
X-MC-Unique: VYcVggbfOdy01pwey71SVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFF051014A73
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:42:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CDA440E80E2;
 Wed, 20 Apr 2022 11:42:17 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:42:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 18/19] tests: Add postcopy tls recovery migration test
Message-ID: <Yl/xl5zrzmX5urH9@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-19-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-19-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, Mar 31, 2022 at 11:08:56AM -0400, Peter Xu wrote:
> It's easy to build this upon the postcopy tls test.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 80c4244871..7288c64e97 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1058,15 +1058,15 @@ static void test_postcopy_tls(void)
>      test_postcopy_common(&args);
>  }
>  
> -static void test_postcopy_recovery(void)
> +static void test_postcopy_recovery_common(MigrateStart *args)
>  {
> -    MigrateStart args = {
> -        .hide_stderr = true,
> -    };
>      QTestState *from, *to;
>      g_autofree char *uri = NULL;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    /* Always hide errors for postcopy recover tests since they're expected */
> +    args->hide_stderr = true;
> +
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>  
> @@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to, &args);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy_recovery(void)
> +{
> +    MigrateStart args = { };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +static void test_postcopy_recovery_tls(void)
> +{
> +    MigrateStart args = { .postcopy_tls = true };
> +
> +    test_postcopy_recovery_common(&args);
>  }
>  
>  static void test_baddest(void)
> @@ -2164,6 +2178,7 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
>  #ifdef CONFIG_GNUTLS
>      qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
> +    qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);

It is important that a test name is *NOT* a prefix for another
test name, as that makes it harder to selectively run individual
tests with '-p' as it does a pattern match.

Bearing in mind my comments on the previous patch, I think we want

    /migration/postcopy/recovery/plain
    /migration/postcopy/recovery/tls/psk

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


