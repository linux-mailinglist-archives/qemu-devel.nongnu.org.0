Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190960294A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:25:31 +0200 (CEST)
Received: from localhost ([::1]:59592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjmr-0000hv-Tf
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjbx-0001lv-N1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjbu-0002eo-Ov
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666088050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+W0s4NnmrqfkemJbJqMXfV6dXNQcaGGJArS8cNPBupg=;
 b=Jmu3X5E5eoPPHnrPvogu+Xmv/osxK69jHAuCAahllTFEtPsCs/jNDshokjm+gGhLRXwpkc
 8tNCV/BmDAQ/zfgFLrMvKtAqR4IeUrbj6RehmWj2lCAHcIWdyqaggmy2XbNvuKJmq6HdwL
 wPbzPcCp9F0cwWYav0HA9YC60OQ6YTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-VtmRrEZgNpKJqG6S7d5Shg-1; Tue, 18 Oct 2022 06:14:08 -0400
X-MC-Unique: VtmRrEZgNpKJqG6S7d5Shg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62E9F185A792;
 Tue, 18 Oct 2022 10:14:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4A9A40C2065;
 Tue, 18 Oct 2022 10:14:06 +0000 (UTC)
Date: Tue, 18 Oct 2022 11:14:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 05/11] io: Add support for seekable channels
Message-ID: <Y058a4c549dx50d+@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-6-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010133408.3214433-6-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 04:34:02PM +0300, Nikolay Borisov wrote:
>  Add a bunch of auxiliarry methods and a feature flag to work with
>  SEEKABLE channels. Currently the only channel considered seekable is
>  QIOChannelFile. Also add a bunch of helper functions to QEMUFile that
>  can make use of this channel feature. All of this is in prepration for
>  supporting 'fixed-ram' migration stream feature.

QIOChannelBuffer/Null are also seekable.

> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  include/io/channel.h                |  1 +
>  include/migration/qemu-file-types.h |  2 +
>  io/channel-file.c                   |  5 +++
>  migration/qemu-file.c               | 59 +++++++++++++++++++++++++++++
>  migration/qemu-file.h               |  3 ++
>  5 files changed, 70 insertions(+)

Can you separate the migration/ tree bits into a second patch
that follows the io/ bits.

> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee748021..4fc37c78e68c 100644
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
> diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
> index 2867e3da84ab..eb0325ee8687 100644
> --- a/include/migration/qemu-file-types.h
> +++ b/include/migration/qemu-file-types.h
> @@ -50,6 +50,8 @@ unsigned int qemu_get_be16(QEMUFile *f);
>  unsigned int qemu_get_be32(QEMUFile *f);
>  uint64_t qemu_get_be64(QEMUFile *f);
>  
> +bool qemu_file_is_seekable(QEMUFile *f);
> +
>  static inline void qemu_put_be64s(QEMUFile *f, const uint64_t *pv)
>  {
>      qemu_put_be64(f, *pv);
> diff --git a/io/channel-file.c b/io/channel-file.c
> index da17d0a11ba7..d84a6737f2f7 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -35,6 +35,7 @@ qio_channel_file_new_fd(int fd)
>  
>      ioc->fd = fd;
>  
> +    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
>      trace_qio_channel_file_new_fd(ioc, fd);
>  
>      return ioc;
> @@ -59,6 +60,10 @@ qio_channel_file_new_path(const char *path,
>          return NULL;
>      }
>  
> +    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
> +        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
> +    }
> +
>      trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);

Wondering why you do the lseek() sanitytest for only one of the
two constructors ? Shouldn't we do it for both ?




With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


