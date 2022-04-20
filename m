Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8F5084B7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:17:45 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6T1-0000wt-RB
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nh6LS-0004wO-Js
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:09:54 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nh6LQ-0002SZ-MD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:09:54 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-GPGz4qPoOVy7YUjkR3XUPw-1; Wed, 20 Apr 2022 05:09:49 -0400
X-MC-Unique: GPGz4qPoOVy7YUjkR3XUPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFBBD801E67;
 Wed, 20 Apr 2022 09:09:48 +0000 (UTC)
Received: from bahia (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9342657232B;
 Wed, 20 Apr 2022 09:09:47 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:09:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220420110946.3dbe6f50@bahia>
In-Reply-To: <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Tue, 19 Apr 2022 13:41:03 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> mknod() on macOS does not support creating sockets, so divert to
> call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> was passed with mode argument.
> 

Hmm... thinking again about this one : QEMU on linux calls the libc
version of mknodat() which doesn't seem to support S_IFSOCK according
to the mknod(3P) manual page. So I'm not sure there's something to
be actually fixed here... what's the observed behavior on linux ?

> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util-darwin.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index 53e0625501..252a6fc5dd 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -74,6 +74,24 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>   */
>  #if defined CONFIG_PTHREAD_FCHDIR_NP
>  
> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> +    int fd, err;
> +    struct sockaddr_un addr = {
> +        .sun_family = AF_UNIX
> +    };
> +
> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> +    if (fd < 0) {
> +        return fd;
> +    }
> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> +    if (err < 0) {
> +        return err;
> +    }
> +    return chmod(addr.sun_path, mode);
> +}
> +
>  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
> @@ -88,7 +106,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
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


