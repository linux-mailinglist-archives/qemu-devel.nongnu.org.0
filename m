Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF33DE8A7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:45:34 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAq3J-0007Mg-Ln
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAq2B-0006BQ-0g
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAq29-0003OJ-7e
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627980260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HP2nzeub2fXT0KZVsrXSPl2mZU4Pran+64Ik+8tCTA=;
 b=EqeOiHta4iMM77Uyt64zoCIm6e3gmaAXcPuecHZP9AQYnZR5clbRBTmAxceSZwQQOzogDS
 HKQI6dj4Hj7t4IinPFaAun7zH0XO6TeUKxzVS3bmPyC833dxl+bU+VBACQQ0NYwuqbHobR
 KpldCw/K/tnJiE5dpvFoT4rgcfVDxl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Vv42cGWOMgOthoJvTUDvaw-1; Tue, 03 Aug 2021 04:44:16 -0400
X-MC-Unique: Vv42cGWOMgOthoJvTUDvaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13311084F53
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 08:44:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1D0810016F5;
 Tue,  3 Aug 2021 08:44:11 +0000 (UTC)
Date: Tue, 3 Aug 2021 09:44:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 2/4] chardev: fix qemu_chr_open_fd() with fd_in==fd_out
Message-ID: <YQkB2OVWERulr/UQ@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
 <20210723102825.1790112-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723102825.1790112-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jul 23, 2021 at 02:28:23PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The "serial" chardev calls qemu_chr_open_fd() with the same fd. This
> may lead to double-close as each QIOChannel owns the fd.
> 
> Instead, share the reference to the same QIOChannel.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-fd.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index ee85a52c06..32166182bf 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -139,13 +139,24 @@ void qemu_chr_open_fd(Chardev *chr,
>          qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
>          g_free(name);
>      }
> -    if (fd_out >= 0) {
> +
> +    if (fd_out < 0) {
> +        return;
> +    }
> +
> +    if (fd_out == fd_in) {
> +        s->ioc_out = QIO_CHANNEL(object_ref(s->ioc_in));
> +        name = g_strdup_printf("chardev-file-%s", chr->label);
> +        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
> +        g_free(name);

This is overwriting the name set a few lines earlier. I think the
code ought to be refactor to eliminate this duplication.

ie

  if (fd_out == fd_in) {
    s->ioc_out = s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
    ....
  } else {
    s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
    ...
    s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
    ...
  }

> +    } else {
>          s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
>          name = g_strdup_printf("chardev-file-out-%s", chr->label);
>          qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
>          g_free(name);
> -        qemu_set_nonblock(fd_out);
>      }
> +
> +    qemu_set_nonblock(fd_out);
>  }
>  
>  static void char_fd_class_init(ObjectClass *oc, void *data)
> -- 
> 2.32.0.264.g75ae10bc75
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


