Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D6602937
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:20:29 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjhu-0006ru-DI
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjaA-0006qb-NI
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:12:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjZy-0002KR-9b
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666087904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ch/CUPeeL58eAEnZBy0pJ+TgYVsyvSq63e9hJ5x2m/o=;
 b=VLyWJTHu8C2hXIrkUtduth3x7b1yilTQIa+lFLyqieEV4SulbB6ni/TrfgoHARAH7EZosf
 8vS82bdFKAjA96WfARoH+5zSL1uodjAimoKc7RUL7n6hSKd/IQAnqU7w7Qe3QGGLKEWCfq
 LVWn6k27ojHzL60SbLKXZGwsz8gK/v8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-DncMcSO2Ny61fJMPlr1p7w-1; Tue, 18 Oct 2022 06:11:41 -0400
X-MC-Unique: DncMcSO2Ny61fJMPlr1p7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16FD985A5B6;
 Tue, 18 Oct 2022 10:11:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0C3C23F6A;
 Tue, 18 Oct 2022 10:11:27 +0000 (UTC)
Date: Tue, 18 Oct 2022 11:11:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 04/11] io: add pwritev support to QIOChannelFile
Message-ID: <Y057zW37//RYw/ft@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-5-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010133408.3214433-5-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 04:34:01PM +0300, Nikolay Borisov wrote:
> The upcoming 'fixed-ram' feature would require qemu to write data at
> specific offsets of the file. This is currently missing so this patch
> adds it. I've chosen to implement it as a type-specific function rather
> than plumb it through the generic channel interface as it relies on
> being able to do seeks.

Well the base QIOChannel does have  an 'io_seek' callback, so it
already has some support for seeking.

In addition to this QIOChannelFile class, the QIOChannelBuffer
and QIOChannelNull classes could also allow seekable IO ops.

So I think it is OK to add this to the QIOChannel base class,
especially since your next patch adds a "SEEKABLE" feature
flag.

We have  io_writev/io_readv callbacks. If we add
io_pwritev/io_preadv callbacks too, we should validate that
they exist when the SEEKABLE feature is marked present.

> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  include/io/channel-file.h |  5 +++++
>  io/channel-file.c         | 24 ++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/io/channel-file.h b/include/io/channel-file.h
> index 50e8eb113868..0a5d54f5e58e 100644
> --- a/include/io/channel-file.h
> +++ b/include/io/channel-file.h
> @@ -89,4 +89,9 @@ qio_channel_file_new_path(const char *path,
>                            mode_t mode,
>                            Error **errp);
>  
> +ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
> +				 const struct iovec *iov,
> +				 size_t niov,
> +				 off_t offset,
> +				 Error **errp);
>  #endif /* QIO_CHANNEL_FILE_H */
> diff --git a/io/channel-file.c b/io/channel-file.c
> index b67687c2aa64..da17d0a11ba7 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -136,6 +136,30 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
>      return ret;
>  }
>  
> +ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
> +				 const struct iovec *iov,
> +				 size_t niov,
> +				 off_t offset,
> +				 Error **errp)
> +{
> +    QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
> +    ssize_t ret;
> +
> + retry:
> +    ret = pwritev(fioc->fd, iov, niov, offset);
> +    if (ret <= 0) {
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +        error_setg_errno(errp, errno, "Unable to write to file");
> +        return -1;
> +    }
> +    return ret;
> +}
> +
>  static int qio_channel_file_set_blocking(QIOChannel *ioc,
>                                           bool enabled,
>                                           Error **errp)
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


