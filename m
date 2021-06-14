Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE23A6629
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:58:56 +0200 (CEST)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lslF1-00030s-FK
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lslDu-0001Tk-4p
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lslDq-00053l-Ry
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623671861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxLv7/h0XX4QVV3RuW5V24vfx5XZdw6d0WEXMxVIEIU=;
 b=hilqEt71beTvkxldTXOBmotIJWJZB3rJljzbaEnElTxlE/l43rKR2HDQFrsHzWod4Qs67l
 QueedfH1TisXZ/rlF0dlom0nQqVoZNbyxItUzN9OahiuqhuoOUmHoMVzNJv8iZ40j8CvCz
 b36R57GbGZ51JcM9wL0GhqIOG+kMUYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-ow2_UaHUNp2DJRMIIj_ZCA-1; Mon, 14 Jun 2021 07:57:39 -0400
X-MC-Unique: ow2_UaHUNp2DJRMIIj_ZCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6A8800D55;
 Mon, 14 Jun 2021 11:57:38 +0000 (UTC)
Received: from work-vm (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD05A60C0F;
 Mon, 14 Jun 2021 11:57:33 +0000 (UTC)
Date: Mon, 14 Jun 2021 12:57:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-stable@nongnu.org
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YMdEK6evcYtpbfMv@work-vm>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210601054030.1153249-1-leobras.c@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, lukasstraub2@web.de,
 berrange@redhat.com, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc'ing in qemu-stable - I think we'd probably want this on 6.0
(It's currently merged as 7de2e8565335c13fb3516cddbe2e40e366cce273 ).
Although you'll probably also want the missing dependency fix
Philippe is working (See: 
Mathieu- ( 42) [RFC PATCH] migration: Add missing dependency on GNUTLS )

Dave

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
> 
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


