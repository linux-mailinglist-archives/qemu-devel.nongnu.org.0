Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB23E4CB9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:10:32 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAfP-0000en-BV
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDAe4-0008PA-Bp
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDAe2-0001p8-4q
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628536145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fm81q4eZ6ybJ8lhNfxHRb90MUjzegXXG/kg2nMmokOA=;
 b=LOsfxYJ6/Uflz0mCAXdd6WY3/KGHySkKnfXXXAr6gSAbS4p4fzfRhPiHjYub4+srtNSpcT
 N/in3AOy+qerrSM/wJFeIpGylFiUXIN1qh8woPTmDHL+/osS1SDm5DlnK3hrEpPIt3iVJ+
 qG8kJ6UEn/SIS4zyJYx4eu9UmWQ06Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-TrZJrN5zPj2g8ChRTHx6gg-1; Mon, 09 Aug 2021 15:09:04 -0400
X-MC-Unique: TrZJrN5zPj2g8ChRTHx6gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB67107ACF5
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 19:09:03 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B7A319D9B;
 Mon,  9 Aug 2021 19:08:52 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id BC983220261; Mon,  9 Aug 2021 15:08:51 -0400 (EDT)
Date: Mon, 9 Aug 2021 15:08:51 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 10/10] virtiofsd: Add lazy lo_do_find()
Message-ID: <YRF9Q+MSjrbeybd2@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-11-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-11-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 05:01:34PM +0200, Max Reitz wrote:
> lo_find() right now takes two lookup keys for two maps, namely the file
> handle for inodes_by_handle and the statx information for inodes_by_ids.
> However, we only need the statx information if looking up the inode by
> the file handle failed.
> 
> There are two callers of lo_find(): The first one, lo_do_lookup(), has
> both keys anyway, so passing them does not incur any additional cost.
> The second one, lookup_name(), though, needs to explicitly invoke
> name_to_handle_at() (through get_file_handle()) and statx() (through
> do_statx()).  We need to try to get a file handle as the primary key, so
> we cannot get rid of get_file_handle(), but we only need the statx
> information if looking up an inode by handle failed; so we can defer
> that until the lookup has indeed failed.

So IIUC, this patch seems to be all about avoiding do_statx()
call in lookup_name() if file handle could be successfully
generated.

So can't we just not modify lookup_name() to not call statx()
if file handle could be generated. And also modfiy lo_find()
to use st/mnt_id only if fhandle==NULL.

That probably is much simpler change as compared to passing function
pointers around.

Vivek

> 
> To this end, replace lo_find()'s st/mnt_id parameters by a get_ids()
> closure that is invoked to fill the lo_key struct if necessary.
> 
> Also, lo_find() is renamed to lo_do_find(), so we can add a new
> lo_find() wrapper whose closure just initializes the lo_key from the
> st/mnt_id parameters, just like the old lo_find() did.
> 
> lookup_name() directly calls lo_do_find() now and passes its own
> closure, which performs the do_statx() call.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 93 ++++++++++++++++++++++++++------
>  1 file changed, 76 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ac95961d12..41e9f53878 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1200,22 +1200,23 @@ out_err:
>      fuse_reply_err(req, saverr);
>  }
>  
> -static struct lo_inode *lo_find(struct lo_data *lo,
> -                                const struct lo_fhandle *fhandle,
> -                                struct stat *st, uint64_t mnt_id)
> +/*
> + * get_ids() will be called to get the key for lo->inodes_by_ids if
> + * the lookup by file handle has failed.
> + */
> +static struct lo_inode *lo_do_find(struct lo_data *lo,
> +    const struct lo_fhandle *fhandle,
> +    int (*get_ids)(struct lo_key *, const void *),
> +    const void *get_ids_opaque)
>  {
>      struct lo_inode *p = NULL;
> -    struct lo_key ids_key = {
> -        .ino = st->st_ino,
> -        .dev = st->st_dev,
> -        .mnt_id = mnt_id,
> -    };
> +    struct lo_key ids_key;
>  
>      pthread_mutex_lock(&lo->mutex);
>      if (fhandle) {
>          p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
>      }
> -    if (!p) {
> +    if (!p && get_ids(&ids_key, get_ids_opaque) == 0) {
>          p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
>          /*
>           * When we had to fall back to looking up an inode by its
> @@ -1244,6 +1245,36 @@ static struct lo_inode *lo_find(struct lo_data *lo,
>      return p;
>  }
>  
> +struct lo_find_get_ids_key_opaque {
> +    const struct stat *st;
> +    uint64_t mnt_id;
> +};
> +
> +static int lo_find_get_ids_key(struct lo_key *ids_key, const void *opaque)
> +{
> +    const struct lo_find_get_ids_key_opaque *stat_info = opaque;
> +
> +    *ids_key = (struct lo_key){
> +        .ino = stat_info->st->st_ino,
> +        .dev = stat_info->st->st_dev,
> +        .mnt_id = stat_info->mnt_id,
> +    };
> +
> +    return 0;
> +}
> +
> +static struct lo_inode *lo_find(struct lo_data *lo,
> +                                const struct lo_fhandle *fhandle,
> +                                struct stat *st, uint64_t mnt_id)
> +{
> +    const struct lo_find_get_ids_key_opaque stat_info = {
> +        .st = st,
> +        .mnt_id = mnt_id,
> +    };
> +
> +    return lo_do_find(lo, fhandle, lo_find_get_ids_key, &stat_info);
> +}
> +
>  /* value_destroy_func for posix_locks GHashTable */
>  static void posix_locks_value_destroy(gpointer data)
>  {
> @@ -1769,14 +1800,41 @@ out_err:
>      fuse_reply_err(req, saverr);
>  }
>  
> +struct lookup_name_get_ids_key_opaque {
> +    struct lo_data *lo;
> +    int parent_fd;
> +    const char *name;
> +};
> +
> +static int lookup_name_get_ids_key(struct lo_key *ids_key, const void *opaque)
> +{
> +    const struct lookup_name_get_ids_key_opaque *stat_params = opaque;
> +    uint64_t mnt_id;
> +    struct stat attr;
> +    int res;
> +
> +    res = do_statx(stat_params->lo, stat_params->parent_fd, stat_params->name,
> +                   &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    if (res < 0) {
> +        return -errno;
> +    }
> +
> +    *ids_key = (struct lo_key){
> +        .ino = attr.st_ino,
> +        .dev = attr.st_dev,
> +        .mnt_id = mnt_id,
> +    };
> +
> +    return 0;
> +}
> +
>  /* Increments nlookup and caller must release refcount using lo_inode_put() */
>  static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>                                      const char *name)
>  {
>      g_auto(TempFd) dir_fd = TEMP_FD_INIT;
>      int res;
> -    uint64_t mnt_id;
> -    struct stat attr;
> +    struct lookup_name_get_ids_key_opaque stat_params;
>      struct lo_fhandle *fh;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir = lo_inode(req, parent);
> @@ -1794,12 +1852,13 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>      fh = get_file_handle(lo, dir_fd.fd, name);
>      /* Ignore errors, this is just an optional key for the lookup */
>  
> -    res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
> -    if (res == -1) {
> -        goto out;
> -    }
> -
> -    inode = lo_find(lo, fh, &attr, mnt_id);
> +    stat_params = (struct lookup_name_get_ids_key_opaque){
> +        .lo = lo,
> +        .parent_fd = dir_fd.fd,
> +        .name = name,
> +    };
> +    inode = lo_do_find(lo, fh, lookup_name_get_ids_key, &stat_params);
> +    lo_inode_put(lo, &dir);
>      g_free(fh);
>  
>  out:
> -- 
> 2.31.1
> 


