Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53C851BC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 19:09:38 +0200 (CEST)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvPRR-000898-V2
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 13:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvPQr-0007So-Dx
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvPQp-0005mY-Ff
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:09:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvPQp-0005m1-6w
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:08:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7546D300BEA5;
 Wed,  7 Aug 2019 17:08:58 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7A415D9DC;
 Wed,  7 Aug 2019 17:08:56 +0000 (UTC)
Date: Wed, 7 Aug 2019 18:08:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Message-ID: <20190807170854.GA27871@work-vm>
References: <20190422103420.15686-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190422103420.15686-1-yury-kotov@yandex-team.ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 07 Aug 2019 17:08:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: Add error_desc for file channel
 errors
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 yc-core@yandex-team.ru, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yury Kotov (yury-kotov@yandex-team.ru) wrote:
> Currently, there is no information about error if outgoing migration was failed
> because of file channel errors.
> Example (QMP session):
> -> { "execute": "migrate", "arguments": { "uri": "exec:head -c 1" }}
> <- { "return": {} }
> ...
> -> { "execute": "query-migrate" }
> <- { "return": { "status": "failed" }} // There is not error's description
> 
> And even in the QEMU's output there is nothing.
> 
> This patch
> 1) Adds errp for the most of QEMUFileOps
> 2) Adds qemu_file_get_error_obj/qemu_file_set_error_obj
> 3) And finally using of qemu_file_get_error_obj in migration.c
> 
> And now, the status for the mentioned fail will be:
> -> { "execute": "query-migrate" }
> <- { "return": { "status": "failed",
>                  "error-desc": "Unable to write to command: Broken pipe" }}
> 
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>

Quued for 4.2

> ---
>  migration/migration.c         | 10 ++++--
>  migration/qemu-file-channel.c | 30 +++++++++--------
>  migration/qemu-file.c         | 63 ++++++++++++++++++++++++++++-------
>  migration/qemu-file.h         | 15 ++++++---
>  migration/savevm.c            |  6 ++--
>  5 files changed, 88 insertions(+), 36 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 609e0df5d0..7bcdc4613b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2949,6 +2949,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>  {
>      int ret;
>      int state = s->state;
> +    Error *local_error = NULL;
>  
>      if (state == MIGRATION_STATUS_CANCELLING ||
>          state == MIGRATION_STATUS_CANCELLED) {
> @@ -2957,13 +2958,18 @@ static MigThrError migration_detect_error(MigrationState *s)
>      }
>  
>      /* Try to detect any file errors */
> -    ret = qemu_file_get_error(s->to_dst_file);
> -
> +    ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
>      if (!ret) {
>          /* Everything is fine */
> +        assert(!local_error);
>          return MIG_THR_ERR_NONE;
>      }
>  
> +    if (local_error) {
> +        migrate_set_error(s, local_error);
> +        error_free(local_error);
> +    }
> +
>      if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
>          /*
>           * For postcopy, we allow the network to be down for a
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 8e639eb496..c382ea2d78 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -33,7 +33,8 @@
>  static ssize_t channel_writev_buffer(void *opaque,
>                                       struct iovec *iov,
>                                       int iovcnt,
> -                                     int64_t pos)
> +                                     int64_t pos,
> +                                     Error **errp)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ssize_t done = 0;
> @@ -47,7 +48,7 @@ static ssize_t channel_writev_buffer(void *opaque,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_writev(ioc, local_iov, nlocal_iov, NULL);
> +        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -57,7 +58,6 @@ static ssize_t channel_writev_buffer(void *opaque,
>              continue;
>          }
>          if (len < 0) {
> -            /* XXX handle Error objects */
>              done = -EIO;
>              goto cleanup;
>          }
> @@ -75,13 +75,14 @@ static ssize_t channel_writev_buffer(void *opaque,
>  static ssize_t channel_get_buffer(void *opaque,
>                                    uint8_t *buf,
>                                    int64_t pos,
> -                                  size_t size)
> +                                  size_t size,
> +                                  Error **errp)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ssize_t ret;
>  
>      do {
> -        ret = qio_channel_read(ioc, (char *)buf, size, NULL);
> +        ret = qio_channel_read(ioc, (char *)buf, size, errp);
>          if (ret < 0) {
>              if (ret == QIO_CHANNEL_ERR_BLOCK) {
>                  if (qemu_in_coroutine()) {
> @@ -90,7 +91,6 @@ static ssize_t channel_get_buffer(void *opaque,
>                      qio_channel_wait(ioc, G_IO_IN);
>                  }
>              } else {
> -                /* XXX handle Error * object */
>                  return -EIO;
>              }
>          }
> @@ -100,18 +100,20 @@ static ssize_t channel_get_buffer(void *opaque,
>  }
>  
>  
> -static int channel_close(void *opaque)
> +static int channel_close(void *opaque, Error **errp)
>  {
> +    int ret;
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
> -    qio_channel_close(ioc, NULL);
> +    ret = qio_channel_close(ioc, errp);
>      object_unref(OBJECT(ioc));
> -    return 0;
> +    return ret;
>  }
>  
>  
>  static int channel_shutdown(void *opaque,
>                              bool rd,
> -                            bool wr)
> +                            bool wr,
> +                            Error **errp)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>  
> @@ -125,8 +127,7 @@ static int channel_shutdown(void *opaque,
>          } else {
>              mode = QIO_CHANNEL_SHUTDOWN_WRITE;
>          }
> -        if (qio_channel_shutdown(ioc, mode, NULL) < 0) {
> -            /* XXX handler Error * object */
> +        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
>              return -EIO;
>          }
>      }
> @@ -135,11 +136,12 @@ static int channel_shutdown(void *opaque,
>  
>  
>  static int channel_set_blocking(void *opaque,
> -                                bool enabled)
> +                                bool enabled,
> +                                Error **errp)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>  
> -    if (qio_channel_set_blocking(ioc, enabled, NULL) < 0) {
> +    if (qio_channel_set_blocking(ioc, enabled, errp) < 0) {
>          return -1;
>      }
>      return 0;
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 977b9ae07c..c52160e08b 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -29,6 +29,7 @@
>  #include "migration.h"
>  #include "qemu-file.h"
>  #include "trace.h"
> +#include "qapi/error.h"
>  
>  #define IO_BUF_SIZE 32768
>  #define MAX_IOV_SIZE MIN(IOV_MAX, 64)
> @@ -52,6 +53,7 @@ struct QEMUFile {
>      unsigned int iovcnt;
>  
>      int last_error;
> +    Error *last_error_obj;
>  };
>  
>  /*
> @@ -63,7 +65,7 @@ int qemu_file_shutdown(QEMUFile *f)
>      if (!f->ops->shut_down) {
>          return -ENOSYS;
>      }
> -    return f->ops->shut_down(f->opaque, true, true);
> +    return f->ops->shut_down(f->opaque, true, true, NULL);
>  }
>  
>  /*
> @@ -108,24 +110,55 @@ void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
>  }
>  
>  /*
> - * Get last error for stream f
> + * Get last error for stream f with optional Error*
>   *
>   * Return negative error value if there has been an error on previous
>   * operations, return 0 if no error happened.
> + * Optional, it returns Error* in errp, but it may be NULL even if return value
> + * is not 0.
>   *
>   */
> -int qemu_file_get_error(QEMUFile *f)
> +int qemu_file_get_error_obj(QEMUFile *f, Error **errp)
>  {
> +    if (errp) {
> +        *errp = f->last_error_obj ? error_copy(f->last_error_obj) : NULL;
> +    }
>      return f->last_error;
>  }
>  
> -void qemu_file_set_error(QEMUFile *f, int ret)
> +/*
> + * Set the last error for stream f with optional Error*
> + */
> +void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err)
>  {
> -    if (f->last_error == 0) {
> +    if (f->last_error == 0 && ret) {
>          f->last_error = ret;
> +        error_propagate(&f->last_error_obj, err);
> +    } else if (err) {
> +        error_report_err(err);
>      }
>  }
>  
> +/*
> + * Get last error for stream f
> + *
> + * Return negative error value if there has been an error on previous
> + * operations, return 0 if no error happened.
> + *
> + */
> +int qemu_file_get_error(QEMUFile *f)
> +{
> +    return qemu_file_get_error_obj(f, NULL);
> +}
> +
> +/*
> + * Set the last error for stream f
> + */
> +void qemu_file_set_error(QEMUFile *f, int ret)
> +{
> +    qemu_file_set_error_obj(f, ret, NULL);
> +}
> +
>  bool qemu_file_is_writable(QEMUFile *f)
>  {
>      return f->ops->writev_buffer;
> @@ -177,6 +210,7 @@ void qemu_fflush(QEMUFile *f)
>  {
>      ssize_t ret = 0;
>      ssize_t expect = 0;
> +    Error *local_error = NULL;
>  
>      if (!qemu_file_is_writable(f)) {
>          return;
> @@ -184,7 +218,8 @@ void qemu_fflush(QEMUFile *f)
>  
>      if (f->iovcnt > 0) {
>          expect = iov_size(f->iov, f->iovcnt);
> -        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->pos);
> +        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->pos,
> +                                    &local_error);
>  
>          qemu_iovec_release_ram(f);
>      }
> @@ -196,7 +231,7 @@ void qemu_fflush(QEMUFile *f)
>       * data set we requested, so sanity check that.
>       */
>      if (ret != expect) {
> -        qemu_file_set_error(f, ret < 0 ? ret : -EIO);
> +        qemu_file_set_error_obj(f, ret < 0 ? ret : -EIO, local_error);
>      }
>      f->buf_index = 0;
>      f->iovcnt = 0;
> @@ -284,6 +319,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>  {
>      int len;
>      int pending;
> +    Error *local_error = NULL;
>  
>      assert(!qemu_file_is_writable(f));
>  
> @@ -295,14 +331,16 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>      f->buf_size = pending;
>  
>      len = f->ops->get_buffer(f->opaque, f->buf + pending, f->pos,
> -                        IO_BUF_SIZE - pending);
> +                             IO_BUF_SIZE - pending, &local_error);
>      if (len > 0) {
>          f->buf_size += len;
>          f->pos += len;
>      } else if (len == 0) {
> -        qemu_file_set_error(f, -EIO);
> +        qemu_file_set_error_obj(f, -EIO, local_error);
>      } else if (len != -EAGAIN) {
> -        qemu_file_set_error(f, len);
> +        qemu_file_set_error_obj(f, len, local_error);
> +    } else {
> +        error_free(local_error);
>      }
>  
>      return len;
> @@ -328,7 +366,7 @@ int qemu_fclose(QEMUFile *f)
>      ret = qemu_file_get_error(f);
>  
>      if (f->ops->close) {
> -        int ret2 = f->ops->close(f->opaque);
> +        int ret2 = f->ops->close(f->opaque, NULL);
>          if (ret >= 0) {
>              ret = ret2;
>          }
> @@ -339,6 +377,7 @@ int qemu_fclose(QEMUFile *f)
>      if (f->last_error) {
>          ret = f->last_error;
>      }
> +    error_free(f->last_error_obj);
>      g_free(f);
>      trace_qemu_file_fclose();
>      return ret;
> @@ -784,6 +823,6 @@ void qemu_put_counted_string(QEMUFile *f, const char *str)
>  void qemu_file_set_blocking(QEMUFile *f, bool block)
>  {
>      if (f->ops->set_blocking) {
> -        f->ops->set_blocking(f->opaque, block);
> +        f->ops->set_blocking(f->opaque, block, NULL);
>      }
>  }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 13baf896bd..eb886db65f 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -32,7 +32,8 @@
>   * bytes actually read should be returned.
>   */
>  typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
> -                                        int64_t pos, size_t size);
> +                                        int64_t pos, size_t size,
> +                                        Error **errp);
>  
>  /* Close a file
>   *
> @@ -41,7 +42,7 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
>   * The meaning of return value on success depends on the specific back-end being
>   * used.
>   */
> -typedef int (QEMUFileCloseFunc)(void *opaque);
> +typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
>  
>  /* Called to return the OS file descriptor associated to the QEMUFile.
>   */
> @@ -49,14 +50,15 @@ typedef int (QEMUFileGetFD)(void *opaque);
>  
>  /* Called to change the blocking mode of the file
>   */
> -typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled);
> +typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled, Error **errp);
>  
>  /*
>   * This function writes an iovec to file. The handler must write all
>   * of the data or return a negative errno value.
>   */
>  typedef ssize_t (QEMUFileWritevBufferFunc)(void *opaque, struct iovec *iov,
> -                                           int iovcnt, int64_t pos);
> +                                           int iovcnt, int64_t pos,
> +                                           Error **errp);
>  
>  /*
>   * This function provides hooks around different
> @@ -97,7 +99,8 @@ typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>   * Existing blocking reads/writes must be woken
>   * Returns 0 on success, -err on error
>   */
> -typedef int (QEMUFileShutdownFunc)(void *opaque, bool rd, bool wr);
> +typedef int (QEMUFileShutdownFunc)(void *opaque, bool rd, bool wr,
> +                                   Error **errp);
>  
>  typedef struct QEMUFileOps {
>      QEMUFileGetBufferFunc *get_buffer;
> @@ -149,6 +152,8 @@ void qemu_update_position(QEMUFile *f, size_t size);
>  void qemu_file_reset_rate_limit(QEMUFile *f);
>  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
>  int64_t qemu_file_get_rate_limit(QEMUFile *f);
> +int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
> +void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
>  void qemu_file_set_error(QEMUFile *f, int ret);
>  int qemu_file_shutdown(QEMUFile *f);
>  QEMUFile *qemu_file_get_return_path(QEMUFile *f);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 34bcad3807..a619af744d 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -124,7 +124,7 @@ static struct mig_cmd_args {
>  /* savevm/loadvm support */
>  
>  static ssize_t block_writev_buffer(void *opaque, struct iovec *iov, int iovcnt,
> -                                   int64_t pos)
> +                                   int64_t pos, Error **errp)
>  {
>      int ret;
>      QEMUIOVector qiov;
> @@ -139,12 +139,12 @@ static ssize_t block_writev_buffer(void *opaque, struct iovec *iov, int iovcnt,
>  }
>  
>  static ssize_t block_get_buffer(void *opaque, uint8_t *buf, int64_t pos,
> -                                size_t size)
> +                                size_t size, Error **errp)
>  {
>      return bdrv_load_vmstate(opaque, buf, pos, size);
>  }
>  
> -static int bdrv_fclose(void *opaque)
> +static int bdrv_fclose(void *opaque, Error **errp)
>  {
>      return bdrv_flush(opaque);
>  }
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

