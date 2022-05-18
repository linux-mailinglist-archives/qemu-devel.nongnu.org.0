Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745052B593
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:05:04 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFc7-0006Qv-91
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrFUh-0002TQ-4D
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:57:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrFUf-0003Kw-4s
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=unGno+yTJIbhgXTjRIKc+ibO5srSvl+vqiGe56KXmqw=;
 b=gpLJMwtDY978Ks0W0eC8MXwqbFRRUg8bFGywVO7ZTox0XlSMxLXFqa4AXF6dzClvyArdvE
 64wiThv+kDASn3JKkys9PqLqUMmfIDeJbHtuj00xHAxiGmWV7828dipKxF4n8Jk+/jKDMd
 f3ZxM43P6hyQvSZmBY/SGzgKoYQXjNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-CvK1Yj6fO1uWi53wVPGhjg-1; Wed, 18 May 2022 04:57:16 -0400
X-MC-Unique: CvK1Yj6fO1uWi53wVPGhjg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6E5C1E02E3F;
 Wed, 18 May 2022 08:57:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B75D1492C3B;
 Wed, 18 May 2022 08:57:14 +0000 (UTC)
Date: Wed, 18 May 2022 09:57:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v6 07/13] migration: Add helpers to detect TLS capability
Message-ID: <YoS06H6I0fZx/uAC@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-8-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-8-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 03:57:24PM -0400, Peter Xu wrote:
> Add migrate_channel_requires_tls() to detect whether the specific channel
> requires TLS, leveraging the recently introduced migrate_use_tls().  No
> functional change intended.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/channel.c   | 9 ++-------
>  migration/migration.c | 1 +
>  migration/multifd.c   | 4 +---
>  migration/tls.c       | 9 +++++++++
>  migration/tls.h       | 4 ++++
>  5 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index a162d00fea..36e59eaeec 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -38,9 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
>  
> -    if (migrate_use_tls() &&
> -        !object_dynamic_cast(OBJECT(ioc),
> -                             TYPE_QIO_CHANNEL_TLS)) {
> +    if (migrate_channel_requires_tls(ioc)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
>          migration_ioc_register_yank(ioc);
> @@ -70,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
>          ioc, object_get_typename(OBJECT(ioc)), hostname, error);
>  
>      if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> +        if (migrate_channel_requires_tls(ioc)) {
>              migration_tls_channel_connect(s, ioc, hostname, &error);
>  
>              if (!error) {
> diff --git a/migration/migration.c b/migration/migration.c
> index f5f7a0f91f..d17f435d08 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -49,6 +49,7 @@
>  #include "trace.h"
>  #include "exec/target_page.h"
>  #include "io/channel-buffer.h"
> +#include "io/channel-tls.h"
>  #include "migration/colo.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9282ab6aa4..849c116ce4 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -831,9 +831,7 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>          migrate_get_current()->hostname, error);
>  
>      if (!error) {
> -        if (migrate_use_tls() &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> +        if (migrate_channel_requires_tls(ioc)) {
>              multifd_tls_channel_connect(p, ioc, &error);
>              if (!error) {
>                  /*
> diff --git a/migration/tls.c b/migration/tls.c
> index 32c384a8b6..1baa662489 100644
> --- a/migration/tls.c
> +++ b/migration/tls.c
> @@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
>                                NULL,
>                                NULL);
>  }
> +
> +bool migrate_channel_requires_tls(QIOChannel *ioc)
> +{
> +    if (!migrate_use_tls()) {
> +        return false;
> +    }
> +
> +    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
> +}
> diff --git a/migration/tls.h b/migration/tls.h
> index de4fe2cafd..a54c1dcec7 100644
> --- a/migration/tls.h
> +++ b/migration/tls.h
> @@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
>                                     QIOChannel *ioc,
>                                     const char *hostname,
>                                     Error **errp);
> +
> +/* Whether the QIO channel requires further TLS handshake? */
> +bool migrate_channel_requires_tls(QIOChannel *ioc);

I find this name somewhat confusing, as 'requires tls' and
'uses tls' are just synonyms for the same thing IMHO.

What this method is actually checking is whether we still need
to upgrade the channel from plain text to TLS, by completing a
TLS handshake. So can we call this:

  migrate_channel_requires_tls_upgrade

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


