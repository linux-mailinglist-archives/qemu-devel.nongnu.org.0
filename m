Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2415C04C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:54:47 +0200 (CEST)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2zl-00081T-V5
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob2wq-0005lB-6Y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob2wm-00083H-0S
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663779099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cv8/OcX8DBSgjqnCmUvEUwwOWXH7obiIC3repeV4agg=;
 b=ZS9lSxlMEI1oNeF3zFrl/PZrv6cvSiw/HAgyjvbHsQJTn1pY70zttQ9rg3D2VRvV9UiTc6
 uol3iaGVTjedluIElb1qozSL6Z10Y4BJskPoryBq+HfjWJZANHLukdJP4IqUZg9kdCJooQ
 gx3/P0ABAUGVvvNaeQf/lAfK0hq0HHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-HxaZSxb4P4a5Q2frg1Bs2g-1; Wed, 21 Sep 2022 12:51:37 -0400
X-MC-Unique: HxaZSxb4P4a5Q2frg1Bs2g-1
Received: by mail-wm1-f71.google.com with SMTP id
 p9-20020a05600c23c900b003b48dc0cef1so1828041wmb.1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Cv8/OcX8DBSgjqnCmUvEUwwOWXH7obiIC3repeV4agg=;
 b=K/4F9rEaOiNjsxRXhJsEI/9O8d2zdY5sSlvFN4lz6YMvoIU2IF45jGSmB44KXvZr9Y
 2WXtkdVR5cH9NG4Sbx+iehWGxZRvHp1AJEaCIqrNPU35R6d2rtvV+fj+Gm409NjJWqir
 LyAmiivbJ6wKXoWZHsPGudIHltbMp9o7QWVmYiCK1H+wZjNJueCyKKUqf5ZAiUZecSf1
 jLq/aVoraKi7NeZAKa1/JX+RemS71imOgM4RpEJZpJwglzmRSlrx0FKKzD7reYKgsw5a
 NNpo1r0621E1/EgLPh7SXn95xtCzqH1Ivia9JvqNPdFLp0p15nR/K/fJ+kXuUtGSncCd
 RCXw==
X-Gm-Message-State: ACrzQf0iZzm5d8hsvZCfGddjUBpx/ekYdItcVylI+7VncLlCrMcOWCVg
 GMwwUgoLQWLZ8SQrgVW4bfj/CszAKqigkbcTxG5XI9qIrUAXRGxfcu84t2P2J+xvwi9ckVwz34y
 2YL4m3/o8OWRIwmI=
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id
 v4-20020a5d59c4000000b0022b237c3e23mr2638189wry.291.1663779096405; 
 Wed, 21 Sep 2022 09:51:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/TilwLPnuXFoFT0nPwezHy5It9dKvKCfAEWZmusqNX19vGfSnmAe23vNSuoOcZiSl4xnDxg==
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id
 v4-20020a5d59c4000000b0022b237c3e23mr2638162wry.291.1663779096033; 
 Wed, 21 Sep 2022 09:51:36 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003b49ab8ff53sm3844839wms.8.2022.09.21.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:51:35 -0700 (PDT)
Date: Wed, 21 Sep 2022 17:51:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, berrange@redhat.com
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
Message-ID: <YytBFdDoLVgkgqIX@work-vm>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920103159.1865256-36-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Some migration test cases use TLS to communicate, but they fail on
> Windows with the following error messages:
> 
>   qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
>   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
>   query-migrate shows failed migration: TLS handshake failed: Error in the pull function.
> 
> Disable them temporarily.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> I am not familar with the gnutls and simply enabling the gnutls debug
> output does not give me an immedidate hint on why it's failing on
> Windows. Disable these cases for now until someone or maintainers
> who may want to test this on Windows.

Copying in Dan Berrange, he's our expert on weird TLS failures.

Dave

> 
> (no changes since v1)
> 
>  tests/qtest/migration-test.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index aedd9ddb72..dbee9b528a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)
>  }
>  
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_unix_tls_psk(void)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> @@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)
>  
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>  
>  #ifdef CONFIG_TASN1
>  static void test_precopy_unix_tls_x509_default_host(void)
> @@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)
>  }
>  
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args = {
> @@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void)
>  
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>  
>  static void test_precopy_tcp_tls_psk_mismatch(void)
>  {
> @@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)
>  #endif
>  
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>                                               QTestState *to)
> @@ -1937,6 +1942,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>      test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
>      return test_migrate_tls_psk_start_match(from, to);
>  }
> +#endif /* _WIN32 */
>  
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
> @@ -1988,6 +1994,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
>  }
>  #endif /* CONFIG_TASN1 */
>  
> +#ifndef _WIN32
>  static void test_multifd_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args = {
> @@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void)
>      };
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>  
>  static void test_multifd_tcp_tls_psk_mismatch(void)
>  {
> @@ -2497,8 +2505,10 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/precopy/unix/tls/psk",
>                     test_precopy_unix_tls_psk);
> +#endif
>  
>      if (has_uffd) {
>          /*
> @@ -2524,8 +2534,10 @@ int main(int argc, char **argv)
>  
>      qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/precopy/tcp/tls/psk/match",
>                     test_precopy_tcp_tls_psk_match);
> +#endif
>      qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
>                     test_precopy_tcp_tls_psk_mismatch);
>  #ifdef CONFIG_TASN1
> @@ -2569,8 +2581,10 @@ int main(int argc, char **argv)
>                     test_multifd_tcp_zstd);
>  #endif
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>      qtest_add_func("/migration/multifd/tcp/tls/psk/match",
>                     test_multifd_tcp_tls_psk_match);
> +#endif
>      qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
>                     test_multifd_tcp_tls_psk_mismatch);
>  #ifdef CONFIG_TASN1
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


