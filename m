Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2A5135A4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:48:35 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4VW-0004TV-KU
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4Ta-000246-SJ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4TZ-0003tK-6Z
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651153592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRn5QhL1ifQ5BioJlxRenZCe2G4uA45WSGUeEm56218=;
 b=LJxi+2pxk96HETkoAYx6Um7/Ab+0QDLrDAt/msB7zuT02dVvo2efPyU6RLEcDVzuSFRV8Y
 8ykFJFHFdAwsgfxveAltlcfVFRYRzjsfPtJGev/odEyX9cuDU6i/UQEgRXaNEuKxM9sTs+
 BYJaULfKo37Tj5ybf2xvHloCgvI3oGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-0Nd2g1S2P42OsfEiAnLkJw-1; Thu, 28 Apr 2022 09:46:31 -0400
X-MC-Unique: 0Nd2g1S2P42OsfEiAnLkJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D64321014A64
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 13:46:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB825814B;
 Thu, 28 Apr 2022 13:46:26 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:46:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 3/9] tests: add migration tests of TLS with PSK
 credentials
Message-ID: <20220428134625.btsehtdftmwvs76m@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-4-berrange@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Tue, Apr 26, 2022 at 05:00:42PM +0100, Daniel P. Berrangé wrote:
> This validates that we correctly handle migration success and failure
> scenarios when using TLS with pre shared keys.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/meson.build             |   7 +-
>  tests/qtest/migration-test.c        | 159 +++++++++++++++++++++++++++-
>  tests/unit/crypto-tls-psk-helpers.c |  18 +++-
>  tests/unit/crypto-tls-psk-helpers.h |   1 +
>  4 files changed, 177 insertions(+), 8 deletions(-)
> 

>  
> -static void test_precopy_unix(void)
> +static void test_precopy_unix_plain(void)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
>      MigrateCommon args = {
> @@ -922,6 +1020,19 @@ static void test_precopy_unix(void)
>      test_precopy_common(&args);
>  }
>  
> +static void test_precopy_unix_tls_psk(void)
> +{

This function is unguarded...

> +    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> +    MigrateCommon args = {
> +        .connect_uri = uri,
> +        .listen_uri = uri,
> +        .start_hook = test_migrate_tls_psk_start_match,
> +        .finish_hook = test_migrate_tls_psk_finish,
> +    };
> +
> +    test_precopy_common(&args);
> +}
> +
>  static void test_precopy_unix_dirty_ring(void)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> @@ -1026,7 +1137,7 @@ static void test_xbzrle_unix(void)
>      test_xbzrle(uri);
>  }
>  
> -static void test_precopy_tcp(void)
> +static void test_precopy_tcp_plain(void)
>  {
>      MigrateCommon args = {
>          .listen_uri = "tcp:127.0.0.1:0",
> @@ -1035,6 +1146,34 @@ static void test_precopy_tcp(void)
>      test_precopy_common(&args);
>  }
>  
> +#ifdef CONFIG_GNUTLS
> +static void test_precopy_tcp_tls_psk_match(void)

...while everything else is #ifdef CONFIG_GNUTLS...

>  static void *test_migrate_fd_start_hook(QTestState *from,
>                                          QTestState *to)
>  {
> @@ -1497,8 +1636,20 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/postcopy/unix", test_postcopy);
>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
>      qtest_add_func("/migration/bad_dest", test_baddest);
> -    qtest_add_func("/migration/precopy/unix", test_precopy_unix);
> -    qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
> +    qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
> +#ifdef CONFIG_GNUTLS
> +    qtest_add_func("/migration/precopy/unix/tls/psk",
> +                   test_precopy_unix_tls_psk);
> +#endif /* CONFIG_GNUTLS */
> +
> +    qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
> +#ifdef CONFIG_GNUTLS
> +    qtest_add_func("/migration/precopy/tcp/tls/psk/match",
> +                   test_precopy_tcp_tls_psk_match);

...including use of the function.

> +    qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
> +                   test_precopy_tcp_tls_psk_mismatch);
> +#endif /* CONFIG_GNUTLS */
> +

With the missing #ifdef added in,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


