Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF144E55A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:09:05 +0100 (CET)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUQa-0001sl-Eq
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUN8-0006NT-Aa
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUN4-0005z3-UG
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zRqrovIui6Ik+Bqh2nzeiSKO9CQ/Uvrl+cT+9L98G6M=;
 b=RvbtoMQZinXr7uiGJyvEoVnWIv6rZxOacLwgcABPjG/Lew3MzT+z/FK2mO45It37Fxr5B6
 GWa1fj67Zlj2iWCD8qJIaeD5nJpcAaElTRJPaB+K9Nh/iO/F8GHDmM7yZsLyVoNz8LMp5m
 ATPRz7F6/AmBuPXsCy+A/q6avE51/88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-2OvTsp07N_yedxkdIuVCTw-1; Fri, 12 Nov 2021 06:05:25 -0500
X-MC-Unique: 2OvTsp07N_yedxkdIuVCTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 460E21966322
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 11:05:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC0B5D6D7;
 Fri, 12 Nov 2021 11:05:22 +0000 (UTC)
Date: Fri, 12 Nov 2021 11:05:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
Message-ID: <YY5Kb4hvhyXhqmRF@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211112051040.923746-5-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 02:10:39AM -0300, Leonardo Bras wrote:
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
> ---
>  qapi/migration.json   | 18 ++++++++++++++++++
>  migration/migration.h |  5 +++++
>  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
>  migration/multifd.c   | 17 +++++++++--------
>  migration/socket.c    |  5 +++++
>  monitor/hmp-cmds.c    |  6 ++++++
>  6 files changed, 75 insertions(+), 8 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48cf0b..9534c299d7 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -730,6 +730,11 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @zerocopy: Controls behavior on sending memory pages on migration.
> +#            When true, enables a zerocopy mechanism for sending memory
> +#            pages, if host supports it.
> +#            Defaults to false. (Since 6.2)

Add

   Requires that QEMU be permitted to use locked memory for guest
   RAM pages.

Also 7.0 since this has missed the 6.2 deadline.


Both these notes apply to later in this file too



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

This change is just a code style alteration with no relation to
zerocopy. Either remove it, or do this change in its own patch
seprate from zerocopy.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


