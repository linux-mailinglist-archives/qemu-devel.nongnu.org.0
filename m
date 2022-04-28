Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419DF513602
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:02:55 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4jO-00029X-6j
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4gQ-0000WL-Sg
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4gO-0006j4-V6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651154388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlsbensU8PMWJFotnqIshrbZgN2D6jNQW8b7IAuCcF4=;
 b=ZW8s2PjURmchnKQrDVijCnNpP03goxR3aQOyIiC0UU+5mlGHpu5CDSy7u8/kzCEV2P9WfK
 O8LIyGkz8/XbzG3/9M1N4X2s7xRP3X3UMP3G+wddn0brljfiI5wTobeEbGNq/OFunWgKZ1
 KgU1baVSc9o2HSxIDHlOaIjIPonNTWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-Ddvnuu0xM_SDFd1Xpvl4NA-1; Thu, 28 Apr 2022 09:59:47 -0400
X-MC-Unique: Ddvnuu0xM_SDFd1Xpvl4NA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B39B680418C
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 13:59:46 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7814010E32;
 Thu, 28 Apr 2022 13:59:45 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:59:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 4/9] tests: add migration tests of TLS with x509
 credentials
Message-ID: <20220428135944.ye6ze4vj3j5volbv@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-5-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-5-berrange@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 05:00:43PM +0100, Daniel P. Berrangé wrote:
> This validates that we correctly handle migration success and failure
> scenarios when using TLS with x509 certificates. There are quite a few
> different scenarios that matter in relation to hostname validation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build                  |   1 +
>  tests/qtest/meson.build      |   5 +
>  tests/qtest/migration-test.c | 382 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 386 insertions(+), 2 deletions(-)
> 

> +
> +#ifdef CONFIG_TASN1
> +typedef struct {
> +    char *workdir;
> +    char *keyfile;
> +    char *cacert;
> +    char *servercert;
> +    char *serverkey;
> +    char *clientcert;
> +    char *clientkey;
> +} TestMigrateTLSX509Data;
> +
> +typedef struct {
> +    bool verifyclient;
> +    bool clientcert;
> +    bool hostileclient;
> +    bool authzclient;
> +    const char *certhostname;
> +    const char *certipaddr;
> +} TestMigrateTLSX509;
> +
> +static void *
> +test_migrate_tls_x509_start_common(QTestState *from,
> +                                   QTestState *to,
> +                                   TestMigrateTLSX509 *args)
> +{
> +    TestMigrateTLSX509Data *data = g_new0(TestMigrateTLSX509Data, 1);
> +    QDict *rsp;
> +
> +    data->workdir = g_strdup_printf("%s/tlscredsx5090", tmpfs);
> +    data->keyfile = g_strdup_printf("%s/key.pem", data->workdir);
> +
> +    data->cacert = g_strdup_printf("%s/ca-cert.pem", data->workdir);
> +    data->serverkey = g_strdup_printf("%s/server-key.pem", data->workdir);
> +    data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
> +    if (args->clientcert) {
> +        data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
> +        data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
> +    }
> +
> +    mkdir(data->workdir, 0700);
> +
> +    test_tls_init(data->keyfile);
> +    g_assert(link(data->keyfile, data->serverkey) == 0);

Is relying on side effects inside a g_assert() wise?  But not the
first time our testsuite has done it, so I guess you're okay.

> +    if (args->clientcert) {
> +        g_assert(link(data->keyfile, data->clientkey) == 0);
> +    }
> +
> +    TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
> +    if (args->clientcert) {
> +        TLS_CERT_REQ_SIMPLE_CLIENT(servercertreq, cacertreq,
> +                                   args->hostileclient ?
> +                                   QCRYPTO_TLS_TEST_CLIENT_HOSTILE_NAME :
> +                                   QCRYPTO_TLS_TEST_CLIENT_NAME,
> +                                   data->clientcert);
> +    }
> +
> +    TLS_CERT_REQ_SIMPLE_SERVER(clientcertreq, cacertreq,
> +                               data->servercert,
> +                               args->certhostname,
> +                               args->certipaddr);

The new macros from 2/9 came in handy.


> +
> +/*
> + * The normal case: match server's cert hostname against
> + * whatever host we were telling QEMU to connect to (if any)
> + */
> +static void *
> +test_migrate_tls_x509_start_default_host(QTestState *from,
> +                                         QTestState *to)
> +{
> +    TestMigrateTLSX509 args = {
> +        .verifyclient = true,
> +        .clientcert = true,
> +        .certipaddr = "127.0.0.1"
> +    };
> +    return test_migrate_tls_x509_start_common(from, to, &args);
> +}
> +
> +/*
> + * The unusual case: the server's cert is different from
> + * the address we're telling QEMU to connect to (if any),
> + * so we must give QEMU an explicit hostname to validate
> + */
> +static void *
> +test_migrate_tls_x509_start_override_host(QTestState *from,
> +                                          QTestState *to)

Useful comments, and good coverage of a number of cases.

> +{
> +    TestMigrateTLSX509 args = {
> +        .verifyclient = true,
> +        .clientcert = true,
> +        .certhostname = "qemu.org",
> +    };
> +    return test_migrate_tls_x509_start_common(from, to, &args);
> +}
> +
> +/*
> + * The unusual case: the server's cert is different from
> + * the address we're telling QEMU to connect to, and so we
> + * expect the client to reject the server
> + */
> +static void *
> +test_migrate_tls_x509_start_mismatch_host(QTestState *from,
> +                                          QTestState *to)
> +{
> +    TestMigrateTLSX509 args = {
> +        .verifyclient = true,
> +        .clientcert = true,
> +        .certipaddr = "10.0.0.1",
> +    };
> +    return test_migrate_tls_x509_start_common(from, to, &args);
> +}
> +
> +static void *
> +test_migrate_tls_x509_start_friendly_client(QTestState *from,
> +                                            QTestState *to)
> +{
> +    TestMigrateTLSX509 args = {
> +        .verifyclient = true,
> +        .clientcert = true,
> +        .authzclient = true,
> +        .certipaddr = "127.0.0.1",
> +    };
> +    return test_migrate_tls_x509_start_common(from, to, &args);
> +}
> +
> +static void *
> +test_migrate_tls_x509_start_hostile_client(QTestState *from,
> +                                           QTestState *to)

Worth a comment on these two?

> @@ -1020,6 +1251,21 @@ static void test_precopy_unix_plain(void)
>      test_precopy_common(&args);
>  }
>  
> +static void test_precopy_unix_dirty_ring(void)
> +{
> +    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> +    MigrateCommon args = {
> +        .start = {
> +            .use_dirty_ring = true,
> +        },
> +        .listen_uri = uri,
> +        .connect_uri = uri,
> +    };
> +
> +    test_precopy_common(&args);
> +}
> +

Looks like unintended code motion?  Should this be squashed into 3/9...

> +#ifdef CONFIG_GNUTLS
>  static void test_precopy_unix_tls_psk(void)

...especially since this is fixing the missing #ifdef I pointed out there?

>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> @@ -1033,19 +1279,38 @@ static void test_precopy_unix_tls_psk(void)
>      test_precopy_common(&args);
>  }
>  
> -static void test_precopy_unix_dirty_ring(void)
> +#ifdef CONFIG_TASN1
> +static void test_precopy_unix_tls_x509_default_host(void)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
>      MigrateCommon args = {
>          .start = {
> -            .use_dirty_ring = true,
> +            .hide_stderr = true,
>          },
> +        .connect_uri = uri,
>          .listen_uri = uri,
> +        .start_hook = test_migrate_tls_x509_start_default_host,
> +        .finish_hook = test_migrate_tls_x509_finish,
> +        .result = MIG_TEST_FAIL_DEST_QUIT_ERR,
> +    };

The code motion mixed in made this a bit harder to read.

> +
> +    test_precopy_common(&args);
> +}
> +
> +static void test_precopy_unix_tls_x509_override_host(void)
> +{
> +    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> +    MigrateCommon args = {
>          .connect_uri = uri,
> +        .listen_uri = uri,
> +        .start_hook = test_migrate_tls_x509_start_override_host,
> +        .finish_hook = test_migrate_tls_x509_finish,
>      };
>  
>      test_precopy_common(&args);
>  }
> +#endif /* CONFIG_TASN1 */
> +#endif /* CONFIG_GNUTLS */
>  
>  #if 0
>  /* Currently upset on aarch64 TCG */
> @@ -1172,6 +1437,97 @@ static void test_precopy_tcp_tls_psk_mismatch(void)
>  
>      test_precopy_common(&args);
>  }
> +
> +#ifdef CONFIG_TASN1
> +static void test_precopy_tcp_tls_x509_default_host(void)

> +static void test_precopy_tcp_tls_x509_reject_anon_client(void)
> +{
> +    MigrateCommon args = {
> +        .start = {
> +            .hide_stderr = true,
> +        },
> +        .listen_uri = "tcp:127.0.0.1:0",
> +        .start_hook = test_migrate_tls_x509_start_reject_anon_client,
> +        .finish_hook = test_migrate_tls_x509_finish,
> +        .result = MIG_TEST_FAIL,
> +    };
> +
> +    test_precopy_common(&args);
> +}
> +#endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */
>  
>  static void *test_migrate_fd_start_hook(QTestState *from,
> @@ -1640,6 +1996,12 @@ int main(int argc, char **argv)
>  #ifdef CONFIG_GNUTLS
>      qtest_add_func("/migration/precopy/unix/tls/psk",
>                     test_precopy_unix_tls_psk);
> +#ifdef CONFIG_TASN1
> +    qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
> +                   test_precopy_unix_tls_x509_default_host);
> +    qtest_add_func("/migration/precopy/unix/tls/x509/override-host",
> +                   test_precopy_unix_tls_x509_override_host);
> +#endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */
>  
>      qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
> @@ -1648,6 +2010,22 @@ int main(int argc, char **argv)
>                     test_precopy_tcp_tls_psk_match);
>      qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
>                     test_precopy_tcp_tls_psk_mismatch);
> +#ifdef CONFIG_TASN1
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/default-host",
> +                   test_precopy_tcp_tls_x509_default_host);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/override-host",
> +                   test_precopy_tcp_tls_x509_override_host);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/mismatch-host",
> +                   test_precopy_tcp_tls_x509_mismatch_host);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/friendly-client",
> +                   test_precopy_tcp_tls_x509_friendly_client);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/hostile-client",
> +                   test_precopy_tcp_tls_x509_hostile_client);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/allow-anon-client",
> +                   test_precopy_tcp_tls_x509_allow_anon_client);
> +    qtest_add_func("/migration/precopy/tcp/tls/x509/reject-anon-client",
> +                   test_precopy_tcp_tls_x509_reject_anon_client);
> +#endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */

Other than the potential mess with having to rebase the code motion of
test_precopy_unix_dirty_ring when fixing the #ifdef in 3, it looks
like these test additions are good.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


