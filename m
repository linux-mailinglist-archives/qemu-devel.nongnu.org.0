Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2AF692448
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQX2A-0000i9-Ca; Fri, 10 Feb 2023 12:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQX27-0000hp-Oq
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQX25-0000JV-PJ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676049477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SHxzelXoafr87R74ZNA4AZlqUEoQ+/r7977XMf/cgk4=;
 b=aPAYzoikWuXwWjCir3EAXS47EHu39TdiCGIQu8GolB9Dgxuo+zpjvOBIHdCSu5srUB3pgC
 +2bjE/usEMyYxDO1D++td1JWnpqPP+rC2xN3dcUg3PHgfANGYflpKdL4hrR3mMDbyUfEYM
 XDbZ5x01oh1jL9LvyUwZXm/lzl7g4fU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-W_-baiy1PQiCnkrYm92Afg-1; Fri, 10 Feb 2023 12:17:50 -0500
X-MC-Unique: W_-baiy1PQiCnkrYm92Afg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47C803C0E46F;
 Fri, 10 Feb 2023 17:17:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EFBF2166B29;
 Fri, 10 Feb 2023 17:17:49 +0000 (UTC)
Date: Fri, 10 Feb 2023 17:17:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 14/14] tests/qtest: migration-test: Add tests for
 file-based migration
Message-ID: <Y+Z8Okng+HXXXI3j@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-15-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028103914.908728-15-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 01:39:14PM +0300, Nikolay Borisov wrote:
> Add basic tests for file-based migration as well as for the 'fixed-ram'
> feature.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  tests/qtest/migration-test.c | 46 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ef4427ff4d41..de877473f193 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -748,6 +748,7 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
>      cleanup("migsocket");
>      cleanup("src_serial");
>      cleanup("dest_serial");
> +    cleanup("migfile");
>  }
>  
>  #ifdef CONFIG_GNUTLS
> @@ -1359,6 +1360,14 @@ static void test_precopy_common(MigrateCommon *args)
>           * hanging forever if migration didn't converge */
>          wait_for_migration_complete(from);
>  
> +        /*
> +         * For file based migration the target must begin its migration after
> +         * the source has finished
> +         */
> +        if (strstr(args->connect_uri, "file:")) {
> +            migrate_incoming_qmp(to, args->connect_uri, "{}");
> +        }
> +
>          if (!got_stop) {
>              qtest_qmp_eventwait(from, "STOP");
>          }
> @@ -1514,6 +1523,39 @@ static void test_precopy_unix_xbzrle(void)
>      test_precopy_common(&args);
>  }
>  
> +static void test_precopy_unix_file(void)
> +{
> +    g_autofree char *uri = g_strdup_printf("file:%s/migfile", tmpfs);
> +    MigrateCommon args = {
> +        .connect_uri = uri,
> +        .listen_uri = "defer",
> +    };
> +
> +    test_precopy_common(&args);
> +}
> +
> +static void *
> +test_migrate_fixed_ram_start(QTestState *from,
> +                             QTestState *to)
> +{
> +    migrate_set_capability(from, "fixed-ram", true);
> +    migrate_set_capability(to, "fixed-ram", true);
> +
> +    return NULL;
> +}
> +
> +static void test_precopy_unix_fixed_ram(void)
> +{
> +    g_autofree char *uri = g_strdup_printf("file:%s/migfile", tmpfs);
> +    MigrateCommon args = {
> +        .connect_uri = uri,
> +        .listen_uri = "defer",
> +        .start_hook = test_migrate_fixed_ram_start,
> +    };
> +
> +    test_precopy_common(&args);
> +}
> +
>  static void test_precopy_tcp_plain(void)
>  {
>      MigrateCommon args = {
> @@ -2506,6 +2548,10 @@ int main(int argc, char **argv)
>                     test_precopy_unix_tls_psk);
>  #endif
>  
> +    qtest_add_func("/migration/precopy/unix/file", test_precopy_unix_file);
> +    qtest_add_func("/migration/precopy/unix/fixed-ram",
> +                   test_precopy_unix_fixed_ram);

Minor point '/unix' would indicate this is testing UNIX socket backend
for migration. The paths for the tests would be better as

    /migration/precopy/file/stream-ram
    /migration/precopy/file/fixed-ram

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


