Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FE44E555
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:07:14 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUOn-0008Cp-U9
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mlUML-0005Zx-RF
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:04:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mlUMJ-0005ps-Cj
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715078;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gsJQXJmV03RhgJlyUcnCv2yT6KXjBxuNJkf0zxoE9aE=;
 b=QUo02r3tLHnamsYfSmWKC1Es8i3emQeYMy8BGtuaqVfptE2fQvrslzxsUnmLuWnpLyOw8S
 ZPMaM5ucFilbIwMivvi8bo+9+Y2qmvaMR5ezjE+dLwGBU9qqCkNT339Wiq07QhACC7hFmq
 ExMzUjkjOS/pRAo3xsyIjjldNtOSFTg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-6c6UI6r0NC2ivSKfP35hWg-1; Fri, 12 Nov 2021 06:04:35 -0500
X-MC-Unique: 6c6UI6r0NC2ivSKfP35hWg-1
Received: by mail-wr1-f70.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso713190wrw.7
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 03:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=gsJQXJmV03RhgJlyUcnCv2yT6KXjBxuNJkf0zxoE9aE=;
 b=FRKn2fuBnQub6o5v8jNG255n2WID6ebzpY7cOWrhk7osieBCJ4vJIhe4z0zMefZzlQ
 nbIuJ9EjEi8NAdR8QeDeiCD37LDnzXLLr0Kt5ZQ6c4PCGSpRWT52o6QWn6FfCaZ9g7mF
 kNKC3/4f5c8ya+y+RzAsuxxTxoCSdiE1Eg4LyfAOJ+lQuQ45CtX/mzx6KrUmQeRiXGso
 OLdxQeDZN7IknjVmscsU1K4j9MkFwblRKaH57E+lFPLgL9zcx3ZlbIgbyUgxLKT/xKLw
 L5+0z/zZHaGbDC6iRtsYx7Enu3sj/btMeFZOGR0ekuh+ZwAj5YukvvO7mSI5+/GKjGTa
 0oOQ==
X-Gm-Message-State: AOAM532kIzyLP8BFDrZ/0mEGFglfTwdJBqg9a/VyfnWBWl/4o40tXyrX
 8ispB14vZHOFqMj7oLLGWOaeh5w7vIzqN5jRtP8KSHgzRTVpk4lQM/RZil7iXKmZW5HM1SofVPa
 Oc1QFistMCVGEM9U=
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr17430032wry.261.1636715074506; 
 Fri, 12 Nov 2021 03:04:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr4ETi9vDiSiafMQWkLMemX0yqaMc0D7OUJH9L0HYjncBIBkipipaqaaiNrkiJyP/IQ3sgZw==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr17430001wry.261.1636715074321; 
 Fri, 12 Nov 2021 03:04:34 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u2sm6256686wrs.17.2021.11.12.03.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:04:33 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP
 for Linux
In-Reply-To: <20211112051040.923746-5-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 12 Nov 2021 02:10:39 -0300")
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 12 Nov 2021 12:04:33 +0100
Message-ID: <87pmr5vdmm.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Add property that allows zerocopy migration of memory pages,
> and also includes a helper function migrate_use_zerocopy() to check
> if it's enabled.
>
> No code is introduced to actually do the migration, but it allow
> future implementations to enable/disable this feature.
>
> On non-Linux builds this parameter is compiled-out.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Hi

> +# @zerocopy: Controls behavior on sending memory pages on migration.
> +#            When true, enables a zerocopy mechanism for sending memory
> +#            pages, if host supports it.
> +#            Defaults to false. (Since 6.2)
> +#

This needs to be changed to next release, but not big deal.


> +#ifdef CONFIG_LINUX
> +int migrate_use_zerocopy(void);

Please, return bool

> +#else
> +#define migrate_use_zerocopy() (0)
> +#endif

and false here.

I know, I know.  We are not consistent here, but the preffered way is
the other way.

>  int migrate_use_xbzrle(void);
>  uint64_t migrate_xbzrle_cache_size(void);
>  bool migrate_colo_enabled(void);
> diff --git a/migration/migration.c b/migration/migration.c
> index abaf6f9e3d..add3dabc56 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->multifd_zlib_level = s->parameters.multifd_zlib_level;
>      params->has_multifd_zstd_level = true;
>      params->multifd_zstd_level = s->parameters.multifd_zstd_level;
> +#ifdef CONFIG_LINUX
> +    params->has_zerocopy = true;
> +    params->zerocopy = s->parameters.zerocopy;
> +#endif
>      params->has_xbzrle_cache_size = true;
>      params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
>      params->has_max_postcopy_bandwidth = true;
> @@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>      if (params->has_multifd_compression) {
>          dest->multifd_compression = params->multifd_compression;
>      }
> +#ifdef CONFIG_LINUX
> +    if (params->has_zerocopy) {
> +        dest->zerocopy = params->zerocopy;
> +    }
> +#endif
>      if (params->has_xbzrle_cache_size) {
>          dest->xbzrle_cache_size = params->xbzrle_cache_size;
>      }
> @@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>      if (params->has_multifd_compression) {
>          s->parameters.multifd_compression = params->multifd_compression;
>      }
> +#ifdef CONFIG_LINUX
> +    if (params->has_zerocopy) {
> +        s->parameters.zerocopy = params->zerocopy;
> +    }
> +#endif

After seing all this CONFIG_LINUX mess, I am not sure that it is a good
idea to add the parameter only for LINUX.  It appears that it is better
to add it for all OS's and just not allow to set it to true there.

But If QAPI/QOM people preffer that way, I am not going to get into the middle.

> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7c9deb1921..ab8f0f97be 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -854,16 +854,17 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>      trace_multifd_new_send_channel_async(p->id);
>      if (qio_task_propagate_error(task, &local_err)) {
>          goto cleanup;
> -    } else {
> -        p->c = QIO_CHANNEL(sioc);
> -        qio_channel_set_delay(p->c, false);
> -        p->running = true;
> -        if (!multifd_channel_connect(p, sioc, local_err)) {
> -            goto cleanup;
> -        }
> -        return;
>      }
>  
> +    p->c = QIO_CHANNEL(sioc);
> +    qio_channel_set_delay(p->c, false);
> +    p->running = true;
> +    if (!multifd_channel_connect(p, sioc, local_err)) {
> +        goto cleanup;
> +    }
> +
> +    return;
> +
>  cleanup:
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>  }

As far as I can see, this chunk is a NOP, and it don't belong to this patch.

Later, Juan.


