Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3C6922D7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:00:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVne-0004Qd-09; Fri, 10 Feb 2023 10:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQVnb-0004QU-LL
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQVnZ-0000wL-Ls
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676044732;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piwTNZp44K47tpJAxW13pMuna0jDefK3vVDR3j5ZpPM=;
 b=VqCRzDFofSm7R/TVoYrRCbZl/DBL/YcO8HoDK2CCqdiR9aUBpE2/L+Fk1Pb7hhWCVTarWk
 eVRSIyg09SE9VbFp2zMKPcfmu1bKXZyaEgVu/L9O+CMaiavPAhrhPYp7Id3SlFpbarZGuM
 LHf3JQFf+4tWIG00OEOled+bRsRv4qI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-SuyMIu7ZNE-QVPQ62Tu6mQ-1; Fri, 10 Feb 2023 10:58:49 -0500
X-MC-Unique: SuyMIu7ZNE-QVPQ62Tu6mQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2EA185A588;
 Fri, 10 Feb 2023 15:58:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D41FC492B00;
 Fri, 10 Feb 2023 15:58:47 +0000 (UTC)
Date: Fri, 10 Feb 2023 15:58:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 02/14] migration: Add support for 'file:' uri for
 incoming migration
Message-ID: <Y+ZptUYkSv5fqqUM@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-3-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028103914.908728-3-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 01:39:02PM +0300, Nikolay Borisov wrote:
> This is a counterpart to the 'file:' uri support for source migration,
> now a file can also serve as the source of an incoming migration.
> 
> Unlike other migration protocol backends, the 'file' protocol cannot
> honour non-blocking mode. POSIX file/block storage will always report
> ready to read/write, regardless of how slow the underlying storage
> will be at servicing the request.
> 
> For incoming migration this limitation may result in the main event
> loop not being fully responsive while loading the VM state. This
> won't impact the VM since it is not running at this phase, however,
> it may impact management applications.

Looking at the QEMU incoming migration code, we're relying on
coroutines. Specifically we initiate the load of state / RAM
in process_incoming_migration_co, and the coroutine magic
is handled in qemu_fill_buffer in migration/qemu-file.c which
does the coroutine yield.

This should be allowing the QMP monitor to be functional while
incoming migration is loaded. That said, I expect a great many
QMP commands will cause problems if invoked, especially any
that hotplug/unplug stuff. IOW, probably only safe to use the
query-xxx commands in general.

With the unhelpful POSIX semantics for poll() on plain files /
block devices, the qemu_fill_buffer method is unlikely to ever
see  QIO_CHANNEL_ERR_BLOCK, so is unlikely to ever yield in the
coroutine. Thus the QMP monitor will not process data until the
migration load is finished.

For libvirt this is not actually a problem in practice from what
I understand, as we don't try to run any QMP commands, we merely
wait until we see an even indicating migration is finished. 

To solve this problem we would need to make the incoming migration
run inside a thread, instead of coroutine. This does not appear
like it would be too hard, mostly just need to replace the
coroutine creation command with a thread creation command and
switch the QEMUFile to blocking  mode.

The open question is whether there are any locking/concurrency
concerns with doing this. To some extent those concerns would
already exist, even with using coroutines, as there are other
threads present, and QMP commands can change state in the
middle of a migration load if an app is foolish enough to
request it.  So maybe switching to threads isn't actually
that hard ?

Either way, I think libvirt could live with the blocked QMP
monitor during incoming migrate in the short/medium term.
So this doesn't look like a blocker to me currently.

> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/file.c      | 15 +++++++++++++++
>  migration/file.h      |  1 +
>  migration/migration.c |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/migration/file.c b/migration/file.c
> index 02896a7cab99..93eb718aa0f4 100644
> --- a/migration/file.c
> +++ b/migration/file.c
> @@ -21,3 +21,18 @@ void file_start_outgoing_migration(MigrationState *s, const char *fname, Error *
>  }
>  
>  
> +void file_start_incoming_migration(const char *fname, Error **errp)
> +{
> +	QIOChannelFile *ioc;
> +
> +	ioc = qio_channel_file_new_path(fname, O_RDONLY, 0, errp);
> +	if (!ioc) {
> +		error_report("Error creating a channel");
> +		return;
> +	}
> +
> +	qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-incoming");
> +	migration_channel_process_incoming(QIO_CHANNEL(ioc));
> +	object_unref(OBJECT(ioc));
> +}
> +
> diff --git a/migration/file.h b/migration/file.h
> index d476eb1157f9..cdbd291322d4 100644
> --- a/migration/file.h
> +++ b/migration/file.h
> @@ -5,5 +5,6 @@ void file_start_outgoing_migration(MigrationState *s,
>                                     const char *filename,
>                                     Error **errp);
>  
> +void file_start_incoming_migration(const char *fname, Error **errp);
>  #endif
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index b5373db38535..eafd887254dd 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -506,6 +506,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>          exec_start_incoming_migration(p, errp);
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
> +    } else if (strstart(uri, "file:", &p)) {
> +        file_start_incoming_migration(p, errp);
>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


