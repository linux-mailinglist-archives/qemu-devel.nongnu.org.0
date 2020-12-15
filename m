Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408B2DAA9E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:10:19 +0100 (CET)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7Hc-00074N-IX
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp7G6-0006U1-3O
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp7G4-0008G5-8v
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026919;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w6ZPY/Z3GaAdR0pQTzOavHZvdW/IqbFGgF5UY7HhEQ8=;
 b=LmTq03KLdzz1K8+o+dsw8AZPeWUSzlvXkoLiLPWww2RSl5z9K1adslFj+fb5dZNAG6Y416
 hZoDiRRUDQTQYFyEC/3FkNaUMpQzOBs19PzpOctDjJf17qbqd/TpU6bHJR4pH87Y/d38ri
 9mxjjCRTn7j7NlX+CQ3+ims1LA9jqt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-742VPhgZM1-KKWI3FrhOIA-1; Tue, 15 Dec 2020 05:08:37 -0500
X-MC-Unique: 742VPhgZM1-KKWI3FrhOIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C55B11005513;
 Tue, 15 Dec 2020 10:08:35 +0000 (UTC)
Received: from redhat.com (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8530262690;
 Tue, 15 Dec 2020 10:08:33 +0000 (UTC)
Date: Tue, 15 Dec 2020 10:08:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH v4] file-posix: detect the lock using the real file
Message-ID: <20201215100830.GG121272@redhat.com>
References: <1608016169-5639-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1608016169-5639-1-git-send-email-fengli@smartx.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 03:09:28PM +0800, Li Feng wrote:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> In the original code, the qemu_has_ofd_lock will test the lock on the
> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> which depends on the underlay filesystem.
> 
> In this patch, add a new 'qemu_has_file_lock' to detect whether the
> file supports the file lock. And disable the lock when the underlay file
> system doesn't support locks.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
> v4: use the fd as the qemu_has_file_lock argument.
> v3: don't call the qemu_has_ofd_lock, use a new function instead.
> v2: remove the refactoring.
> ---
>  block/file-posix.c   | 66 +++++++++++++++++++++++++-------------------
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 19 +++++++++++++
>  3 files changed, 58 insertions(+), 28 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 806764f7e3..9708212f01 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>      s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
>  #endif
>  
> +    s->open_flags = open_flags;
> +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> +
> +    s->fd = -1;
> +    fd = qemu_open(filename, s->open_flags, errp);
> +    ret = fd < 0 ? -errno : 0;
> +
> +    if (ret < 0) {
> +        if (ret == -EROFS) {
> +            ret = -EACCES;
> +        }
> +        goto fail;
> +    }
> +    s->fd = fd;
> +
>      locking = qapi_enum_parse(&OnOffAuto_lookup,
>                                qemu_opt_get(opts, "locking"),
>                                ON_OFF_AUTO_AUTO, &local_err);
> @@ -607,6 +622,13 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>          break;
>      case ON_OFF_AUTO_AUTO:
>          s->use_lock = qemu_has_ofd_lock();
> +        if (s->use_lock && !qemu_has_file_lock(s->fd)) {
> +            /*
> +             * When the os supports the OFD lock, but the filesystem doesn't
> +             * support, just disable the file lock.
> +             */
> +            s->use_lock = false;
> +        }

This should just be

  s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();



> diff --git a/util/osdep.c b/util/osdep.c
> index 66d01b9160..07de97e2c5 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -225,6 +225,25 @@ static void qemu_probe_lock_ops(void)
>      }
>  }
>  
> +bool qemu_has_file_lock(int fd)
> +{
> +#ifdef F_OFD_SETLK
> +    int cmd = F_OFD_GETLK;
> +#else
> +    int cmd = F_GETLK;
> +#endif

This should unconditionally use  F_GETLK.

> +    int ret;
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 0,
> +        .l_len    = 0,
> +        .l_type   = F_WRLCK,
> +    };
> +
> +    ret = fcntl(fd, cmd, &fl);
> +    return ret == 0;
> +}

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


