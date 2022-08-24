Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0E5A01A2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:55:26 +0200 (CEST)
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvXB-00013V-MV
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvV8-0007lY-Nx
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvV6-0007xS-MC
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661367195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HFp56oMQPN8zZM4t4WgTSeA8aX7tZ+Vc4PRJsed6Wk=;
 b=BgbbMKT2MUnjGvNFFKCaqg5WWUl2xY112L9kbxmMq6wS+Wva/CPbFduVsZmTqib75NIZaU
 AczVZMD2P7Xbj/VU5+NTuv1LP1MzAQlV3WKOYx2s4/V7LBoXZch5BoQPdD3WlXFtvKJc+l
 3NFWkXl8IaanotOCBfkJSVNPIwy/CQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-c_jxp8h3Omm7LnoHCa3y7Q-1; Wed, 24 Aug 2022 14:53:14 -0400
X-MC-Unique: c_jxp8h3Omm7LnoHCa3y7Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso9754380wmq.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 11:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/HFp56oMQPN8zZM4t4WgTSeA8aX7tZ+Vc4PRJsed6Wk=;
 b=8DkWBcopuG+pdyFc1DlXL9HF5nVJr5VUJw3n+5SNtnK+RZ/5gEmrgbbqc7tWEhsRIE
 p9SoFXK+OObNQpBeSkAaG6GZBH7RiCt05RLpcJ7hz5e8lj8uWT2w/sF+HWQblvahQHXD
 HtAuiI8cM6CNEXsFRCgctXHDqk10SoYxTg13gjvfWu9mo/CqzRq5TrAJV2KA573dcr2P
 LihhHu6ps8r/lYcVjsDbvoqfQ1EROKZJepBfdn4fabzD9Rf1VhulOls2yVOwI/1FoPHU
 GLHuV8U3ELNxrEGhAf4bA08k6iS2I7vn9rNCHFRIvebH+d+q0JWXoB5mr68T5VNErX83
 pxWQ==
X-Gm-Message-State: ACgBeo1yHqiZBE587Bwz2wC6CUUtZ/uJkT3EGRPDut+yp5tD41z+IY42
 oharLyROA4WV3Kuy+rbarZO0G3yBFK5TzbFZ6tZUEDKci6Qa2dwgt4648TQ0KsH13KNeNctqDsT
 yICJEoad0Eob89WA=
X-Received: by 2002:a5d:64ca:0:b0:225:4a7f:6e91 with SMTP id
 f10-20020a5d64ca000000b002254a7f6e91mr286655wri.133.1661367193316; 
 Wed, 24 Aug 2022 11:53:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4DJNG3bFI0xRy6DqIiNQV0tix0EDCyfjDH1pZrORV283g00Ha0bWVpd2iZ4Wj+vSkQ80aQxw==
X-Received: by 2002:a5d:64ca:0:b0:225:4a7f:6e91 with SMTP id
 f10-20020a5d64ca000000b002254a7f6e91mr286647wri.133.1661367193011; 
 Wed, 24 Aug 2022 11:53:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6d46000000b00225221fd286sm17663954wri.114.2022.08.24.11.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 11:53:12 -0700 (PDT)
Date: Wed, 24 Aug 2022 19:53:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 37/51] tests/qtest: migration-test: Disable IO
 redirection for win32
Message-ID: <YwZzlkoJOFxs7Uyy@work-vm>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-38-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824094029.1634519-38-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> On Windows the QEMU executable is created via CreateProcess() and IO
> redirection does not work, so we need to set MigrateStart::hide_stderr
> to false to disable adding IO redirection to the command line.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Isn't it easier just to change the one place that tests this?

Dave

> ---
> 
>  tests/qtest/migration-test.c | 39 +++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 2ae7498d5d..125d48d855 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -53,6 +53,17 @@ static bool uffd_feature_thread_id;
>   */
>  #define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
>  
> +/*
> + * On Windows the QEMU executable is created via CreateProcess() and IO
> + * redirection does not work, so we need to set MigrateStart::hide_stderr
> + * to false to disable adding IO redirection to the command line.
> + */
> +#ifndef _WIN32
> +# define HIDE_STDERR true
> +#else
> +# define HIDE_STDERR false
> +#endif
> +
>  #if defined(__linux__)
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
> @@ -1186,7 +1197,7 @@ static void test_postcopy_recovery_common(MigrateCommon *args)
>      g_autofree char *uri = NULL;
>  
>      /* Always hide errors for postcopy recover tests since they're expected */
> -    args->start.hide_stderr = true;
> +    args->start.hide_stderr = HIDE_STDERR;
>  
>      if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
> @@ -1287,7 +1298,7 @@ static void test_postcopy_preempt_all(void)
>  static void test_baddest(void)
>  {
>      MigrateStart args = {
> -        .hide_stderr = true
> +        .hide_stderr = HIDE_STDERR
>      };
>      QTestState *from, *to;
>  
> @@ -1410,7 +1421,7 @@ static void test_precopy_unix_tls_x509_default_host(void)
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .connect_uri = uri,
>          .listen_uri = uri,
> @@ -1526,7 +1537,7 @@ static void test_precopy_tcp_tls_psk_mismatch(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "tcp:127.0.0.1:0",
>          .start_hook = test_migrate_tls_psk_start_mismatch,
> @@ -1564,7 +1575,7 @@ static void test_precopy_tcp_tls_x509_mismatch_host(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "tcp:127.0.0.1:0",
>          .start_hook = test_migrate_tls_x509_start_mismatch_host,
> @@ -1590,7 +1601,7 @@ static void test_precopy_tcp_tls_x509_hostile_client(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "tcp:127.0.0.1:0",
>          .start_hook = test_migrate_tls_x509_start_hostile_client,
> @@ -1616,7 +1627,7 @@ static void test_precopy_tcp_tls_x509_reject_anon_client(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "tcp:127.0.0.1:0",
>          .start_hook = test_migrate_tls_x509_start_reject_anon_client,
> @@ -1747,7 +1758,7 @@ static void test_validate_uuid_error(void)
>      MigrateStart args = {
>          .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
>          .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
> -        .hide_stderr = true,
> +        .hide_stderr = HIDE_STDERR,
>      };
>  
>      do_test_validate_uuid(&args, true);
> @@ -1757,7 +1768,7 @@ static void test_validate_uuid_src_not_set(void)
>  {
>      MigrateStart args = {
>          .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
> -        .hide_stderr = true,
> +        .hide_stderr = HIDE_STDERR,
>      };
>  
>      do_test_validate_uuid(&args, false);
> @@ -1767,7 +1778,7 @@ static void test_validate_uuid_dst_not_set(void)
>  {
>      MigrateStart args = {
>          .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
> -        .hide_stderr = true,
> +        .hide_stderr = HIDE_STDERR,
>      };
>  
>      do_test_validate_uuid(&args, false);
> @@ -1990,7 +2001,7 @@ static void test_multifd_tcp_tls_psk_mismatch(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "defer",
>          .start_hook = test_migrate_multifd_tcp_tls_psk_start_mismatch,
> @@ -2038,7 +2049,7 @@ static void test_multifd_tcp_tls_x509_mismatch_host(void)
>       */
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "defer",
>          .start_hook = test_migrate_multifd_tls_x509_start_mismatch_host,
> @@ -2062,7 +2073,7 @@ static void test_multifd_tcp_tls_x509_reject_anon_client(void)
>  {
>      MigrateCommon args = {
>          .start = {
> -            .hide_stderr = true,
> +            .hide_stderr = HIDE_STDERR,
>          },
>          .listen_uri = "defer",
>          .start_hook = test_migrate_multifd_tls_x509_start_reject_anon_client,
> @@ -2088,7 +2099,7 @@ static void test_multifd_tcp_tls_x509_reject_anon_client(void)
>  static void test_multifd_tcp_cancel(void)
>  {
>      MigrateStart args = {
> -        .hide_stderr = true,
> +        .hide_stderr = HIDE_STDERR,
>      };
>      QTestState *from, *to, *to2;
>      QDict *rsp;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


