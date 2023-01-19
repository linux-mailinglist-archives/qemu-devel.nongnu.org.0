Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045267363D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:00:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISdm-0004LY-R2; Thu, 19 Jan 2023 05:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISdk-0004Km-R4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISdi-0007H2-SK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674125965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Up4YrErBFv+vLIjcirAeD81qQKttsy0rS4W5bcdv5A=;
 b=GCDEKctt+BByGJc6W7Ni0eHcJcCUH/9K57lWAD4H77ZNZAFb5I9dP9Y/LHLdIuM3KXS4MQ
 hj59NV3JLwvUzLCEK472qdTKdXkY2SEF9U+bpR6MdN1M/MzejfuKzhDsO03xdncNGN9KHr
 SNBiaisKY2y4pc4S+MU4rvHQnCc+7UQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-X0hg1biSOcG0HipKaVyePQ-1; Thu, 19 Jan 2023 05:59:24 -0500
X-MC-Unique: X0hg1biSOcG0HipKaVyePQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso2763266wmb.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Up4YrErBFv+vLIjcirAeD81qQKttsy0rS4W5bcdv5A=;
 b=NDT0LFMdstjqGl66h5xzPu1NWQO9WawNmrrJhi2fCrwJ+OxDjrkDt9wG8V88mVoAZc
 bbEx+8xO5hHVz7gMaey0k4fsb3VefDm/YDa90qtzpyDitaHvWgyaPKT9quruakjot8Dc
 r+c6rkdQErKCWqT2Z0ppyLRvbQWG9iWqJP6GUu2XVG1cikDenn8tdaUtc2gN7csFmHMs
 n2WtNT6gfyuyeZFrP4UT7OSwcNFrEluhkkPNBgspGRPXo6edNCZ7fbMagcKPUWNk/JwA
 zvCY7hks2JCNtOVms+7G0YrK6LmrCUvaO3O3B4jgmtj/Sv2aluSIewmeQzbfTPhMNaRm
 2tOQ==
X-Gm-Message-State: AFqh2kqZFQPoaP8NloALMY3oOphildxnCqvFrbsJ9XPGXVyiZpLfp1sX
 tgZxK9QFKrDv8d2RsghE2tRg5ASFxipalqjA4gYYw1+0I/92ENGoIGldKuhl8JtME4hj34NBU9i
 LEn4/QSnDKsZnG10=
X-Received: by 2002:a5d:50d0:0:b0:2bd:c2d7:2700 with SMTP id
 f16-20020a5d50d0000000b002bdc2d72700mr9599704wrt.42.1674125963046; 
 Thu, 19 Jan 2023 02:59:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQ7akQCwh5BTGtMV57w/3s1+lfsoS0y4AovGXT2mo2OB8MMbt61RTrZ7+vwPrMYYqlj6oUjg==
X-Received: by 2002:a5d:50d0:0:b0:2bd:c2d7:2700 with SMTP id
 f16-20020a5d50d0000000b002bdc2d72700mr9599688wrt.42.1674125962811; 
 Thu, 19 Jan 2023 02:59:22 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6d49000000b002bc8130cca7sm25510489wri.23.2023.01.19.02.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 02:59:22 -0800 (PST)
Date: Thu, 19 Jan 2023 10:59:20 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 4/8] tests/qtest/migration-test: Build command line using
 GString API
Message-ID: <Y8kiiMLWxKmHIJTr@work-vm>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119100537.5114-5-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/migration-test.c | 85 ++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 43 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index dbde726adf..36e6074653 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -582,13 +582,13 @@ typedef struct {
>  static int test_migrate_start(QTestState **from, QTestState **to,
>                                const char *uri, MigrateStart *args)
>  {

bit of a big change with lots of things moving around, I think it's
mostly OK but...

> +    g_autoptr(GString) cmd_common = NULL;
>      g_autofree gchar *arch_source = NULL;
> +    g_autoptr(GString) cmd_source = NULL;
>      g_autofree gchar *arch_target = NULL;
> -    g_autofree gchar *cmd_source = NULL;
> -    g_autofree gchar *cmd_target = NULL;
> -    const gchar *ignore_stderr;
> +    g_autoptr(GString) cmd_target = NULL;
> +    const gchar *ignore_stderr = NULL;
>      g_autofree char *bootpath = NULL;
> -    g_autofree char *shmem_opts = NULL;
>      g_autofree char *shmem_path = NULL;
>      const char *arch = qtest_get_arch();
>      const char *machine_opts = NULL;
> @@ -602,6 +602,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      }
>  
>      got_stop = false;
> +
> +    cmd_common = g_string_new("");
> +    g_string_append(cmd_common, "-accel tcg ");
> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
> +                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
> +

Isn't that swapping the order of -accel tcg and -accel kvm ?
In the original it's
                    g_strdup_printf("-accel kvm%s -accel tcg%s%s "

I think you're ending up with tcg first?

Dave

>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          /* the assembled x86 boot sector should be exactly one sector large */
> @@ -645,65 +651,58 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      } else {
>          g_assert_not_reached();
>      }
> +    if (machine_opts) {
> +        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
> +    }
> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>  
>      if (!getenv("QTEST_LOG") && args->hide_stderr) {
> -#ifndef _WIN32
> -        ignore_stderr = "2>/dev/null";
> -#else
> +#ifdef _WIN32
>          /*
>           * On Windows the QEMU executable is created via CreateProcess() and
>           * IO redirection does not work, so don't bother adding IO redirection
>           * to the command line.
>           */
> -        ignore_stderr = "";
> +#else
> +        ignore_stderr = "2>/dev/null";
>  #endif
> -    } else {
> -        ignore_stderr = "";
>      }
>  
>      if (args->use_shmem) {
>          shmem_path = g_strdup_printf("/dev/shm/qemu-%d", getpid());
> -        shmem_opts = g_strdup_printf(
> +        g_string_append_printf(cmd_common,
>              "-object memory-backend-file,id=mem0,size=%s"
>              ",mem-path=%s,share=on -numa node,memdev=mem0",
>              memory_size, shmem_path);
> -    } else {
> -        shmem_path = NULL;
> -        shmem_opts = g_strdup("");
>      }
>  
> -    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> -                                 "-name source,debug-threads=on "
> -                                 "-m %s "
> -                                 "-serial file:%s/src_serial "
> -                                 "%s %s %s %s",
> -                                 args->use_dirty_ring ?
> -                                 ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs,
> -                                 arch_source, shmem_opts,
> -                                 args->opts_source ? args->opts_source : "",
> -                                 ignore_stderr);
>      if (!args->only_target) {
> -        *from = qtest_init(cmd_source);
> +        cmd_source = g_string_new(cmd_common->str);
> +        g_string_append(cmd_source, "-name source,debug-threads=on ");
> +        g_string_append_printf(cmd_source, "-serial file:%s/src_serial ",
> +                               tmpfs);
> +        g_string_append_printf(cmd_source, "%s ", arch_source);
> +        if (args->opts_source) {
> +            g_string_append_printf(cmd_source, "%s ", args->opts_source);
> +        }
> +        if (ignore_stderr) {
> +            g_string_append(cmd_source, ignore_stderr);
> +        }
> +        *from = qtest_init(cmd_source->str);
>      }
>  
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> -                                 "-name target,debug-threads=on "
> -                                 "-m %s "
> -                                 "-serial file:%s/dest_serial "
> -                                 "-incoming %s "
> -                                 "%s %s %s %s",
> -                                 args->use_dirty_ring ?
> -                                 ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs, uri,
> -                                 arch_target, shmem_opts,
> -                                 args->opts_target ? args->opts_target : "",
> -                                 ignore_stderr);
> -    *to = qtest_init(cmd_target);
> +    cmd_target = g_string_new(cmd_common->str);
> +    g_string_append(cmd_target, "-name target,debug-threads=on ");
> +    g_string_append_printf(cmd_target, "-serial file:%s/dest_serial ", tmpfs);
> +    g_string_append_printf(cmd_target, "-incoming %s ", uri);
> +    g_string_append_printf(cmd_target, "%s ", arch_target);
> +    if (args->opts_target) {
> +        g_string_append_printf(cmd_target, "%s ", args->opts_target);
> +    }
> +    if (ignore_stderr) {
> +        g_string_append(cmd_source, ignore_stderr);
> +    }
> +    *to = qtest_init(cmd_target->str);
>  
>      /*
>       * Remove shmem file immediately to avoid memory leak in test failed case.
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


