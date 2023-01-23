Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8698F6779B1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJuWM-0007tA-W4; Mon, 23 Jan 2023 05:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuWH-0007sq-9w
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuWF-0006Ey-PQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lc7+Nth4tD6DUPxWOZ/wtOuz1QcSnbRXKS+0qgP//Yc=;
 b=T6strZRKp9mywpX2mxQHiPHNgEws/fqrEENZ79DwEgIrMSo2b3v7LFIaFe64FAX+K2kJrk
 NI3xUaVSROJqyDcC+ArE19Sm9qxS7tjkm7YPHMTUjHsOKfwtwr/raZsyvuOLw718VUZos5
 Dpb4JiNli6C6Os16XNF7xe2kdPMwAHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-FdtQ4WZiOguwD9APOFDIkw-1; Mon, 23 Jan 2023 05:57:41 -0500
X-MC-Unique: FdtQ4WZiOguwD9APOFDIkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay38-20020a05600c1e2600b003da7c41fafcso9242264wmb.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lc7+Nth4tD6DUPxWOZ/wtOuz1QcSnbRXKS+0qgP//Yc=;
 b=2jl1M5fKmOf9f0bNFEnLRQuRyJH42u9iCEjH+MLJPkSSO8igQS/PGSdFD3XxEGKlzV
 0qcOWcz75L8OE7PJhZdKg6Ki+HehIGmNpeGluS8dknX8hgLvadPTPz53Po1GOsq8Xk7y
 c7Qf3E7mEelwpFIB/75pbLMexvCENBrNeF3ZAIk2zPU2FO+JtS9VqMGOoR5JDrK4pOEX
 kvghP8/bWIuHc77l/sknk8bzYsJvZ5v4zYYKpkVWE0qhFkBX1JQP+gvB8xyYDM2t6zt0
 6SRtkWjDmoTdOLwZy54JdWYc6HiTGDUIZjMKAxFeRbJX4NGeSTceO3C4SpEjzTRwoLTb
 qvdw==
X-Gm-Message-State: AFqh2kpF2BhlfNhBBmKi9agN8kv1CqyizIzYN9RXvgHhpIJCP+Aphlar
 3Sx08PfcIz1t/BlLj1F9NbOE9Ztw6i+E3dPBuucrX7Pm9bKPQ8pcnwVyjCyB6+xKJW+0UUyuuVT
 iiGVeTREQ6vP6EBs=
X-Received: by 2002:a05:600c:198a:b0:3d9:cb4c:af5a with SMTP id
 t10-20020a05600c198a00b003d9cb4caf5amr24512145wmq.33.1674471460129; 
 Mon, 23 Jan 2023 02:57:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtSDivK6DND7X/zM0AWJjBWEVB4NYQaPH1MKw8UEpQJSbRB69fBRn1YWsstB5Z8GUl4vrdfGw==
X-Received: by 2002:a05:600c:198a:b0:3d9:cb4c:af5a with SMTP id
 t10-20020a05600c198a00b003d9cb4caf5amr24512130wmq.33.1674471459847; 
 Mon, 23 Jan 2023 02:57:39 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003dafadd2f77sm11365655wms.1.2023.01.23.02.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:57:39 -0800 (PST)
Date: Mon, 23 Jan 2023 10:57:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Message-ID: <Y85oIDWpAdbIpGUa@work-vm>
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120082341.59913-8-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Part 1/4: Convert memory & machine options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index f96c73f552..9cdef4fa65 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -582,6 +582,7 @@ typedef struct {
>  static int test_migrate_start(QTestState **from, QTestState **to,
>                                const char *uri, MigrateStart *args)
>  {
> +    g_autoptr(GString) cmd_common = NULL;
>      g_autofree gchar *arch_source = NULL;
>      g_autofree gchar *arch_target = NULL;
>      g_autofree gchar *cmd_target = NULL;
> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      }
>  
>      got_stop = false;
> +
> +    cmd_common = g_string_new("");
> +
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          /* the assembled x86 boot sector should be exactly one sector large */
> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      } else {
>          g_assert_not_reached();
>      }
> +    if (machine_opts) {
> +        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
> +    }
> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>  
>      if (!getenv("QTEST_LOG") && args->hide_stderr) {
>  #ifdef _WIN32
> @@ -674,33 +682,29 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      if (!args->only_target) {
>          g_autofree gchar *cmd_source = NULL;
>  
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
>                                       "-name source,debug-threads=on "
> -                                     "-m %s "
>                                       "-serial file:%s/src_serial "
>                                       "%s %s %s %s",
>                                       args->use_dirty_ring ?
>                                       ",dirty-ring-size=4096" : "",
> -                                     machine_opts ? " -machine " : "",
> -                                     machine_opts ? machine_opts : "",
> -                                     memory_size, tmpfs,
> +                                     cmd_common->str,
> +                                     tmpfs,
>                                       arch_source, shmem_opts,
>                                       args->opts_source ? args->opts_source : "",
>                                       ignore_stderr);
>          *from = qtest_init(cmd_source);
>      }
>  
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
>                                   "-name target,debug-threads=on "
> -                                 "-m %s "
>                                   "-serial file:%s/dest_serial "
>                                   "-incoming %s "
>                                   "%s %s %s %s",
>                                   args->use_dirty_ring ?
>                                   ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs, uri,
> +                                 cmd_common->str,
> +                                 tmpfs, uri,
>                                   arch_target, shmem_opts,
>                                   args->opts_target ? args->opts_target : "",
>                                   ignore_stderr);
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


