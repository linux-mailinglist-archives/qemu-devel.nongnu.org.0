Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAB429791
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:29:45 +0200 (CEST)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0zX-0000EY-SV
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0yU-0007xp-VY
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0yQ-0002JY-Ov
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633980513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQJE9E92a/t1InxoWwJm3s2TQDHg3rgNerbJLHAO7Ow=;
 b=CG6Y/DR+VzXpxnuWqRcoar0G85I3UQyh012ElM64YHyWABJcZ3Wvot6fC71h4rk+aj756N
 iKrFQndCGbICIHgz2SmUKQ/04NgzC96bApVUsEqZAPTGFCom+VN5l7pM4sFMiuXeCnCbJe
 YsgBAQYPUGjgslZec3bQYKo/1ktQVX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-sy9TFgndNqqEOlA_uyb_4A-1; Mon, 11 Oct 2021 15:28:32 -0400
X-MC-Unique: sy9TFgndNqqEOlA_uyb_4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7344584A5F8
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 19:28:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DAFADC9;
 Mon, 11 Oct 2021 19:27:17 +0000 (UTC)
Date: Mon, 11 Oct 2021 14:27:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Message-ID: <20211011192710.vu7yhmtit5uo4m4j@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-3-leobras@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 04:56:12AM -0300, Leonardo Bras wrote:
> For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
> io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
> 
> qio_channel_socket_writev() contents were moved to a helper function
> qio_channel_socket_writev_flags() which accepts an extra argument for flags.
> (This argument is passed directly to sendmsg().
> 
> The above helper function is used to implement qio_channel_socket_writev(),
> with flags = 0, keeping it's behavior unchanged, and

its (remember, "it's" is shorthand for "it is", which does not fit here)

> qio_channel_socket_writev_zerocopy() with flags = MSG_ZEROCOPY.
> 
> qio_channel_socket_flush_zerocopy() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was sucessfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error ocurs.

occurs

> 
> A new function qio_channel_socket_poll() was also created in order to avoid
> busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
> updates in socket's error queue.
> 
> Notes on using writev_zerocopy():
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call flush_zerocopy() before freeing
> or re-using the buffer.
> 
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zerocopy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zerocopy as a feature, it
> requires a mechanism to disable it, so it can still be acessible to less
> privileged users.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  include/io/channel.h        |   1 +
>  io/channel-socket.c         | 180 ++++++++++++++++++++++++++++++++++--
>  3 files changed, 173 insertions(+), 10 deletions(-)
> 
> +static int qio_channel_socket_flush_zerocopy(QIOChannel *ioc,
> +                                             Error **errp)
> +{

> +
> +        /* No errors, count sucessfully finished sendmsg()*/

Space before */

> +        sioc->zerocopy_sent += serr->ee_data - serr->ee_info + 1;
> +    }
> +    return 0;
> +}
> +
> +#endif /* CONFIG_LINUX */
> +
>  static int
>  qio_channel_socket_set_blocking(QIOChannel *ioc,
>                                  bool enabled,
> @@ -787,6 +943,10 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>      ioc_klass->io_set_delay = qio_channel_socket_set_delay;
>      ioc_klass->io_create_watch = qio_channel_socket_create_watch;
>      ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
> +#ifdef CONFIG_LINUX
> +    ioc_klass->io_writev_zerocopy = qio_channel_socket_writev_zerocopy;
> +    ioc_klass->io_flush_zerocopy = qio_channel_socket_flush_zerocopy;
> +#endif
>  }

I did a high-level look at the code, rather than an in-depth review of
whether zero-copy was being used correctly.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


