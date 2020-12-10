Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137C2D678B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:53:15 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knS01-0000bv-Ft
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knRxp-0008Lj-Fk
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knRxm-00029e-VA
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607629853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8MQ+nPwdEZTcRgp89CkiYaqT52reIeGV27WjwADJByw=;
 b=Tfok1Y9A8qCDnDElPnsvGVsyMkiyZrMKzkzPU09LNqp8IG92EZU+oI3R3PLZxCTZKo6YDm
 YM7S8U2udYu9YCRoJaZtkha8oUNQmMqhnqAe3RUJHEX7cuRTqV8FaAxIOYCk6kbss50VYS
 XnK4Mt+7EjV7MCTaF7h0kinq76+i3BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-4t47Ot41PFmDxaPI2evrog-1; Thu, 10 Dec 2020 14:50:51 -0500
X-MC-Unique: 4t47Ot41PFmDxaPI2evrog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D51B0801817
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 19:50:50 +0000 (UTC)
Received: from work-vm (ovpn-113-66.ams2.redhat.com [10.36.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBDC6F130;
 Thu, 10 Dec 2020 19:50:43 +0000 (UTC)
Date: Thu, 10 Dec 2020 19:50:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 1/3] virtiofsd: Set up posix_lock hash table for root inode
Message-ID: <20201210195035.GD12670@work-vm>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-2-vgoyal@redhat.com>
 <20201207195539.GB3107@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201207195539.GB3107@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, lersek@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> We setup per inode hash table ->posix_lock to support remote posix locks.
> But we forgot to initialize this table for root inode.
> 
> Laszlo managed to trigger an issue where he sent a FUSE_FLUSH request for
> root inode and lo_flush() found inode with inode->posix_lock NULL and
> accessing this table crashed virtiofsd.
> 
> May be we can get rid of initializing this hash table for directory
> objects completely. But that optimization is for another day.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2020-12-07 14:46:22.198359486 -0500
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2020-12-07 14:48:07.873737472 -0500
> @@ -3372,6 +3372,9 @@ static void setup_root(struct lo_data *l
>      root->key.mnt_id = mnt_id;
>      root->nlookup = 2;
>      g_atomic_int_set(&root->refcount, 2);
> +    pthread_mutex_init(&root->plock_mutex, NULL);
> +    root->posix_locks = g_hash_table_new_full(
> +        g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
>  }
>  
>  static guint lo_key_hash(gconstpointer key)
> @@ -3394,6 +3397,10 @@ static void fuse_lo_data_cleanup(struct
>      if (lo->inodes) {
>          g_hash_table_destroy(lo->inodes);
>      }
> +
> +    if (lo->root.posix_locks) {
> +        g_hash_table_destroy(lo->root.posix_locks);
> +    }
>      lo_map_destroy(&lo->fd_map);
>      lo_map_destroy(&lo->dirp_map);
>      lo_map_destroy(&lo->ino_map);
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


