Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C879A39FE3A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:52:13 +0200 (CEST)
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqftc-0000V1-Sv
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqfsm-0007bH-Cr
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqfsk-0004HU-KE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pFWjfDfbO/ecywVFo+v4c7/BIhFRN2tmywnDz+4FcuQ=;
 b=J/TbDR8WKwQW2+toiBP5knX6Dnynx2qGo2DrW6qs3CUflpWvxmChVJaruHZkF/ve1V4J1F
 uSh17GesWzIqZO8HPkvo6ktNgbb32BJyUj//sspjWr3u5FjqwUW94MvuFgFOhRvLaZFAxx
 h0iwslcw2GxklFPJ9lkqGT2Tpa2ZTGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-c8JzYaxsN_S6CQgWhlFEVg-1; Tue, 08 Jun 2021 13:51:16 -0400
X-MC-Unique: c8JzYaxsN_S6CQgWhlFEVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17582800C60;
 Tue,  8 Jun 2021 17:51:15 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B310E5C1C2;
 Tue,  8 Jun 2021 17:51:10 +0000 (UTC)
Date: Tue, 8 Jun 2021 18:51:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YL+uDA7zo73A7e1j@work-vm>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210601054030.1153249-1-leobras.c@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lukasstraub2@web.de, berrange@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras (leobras.c@gmail.com) wrote:
> After yank feature was introduced in migration, whenever migration
> is started using TLS, the following error happens in both source and
> destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
> 
> Also, inside migration_channel_connect() and
> migration_channel_process_incoming() move yank_register_function() so
> it only runs once on a TLS migration.
> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Queued; thank you!

> --
> Changes since v2:
> - Dropped all references to ioc->master
> - yank_register_function() and yank_unregister_function() now only run
>   once in a TLS migration.
> 
> Changes since v1:
> - Cast p->c to QIOChannelTLS into multifd_load_cleanup()
> ---
>  migration/channel.c           | 26 ++++++++++++++------------
>  migration/multifd.c           |  3 ++-
>  migration/qemu-file-channel.c |  4 +++-
>  3 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index c9ee902021..01275a9162 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -38,18 +38,19 @@ void migration_channel_process_incoming(QIOChannel *ioc)
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
>  
> -    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
> -        yank_register_function(MIGRATION_YANK_INSTANCE,
> -                               migration_yank_iochannel,
> -                               QIO_CHANNEL(ioc));
> -    }
> -
>      if (s->parameters.tls_creds &&
>          *s->parameters.tls_creds &&
>          !object_dynamic_cast(OBJECT(ioc),
>                               TYPE_QIO_CHANNEL_TLS)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
> +        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> +            yank_register_function(MIGRATION_YANK_INSTANCE,
> +                                   migration_yank_iochannel,
> +                                   QIO_CHANNEL(ioc));
> +        }
> +
>          migration_ioc_process_incoming(ioc, &local_err);
>      }
>  
> @@ -76,12 +77,6 @@ void migration_channel_connect(MigrationState *s,
>          ioc, object_get_typename(OBJECT(ioc)), hostname, error);
>  
>      if (!error) {
> -        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
> -            yank_register_function(MIGRATION_YANK_INSTANCE,
> -                                   migration_yank_iochannel,
> -                                   QIO_CHANNEL(ioc));
> -        }
> -
>          if (s->parameters.tls_creds &&
>              *s->parameters.tls_creds &&
>              !object_dynamic_cast(OBJECT(ioc),
> @@ -99,6 +94,13 @@ void migration_channel_connect(MigrationState *s,
>          } else {
>              QEMUFile *f = qemu_fopen_channel_output(ioc);
>  
> +            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> +                yank_register_function(MIGRATION_YANK_INSTANCE,
> +                                       migration_yank_iochannel,
> +                                       QIO_CHANNEL(ioc));
> +            }
> +
>              qemu_mutex_lock(&s->qemu_file_lock);
>              s->to_dst_file = f;
>              qemu_mutex_unlock(&s->qemu_file_lock);
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 0a4803cfcc..2e8f001bc0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,7 +987,8 @@ int multifd_load_cleanup(Error **errp)
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
> -        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
> +        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
> +             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
>              && OBJECT(p->c)->ref == 1) {
>              yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                       migration_yank_iochannel,
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 876d05a540..fad340ea7a 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -26,6 +26,7 @@
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
> +#include "io/channel-tls.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
> @@ -106,7 +107,8 @@ static int channel_close(void *opaque, Error **errp)
>      int ret;
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ret = qio_channel_close(ioc, errp);
> -    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
> +    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
>          && OBJECT(ioc)->ref == 1) {
>          yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                   migration_yank_iochannel,
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


