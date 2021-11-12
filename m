Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B530144E549
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:58:28 +0100 (CET)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUGJ-0001DW-Je
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:58:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUF4-0000W9-Lb
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlUEz-00051u-C6
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636714624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JnOSi/uBKIjYI7g0QAtJbw/rLQLD928nKBqdFOGDZMc=;
 b=VcQb06mN6q7cZKuGZdSfaYHK5yf08B3pPX5ksfiaIOLYoeUny+x7M7TXxK51rWyZEl3xHc
 oHqzjVcj+m6btSqDwvt9i+2aSLAHxAlTH8547VYlQOfIJ7qbzXQUDFf305xbHjAolwgTGc
 WQgXmIxZDcNDRZqnSTwapjbi51+o+34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-GJy2d2GaO4KkrzGuzUXJpA-1; Fri, 12 Nov 2021 05:56:59 -0500
X-MC-Unique: GJy2d2GaO4KkrzGuzUXJpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DD0804140
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 10:56:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D932A5F4EC;
 Fri, 12 Nov 2021 10:56:49 +0000 (UTC)
Date: Fri, 12 Nov 2021 10:56:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/6] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YY5IbmyMUwMI4LGn@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211112051040.923746-2-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 02:10:36AM -0300, Leonardo Bras wrote:
> Adds io_writev_zerocopy and io_flush_zerocopy as optional callback to QIOChannelClass,
> allowing the implementation of zerocopy writes by subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev_zerocopy(),
> - Wait write completion with qio_channel_flush_zerocopy().
> 
> Notes:
> As some zerocopy implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush_zerocopy(), to avoid the risk of sending an updated
> buffer instead of the one at the write.
> 
> As the new callbacks are optional, if a subclass does not implement them, then:
> - io_writev_zerocopy will return -1,
> - io_flush_zerocopy will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zerocopy and
> non-zerocopy writev.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 93 ++++++++++++++++++++++++++++++++++++++------
>  io/channel.c         | 65 +++++++++++++++++++++++++------
>  2 files changed, 135 insertions(+), 23 deletions(-)
> 

> +/**
> + * qio_channel_flush_zerocopy:
> + * @ioc: the channel object
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Will block until every packet queued with
> + * qio_channel_writev_zerocopy() is sent, or return
> + * in case of any error.
> + *
> + * Returns -1 if any error is found, 0 otherwise.

  Returns -1 if any error is found, 0 if all data was sent,
           or 1 if all data was sent but at least some was copied.


> + * If not implemented, acts as a no-op, and returns 0.
> + */
> +
> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


