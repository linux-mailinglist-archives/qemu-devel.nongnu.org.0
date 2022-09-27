Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C475EC79F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:26:26 +0200 (CEST)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCTX-0002il-VI
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBr1-0001Xn-GJ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBdn-0000ho-J5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664289175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NTQFM9fwS0ER3+4WuqpbllZYzVLHvNZXeFQgu9/Q3Qk=;
 b=XpX5dlCdxEzSIttl4wnXWNc2hqeI2wlXruBwVjZ8yv/DkH/2iye9UzuDZIfRfd9heGJf3U
 UCeftZFWCvCivgx/3IqUpnjcwDX35aurkHb8w4dwxrIEszbHAP0TSf48WNPaxc6VVkoeze
 weZ39HBtISfSRcACDE17zwhhJe9tbf4=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-2ao-eBOIOpaUtU8I1bEb3g-1; Tue, 27 Sep 2022 10:32:50 -0400
X-MC-Unique: 2ao-eBOIOpaUtU8I1bEb3g-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-126ebb05e8eso3732136fac.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=NTQFM9fwS0ER3+4WuqpbllZYzVLHvNZXeFQgu9/Q3Qk=;
 b=OWU3qune6jxvHYiSUQwpZ0Rhdkxj/6w005j2HKq51O0ZgqVWyQ0Oy5anlJUhg4zet2
 TtGwi8DQV62BB7gSRs3btctS4ZnKm5l8I4VBbqbW2vY1OXLySJ4KuGto3QAsg0u/X7ja
 lmaJj/bIT+uP4NlO1fizz4BM/9G+V6NYakPihRhwIlfWCS+xnYIMQBCGhX6QS54mLsBt
 yRkNZ8seeu5rhaRtufWAK+t6ASNOtfgu2ysnibxCi7lowdx+09hUwAOlgy1PjB/tlrF1
 FJenhgxeVtexySk83pxG6TyCU9v0AHDluPcXcre/JMs33AIHmcPW0cQvY0EvQHUTRmTB
 ho7w==
X-Gm-Message-State: ACrzQf1260UL+Ic7TDCBcxonARYtqzsQalD53OMCF5RukCA31DgzGIcX
 n0KGbbKoc9jGKwXEgzuJ65eqv/hv8E/QJCbWsQhtd/orofwvKKVwkFjIrQZDpJn9Qaxjn7Yu9Ou
 cBV5980vGfhpM6DIB0fTdz8kbghXVwBY=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr12588195otu.378.1664289166594; 
 Tue, 27 Sep 2022 07:32:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rU6zv/a+xfW7d5uIyNNjg5iqf4vm0mULxOxrrA8GODvOd/CZLkC1YnhaioRL7OYRHsbINEVOXJwmF6A/1wUQ=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr12588180otu.378.1664289166381; Tue, 27
 Sep 2022 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-51-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-51-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:32:35 +0400
Message-ID: <CAMxuvazWXg+qpNvhR6bDcS5XwrDN_2zd-6KDmQvGS7TPa+hTNA@mail.gmail.com>
Subject: Re: [PATCH v4 50/54] tests/qtest: migration-test: Skip running some
 TLS cases for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Sep 27, 2022 at 3:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
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
>
> (no changes since v1)

Please use g_test_skip() instead of #if blocks.

>
>  tests/qtest/migration-test.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 6f9fe13488..5c1aaa700e 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1402,6 +1402,7 @@ static void test_precopy_unix_dirty_ring(void)
>  }
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_unix_tls_psk(void)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> @@ -1414,6 +1415,7 @@ static void test_precopy_unix_tls_psk(void)
>
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  #ifdef CONFIG_TASN1
>  static void test_precopy_unix_tls_x509_default_host(void)
> @@ -1522,6 +1524,7 @@ static void test_precopy_tcp_plain(void)
>  }
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void test_precopy_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args = {
> @@ -1532,6 +1535,7 @@ static void test_precopy_tcp_tls_psk_match(void)
>
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  static void test_precopy_tcp_tls_psk_mismatch(void)
>  {
> @@ -1929,6 +1933,7 @@ static void test_multifd_tcp_zstd(void)
>  #endif
>
>  #ifdef CONFIG_GNUTLS
> +#ifndef _WIN32
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>                                               QTestState *to)
> @@ -1936,6 +1941,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
>      test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
>      return test_migrate_tls_psk_start_match(from, to);
>  }
> +#endif /* _WIN32 */
>
>  static void *
>  test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
> @@ -1987,6 +1993,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
>  }
>  #endif /* CONFIG_TASN1 */
>
> +#ifndef _WIN32
>  static void test_multifd_tcp_tls_psk_match(void)
>  {
>      MigrateCommon args = {
> @@ -1996,6 +2003,7 @@ static void test_multifd_tcp_tls_psk_match(void)
>      };
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>
>  static void test_multifd_tcp_tls_psk_mismatch(void)
>  {
> @@ -2498,8 +2506,10 @@ int main(int argc, char **argv)
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
> @@ -2525,8 +2535,10 @@ int main(int argc, char **argv)
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
> @@ -2570,8 +2582,10 @@ int main(int argc, char **argv)
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


