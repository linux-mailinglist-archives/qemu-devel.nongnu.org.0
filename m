Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A176F692379
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWQJ-00022x-4Y; Fri, 10 Feb 2023 11:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWQ5-0001Z5-HX
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWPx-0000Id-LY
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676047112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQkNeFVscHMG6MKQ4QkvQihyiJ+4DYVaY+eRadbBTsU=;
 b=JmwZ64SzVxb/s83wCImEvY5b0LnW2tS9qUqLTz12dyC20uaSky6vFwgBtf33xKgmBAsGuL
 H7k5npLA1bqru1HyuVQuZFffUJyuDNj4oTJ0Et0kH+4RMtPYPyDzTnMPAiqtm6v8VUtBxN
 z1miyiF4qjrFhQJlBIHs6niqrmBI9QM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-6ZgJH7BDOT291Y4SdIBILw-1; Fri, 10 Feb 2023 11:38:31 -0500
X-MC-Unique: 6ZgJH7BDOT291Y4SdIBILw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801AB800B23;
 Fri, 10 Feb 2023 16:38:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8B42026D4B;
 Fri, 10 Feb 2023 16:38:28 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:38:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 06/14] io: add and implement
 QIO_CHANNEL_FEATURE_SEEKABLE for channel file
Message-ID: <Y+ZzAVGfXGU73WCT@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-7-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028103914.908728-7-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Fri, Oct 28, 2022 at 01:39:06PM +0300, Nikolay Borisov wrote:
> Add a generic QIOChannel feature SEEKABLE which would be used by the
> qemu_file* apis. For the time being this will be only implemented for
> file channels.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  include/io/channel.h | 1 +
>  io/channel-file.c    | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 6b10bce8bbdf..b645989e467c 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -41,6 +41,7 @@ enum QIOChannelFeature {
>      QIO_CHANNEL_FEATURE_SHUTDOWN,
>      QIO_CHANNEL_FEATURE_LISTEN,
>      QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
> +    QIO_CHANNEL_FEATURE_SEEKABLE,
>  };
>  
>  
> diff --git a/io/channel-file.c b/io/channel-file.c
> index a7a90c12dc2b..e213a0fd7cd2 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -35,6 +35,11 @@ qio_channel_file_new_fd(int fd)
>  
>      ioc->fd = fd;
>  
> +    if (lseek(fd, 0, SEEK_CUR) != (off_t)-1) {
> +        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
> +    }
> +
> +    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);

This second qio_channel_set_feature call is a rebase mistake I
presume. With that removed, the rest of the patch looks fine

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


>      trace_qio_channel_file_new_fd(ioc, fd);
>  
>      return ioc;
> @@ -59,6 +64,10 @@ qio_channel_file_new_path(const char *path,
>          return NULL;
>      }
>  
> +    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
> +        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
> +    }
> +
>      trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);
>  
>      return ioc;
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


