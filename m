Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32627146856
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:47:08 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubt4-0001hp-JI
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub8U-0001e3-Ia
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub8Q-0004jA-D0
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:58:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32528
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub8Q-0004if-6Q
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pp/qATplDrz6aSdEj663YVGvomxACTRs1AhbwReR+AA=;
 b=grpEKN6ZHFiwj6zPE8EVo0zhGk4KGjlx/mC4Qs2KQjohfmuXJ8Wk94W54OUqa/HVml+P5z
 mtqISsYAE84k43GdGYs+eENNEGi3ymy1xttLbX5Yi0Hm25n3eBIq+z1s8ioEsjW4NYqMSl
 tWjSqou2HLUUfCa+5P9LLhSznjFi6S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-HzITXyqDPyu4k1ZpLJsX3A-1; Thu, 23 Jan 2020 06:58:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EECDB62
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:58:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFC21CB;
 Thu, 23 Jan 2020 11:58:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 003/111] virtiofsd: Add auxiliary .c's
Date: Thu, 23 Jan 2020 11:56:53 +0000
Message-Id: <20200123115841.138849-4-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: HzITXyqDPyu4k1ZpLJsX3A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add most of the non-main .c files we need from upstream fuse-3.8.0

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/buffer.c       | 321 ++++++++++++++++++++++++
 tools/virtiofsd/fuse_log.c     |  40 +++
 tools/virtiofsd/fuse_opt.c     | 423 +++++++++++++++++++++++++++++++
 tools/virtiofsd/fuse_signals.c |  91 +++++++
 tools/virtiofsd/helper.c       | 440 +++++++++++++++++++++++++++++++++
 5 files changed, 1315 insertions(+)
 create mode 100644 tools/virtiofsd/buffer.c
 create mode 100644 tools/virtiofsd/fuse_log.c
 create mode 100644 tools/virtiofsd/fuse_opt.c
 create mode 100644 tools/virtiofsd/fuse_signals.c
 create mode 100644 tools/virtiofsd/helper.c

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
new file mode 100644
index 0000000000..5ab9b87455
--- /dev/null
+++ b/tools/virtiofsd/buffer.c
@@ -0,0 +1,321 @@
+/*
+  FUSE: Filesystem in Userspace
+  Copyright (C) 2010  Miklos Szeredi <miklos@szeredi.hu>
+
+  Functions for dealing with `struct fuse_buf` and `struct
+  fuse_bufvec`.
+
+  This program can be distributed under the terms of the GNU LGPLv2.
+  See the file COPYING.LIB
+*/
+
+#define _GNU_SOURCE
+
+#include "config.h"
+#include "fuse_i.h"
+#include "fuse_lowlevel.h"
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <assert.h>
+
+size_t fuse_buf_size(const struct fuse_bufvec *bufv)
+{
+=09size_t i;
+=09size_t size =3D 0;
+
+=09for (i =3D 0; i < bufv->count; i++) {
+=09=09if (bufv->buf[i].size =3D=3D SIZE_MAX)
+=09=09=09size =3D SIZE_MAX;
+=09=09else
+=09=09=09size +=3D bufv->buf[i].size;
+=09}
+
+=09return size;
+}
+
+static size_t min_size(size_t s1, size_t s2)
+{
+=09return s1 < s2 ? s1 : s2;
+}
+
+static ssize_t fuse_buf_write(const struct fuse_buf *dst, size_t dst_off,
+=09=09=09      const struct fuse_buf *src, size_t src_off,
+=09=09=09      size_t len)
+{
+=09ssize_t res =3D 0;
+=09size_t copied =3D 0;
+
+=09while (len) {
+=09=09if (dst->flags & FUSE_BUF_FD_SEEK) {
+=09=09=09res =3D pwrite(dst->fd, (char *)src->mem + src_off, len,
+=09=09=09=09     dst->pos + dst_off);
+=09=09} else {
+=09=09=09res =3D write(dst->fd, (char *)src->mem + src_off, len);
+=09=09}
+=09=09if (res =3D=3D -1) {
+=09=09=09if (!copied)
+=09=09=09=09return -errno;
+=09=09=09break;
+=09=09}
+=09=09if (res =3D=3D 0)
+=09=09=09break;
+
+=09=09copied +=3D res;
+=09=09if (!(dst->flags & FUSE_BUF_FD_RETRY))
+=09=09=09break;
+
+=09=09src_off +=3D res;
+=09=09dst_off +=3D res;
+=09=09len -=3D res;
+=09}
+
+=09return copied;
+}
+
+static ssize_t fuse_buf_read(const struct fuse_buf *dst, size_t dst_off,
+=09=09=09     const struct fuse_buf *src, size_t src_off,
+=09=09=09     size_t len)
+{
+=09ssize_t res =3D 0;
+=09size_t copied =3D 0;
+
+=09while (len) {
+=09=09if (src->flags & FUSE_BUF_FD_SEEK) {
+=09=09=09res =3D pread(src->fd, (char *)dst->mem + dst_off, len,
+=09=09=09=09     src->pos + src_off);
+=09=09} else {
+=09=09=09res =3D read(src->fd, (char *)dst->mem + dst_off, len);
+=09=09}
+=09=09if (res =3D=3D -1) {
+=09=09=09if (!copied)
+=09=09=09=09return -errno;
+=09=09=09break;
+=09=09}
+=09=09if (res =3D=3D 0)
+=09=09=09break;
+
+=09=09copied +=3D res;
+=09=09if (!(src->flags & FUSE_BUF_FD_RETRY))
+=09=09=09break;
+
+=09=09dst_off +=3D res;
+=09=09src_off +=3D res;
+=09=09len -=3D res;
+=09}
+
+=09return copied;
+}
+
+static ssize_t fuse_buf_fd_to_fd(const struct fuse_buf *dst, size_t dst_of=
f,
+=09=09=09=09 const struct fuse_buf *src, size_t src_off,
+=09=09=09=09 size_t len)
+{
+=09char buf[4096];
+=09struct fuse_buf tmp =3D {
+=09=09.size =3D sizeof(buf),
+=09=09.flags =3D 0,
+=09};
+=09ssize_t res;
+=09size_t copied =3D 0;
+
+=09tmp.mem =3D buf;
+
+=09while (len) {
+=09=09size_t this_len =3D min_size(tmp.size, len);
+=09=09size_t read_len;
+
+=09=09res =3D fuse_buf_read(&tmp, 0, src, src_off, this_len);
+=09=09if (res < 0) {
+=09=09=09if (!copied)
+=09=09=09=09return res;
+=09=09=09break;
+=09=09}
+=09=09if (res =3D=3D 0)
+=09=09=09break;
+
+=09=09read_len =3D res;
+=09=09res =3D fuse_buf_write(dst, dst_off, &tmp, 0, read_len);
+=09=09if (res < 0) {
+=09=09=09if (!copied)
+=09=09=09=09return res;
+=09=09=09break;
+=09=09}
+=09=09if (res =3D=3D 0)
+=09=09=09break;
+
+=09=09copied +=3D res;
+
+=09=09if (res < this_len)
+=09=09=09break;
+
+=09=09dst_off +=3D res;
+=09=09src_off +=3D res;
+=09=09len -=3D res;
+=09}
+
+=09return copied;
+}
+
+#ifdef HAVE_SPLICE
+static ssize_t fuse_buf_splice(const struct fuse_buf *dst, size_t dst_off,
+=09=09=09       const struct fuse_buf *src, size_t src_off,
+=09=09=09       size_t len, enum fuse_buf_copy_flags flags)
+{
+=09int splice_flags =3D 0;
+=09off_t *srcpos =3D NULL;
+=09off_t *dstpos =3D NULL;
+=09off_t srcpos_val;
+=09off_t dstpos_val;
+=09ssize_t res;
+=09size_t copied =3D 0;
+
+=09if (flags & FUSE_BUF_SPLICE_MOVE)
+=09=09splice_flags |=3D SPLICE_F_MOVE;
+=09if (flags & FUSE_BUF_SPLICE_NONBLOCK)
+=09=09splice_flags |=3D SPLICE_F_NONBLOCK;
+
+=09if (src->flags & FUSE_BUF_FD_SEEK) {
+=09=09srcpos_val =3D src->pos + src_off;
+=09=09srcpos =3D &srcpos_val;
+=09}
+=09if (dst->flags & FUSE_BUF_FD_SEEK) {
+=09=09dstpos_val =3D dst->pos + dst_off;
+=09=09dstpos =3D &dstpos_val;
+=09}
+
+=09while (len) {
+=09=09res =3D splice(src->fd, srcpos, dst->fd, dstpos, len,
+=09=09=09     splice_flags);
+=09=09if (res =3D=3D -1) {
+=09=09=09if (copied)
+=09=09=09=09break;
+
+=09=09=09if (errno !=3D EINVAL || (flags & FUSE_BUF_FORCE_SPLICE))
+=09=09=09=09return -errno;
+
+=09=09=09/* Maybe splice is not supported for this combination */
+=09=09=09return fuse_buf_fd_to_fd(dst, dst_off, src, src_off,
+=09=09=09=09=09=09 len);
+=09=09}
+=09=09if (res =3D=3D 0)
+=09=09=09break;
+
+=09=09copied +=3D res;
+=09=09if (!(src->flags & FUSE_BUF_FD_RETRY) &&
+=09=09    !(dst->flags & FUSE_BUF_FD_RETRY)) {
+=09=09=09break;
+=09=09}
+
+=09=09len -=3D res;
+=09}
+
+=09return copied;
+}
+#else
+static ssize_t fuse_buf_splice(const struct fuse_buf *dst, size_t dst_off,
+=09=09=09       const struct fuse_buf *src, size_t src_off,
+=09=09=09       size_t len, enum fuse_buf_copy_flags flags)
+{
+=09(void) flags;
+
+=09return fuse_buf_fd_to_fd(dst, dst_off, src, src_off, len);
+}
+#endif
+
+
+static ssize_t fuse_buf_copy_one(const struct fuse_buf *dst, size_t dst_of=
f,
+=09=09=09=09 const struct fuse_buf *src, size_t src_off,
+=09=09=09=09 size_t len, enum fuse_buf_copy_flags flags)
+{
+=09int src_is_fd =3D src->flags & FUSE_BUF_IS_FD;
+=09int dst_is_fd =3D dst->flags & FUSE_BUF_IS_FD;
+
+=09if (!src_is_fd && !dst_is_fd) {
+=09=09char *dstmem =3D (char *)dst->mem + dst_off;
+=09=09char *srcmem =3D (char *)src->mem + src_off;
+
+=09=09if (dstmem !=3D srcmem) {
+=09=09=09if (dstmem + len <=3D srcmem || srcmem + len <=3D dstmem)
+=09=09=09=09memcpy(dstmem, srcmem, len);
+=09=09=09else
+=09=09=09=09memmove(dstmem, srcmem, len);
+=09=09}
+
+=09=09return len;
+=09} else if (!src_is_fd) {
+=09=09return fuse_buf_write(dst, dst_off, src, src_off, len);
+=09} else if (!dst_is_fd) {
+=09=09return fuse_buf_read(dst, dst_off, src, src_off, len);
+=09} else if (flags & FUSE_BUF_NO_SPLICE) {
+=09=09return fuse_buf_fd_to_fd(dst, dst_off, src, src_off, len);
+=09} else {
+=09=09return fuse_buf_splice(dst, dst_off, src, src_off, len, flags);
+=09}
+}
+
+static const struct fuse_buf *fuse_bufvec_current(struct fuse_bufvec *bufv=
)
+{
+=09if (bufv->idx < bufv->count)
+=09=09return &bufv->buf[bufv->idx];
+=09else
+=09=09return NULL;
+}
+
+static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
+{
+=09const struct fuse_buf *buf =3D fuse_bufvec_current(bufv);
+
+=09bufv->off +=3D len;
+=09assert(bufv->off <=3D buf->size);
+=09if (bufv->off =3D=3D buf->size) {
+=09=09assert(bufv->idx < bufv->count);
+=09=09bufv->idx++;
+=09=09if (bufv->idx =3D=3D bufv->count)
+=09=09=09return 0;
+=09=09bufv->off =3D 0;
+=09}
+=09return 1;
+}
+
+ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct fuse_bufvec *srcv,
+=09=09      enum fuse_buf_copy_flags flags)
+{
+=09size_t copied =3D 0;
+
+=09if (dstv =3D=3D srcv)
+=09=09return fuse_buf_size(dstv);
+
+=09for (;;) {
+=09=09const struct fuse_buf *src =3D fuse_bufvec_current(srcv);
+=09=09const struct fuse_buf *dst =3D fuse_bufvec_current(dstv);
+=09=09size_t src_len;
+=09=09size_t dst_len;
+=09=09size_t len;
+=09=09ssize_t res;
+
+=09=09if (src =3D=3D NULL || dst =3D=3D NULL)
+=09=09=09break;
+
+=09=09src_len =3D src->size - srcv->off;
+=09=09dst_len =3D dst->size - dstv->off;
+=09=09len =3D min_size(src_len, dst_len);
+
+=09=09res =3D fuse_buf_copy_one(dst, dstv->off, src, srcv->off, len, flags=
);
+=09=09if (res < 0) {
+=09=09=09if (!copied)
+=09=09=09=09return res;
+=09=09=09break;
+=09=09}
+=09=09copied +=3D res;
+
+=09=09if (!fuse_bufvec_advance(srcv, res) ||
+=09=09    !fuse_bufvec_advance(dstv, res))
+=09=09=09break;
+
+=09=09if (res < len)
+=09=09=09break;
+=09}
+
+=09return copied;
+}
diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
new file mode 100644
index 0000000000..0d268ab014
--- /dev/null
+++ b/tools/virtiofsd/fuse_log.c
@@ -0,0 +1,40 @@
+/*
+  FUSE: Filesystem in Userspace
+  Copyright (C) 2019  Red Hat, Inc.
+
+  Logging API.
+
+  This program can be distributed under the terms of the GNU LGPLv2.
+  See the file COPYING.LIB
+*/
+
+#include "fuse_log.h"
+
+#include <stdarg.h>
+#include <stdio.h>
+
+static void default_log_func(
+=09=09__attribute__(( unused )) enum fuse_log_level level,
+=09=09const char *fmt, va_list ap)
+{
+=09vfprintf(stderr, fmt, ap);
+}
+
+static fuse_log_func_t log_func =3D default_log_func;
+
+void fuse_set_log_func(fuse_log_func_t func)
+{
+=09if (!func)
+=09=09func =3D default_log_func;
+
+=09log_func =3D func;
+}
+
+void fuse_log(enum fuse_log_level level, const char *fmt, ...)
+{
+=09va_list ap;
+
+=09va_start(ap, fmt);
+=09log_func(level, fmt, ap);
+=09va_end(ap);
+}
diff --git a/tools/virtiofsd/fuse_opt.c b/tools/virtiofsd/fuse_opt.c
new file mode 100644
index 0000000000..93066b926e
--- /dev/null
+++ b/tools/virtiofsd/fuse_opt.c
@@ -0,0 +1,423 @@
+/*
+  FUSE: Filesystem in Userspace
+  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>
+
+  Implementation of option parsing routines (dealing with `struct
+  fuse_args`).
+
+  This program can be distributed under the terms of the GNU LGPLv2.
+  See the file COPYING.LIB
+*/
+
+#include "config.h"
+#include "fuse_i.h"
+#include "fuse_opt.h"
+#include "fuse_misc.h"
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+
+struct fuse_opt_context {
+=09void *data;
+=09const struct fuse_opt *opt;
+=09fuse_opt_proc_t proc;
+=09int argctr;
+=09int argc;
+=09char **argv;
+=09struct fuse_args outargs;
+=09char *opts;
+=09int nonopt;
+};
+
+void fuse_opt_free_args(struct fuse_args *args)
+{
+=09if (args) {
+=09=09if (args->argv && args->allocated) {
+=09=09=09int i;
+=09=09=09for (i =3D 0; i < args->argc; i++)
+=09=09=09=09free(args->argv[i]);
+=09=09=09free(args->argv);
+=09=09}
+=09=09args->argc =3D 0;
+=09=09args->argv =3D NULL;
+=09=09args->allocated =3D 0;
+=09}
+}
+
+static int alloc_failed(void)
+{
+=09fuse_log(FUSE_LOG_ERR, "fuse: memory allocation failed\n");
+=09return -1;
+}
+
+int fuse_opt_add_arg(struct fuse_args *args, const char *arg)
+{
+=09char **newargv;
+=09char *newarg;
+
+=09assert(!args->argv || args->allocated);
+
+=09newarg =3D strdup(arg);
+=09if (!newarg)
+=09=09return alloc_failed();
+
+=09newargv =3D realloc(args->argv, (args->argc + 2) * sizeof(char *));
+=09if (!newargv) {
+=09=09free(newarg);
+=09=09return alloc_failed();
+=09}
+
+=09args->argv =3D newargv;
+=09args->allocated =3D 1;
+=09args->argv[args->argc++] =3D newarg;
+=09args->argv[args->argc] =3D NULL;
+=09return 0;
+}
+
+static int fuse_opt_insert_arg_common(struct fuse_args *args, int pos,
+=09=09=09=09      const char *arg)
+{
+=09assert(pos <=3D args->argc);
+=09if (fuse_opt_add_arg(args, arg) =3D=3D -1)
+=09=09return -1;
+
+=09if (pos !=3D args->argc - 1) {
+=09=09char *newarg =3D args->argv[args->argc - 1];
+=09=09memmove(&args->argv[pos + 1], &args->argv[pos],
+=09=09=09sizeof(char *) * (args->argc - pos - 1));
+=09=09args->argv[pos] =3D newarg;
+=09}
+=09return 0;
+}
+
+int fuse_opt_insert_arg(struct fuse_args *args, int pos, const char *arg)
+{
+=09return fuse_opt_insert_arg_common(args, pos, arg);
+}
+
+static int next_arg(struct fuse_opt_context *ctx, const char *opt)
+{
+=09if (ctx->argctr + 1 >=3D ctx->argc) {
+=09=09fuse_log(FUSE_LOG_ERR, "fuse: missing argument after `%s'\n", opt);
+=09=09return -1;
+=09}
+=09ctx->argctr++;
+=09return 0;
+}
+
+static int add_arg(struct fuse_opt_context *ctx, const char *arg)
+{
+=09return fuse_opt_add_arg(&ctx->outargs, arg);
+}
+
+static int add_opt_common(char **opts, const char *opt, int esc)
+{
+=09unsigned oldlen =3D *opts ? strlen(*opts) : 0;
+=09char *d =3D realloc(*opts, oldlen + 1 + strlen(opt) * 2 + 1);
+
+=09if (!d)
+=09=09return alloc_failed();
+
+=09*opts =3D d;
+=09if (oldlen) {
+=09=09d +=3D oldlen;
+=09=09*d++ =3D ',';
+=09}
+
+=09for (; *opt; opt++) {
+=09=09if (esc && (*opt =3D=3D ',' || *opt =3D=3D '\\'))
+=09=09=09*d++ =3D '\\';
+=09=09*d++ =3D *opt;
+=09}
+=09*d =3D '\0';
+
+=09return 0;
+}
+
+int fuse_opt_add_opt(char **opts, const char *opt)
+{
+=09return add_opt_common(opts, opt, 0);
+}
+
+int fuse_opt_add_opt_escaped(char **opts, const char *opt)
+{
+=09return add_opt_common(opts, opt, 1);
+}
+
+static int add_opt(struct fuse_opt_context *ctx, const char *opt)
+{
+=09return add_opt_common(&ctx->opts, opt, 1);
+}
+
+static int call_proc(struct fuse_opt_context *ctx, const char *arg, int ke=
y,
+=09=09     int iso)
+{
+=09if (key =3D=3D FUSE_OPT_KEY_DISCARD)
+=09=09return 0;
+
+=09if (key !=3D FUSE_OPT_KEY_KEEP && ctx->proc) {
+=09=09int res =3D ctx->proc(ctx->data, arg, key, &ctx->outargs);
+=09=09if (res =3D=3D -1 || !res)
+=09=09=09return res;
+=09}
+=09if (iso)
+=09=09return add_opt(ctx, arg);
+=09else
+=09=09return add_arg(ctx, arg);
+}
+
+static int match_template(const char *t, const char *arg, unsigned *sepp)
+{
+=09int arglen =3D strlen(arg);
+=09const char *sep =3D strchr(t, '=3D');
+=09sep =3D sep ? sep : strchr(t, ' ');
+=09if (sep && (!sep[1] || sep[1] =3D=3D '%')) {
+=09=09int tlen =3D sep - t;
+=09=09if (sep[0] =3D=3D '=3D')
+=09=09=09tlen ++;
+=09=09if (arglen >=3D tlen && strncmp(arg, t, tlen) =3D=3D 0) {
+=09=09=09*sepp =3D sep - t;
+=09=09=09return 1;
+=09=09}
+=09}
+=09if (strcmp(t, arg) =3D=3D 0) {
+=09=09*sepp =3D 0;
+=09=09return 1;
+=09}
+=09return 0;
+}
+
+static const struct fuse_opt *find_opt(const struct fuse_opt *opt,
+=09=09=09=09       const char *arg, unsigned *sepp)
+{
+=09for (; opt && opt->templ; opt++)
+=09=09if (match_template(opt->templ, arg, sepp))
+=09=09=09return opt;
+=09return NULL;
+}
+
+int fuse_opt_match(const struct fuse_opt *opts, const char *opt)
+{
+=09unsigned dummy;
+=09return find_opt(opts, opt, &dummy) ? 1 : 0;
+}
+
+static int process_opt_param(void *var, const char *format, const char *pa=
ram,
+=09=09=09     const char *arg)
+{
+=09assert(format[0] =3D=3D '%');
+=09if (format[1] =3D=3D 's') {
+=09=09char **s =3D var;
+=09=09char *copy =3D strdup(param);
+=09=09if (!copy)
+=09=09=09return alloc_failed();
+
+=09=09free(*s);
+=09=09*s =3D copy;
+=09} else {
+=09=09if (sscanf(param, format, var) !=3D 1) {
+=09=09=09fuse_log(FUSE_LOG_ERR, "fuse: invalid parameter in option `%s'\n"=
, arg);
+=09=09=09return -1;
+=09=09}
+=09}
+=09return 0;
+}
+
+static int process_opt(struct fuse_opt_context *ctx,
+=09=09       const struct fuse_opt *opt, unsigned sep,
+=09=09       const char *arg, int iso)
+{
+=09if (opt->offset =3D=3D -1U) {
+=09=09if (call_proc(ctx, arg, opt->value, iso) =3D=3D -1)
+=09=09=09return -1;
+=09} else {
+=09=09void *var =3D (char *)ctx->data + opt->offset;
+=09=09if (sep && opt->templ[sep + 1]) {
+=09=09=09const char *param =3D arg + sep;
+=09=09=09if (opt->templ[sep] =3D=3D '=3D')
+=09=09=09=09param ++;
+=09=09=09if (process_opt_param(var, opt->templ + sep + 1,
+=09=09=09=09=09      param, arg) =3D=3D -1)
+=09=09=09=09return -1;
+=09=09} else
+=09=09=09*(int *)var =3D opt->value;
+=09}
+=09return 0;
+}
+
+static int process_opt_sep_arg(struct fuse_opt_context *ctx,
+=09=09=09       const struct fuse_opt *opt, unsigned sep,
+=09=09=09       const char *arg, int iso)
+{
+=09int res;
+=09char *newarg;
+=09char *param;
+
+=09if (next_arg(ctx, arg) =3D=3D -1)
+=09=09return -1;
+
+=09param =3D ctx->argv[ctx->argctr];
+=09newarg =3D malloc(sep + strlen(param) + 1);
+=09if (!newarg)
+=09=09return alloc_failed();
+
+=09memcpy(newarg, arg, sep);
+=09strcpy(newarg + sep, param);
+=09res =3D process_opt(ctx, opt, sep, newarg, iso);
+=09free(newarg);
+
+=09return res;
+}
+
+static int process_gopt(struct fuse_opt_context *ctx, const char *arg, int=
 iso)
+{
+=09unsigned sep;
+=09const struct fuse_opt *opt =3D find_opt(ctx->opt, arg, &sep);
+=09if (opt) {
+=09=09for (; opt; opt =3D find_opt(opt + 1, arg, &sep)) {
+=09=09=09int res;
+=09=09=09if (sep && opt->templ[sep] =3D=3D ' ' && !arg[sep])
+=09=09=09=09res =3D process_opt_sep_arg(ctx, opt, sep, arg,
+=09=09=09=09=09=09=09  iso);
+=09=09=09else
+=09=09=09=09res =3D process_opt(ctx, opt, sep, arg, iso);
+=09=09=09if (res =3D=3D -1)
+=09=09=09=09return -1;
+=09=09}
+=09=09return 0;
+=09} else
+=09=09return call_proc(ctx, arg, FUSE_OPT_KEY_OPT, iso);
+}
+
+static int process_real_option_group(struct fuse_opt_context *ctx, char *o=
pts)
+{
+=09char *s =3D opts;
+=09char *d =3D s;
+=09int end =3D 0;
+
+=09while (!end) {
+=09=09if (*s =3D=3D '\0')
+=09=09=09end =3D 1;
+=09=09if (*s =3D=3D ',' || end) {
+=09=09=09int res;
+
+=09=09=09*d =3D '\0';
+=09=09=09res =3D process_gopt(ctx, opts, 1);
+=09=09=09if (res =3D=3D -1)
+=09=09=09=09return -1;
+=09=09=09d =3D opts;
+=09=09} else {
+=09=09=09if (s[0] =3D=3D '\\' && s[1] !=3D '\0') {
+=09=09=09=09s++;
+=09=09=09=09if (s[0] >=3D '0' && s[0] <=3D '3' &&
+=09=09=09=09    s[1] >=3D '0' && s[1] <=3D '7' &&
+=09=09=09=09    s[2] >=3D '0' && s[2] <=3D '7') {
+=09=09=09=09=09*d++ =3D (s[0] - '0') * 0100 +
+=09=09=09=09=09=09(s[1] - '0') * 0010 +
+=09=09=09=09=09=09(s[2] - '0');
+=09=09=09=09=09s +=3D 2;
+=09=09=09=09} else {
+=09=09=09=09=09*d++ =3D *s;
+=09=09=09=09}
+=09=09=09} else {
+=09=09=09=09*d++ =3D *s;
+=09=09=09}
+=09=09}
+=09=09s++;
+=09}
+
+=09return 0;
+}
+
+static int process_option_group(struct fuse_opt_context *ctx, const char *=
opts)
+{
+=09int res;
+=09char *copy =3D strdup(opts);
+
+=09if (!copy) {
+=09=09fuse_log(FUSE_LOG_ERR, "fuse: memory allocation failed\n");
+=09=09return -1;
+=09}
+=09res =3D process_real_option_group(ctx, copy);
+=09free(copy);
+=09return res;
+}
+
+static int process_one(struct fuse_opt_context *ctx, const char *arg)
+{
+=09if (ctx->nonopt || arg[0] !=3D '-')
+=09=09return call_proc(ctx, arg, FUSE_OPT_KEY_NONOPT, 0);
+=09else if (arg[1] =3D=3D 'o') {
+=09=09if (arg[2])
+=09=09=09return process_option_group(ctx, arg + 2);
+=09=09else {
+=09=09=09if (next_arg(ctx, arg) =3D=3D -1)
+=09=09=09=09return -1;
+
+=09=09=09return process_option_group(ctx,
+=09=09=09=09=09=09    ctx->argv[ctx->argctr]);
+=09=09}
+=09} else if (arg[1] =3D=3D '-' && !arg[2]) {
+=09=09if (add_arg(ctx, arg) =3D=3D -1)
+=09=09=09return -1;
+=09=09ctx->nonopt =3D ctx->outargs.argc;
+=09=09return 0;
+=09} else
+=09=09return process_gopt(ctx, arg, 0);
+}
+
+static int opt_parse(struct fuse_opt_context *ctx)
+{
+=09if (ctx->argc) {
+=09=09if (add_arg(ctx, ctx->argv[0]) =3D=3D -1)
+=09=09=09return -1;
+=09}
+
+=09for (ctx->argctr =3D 1; ctx->argctr < ctx->argc; ctx->argctr++)
+=09=09if (process_one(ctx, ctx->argv[ctx->argctr]) =3D=3D -1)
+=09=09=09return -1;
+
+=09if (ctx->opts) {
+=09=09if (fuse_opt_insert_arg(&ctx->outargs, 1, "-o") =3D=3D -1 ||
+=09=09    fuse_opt_insert_arg(&ctx->outargs, 2, ctx->opts) =3D=3D -1)
+=09=09=09return -1;
+=09}
+
+=09/* If option separator ("--") is the last argument, remove it */
+=09if (ctx->nonopt && ctx->nonopt =3D=3D ctx->outargs.argc &&
+=09    strcmp(ctx->outargs.argv[ctx->outargs.argc - 1], "--") =3D=3D 0) {
+=09=09free(ctx->outargs.argv[ctx->outargs.argc - 1]);
+=09=09ctx->outargs.argv[--ctx->outargs.argc] =3D NULL;
+=09}
+
+=09return 0;
+}
+
+int fuse_opt_parse(struct fuse_args *args, void *data,
+=09=09   const struct fuse_opt opts[], fuse_opt_proc_t proc)
+{
+=09int res;
+=09struct fuse_opt_context ctx =3D {
+=09=09.data =3D data,
+=09=09.opt =3D opts,
+=09=09.proc =3D proc,
+=09};
+
+=09if (!args || !args->argv || !args->argc)
+=09=09return 0;
+
+=09ctx.argc =3D args->argc;
+=09ctx.argv =3D args->argv;
+
+=09res =3D opt_parse(&ctx);
+=09if (res !=3D -1) {
+=09=09struct fuse_args tmp =3D *args;
+=09=09*args =3D ctx.outargs;
+=09=09ctx.outargs =3D tmp;
+=09}
+=09free(ctx.opts);
+=09fuse_opt_free_args(&ctx.outargs);
+=09return res;
+}
diff --git a/tools/virtiofsd/fuse_signals.c b/tools/virtiofsd/fuse_signals.=
c
new file mode 100644
index 0000000000..4271947bd4
--- /dev/null
+++ b/tools/virtiofsd/fuse_signals.c
@@ -0,0 +1,91 @@
+/*
+  FUSE: Filesystem in Userspace
+  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>
+
+  Utility functions for setting signal handlers.
+
+  This program can be distributed under the terms of the GNU LGPLv2.
+  See the file COPYING.LIB
+*/
+
+#include "config.h"
+#include "fuse_lowlevel.h"
+#include "fuse_i.h"
+
+#include <stdio.h>
+#include <string.h>
+#include <signal.h>
+#include <stdlib.h>
+
+static struct fuse_session *fuse_instance;
+
+static void exit_handler(int sig)
+{
+=09if (fuse_instance) {
+=09=09fuse_session_exit(fuse_instance);
+=09=09if(sig <=3D 0) {
+=09=09=09fuse_log(FUSE_LOG_ERR, "assertion error: signal value <=3D 0\n");
+=09=09=09abort();
+=09=09}
+=09=09fuse_instance->error =3D sig;
+=09}
+}
+
+static void do_nothing(int sig)
+{
+=09(void) sig;
+}
+
+static int set_one_signal_handler(int sig, void (*handler)(int), int remov=
e)
+{
+=09struct sigaction sa;
+=09struct sigaction old_sa;
+
+=09memset(&sa, 0, sizeof(struct sigaction));
+=09sa.sa_handler =3D remove ? SIG_DFL : handler;
+=09sigemptyset(&(sa.sa_mask));
+=09sa.sa_flags =3D 0;
+
+=09if (sigaction(sig, NULL, &old_sa) =3D=3D -1) {
+=09=09perror("fuse: cannot get old signal handler");
+=09=09return -1;
+=09}
+
+=09if (old_sa.sa_handler =3D=3D (remove ? handler : SIG_DFL) &&
+=09    sigaction(sig, &sa, NULL) =3D=3D -1) {
+=09=09perror("fuse: cannot set signal handler");
+=09=09return -1;
+=09}
+=09return 0;
+}
+
+int fuse_set_signal_handlers(struct fuse_session *se)
+{
+=09/* If we used SIG_IGN instead of the do_nothing function,
+=09   then we would be unable to tell if we set SIG_IGN (and
+=09   thus should reset to SIG_DFL in fuse_remove_signal_handlers)
+=09   or if it was already set to SIG_IGN (and should be left
+=09   untouched. */
+=09if (set_one_signal_handler(SIGHUP, exit_handler, 0) =3D=3D -1 ||
+=09    set_one_signal_handler(SIGINT, exit_handler, 0) =3D=3D -1 ||
+=09    set_one_signal_handler(SIGTERM, exit_handler, 0) =3D=3D -1 ||
+=09    set_one_signal_handler(SIGPIPE, do_nothing, 0) =3D=3D -1)
+=09=09return -1;
+
+=09fuse_instance =3D se;
+=09return 0;
+}
+
+void fuse_remove_signal_handlers(struct fuse_session *se)
+{
+=09if (fuse_instance !=3D se)
+=09=09fuse_log(FUSE_LOG_ERR,
+=09=09=09"fuse: fuse_remove_signal_handlers: unknown session\n");
+=09else
+=09=09fuse_instance =3D NULL;
+
+=09set_one_signal_handler(SIGHUP, exit_handler, 1);
+=09set_one_signal_handler(SIGINT, exit_handler, 1);
+=09set_one_signal_handler(SIGTERM, exit_handler, 1);
+=09set_one_signal_handler(SIGPIPE, do_nothing, 1);
+}
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
new file mode 100644
index 0000000000..64ff7ad6d5
--- /dev/null
+++ b/tools/virtiofsd/helper.c
@@ -0,0 +1,440 @@
+/*
+  FUSE: Filesystem in Userspace
+  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>
+
+  Helper functions to create (simple) standalone programs. With the
+  aid of these functions it should be possible to create full FUSE
+  file system by implementing nothing but the request handlers.
+
+  This program can be distributed under the terms of the GNU LGPLv2.
+  See the file COPYING.LIB.
+*/
+
+#include "config.h"
+#include "fuse_i.h"
+#include "fuse_misc.h"
+#include "fuse_opt.h"
+#include "fuse_lowlevel.h"
+#include "mount_util.h"
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include <unistd.h>
+#include <string.h>
+#include <limits.h>
+#include <errno.h>
+#include <sys/param.h>
+
+#define FUSE_HELPER_OPT(t, p) \
+=09{ t, offsetof(struct fuse_cmdline_opts, p), 1 }
+
+static const struct fuse_opt fuse_helper_opts[] =3D {
+=09FUSE_HELPER_OPT("-h",=09=09show_help),
+=09FUSE_HELPER_OPT("--help",=09show_help),
+=09FUSE_HELPER_OPT("-V",=09=09show_version),
+=09FUSE_HELPER_OPT("--version",=09show_version),
+=09FUSE_HELPER_OPT("-d",=09=09debug),
+=09FUSE_HELPER_OPT("debug",=09debug),
+=09FUSE_HELPER_OPT("-d",=09=09foreground),
+=09FUSE_HELPER_OPT("debug",=09foreground),
+=09FUSE_OPT_KEY("-d",=09=09FUSE_OPT_KEY_KEEP),
+=09FUSE_OPT_KEY("debug",=09=09FUSE_OPT_KEY_KEEP),
+=09FUSE_HELPER_OPT("-f",=09=09foreground),
+=09FUSE_HELPER_OPT("-s",=09=09singlethread),
+=09FUSE_HELPER_OPT("fsname=3D",=09nodefault_subtype),
+=09FUSE_OPT_KEY("fsname=3D",=09=09FUSE_OPT_KEY_KEEP),
+#ifndef __FreeBSD__
+=09FUSE_HELPER_OPT("subtype=3D",=09nodefault_subtype),
+=09FUSE_OPT_KEY("subtype=3D",=09FUSE_OPT_KEY_KEEP),
+#endif
+=09FUSE_HELPER_OPT("clone_fd",=09clone_fd),
+=09FUSE_HELPER_OPT("max_idle_threads=3D%u", max_idle_threads),
+=09FUSE_OPT_END
+};
+
+struct fuse_conn_info_opts {
+=09int atomic_o_trunc;
+=09int no_remote_posix_lock;
+=09int no_remote_flock;
+=09int splice_write;
+=09int splice_move;
+=09int splice_read;
+=09int no_splice_write;
+=09int no_splice_move;
+=09int no_splice_read;
+=09int auto_inval_data;
+=09int no_auto_inval_data;
+=09int no_readdirplus;
+=09int no_readdirplus_auto;
+=09int async_dio;
+=09int no_async_dio;
+=09int writeback_cache;
+=09int no_writeback_cache;
+=09int async_read;
+=09int sync_read;
+=09unsigned max_write;
+=09unsigned max_readahead;
+=09unsigned max_background;
+=09unsigned congestion_threshold;
+=09unsigned time_gran;
+=09int set_max_write;
+=09int set_max_readahead;
+=09int set_max_background;
+=09int set_congestion_threshold;
+=09int set_time_gran;
+};
+
+#define CONN_OPTION(t, p, v)=09=09=09=09=09\
+=09{ t, offsetof(struct fuse_conn_info_opts, p), v }
+static const struct fuse_opt conn_info_opt_spec[] =3D {
+=09CONN_OPTION("max_write=3D%u", max_write, 0),
+=09CONN_OPTION("max_write=3D", set_max_write, 1),
+=09CONN_OPTION("max_readahead=3D%u", max_readahead, 0),
+=09CONN_OPTION("max_readahead=3D", set_max_readahead, 1),
+=09CONN_OPTION("max_background=3D%u", max_background, 0),
+=09CONN_OPTION("max_background=3D", set_max_background, 1),
+=09CONN_OPTION("congestion_threshold=3D%u", congestion_threshold, 0),
+=09CONN_OPTION("congestion_threshold=3D", set_congestion_threshold, 1),
+=09CONN_OPTION("sync_read", sync_read, 1),
+=09CONN_OPTION("async_read", async_read, 1),
+=09CONN_OPTION("atomic_o_trunc", atomic_o_trunc, 1),
+=09CONN_OPTION("no_remote_lock", no_remote_posix_lock, 1),
+=09CONN_OPTION("no_remote_lock", no_remote_flock, 1),
+=09CONN_OPTION("no_remote_flock", no_remote_flock, 1),
+=09CONN_OPTION("no_remote_posix_lock", no_remote_posix_lock, 1),
+=09CONN_OPTION("splice_write", splice_write, 1),
+=09CONN_OPTION("no_splice_write", no_splice_write, 1),
+=09CONN_OPTION("splice_move", splice_move, 1),
+=09CONN_OPTION("no_splice_move", no_splice_move, 1),
+=09CONN_OPTION("splice_read", splice_read, 1),
+=09CONN_OPTION("no_splice_read", no_splice_read, 1),
+=09CONN_OPTION("auto_inval_data", auto_inval_data, 1),
+=09CONN_OPTION("no_auto_inval_data", no_auto_inval_data, 1),
+=09CONN_OPTION("readdirplus=3Dno", no_readdirplus, 1),
+=09CONN_OPTION("readdirplus=3Dyes", no_readdirplus, 0),
+=09CONN_OPTION("readdirplus=3Dyes", no_readdirplus_auto, 1),
+=09CONN_OPTION("readdirplus=3Dauto", no_readdirplus, 0),
+=09CONN_OPTION("readdirplus=3Dauto", no_readdirplus_auto, 0),
+=09CONN_OPTION("async_dio", async_dio, 1),
+=09CONN_OPTION("no_async_dio", no_async_dio, 1),
+=09CONN_OPTION("writeback_cache", writeback_cache, 1),
+=09CONN_OPTION("no_writeback_cache", no_writeback_cache, 1),
+=09CONN_OPTION("time_gran=3D%u", time_gran, 0),
+=09CONN_OPTION("time_gran=3D", set_time_gran, 1),
+=09FUSE_OPT_END
+};
+
+
+void fuse_cmdline_help(void)
+{
+=09printf("    -h   --help            print help\n"
+=09       "    -V   --version         print version\n"
+=09       "    -d   -o debug          enable debug output (implies -f)\n"
+=09       "    -f                     foreground operation\n"
+=09       "    -s                     disable multi-threaded operation\n"
+=09       "    -o clone_fd            use separate fuse device fd for each=
 thread\n"
+=09       "                           (may improve performance)\n"
+=09       "    -o max_idle_threads    the maximum number of idle worker th=
reads\n"
+=09       "                           allowed (default: 10)\n");
+}
+
+static int fuse_helper_opt_proc(void *data, const char *arg, int key,
+=09=09=09=09struct fuse_args *outargs)
+{
+=09(void) outargs;
+=09struct fuse_cmdline_opts *opts =3D data;
+
+=09switch (key) {
+=09case FUSE_OPT_KEY_NONOPT:
+=09=09if (!opts->mountpoint) {
+=09=09=09if (fuse_mnt_parse_fuse_fd(arg) !=3D -1) {
+=09=09=09=09return fuse_opt_add_opt(&opts->mountpoint, arg);
+=09=09=09}
+
+=09=09=09char mountpoint[PATH_MAX] =3D "";
+=09=09=09if (realpath(arg, mountpoint) =3D=3D NULL) {
+=09=09=09=09fuse_log(FUSE_LOG_ERR,
+=09=09=09=09=09"fuse: bad mount point `%s': %s\n",
+=09=09=09=09=09arg, strerror(errno));
+=09=09=09=09return -1;
+=09=09=09}
+=09=09=09return fuse_opt_add_opt(&opts->mountpoint, mountpoint);
+=09=09} else {
+=09=09=09fuse_log(FUSE_LOG_ERR, "fuse: invalid argument `%s'\n", arg);
+=09=09=09return -1;
+=09=09}
+
+=09default:
+=09=09/* Pass through unknown options */
+=09=09return 1;
+=09}
+}
+
+/* Under FreeBSD, there is no subtype option so this
+   function actually sets the fsname */
+static int add_default_subtype(const char *progname, struct fuse_args *arg=
s)
+{
+=09int res;
+=09char *subtype_opt;
+
+=09const char *basename =3D strrchr(progname, '/');
+=09if (basename =3D=3D NULL)
+=09=09basename =3D progname;
+=09else if (basename[1] !=3D '\0')
+=09=09basename++;
+
+=09subtype_opt =3D (char *) malloc(strlen(basename) + 64);
+=09if (subtype_opt =3D=3D NULL) {
+=09=09fuse_log(FUSE_LOG_ERR, "fuse: memory allocation failed\n");
+=09=09return -1;
+=09}
+#ifdef __FreeBSD__
+=09sprintf(subtype_opt, "-ofsname=3D%s", basename);
+#else
+=09sprintf(subtype_opt, "-osubtype=3D%s", basename);
+#endif
+=09res =3D fuse_opt_add_arg(args, subtype_opt);
+=09free(subtype_opt);
+=09return res;
+}
+
+int fuse_parse_cmdline(struct fuse_args *args,
+=09=09       struct fuse_cmdline_opts *opts)
+{
+=09memset(opts, 0, sizeof(struct fuse_cmdline_opts));
+
+=09opts->max_idle_threads =3D 10;
+
+=09if (fuse_opt_parse(args, opts, fuse_helper_opts,
+=09=09=09   fuse_helper_opt_proc) =3D=3D -1)
+=09=09return -1;
+
+=09/* *Linux*: if neither -o subtype nor -o fsname are specified,
+=09   set subtype to program's basename.
+=09   *FreeBSD*: if fsname is not specified, set to program's
+=09   basename. */
+=09if (!opts->nodefault_subtype)
+=09=09if (add_default_subtype(args->argv[0], args) =3D=3D -1)
+=09=09=09return -1;
+
+=09return 0;
+}
+
+
+int fuse_daemonize(int foreground)
+{
+=09if (!foreground) {
+=09=09int nullfd;
+=09=09int waiter[2];
+=09=09char completed;
+
+=09=09if (pipe(waiter)) {
+=09=09=09perror("fuse_daemonize: pipe");
+=09=09=09return -1;
+=09=09}
+
+=09=09/*
+=09=09 * demonize current process by forking it and killing the
+=09=09 * parent.  This makes current process as a child of 'init'.
+=09=09 */
+=09=09switch(fork()) {
+=09=09case -1:
+=09=09=09perror("fuse_daemonize: fork");
+=09=09=09return -1;
+=09=09case 0:
+=09=09=09break;
+=09=09default:
+=09=09=09(void) read(waiter[0], &completed, sizeof(completed));
+=09=09=09_exit(0);
+=09=09}
+
+=09=09if (setsid() =3D=3D -1) {
+=09=09=09perror("fuse_daemonize: setsid");
+=09=09=09return -1;
+=09=09}
+
+=09=09(void) chdir("/");
+
+=09=09nullfd =3D open("/dev/null", O_RDWR, 0);
+=09=09if (nullfd !=3D -1) {
+=09=09=09(void) dup2(nullfd, 0);
+=09=09=09(void) dup2(nullfd, 1);
+=09=09=09(void) dup2(nullfd, 2);
+=09=09=09if (nullfd > 2)
+=09=09=09=09close(nullfd);
+=09=09}
+
+=09=09/* Propagate completion of daemon initialization */
+=09=09completed =3D 1;
+=09=09(void) write(waiter[1], &completed, sizeof(completed));
+=09=09close(waiter[0]);
+=09=09close(waiter[1]);
+=09} else {
+=09=09(void) chdir("/");
+=09}
+=09return 0;
+}
+
+int fuse_main_real(int argc, char *argv[], const struct fuse_operations *o=
p,
+=09=09   size_t op_size, void *user_data)
+{
+=09struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
+=09struct fuse *fuse;
+=09struct fuse_cmdline_opts opts;
+=09int res;
+
+=09if (fuse_parse_cmdline(&args, &opts) !=3D 0)
+=09=09return 1;
+
+=09if (opts.show_version) {
+=09=09printf("FUSE library version %s\n", PACKAGE_VERSION);
+=09=09fuse_lowlevel_version();
+=09=09res =3D 0;
+=09=09goto out1;
+=09}
+
+=09if (opts.show_help) {
+=09=09if(args.argv[0][0] !=3D '\0')
+=09=09=09printf("usage: %s [options] <mountpoint>\n\n",
+=09=09=09       args.argv[0]);
+=09=09printf("FUSE options:\n");
+=09=09fuse_cmdline_help();
+=09=09fuse_lib_help(&args);
+=09=09res =3D 0;
+=09=09goto out1;
+=09}
+
+=09if (!opts.show_help &&
+=09    !opts.mountpoint) {
+=09=09fuse_log(FUSE_LOG_ERR, "error: no mountpoint specified\n");
+=09=09res =3D 2;
+=09=09goto out1;
+=09}
+
+
+=09fuse =3D fuse_new_31(&args, op, op_size, user_data);
+=09if (fuse =3D=3D NULL) {
+=09=09res =3D 3;
+=09=09goto out1;
+=09}
+
+=09if (fuse_mount(fuse,opts.mountpoint) !=3D 0) {
+=09=09res =3D 4;
+=09=09goto out2;
+=09}
+
+=09if (fuse_daemonize(opts.foreground) !=3D 0) {
+=09=09res =3D 5;
+=09=09goto out3;
+=09}
+
+=09struct fuse_session *se =3D fuse_get_session(fuse);
+=09if (fuse_set_signal_handlers(se) !=3D 0) {
+=09=09res =3D 6;
+=09=09goto out3;
+=09}
+
+=09if (opts.singlethread)
+=09=09res =3D fuse_loop(fuse);
+=09else {
+=09=09struct fuse_loop_config loop_config;
+=09=09loop_config.clone_fd =3D opts.clone_fd;
+=09=09loop_config.max_idle_threads =3D opts.max_idle_threads;
+=09=09res =3D fuse_loop_mt_32(fuse, &loop_config);
+=09}
+=09if (res)
+=09=09res =3D 7;
+
+=09fuse_remove_signal_handlers(se);
+out3:
+=09fuse_unmount(fuse);
+out2:
+=09fuse_destroy(fuse);
+out1:
+=09free(opts.mountpoint);
+=09fuse_opt_free_args(&args);
+=09return res;
+}
+
+
+void fuse_apply_conn_info_opts(struct fuse_conn_info_opts *opts,
+=09=09=09       struct fuse_conn_info *conn)
+{
+=09if(opts->set_max_write)
+=09=09conn->max_write =3D opts->max_write;
+=09if(opts->set_max_background)
+=09=09conn->max_background =3D opts->max_background;
+=09if(opts->set_congestion_threshold)
+=09=09conn->congestion_threshold =3D opts->congestion_threshold;
+=09if(opts->set_time_gran)
+=09=09conn->time_gran =3D opts->time_gran;
+=09if(opts->set_max_readahead)
+=09=09conn->max_readahead =3D opts->max_readahead;
+
+#define LL_ENABLE(cond,cap) \
+=09if (cond) conn->want |=3D (cap)
+#define LL_DISABLE(cond,cap) \
+=09if (cond) conn->want &=3D ~(cap)
+
+=09LL_ENABLE(opts->splice_read, FUSE_CAP_SPLICE_READ);
+=09LL_DISABLE(opts->no_splice_read, FUSE_CAP_SPLICE_READ);
+
+=09LL_ENABLE(opts->splice_write, FUSE_CAP_SPLICE_WRITE);
+=09LL_DISABLE(opts->no_splice_write, FUSE_CAP_SPLICE_WRITE);
+
+=09LL_ENABLE(opts->splice_move, FUSE_CAP_SPLICE_MOVE);
+=09LL_DISABLE(opts->no_splice_move, FUSE_CAP_SPLICE_MOVE);
+
+=09LL_ENABLE(opts->auto_inval_data, FUSE_CAP_AUTO_INVAL_DATA);
+=09LL_DISABLE(opts->no_auto_inval_data, FUSE_CAP_AUTO_INVAL_DATA);
+
+=09LL_DISABLE(opts->no_readdirplus, FUSE_CAP_READDIRPLUS);
+=09LL_DISABLE(opts->no_readdirplus_auto, FUSE_CAP_READDIRPLUS_AUTO);
+
+=09LL_ENABLE(opts->async_dio, FUSE_CAP_ASYNC_DIO);
+=09LL_DISABLE(opts->no_async_dio, FUSE_CAP_ASYNC_DIO);
+
+=09LL_ENABLE(opts->writeback_cache, FUSE_CAP_WRITEBACK_CACHE);
+=09LL_DISABLE(opts->no_writeback_cache, FUSE_CAP_WRITEBACK_CACHE);
+
+=09LL_ENABLE(opts->async_read, FUSE_CAP_ASYNC_READ);
+=09LL_DISABLE(opts->sync_read, FUSE_CAP_ASYNC_READ);
+
+=09LL_DISABLE(opts->no_remote_posix_lock, FUSE_CAP_POSIX_LOCKS);
+=09LL_DISABLE(opts->no_remote_flock, FUSE_CAP_FLOCK_LOCKS);
+}
+
+struct fuse_conn_info_opts* fuse_parse_conn_info_opts(struct fuse_args *ar=
gs)
+{
+=09struct fuse_conn_info_opts *opts;
+
+=09opts =3D calloc(1, sizeof(struct fuse_conn_info_opts));
+=09if(opts =3D=3D NULL) {
+=09=09fuse_log(FUSE_LOG_ERR, "calloc failed\n");
+=09=09return NULL;
+=09}
+=09if(fuse_opt_parse(args, opts, conn_info_opt_spec, NULL) =3D=3D -1) {
+=09=09free(opts);
+=09=09return NULL;
+=09}
+=09return opts;
+}
+
+int fuse_open_channel(const char *mountpoint, const char* options)
+{
+=09struct mount_opts *opts =3D NULL;
+=09int fd =3D -1;
+=09const char *argv[] =3D { "", "-o", options };
+=09int argc =3D sizeof(argv) / sizeof(argv[0]);
+=09struct fuse_args args =3D FUSE_ARGS_INIT(argc, (char**) argv);
+
+=09opts =3D parse_mount_opts(&args);
+=09if (opts =3D=3D NULL)
+=09=09return -1;
+
+=09fd =3D fuse_kern_mount(mountpoint, opts);
+=09destroy_mount_opts(opts);
+
+=09return fd;
+}
--=20
2.24.1


