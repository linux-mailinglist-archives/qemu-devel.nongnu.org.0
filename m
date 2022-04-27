Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86E5123FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:37:50 +0200 (CEST)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njoQ1-0000WS-4f
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njoOq-000805-MF
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:36:37 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njoOn-000423-Sd
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:36:35 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-c52dqAGSMtKKvPxdn7VwRg-1; Wed, 27 Apr 2022 16:36:28 -0400
X-MC-Unique: c52dqAGSMtKKvPxdn7VwRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E33C85A5BE;
 Wed, 27 Apr 2022 20:36:28 +0000 (UTC)
Received: from bahia (unknown [10.39.195.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9E782024CB6;
 Wed, 27 Apr 2022 20:36:26 +0000 (UTC)
Date: Wed, 27 Apr 2022 22:36:25 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220427223625.52e0e23f@bahia>
In-Reply-To: <489275615f29a2efc97cbd6130c98669ed28a24b.1651085922.git.qemu_oss@crudebyte.com>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
 <489275615f29a2efc97cbd6130c98669ed28a24b.1651085922.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 20:54:17 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating sockets, so divert to
> call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
> was passed with mode argument.
> 
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util-darwin.c | 45 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index e24d09763a..7d00db47a9 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -74,6 +74,45 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>   */
>  #if defined CONFIG_PTHREAD_FCHDIR_NP
>  
> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> +    int fd, err;
> +    struct sockaddr_un addr = {
> +        .sun_family = AF_UNIX
> +    };
> +
> +    /*
> +     * sun_path is only 104 bytes, explicit filename length check required
> +     */
> +    if (sizeof(addr.sun_path) - 1 < strlen(filename) + 2) {

True but I was a bit puzzled by the math until I realized the '+ 2' was
for the prepended "./" ;-)

> +        errno = ENAMETOOLONG;
> +        return -1;
> +    }
> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> +    if (fd == -1) {
> +        return fd;
> +    }
> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);

What about the more generic approach of checking snprintf()'s return
value ? If it is >= sizeof(addr.sun_path) then truncation occured.

> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> +    if (err == -1) {
> +        goto out;
> +    }
> +    /*
> +     * FIXME: Should rather be using descriptor-based fchmod() on the
> +     * socket file descriptor above (preferably before bind() call),
> +     * instead of path-based fchmodat(), to prevent concurrent transient
> +     * state issues between creating the named FIFO file at bind() and
> +     * delayed adjustment of permissions at fchmodat(). However currently
> +     * macOS (12.x) does not support such operations on socket file
> +     * descriptors yet.
> +     *
> +     * Filed report with Apple: FB9997731
> +     */
> +    err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
> +out:
> +    close_preserve_errno(fd);

You could close(fd) earlier now, but you might want to keep the code
as is in case FB9997731 gets proper attention.

Anyway, this should do the job so:

Reviewed-by: Greg Kurz <groug@kaod.org>

> +    return err;
> +}
> +
>  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
> @@ -93,7 +132,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>      if (pthread_fchdir_np(dirfd) < 0) {
>          return -1;
>      }
> -    err = mknod(filename, mode, dev);
> +    if (S_ISSOCK(mode)) {
> +        err = create_socket_file_at_cwd(filename, mode);
> +    } else {
> +        err = mknod(filename, mode, dev);
> +    }
>      preserved_errno = errno;
>      /* Stop using the thread-local cwd */
>      pthread_fchdir_np(-1);


