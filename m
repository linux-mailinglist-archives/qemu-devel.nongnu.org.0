Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A354E615
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 17:30:32 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1rS2-0000Oh-Ri
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 11:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1rQx-000834-Lx
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1rQt-000634-KK
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655393358;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9MTxsqeRvhIC3co1C7GnyavpcVlF2IDmlaAZEkpZO/0=;
 b=b5ebsz2RcZxubNa5kEFuJON3NsIQKI+LwWZCozh8EDUX1glaWhd+gr79swDRmo0CsP9i9E
 fGqZHWEElWAdo+0cdWn0TKVKXaQDYfrKGl5xjx1ZrlikJO3udtLZX3HAWiskoQynaa68Vh
 EsQfcC+BCHFmpwNPh6lxzFI1L7HdNE8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-wCDJ2gHEP_WDCggtXzd2Mw-1; Thu, 16 Jun 2022 11:29:15 -0400
X-MC-Unique: wCDJ2gHEP_WDCggtXzd2Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F08C5811E83;
 Thu, 16 Jun 2022 15:29:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AA41121314;
 Thu, 16 Jun 2022 15:29:06 +0000 (UTC)
Date: Thu, 16 Jun 2022 16:29:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
Message-ID: <YqtMQFqFR3+b26YO@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 07:51:49AM -0700, Steve Sistare wrote:
> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
> files and file descriptors.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>  migration/qemu-file-channel.h |  6 ++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index bb5a575..cc5aebc 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -27,8 +27,10 @@
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
> +#include "io/channel-file.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
> +#include "qapi/error.h"
>  #include "yank_functions.h"
>  
>  
> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>      object_ref(OBJECT(ioc));
>      return qemu_fopen_ops(ioc, &channel_output_ops, true);
>  }
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                          const char *name, Error **errp)
> +{
> +    g_autoptr(QIOChannelFile) fioc = NULL;
> +    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {

IIRC, O_RDWR may expand to more than 1 bit, so needs a strict
equality test

   if ((flags & O_RDWR) == O_RDWR)

> +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
> +        return NULL;
> +    }
> +
> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
> +    if (!fioc) {
> +        return NULL;
> +    }
> +
> +    ioc = QIO_CHANNEL(fioc);
> +    qio_channel_set_name(ioc, name);
> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    return f;
> +}
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
> +{
> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    qio_channel_set_name(ioc, name);
> +    return f;
> +}
> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
> index 0028a09..75fd0ad 100644
> --- a/migration/qemu-file-channel.h
> +++ b/migration/qemu-file-channel.h
> @@ -29,4 +29,10 @@
>  
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                         const char *name, Error **errp);
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);

Note we used the explicit names "_input" and "_output" in
the existing methods as they're more readable in the calling
sides than "true" / "false".

Similarly we had qemu_open vs qemu_create, so that we don't
have the ambiguity of whuether 'mode' is needed or not. IOW,
I'd suggest we have 

 QEMUFile *qemu_fopen_file_output(const char *path, int mode,
                                  const char *name, Error **errp);
 QEMUFile *qemu_fopen_file_input(const char *path,
                                  const char *name, Error **errp);

 QEMUFile *qemu_fopen_fd_input(int fd, const char *name);
 QEMUFile *qemu_fopen_fd_output(int fd, const char *name);


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


