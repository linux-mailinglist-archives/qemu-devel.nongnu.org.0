Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633F2D2C2D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:48:28 +0100 (CET)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdLv-0006Lb-CA
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmdJI-0005K1-1T
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmdJE-00010U-IE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607435138;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9ZWpGQT6ZWiH5cc7k/AB5bI1iC8XOrqw2Yr0lncP7mg=;
 b=iammYDy0/z99AsZyEeT0sPXp2rcs1PK/sGg81Up6uF1gdrSx1dJEdG5Psv6yKttKtT7kz2
 NDURZANc0lwGJ4JYTc0+W/LA2PpAkGnGa2nqnsgsJh9OxnQjKXG7ZRAntuXmMJFjdpRO+C
 PLWd7JRBz+pqNqTGbZ6I2JkSYdaaI2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-sITEjmWgPbqXp5SqLlwgXg-1; Tue, 08 Dec 2020 08:45:26 -0500
X-MC-Unique: sITEjmWgPbqXp5SqLlwgXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 433F3180A0A4;
 Tue,  8 Dec 2020 13:45:25 +0000 (UTC)
Received: from redhat.com (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82C55C1BB;
 Tue,  8 Dec 2020 13:45:22 +0000 (UTC)
Date: Tue, 8 Dec 2020 13:45:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
Message-ID: <20201208134519.GJ3136942@redhat.com>
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
MIME-Version: 1.0
In-Reply-To: <1607432377-87084-1-git-send-email-fengli@smartx.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Dec 08, 2020 at 08:59:37PM +0800, Li Feng wrote:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> In the original code, the qemu_has_ofd_lock will test the lock on the
> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> which depends on the underlay filesystem.

IIUC, the problem you're describing is one of whether the filesystem
supports fcntl locking at all, which is indeed a per-FS check.

The QEMU code being changed though is just about detecting whether
the host OS supports OFD to not, which is supposed to be a kernel
level feature applied  universally to all FS types.

> 
> In this patch, make the 'qemu_has_ofd_lock' with a filename be more generic
> and reasonable.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
>  block/file-posix.c         | 32 +++++++++++++++-------------
>  include/qemu/osdep.h       |  2 +-
>  tests/test-image-locking.c |  2 +-
>  util/osdep.c               | 43 ++++++++++++++++++++++++--------------
>  4 files changed, 47 insertions(+), 32 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 806764f7e3..03be1b188c 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -595,7 +595,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>      switch (locking) {
>      case ON_OFF_AUTO_ON:
>          s->use_lock = true;
> -        if (!qemu_has_ofd_lock()) {
> +        if (!qemu_has_ofd_lock(filename)) {
>              warn_report("File lock requested but OFD locking syscall is "
>                          "unavailable, falling back to POSIX file locks");
>              error_printf("Due to the implementation, locks can be lost "
> @@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>          s->use_lock = false;
>          break;
>      case ON_OFF_AUTO_AUTO:
> -        s->use_lock = qemu_has_ofd_lock();
> +        s->use_lock = qemu_has_ofd_lock(filename);
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
> +    use_lock = qemu_has_ofd_lock(file_opts->filename);
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
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..349adad465 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -512,7 +512,7 @@ int qemu_dup(int fd);
>  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
> -bool qemu_has_ofd_lock(void);
> +bool qemu_has_ofd_lock(const char *filename);
>  #endif
>  
>  #if defined(__HAIKU__) && defined(__i386__)
> diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
> index ba057bd66c..3e80246081 100644
> --- a/tests/test-image-locking.c
> +++ b/tests/test-image-locking.c
> @@ -149,7 +149,7 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -    if (qemu_has_ofd_lock()) {
> +    if (qemu_has_ofd_lock(NULL)) {
>          g_test_add_func("/image-locking/basic", test_image_locking_basic);
>          g_test_add_func("/image-locking/set-perm-abort", test_set_perm_abort);
>      }
> diff --git a/util/osdep.c b/util/osdep.c
> index 66d01b9160..e7e502edd1 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -42,6 +42,7 @@ extern int madvise(char *, size_t, int);
>  static bool fips_enabled = false;
>  
>  static const char *hw_version = QEMU_HW_VERSION;
> +static const char *null_device = "/dev/null";
>  
>  int socket_set_cork(int fd, int v)
>  {
> @@ -187,11 +188,10 @@ static int qemu_parse_fdset(const char *param)
>      return qemu_parse_fd(param);
>  }
>  
> -static void qemu_probe_lock_ops(void)
> +static void qemu_probe_lock_ops_fd(int fd)
>  {
>      if (fcntl_op_setlk == -1) {
>  #ifdef F_OFD_SETLK
> -        int fd;
>          int ret;
>          struct flock fl = {
>              .l_whence = SEEK_SET,
> @@ -200,17 +200,7 @@ static void qemu_probe_lock_ops(void)
>              .l_type   = F_WRLCK,
>          };
>  
> -        fd = open("/dev/null", O_RDWR);
> -        if (fd < 0) {
> -            fprintf(stderr,
> -                    "Failed to open /dev/null for OFD lock probing: %s\n",
> -                    strerror(errno));
> -            fcntl_op_setlk = F_SETLK;
> -            fcntl_op_getlk = F_GETLK;
> -            return;
> -        }
>          ret = fcntl(fd, F_OFD_GETLK, &fl);
> -        close(fd);
>          if (!ret) {
>              fcntl_op_setlk = F_OFD_SETLK;
>              fcntl_op_getlk = F_OFD_GETLK;
> @@ -225,9 +215,30 @@ static void qemu_probe_lock_ops(void)
>      }
>  }
>  
> -bool qemu_has_ofd_lock(void)
> +static void qemu_probe_lock_ops(const char *filename)
> +{
> +    int fd;
> +    if (filename) {
> +        fd = open(filename, O_RDWR);
> +    } else {
> +        fd = open(null_device, O_RDONLY);
> +    }
> +    if (fd < 0) {
> +        fprintf(stderr,
> +                "Failed to open %s for OFD lock probing: %s\n",
> +                filename ? filename : null_device,
> +                strerror(errno));
> +        fcntl_op_setlk = F_SETLK;
> +        fcntl_op_getlk = F_GETLK;
> +        return;
> +    }
> +    qemu_probe_lock_ops_fd(fd);
> +    close(fd);
> +}
> +

This method now does a test whose results will vary based on the
filename passed in, but it is updating a global variable to say
whether to use OFD locks.  This is looks badly broken when using
files across different filesystems.

IMHO the raw_co_create method just needs to use a dedicated method
to check whether fcntl locks are supposed, and all this broken
refactoring of the OFD check should be removed.

> +bool qemu_has_ofd_lock(const char *filename)
>  {
> -    qemu_probe_lock_ops();
> +    qemu_probe_lock_ops(filename);
>  #ifdef F_OFD_SETLK
>      return fcntl_op_setlk == F_OFD_SETLK;
>  #else
> @@ -244,7 +255,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
>          .l_len    = len,
>          .l_type   = fl_type,
>      };
> -    qemu_probe_lock_ops();
> +    qemu_probe_lock_ops_fd(fd);
>      do {
>          ret = fcntl(fd, fcntl_op_setlk, &fl);
>      } while (ret == -1 && errno == EINTR);
> @@ -270,7 +281,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
>          .l_len    = len,
>          .l_type   = exclusive ? F_WRLCK : F_RDLCK,
>      };
> -    qemu_probe_lock_ops();
> +    qemu_probe_lock_ops_fd(fd);
>      ret = fcntl(fd, fcntl_op_getlk, &fl);
>      if (ret == -1) {
>          return -errno;
> -- 
> 2.24.3
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


