Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE613DE896
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:41:44 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApzb-0003Sa-Ub
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mApyr-0002mW-01
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mApyp-00006J-EL
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627980054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4JUysufm00XA6g+h1uQWa1/z6dhEowF3NYz7faFiU0=;
 b=VqvKFmlzwae+HL2FJv5h0J9frDoXjXoR6GQNZAcG+ou61jKxj1IytuGz9JlRi+Q6IayJ10
 S6mG4hUSV/pQDZaGdyH+K0E3vPRklfhZeV+2+K+F60U/Bmj3ZrCmh4PGk8Y0eyxfOby9IT
 X28e8y5CYf5UiB4HvgQo1JmMNdkkkFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-X216L2oXPpewgpLIXImtSg-1; Tue, 03 Aug 2021 04:40:50 -0400
X-MC-Unique: X216L2oXPpewgpLIXImtSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728AD801AEB
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 08:40:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 535CC5F707;
 Tue,  3 Aug 2021 08:40:43 +0000 (UTC)
Date: Tue, 3 Aug 2021 09:40:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/4] chardev: fix qemu_chr_open_fd() being called with
 fd=-1
Message-ID: <YQkBCUCoXpHR8cZ6@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
 <20210723102825.1790112-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723102825.1790112-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 02:28:22PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The "file" chardev may call qemu_chr_open_fd() with fd_in=-1. This may
> cause invalid system calls, as the QIOChannel is assumed to be properly
> initialized later on.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-fd.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index 1cd62f2779..ee85a52c06 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -133,15 +133,19 @@ void qemu_chr_open_fd(Chardev *chr,
>      FDChardev *s = FD_CHARDEV(chr);
>      char *name;
>  
> -    s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
> -    name = g_strdup_printf("chardev-file-in-%s", chr->label);
> -    qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
> -    g_free(name);
> -    s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
> -    name = g_strdup_printf("chardev-file-out-%s", chr->label);
> -    qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
> -    g_free(name);
> -    qemu_set_nonblock(fd_out);
> +    if (fd_in >= 0) {
> +        s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
> +        name = g_strdup_printf("chardev-file-in-%s", chr->label);
> +        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
> +        g_free(name);
> +    }
> +    if (fd_out >= 0) {
> +        s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
> +        name = g_strdup_printf("chardev-file-out-%s", chr->label);
> +        qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
> +        g_free(name);
> +        qemu_set_nonblock(fd_out);
> +    }

Other code in this file assumes ioc_out is non-NULL, so this looks
like an incomplete fix.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


