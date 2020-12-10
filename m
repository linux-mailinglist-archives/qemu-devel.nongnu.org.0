Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458F2D630E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:09:34 +0100 (CET)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPRd-0002YO-JC
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knPDy-0008Pn-NM
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knPDm-0006a8-SS
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607619313;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gMfgfwygsWKecuKUW+tDv1BgtpQ1oawnXPCLGRnk7jc=;
 b=DL5FBDyqOaTC/BK4Y33P5tfhmODEjsHOYoma8NICUkeAfxX8cgVG9ZIdVm/wr68AVeUQmD
 +RGihnoeDTGMv3K3YP8GqYZNv2lCPm94TVw1lbW51qcrcEsjtQJKFI5NtDGCNl4DUVlk/q
 b+dST5oK8jnVqAPaWthST8QKe0S28ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-kfj9j0-_MnKbu4bKblSPLA-1; Thu, 10 Dec 2020 11:55:06 -0500
X-MC-Unique: kfj9j0-_MnKbu4bKblSPLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC686800D53;
 Thu, 10 Dec 2020 16:55:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E27E160BF3;
 Thu, 10 Dec 2020 16:55:02 +0000 (UTC)
Date: Thu, 10 Dec 2020 16:54:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH v3] file-posix: detect the lock using the real file
Message-ID: <20201210165459.GO24855@redhat.com>
References: <1607618299-55092-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1607618299-55092-1-git-send-email-fengli@smartx.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Dec 11, 2020 at 12:38:19AM +0800, Li Feng wrote:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> Add a new function 'qemu_has_file_lock' to detect if the filesystem supports locks
> or not.
> And when the drive is auto mode, use the 'qemu_has_file_lock' to set the toggle.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
> v3: don't call the qemu_has_ofd_lock, use a new function instead.
> v2: remove the refactoring.
> ---
>  block/file-posix.c   | 30 +++++++++++++++++-------------
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 29 +++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 806764f7e3..48f9a32de2 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>          s->use_lock = false;
>          break;
>      case ON_OFF_AUTO_AUTO:
> -        s->use_lock = qemu_has_ofd_lock();
> +        s->use_lock = qemu_has_file_lock(filename);

This is not good - it causes us to always use locks by default, where
as previously we only used them if OFD was available. It neds to test
both here, except opening + closing filename to test for fnctl support
risks releasing any locks QEMU already holds on filename if OFD is not
supported.

>          break;
>      default:
>          abort();
> @@ -2388,6 +2388,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>      int fd;
>      uint64_t perm, shared;
>      int result = 0;
> +    bool use_lock;
>  
>      /* Validate options and set default values */
>      assert(options->driver == BLOCKDEV_DRIVER_FILE);
> @@ -2428,19 +2429,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>      perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
>      shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
>  
> -    /* Step one: Take locks */
> -    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> -    if (result < 0) {
> -        goto out_close;
> -    }
> +    use_lock = qemu_has_file_lock(file_opts->filename);

This cause QEMU to open and close filename. If another thread
already had filename open, and OFD is not support, we've just
lock the locks we held. We need to use 'fd' which is already
open.

> +    if (use_lock) {
> +        /* Step one: Take locks */
> +        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> +        if (result < 0) {
> +            goto out_close;
> +        }
>  
> -    /* Step two: Check that nobody else has taken conflicting locks */
> -    result = raw_check_lock_bytes(fd, perm, shared, errp);
> -    if (result < 0) {
> -        error_append_hint(errp,
> -                          "Is another process using the image [%s]?\n",
> -                          file_opts->filename);
> -        goto out_unlock;
> +        /* Step two: Check that nobody else has taken conflicting locks */
> +        result = raw_check_lock_bytes(fd, perm, shared, errp);
> +        if (result < 0) {
> +            error_append_hint(errp,
> +                              "Is another process using the image [%s]?\n",
> +                              file_opts->filename);
> +            goto out_unlock;
> +        }
>      }
>  
>      /* Clear the file by truncating it to 0 */


> +bool qemu_has_file_lock(const char *filename)

IMO thisshould just accept a pre-opened 'int fd'

> +{
> +#ifdef F_OFD_SETLK
> +    int cmd = F_OFD_GETLK;
> +#else
> +    int cmd = F_GETLK;
> +#endif
> +        int fd;
> +        int ret;
> +        struct flock fl = {
> +            .l_whence = SEEK_SET,
> +            .l_start  = 0,
> +            .l_len    = 0,
> +            .l_type   = F_WRLCK,
> +        };
> +
> +        fd = open(filename, O_RDWR);
> +        if (fd < 0) {
> +            fprintf(stderr,
> +                    "Failed to open %s for OFD lock probing: %s\n",
> +                    filename,
> +                    strerror(errno));
> +            return false;
> +        }
> +        ret = fcntl(fd, cmd, &fl);
> +        close(fd);
> +        return ret == 0;
> +}
> +
>  bool qemu_has_ofd_lock(void)
>  {
>      qemu_probe_lock_ops();

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


