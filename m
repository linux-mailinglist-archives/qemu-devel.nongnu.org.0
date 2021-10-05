Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35165422820
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:42:51 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkiW-0000bc-Pq
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mXkfx-0007Jy-LM
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mXkft-0004LC-LD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633441204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G8ocgkXMJKYX32ysFS9Y8/kil8NtU8ecWpacSh5oM6I=;
 b=O9ZMFbwciYyk9sHT7kqhT6v5UcxjG9b11eS38Sp4kytv6o2vt379r2+G6v8ngLwy/ceuGm
 so45JCuoUFYYLFe+vAM9YvCGdsf3FuwJE7hOj0kFC9gwz3f6XFq38jyLgMsfyMJEfPAOVz
 CfjT9beTNGfHJZIYKgK2k/40qzrD1L0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Z6YRBJihMq28R183R4QJFQ-1; Tue, 05 Oct 2021 09:38:52 -0400
X-MC-Unique: Z6YRBJihMq28R183R4QJFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6FE1802B9F;
 Tue,  5 Oct 2021 13:38:51 +0000 (UTC)
Received: from titinator (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2BAD60BF4;
 Tue,  5 Oct 2021 13:38:30 +0000 (UTC)
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-8-vgoyal@redhat.com>
User-agent: mu4e 1.5.13; emacs 27.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 07/13] virtiofsd: Release file locks using
 F_UNLCK
Date: Tue, 05 Oct 2021 15:37:17 +0200
In-reply-to: <20210930153037.1194279-8-vgoyal@redhat.com>
Message-ID: <lytuhv617w.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021-09-30 at 11:30 -04, Vivek Goyal <vgoyal@redhat.com> wrote...
> We are emulating posix locks for guest using open file description locks
> in virtiofsd. When any of the fd is closed in guest, we find associated
> OFD lock fd (if there is one) and close it to release all the locks.
>
> Assumption here is that there is no other thread using lo_inode_plock
> structure or plock->fd, hence it is safe to do so.
>
> But now we are about to introduce blocking variant of locks (SETLKW),
> and that means we might be waiting to a lock to be available and
> using plock->fd. And that means there are still users of plock
> structure.
>
> So release locks using fcntl(SETLK, F_UNLCK) instead of closing fd
> and plock will be freed later when lo_inode is being freed.
>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 38b2af8599..6928662e22 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1557,9 +1557,6 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
>          g_hash_table_remove(lo->inodes, &inode->key);
>          if (lo->posix_lock) {
> -            if (g_hash_table_size(inode->posix_locks)) {
> -                fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> -            }
>              g_hash_table_destroy(inode->posix_locks);
>              pthread_mutex_destroy(&inode->plock_mutex);
>          }
> @@ -2266,6 +2263,8 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      (void)ino;
>      struct lo_inode *inode;
>      struct lo_data *lo = lo_data(req);
> +    struct lo_inode_plock *plock;
> +    struct flock flock;
>
>      inode = lo_inode(req, ino);
>      if (!inode) {
> @@ -2282,8 +2281,22 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      /* An fd is going away. Cleanup associated posix locks */
>      if (lo->posix_lock) {
>          pthread_mutex_lock(&inode->plock_mutex);
> -        g_hash_table_remove(inode->posix_locks,

I'm curious why the g_hash_table_remove above is not in the 'if' below?

> +        plock = g_hash_table_lookup(inode->posix_locks,
>              GUINT_TO_POINTER(fi->lock_owner));
> +
> +        if (plock) {
> +            /*
> +             * An fd is being closed. For posix locks, this means
> +             * drop all the associated locks.
> +             */
> +            memset(&flock, 0, sizeof(struct flock));
> +            flock.l_type = F_UNLCK;
> +            flock.l_whence = SEEK_SET;
> +            /* Unlock whole file */
> +            flock.l_start = flock.l_len = 0;
> +            fcntl(plock->fd, F_OFD_SETLK, &flock);
> +        }
> +
>          pthread_mutex_unlock(&inode->plock_mutex);
>      }
>      res = close(dup(lo_fi_fd(req, fi)));


--
Cheers,
Christophe de Dinechin (IRC c3d)


