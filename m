Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95B5A019E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:53:55 +0200 (CEST)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvVh-0007yo-03
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvRs-0004Rv-0t
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvRl-0007Kv-7h
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ugyNQAX5Xg2PIN6d3Eh3qqcZXusTXibg2NOwhlon/Ek=;
 b=idiPG8v4dqtBtqPH4U2UGm3L9EMXzyk3jdjVbj8/+yOAkius+fhaxF984jgpHNQkucv7Kk
 ze6Qm/QBXDovQQuMzt3mVR62Is5hvPfsr1AdjFAP2N+sfTLpXtxslIea+ka9QDSvq57CFt
 ko7Tdreolu/m/W+PlN2P7UVAzISIC+A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-5ParFGpjMFGMX2DXDwGVuQ-1; Wed, 24 Aug 2022 14:49:45 -0400
X-MC-Unique: 5ParFGpjMFGMX2DXDwGVuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so1203417wma.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 11:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ugyNQAX5Xg2PIN6d3Eh3qqcZXusTXibg2NOwhlon/Ek=;
 b=zw4LLAyUF9AudokfQEjITTDq/Qg9ZbpoWqev29wthPEOg1zAVMxMRM6slZ/MrJRWWc
 sFuD+MJ+dYQQCx5xwwzfGpQR5Fcp3KvWQMxBi5MJXzxpx0WqmJVth2LtXeRVTbQjX/ae
 lhyjGUx1P4qPOSeZUnt3mE1nuedbng0OxHOYTL0f2l8fNq+KXfrtmwOL7NXeLAwikC9m
 KWMM/uwaElkLJqKyYNz7bDPgUMyGKtGJEdIlWekCXAt8zVxhaxqq4BjibyW9HDnAbbjU
 mGtxTwBRlbIPYspDvKhMcOrkaELLLkLqG1vLq1MUm13v39gyfKCTRQMlW8Zp4JG9iyR9
 Mwnw==
X-Gm-Message-State: ACgBeo3ZRB6V79pkgoKIICMMe3CQZhqSzX0WOnrgyrLnLM7tMy6o9twl
 UCyl7ezaGH5YK74Bf4e9CIxE2VTCLb5TjiYf54PhMXUm8mh/BbHEfSejeIs35XGseGPbqs2qo7K
 BcBKsNee6JtMf7yA=
X-Received: by 2002:adf:dc83:0:b0:225:738e:bb54 with SMTP id
 r3-20020adfdc83000000b00225738ebb54mr277774wrj.513.1661366984523; 
 Wed, 24 Aug 2022 11:49:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4FnwGIko1GTKEFsetRz09p0afRhVB7p5eJa0M2zBvIDR9J+pI2tiFsiXdxw/tqon1dW2VuZw==
X-Received: by 2002:adf:dc83:0:b0:225:738e:bb54 with SMTP id
 r3-20020adfdc83000000b00225738ebb54mr277762wrj.513.1661366984311; 
 Wed, 24 Aug 2022 11:49:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002250f9abdefsm20522968wrw.117.2022.08.24.11.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 11:49:43 -0700 (PDT)
Date: Wed, 24 Aug 2022 19:49:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 21/51] tests/qtest: migration-test: Skip running
 test_migrate_fd_proto on win32
Message-ID: <YwZyxTwAseBY1GRT@work-vm>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-22-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824094029.1634519-22-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> The test case 'test_migrate_fd_proto' calls socketpair() which does
> not exist on win32. Exclude it. The helper function wait_command_fd()
> is not needed anymore, hence exclude it too.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
>  tests/qtest/migration-helpers.h | 2 ++
>  tests/qtest/migration-helpers.c | 2 ++
>  tests/qtest/migration-test.c    | 4 ++++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
> index 59561898d0..db0684de48 100644
> --- a/tests/qtest/migration-helpers.h
> +++ b/tests/qtest/migration-helpers.h
> @@ -17,8 +17,10 @@
>  
>  extern bool got_stop;
>  
> +#ifndef _WIN32
>  G_GNUC_PRINTF(3, 4)
>  QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
> +#endif
>  
>  G_GNUC_PRINTF(2, 3)
>  QDict *wait_command(QTestState *who, const char *command, ...);
> diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
> index c6fbeb3974..f6f3c6680f 100644
> --- a/tests/qtest/migration-helpers.c
> +++ b/tests/qtest/migration-helpers.c
> @@ -34,6 +34,7 @@ static void check_stop_event(QTestState *who)
>      }
>  }
>  
> +#ifndef _WIN32
>  /*
>   * Events can get in the way of responses we are actually waiting for.
>   */
> @@ -58,6 +59,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
>  
>      return ret;
>  }
> +#endif
>  
>  /*
>   * Events can get in the way of responses we are actually waiting for.
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index af9250750b..2ae7498d5d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1629,6 +1629,7 @@ static void test_precopy_tcp_tls_x509_reject_anon_client(void)
>  #endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */
>  
> +#ifndef _WIN32
>  static void *test_migrate_fd_start_hook(QTestState *from,
>                                          QTestState *to)
>  {
> @@ -1697,6 +1698,7 @@ static void test_migrate_fd_proto(void)
>      };
>      test_precopy_common(&args);
>  }
> +#endif /* _WIN32 */
>  
>  static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
>  {
> @@ -2531,7 +2533,9 @@ int main(int argc, char **argv)
>  #endif /* CONFIG_GNUTLS */
>  
>      /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
> +#ifndef _WIN32
>      qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
> +#endif
>      qtest_add_func("/migration/validate_uuid", test_validate_uuid);
>      qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
>      qtest_add_func("/migration/validate_uuid_src_not_set",
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


