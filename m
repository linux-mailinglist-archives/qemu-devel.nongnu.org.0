Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E96C54D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 20:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf41W-00062i-9i; Wed, 22 Mar 2023 15:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf41R-000629-0o
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf41N-0006dy-Sb
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679512876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8zfyS0PqI2V/z5CmXyhGorMO9EvwziwxVf27CyKPO4=;
 b=GNa7awXz8r7ZTQ3KwiX8avp7OfgBXwlVRZidSgw7KKDzSTrZlyCo70Uzj0KhQ/QUEze8wh
 b7/sIoHops3c8fHFkRrJmuDTrRF3SAXmUhoZ1+ZUKtSDlkHgLLZD5EjNfh5UXllBrKNX7m
 ho1QedkUgtYufTIZUZ3o0LnGG6lW/Hs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-Mr7XiIaPOo6_conBCkKrLA-1; Wed, 22 Mar 2023 15:21:15 -0400
X-MC-Unique: Mr7XiIaPOo6_conBCkKrLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA723C10EC1;
 Wed, 22 Mar 2023 19:21:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E41651FF;
 Wed, 22 Mar 2023 19:21:13 +0000 (UTC)
Date: Wed, 22 Mar 2023 19:21:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: s390 migration crash
Message-ID: <ZBtVJyeOK4U+VD3/@redhat.com>
References: <ZBoShWArKDPpX/D7@work-vm>
 <ZBpJdAbqmyqMNh4D@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBpJdAbqmyqMNh4D@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Tue, Mar 21, 2023 at 08:19:00PM -0400, Peter Xu wrote:
> On Tue, Mar 21, 2023 at 08:24:37PM +0000, Dr. David Alan Gilbert wrote:
> > Hi Peter's,
> >   Peter M pointed me to a seg in a migration test in CI; I can reproduce
> > it:
> >   * On an s390 host
> 
> How easy to reproduce?
> 
> >   * only as part of a make check - running migration-test by itself
> > doesn't trigger for me.
> >   * It looks like it's postcopy preempt

snip

> > Looking at the iov and file it's garbage; so it makes me think this is
> > something like a flush on a closed file.
> 
> I didn't figure out how that could be closed, but I think there's indeed a
> possible race that the qemufile can be accessed by both the return path
> thread and the migration thread concurrently, while qemufile is not thread
> safe on that.

snip

> From 0e317fa78e9671c119f6be78a0e0a36201517dc2 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 21 Mar 2023 19:58:42 -0400
> Subject: [PATCH 1/2] io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server
>  side
> 
> TLS iochannel will inherit io_shutdown() from the master ioc, however we
> missed to do that on the server side.
> 
> This will e.g. allow qemu_file_shutdown() to work on dest QEMU too for
> migration.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  io/channel-tls.c | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 5a7a3d48d6..9805dd0a3f 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -74,6 +74,9 @@ qio_channel_tls_new_server(QIOChannel *master,
>      ioc = QIO_CHANNEL_TLS(object_new(TYPE_QIO_CHANNEL_TLS));
>  
>      ioc->master = master;
> +    if (qio_channel_has_feature(master, QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> +        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SHUTDOWN);
> +    }
>      object_ref(OBJECT(master));
>  
>      ioc->session = qcrypto_tls_session_new(



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


