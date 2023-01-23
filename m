Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91386779B9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJuXz-0000Gp-HQ; Mon, 23 Jan 2023 05:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuXr-0000FQ-Fs
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuXp-0006U0-OM
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myTxCe5PucInwvFDihFM6lx/CJUs8oHXuHxOxQX6gcI=;
 b=MvF5n+GgqvlUk1T39HOkUM0kVNrrCbulEbhylpoEClJ0b5r8X067C8GTHdLneq+TyUV82F
 a9JdewweaY5faupkMx60Xk9RLMZ5HPvq5crj8gCEKhzh8iesKMwaR0b6oATOjLKcZsvKk1
 xcQ2/cBSS26GBq2uDeGIpBAEnIShUf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-F6xp2dX0OhO3gA0ZPqSduw-1; Mon, 23 Jan 2023 05:59:19 -0500
X-MC-Unique: F6xp2dX0OhO3gA0ZPqSduw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h21-20020adfaa95000000b002be47d1d79cso1813799wrc.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myTxCe5PucInwvFDihFM6lx/CJUs8oHXuHxOxQX6gcI=;
 b=wpgYohUoHcJmLonNWL/MXDdUvy6uQsYjgFD8KJXF9kT1kmicUybM1WF3tu77B9783y
 QLIY3SLcSbCkMqH0H9G7AJym5tdfMzoEb3lu6yrqqSKcnxTj9ElEE8fM2JBmfjYbzhiP
 Is7xHQJoiATvxor6v+B/FK0UtMKwupBdM1A/nVG1EX8SNSqE+WMJdmNJIGPhw5AGM28o
 Udt45fDVS5cfbsfi9mfAiqXAB3CHIIY4iezROdalpa7hbrcXnj7dN+HCjpciLbt1HIwg
 Kc7AhWA/EYhFUQEvpkm71w/LRfIc7irGrxOUGVXdeM7G3rJzLWWHxZaVRSOGYv3oJd9q
 LalA==
X-Gm-Message-State: AFqh2kqh2w4B/fombNtYOZ5oj8UbZJiCV81RqtFZNaGIqhvfGWellMlu
 zz+NI4FPM/waVZSzBR3O2wh7Jh9DewHbU7aOdIl6lR09k0AENjRO9F/t03s+3GI7z6MjZlDr77t
 W9kD76EOsIaGKaJU=
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr22491898wmf.16.1674471558549; 
 Mon, 23 Jan 2023 02:59:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscWyWBIc517/UBQns93A2Dddd/qAPCu3KisAwgyquIxnHVBIhgjZteEv9uKQzROTp0w9G4sg==
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr22491880wmf.16.1674471558372; 
 Mon, 23 Jan 2023 02:59:18 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003dafa04ecc4sm10235937wmi.6.2023.01.23.02.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:59:17 -0800 (PST)
Date: Mon, 23 Jan 2023 10:59:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Message-ID: <Y85ohEspxLesiE1b@work-vm>
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120082341.59913-10-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> Part 3/4: Convert accelerator options.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/migration-test.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 670097a956..1ed3505c91 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -603,6 +603,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      got_stop = false;
>  
>      cmd_common = g_string_new("");
> +    /* KVM first */
> +    if (args->use_dirty_ring) {
> +        g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
> +    } else {
> +        g_string_append(cmd_common, "-accel kvm ");
> +    }
> +    g_string_append(cmd_common, "-accel tcg ");

Yep, that's the right way around this time :-)


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -678,12 +685,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      if (!args->only_target) {
>          g_autofree gchar *cmd_source = NULL;
>  
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
> +        cmd_source = g_strdup_printf("%s "
>                                       "-name source,debug-threads=on "
>                                       "-serial file:%s/src_serial "
>                                       "%s %s %s",
> -                                     args->use_dirty_ring ?
> -                                     ",dirty-ring-size=4096" : "",
>                                       cmd_common->str,
>                                       tmpfs,
>                                       arch_source,
> @@ -692,13 +697,11 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>          *from = qtest_init(cmd_source);
>      }
>  
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
> +    cmd_target = g_strdup_printf("%s "
>                                   "-name target,debug-threads=on "
>                                   "-serial file:%s/dest_serial "
>                                   "-incoming %s "
>                                   "%s %s %s",
> -                                 args->use_dirty_ring ?
> -                                 ",dirty-ring-size=4096" : "",
>                                   cmd_common->str,
>                                   tmpfs, uri,
>                                   arch_target,
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


