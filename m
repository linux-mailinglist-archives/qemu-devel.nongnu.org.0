Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB630DC8F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:22:49 +0100 (CET)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J3Q-0001XT-6k
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7J1G-0000jL-VC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:20:34 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7J1E-0006Fj-M2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:20:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id E170A88B5E27;
 Wed,  3 Feb 2021 15:20:21 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 15:20:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00148947b67-7018-4824-99b8-9987dcf8b33b,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 15:20:14 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Message-ID: <20210203152014.443a8b29@bahia.lan>
In-Reply-To: <20210203113719.83633-3-stefanha@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-3-stefanha@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c62cfea9-2ac9-4d53-bd10-bfc58d19f2da
X-Ovh-Tracer-Id: 12764608719518669234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepshhlphesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  3 Feb 2021 11:37:18 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> lo_do_lookup() finds an existing inode or allocates a new one. It
> increments nlookup so that the inode stays alive until the client
> releases it.
> 
> Existing callers don't need the struct lo_inode so the function doesn't
> return it. Extend the function to optionally return the inode. The next
> commit will need it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index e63cbd3fb7..c87a1f3d72 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>  }
>  
>  /*
> - * Increments nlookup and caller must release refcount using
> - * lo_inode_put(&parent).
> + * Increments nlookup on the inode on success. unref_inode_lolocked() must be
> + * called eventually to decrement nlookup again. If inodep is non-NULL, the
> + * inode pointer is stored and the caller must call lo_inode_put().
>   */
>  static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
> -                        struct fuse_entry_param *e)
> +                        struct fuse_entry_param *e,
> +                        struct lo_inode **inodep)
>  {
>      int newfd;
>      int res;
> @@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_inode *inode = NULL;
>      struct lo_inode *dir = lo_inode(req, parent);
>  
> +    if (inodep) {
> +        *inodep = NULL;
> +    }
> +

Is this side-effect needed ? If lo_do_lookup() returns an error, it
rather seems that the caller shouldn't expect anything to be written
here, i.e. the content of *inodep still belongs to the caller and
whatever value it previously put in there (as patch 3/3 does) should
be preserved IMHO.

Apart from that LGTM.

>      /*
>       * name_to_handle_at() and open_by_handle_at() can reach here with fuse
>       * mount point in guest, but we don't have its inode info in the
> @@ -913,7 +919,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
> -    lo_inode_put(lo, &inode);
> +
> +    /* Transfer ownership of inode pointer to caller or drop it */
> +    if (inodep) {
> +        *inodep = inode;
> +    } else {
> +        lo_inode_put(lo, &inode);
> +    }
> +
>      lo_inode_put(lo, &dir);
>  
>      fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
> @@ -948,7 +961,7 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
>          return;
>      }
>  
> -    err = lo_do_lookup(req, parent, name, &e);
> +    err = lo_do_lookup(req, parent, name, &e, NULL);
>      if (err) {
>          fuse_reply_err(req, err);
>      } else {
> @@ -1056,7 +1069,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>          goto out;
>      }
>  
> -    saverr = lo_do_lookup(req, parent, name, &e);
> +    saverr = lo_do_lookup(req, parent, name, &e, NULL);
>      if (saverr) {
>          goto out;
>      }
> @@ -1534,7 +1547,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
>  
>          if (plus) {
>              if (!is_dot_or_dotdot(name)) {
> -                err = lo_do_lookup(req, ino, name, &e);
> +                err = lo_do_lookup(req, ino, name, &e, NULL);
>                  if (err) {
>                      goto error;
>                  }
> @@ -1732,7 +1745,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>          }
>  
>          fi->fh = fh;
> -        err = lo_do_lookup(req, parent, name, &e);
> +        err = lo_do_lookup(req, parent, name, &e, NULL);
>      }
>      if (lo->cache == CACHE_NONE) {
>          fi->direct_io = 1;


