Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA45086FA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:27:35 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8Uh-0000XA-1T
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8E3-0002kZ-Vn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8E1-0004hQ-AB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650453019;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7v5Sg7u324Bs9E5m4A2oYs9aXPjLlxq8X/G8+IJwIK0=;
 b=gPka0HPPuxHIfx4Sn3Lc94q/ld17XxHdCr4T3Wu3/8Mx7bj5xbdCSi2yzrnKZCN7K5OvNJ
 WIpRP6Ao76+78nWGP8idkchD6awwDgSwhFfGB0DHkTsPXKY9iC0p+uBG77yLBm/dTwUJMh
 CLyUxAZycV1QVG35YGENqB5UELUwAiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-PulYAxNpNMaIxA4eY7jkyQ-1; Wed, 20 Apr 2022 07:10:18 -0400
X-MC-Unique: PulYAxNpNMaIxA4eY7jkyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31139802819
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:10:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D810C44AE1;
 Wed, 20 Apr 2022 11:10:17 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:10:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 14/19] migration: Add helpers to detect TLS capability
Message-ID: <Yl/qFmt09kIBmBM8@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-15-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-15-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:52AM -0400, Peter Xu wrote:
> Add migrate_tls_enabled() to detect whether TLS is configured.
> 
> Add migrate_channel_requires_tls() to detect whether the specific channel
> requires TLS.
> 
> No functional change intended.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/channel.c   | 10 ++--------
>  migration/migration.c | 17 +++++++++++++++++
>  migration/migration.h |  4 ++++
>  migration/multifd.c   |  7 +------
>  4 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index c6a8dcf1d7..36e59eaeec 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -38,10 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
>  
> -    if (s->parameters.tls_creds &&
> -        *s->parameters.tls_creds &&
> -        !object_dynamic_cast(OBJECT(ioc),
> -                             TYPE_QIO_CHANNEL_TLS)) {
> +    if (migrate_channel_requires_tls(ioc)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
>          migration_ioc_register_yank(ioc);
> @@ -71,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
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
> index ee3df9e229..899084f993 100644
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
> @@ -4251,6 +4252,22 @@ void migration_global_dump(Monitor *mon)
>                     ms->clear_bitmap_shift);
>  }
>  
> +bool migrate_tls_enabled(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->parameters.tls_creds && *s->parameters.tls_creds;
> +}
> +
> +bool migrate_channel_requires_tls(QIOChannel *ioc)
> +{
> +    if (!migrate_tls_enabled()) {

This is the only place migrate_tls_enabled is called. Does it
really need to exist as an exported method, as opposed to
inlining it here ?

> +        return false;
> +    }
> +
> +    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
> +}
> +
>  #define DEFINE_PROP_MIG_CAP(name, x)             \
>      DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index 6ee520642f..8b9ad7fe31 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -436,6 +436,10 @@ bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_background_snapshot(void);
>  bool migrate_postcopy_preempt(void);
> +/* Whether TLS is enabled for migration? */
> +bool migrate_tls_enabled(void);
> +/* Whether the QIO channel requires further TLS handshake? */
> +bool migrate_channel_requires_tls(QIOChannel *ioc);

How about having it in tls.{c,h} as  'migration_tls_channel_enabled()' ?

>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9ea4f581e2..19e3c44491 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -782,17 +782,12 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>                                      QIOChannel *ioc,
>                                      Error *error)
>  {
> -    MigrationState *s = migrate_get_current();
> -
>      trace_multifd_set_outgoing_channel(
>          ioc, object_get_typename(OBJECT(ioc)),
>          migrate_get_current()->hostname, error);
>  
>      if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> +        if (migrate_channel_requires_tls(ioc)) {
>              multifd_tls_channel_connect(p, ioc, &error);
>              if (!error) {
>                  /*
> -- 
> 2.32.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


