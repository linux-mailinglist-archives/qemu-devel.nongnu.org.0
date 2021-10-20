Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1761435341
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 20:56:01 +0200 (CEST)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdGkq-00055j-1l
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 14:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mdGiW-0003fp-56
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mdGiS-0002CL-2c
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634756010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoHMK+s1ELYYoEENiH2hGhqMqcmHt4H1/wIp1ZMKLUg=;
 b=adwLsCZiw00w05y7DSWIqXCI6wV1PMnzhWXLr0a62a3ABQB0qQpn6OE3E1xcTiezTubRUi
 ww3bh9nH4dwRw4Rn0RBqkipPSVGnc6jHjdtnczhiWI3GsKjgC4PNDiL2qYL/HxfxGw93ba
 OQgk3xZ2zQeXj8vbyhFfZNILJ3bTcDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400--6Uj3TqDP1aaeK7A6kvlAg-1; Wed, 20 Oct 2021 14:53:20 -0400
X-MC-Unique: -6Uj3TqDP1aaeK7A6kvlAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6BA69F92B
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 18:53:19 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96AE260CA0;
 Wed, 20 Oct 2021 18:53:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 138922256FC; Wed, 20 Oct 2021 14:53:14 -0400 (EDT)
Date: Wed, 20 Oct 2021 14:53:14 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 11/12] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YXBlmogJyeinUsXk@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-12-hreitz@redhat.com>
 <YW8VBVsCqdUrm+M7@redhat.com>
 <161f36dc-2046-9b0b-deac-3fe039849103@redhat.com>
MIME-Version: 1.0
In-Reply-To: <161f36dc-2046-9b0b-deac-3fe039849103@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Oct 20, 2021 at 12:00:07PM +0200, Hanna Reitz wrote:

[..]
> > > @@ -1302,13 +1512,26 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >           goto out;
> > >       }
> > > -    newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
> > > -    if (newfd == -1) {
> > > -        goto out_err;
> > > +    fh = get_file_handle(lo, dir_path_fd.fd, name, &can_open_handle);
> > > +    if (!fh || !can_open_handle) {
> > > +        /*
> > > +         * If we will not be able to open the file handle again
> > > +         * (can_open_handle is false), open an FD that we can put into
> > > +         * lo_inode (in case we need to create a new lo_inode).
> > > +         */
> > > +        newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
> > > +        if (newfd == -1) {
> > > +            goto out_err;
> > > +        }
> > >       }
> > > -    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> > > -                   &mnt_id);
> > > +    if (newfd >= 0) {
> > > +        res = do_statx(lo, newfd, "", &e->attr,
> > > +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> > > +    } else {
> > > +        res = do_statx(lo, dir_path_fd.fd, name, &e->attr,
> > > +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> > > +    }
> > >       if (res == -1) {
> > >           goto out_err;
> > >       }
> > > @@ -1318,9 +1541,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >           e->attr_flags |= FUSE_ATTR_SUBMOUNT;
> > Can this FUSE_ATTR_SUBMOUNT check be racy w.r.t file handles. I mean
> > say we open the file handle, and before we call do_statx(), another
> > mount shows up on the directory in queustion. So stats now belong
> > to file in new mount and we will think it is a SUBMOUNT. So effectively
> > now we have fh belonging to old file but stats belonging to new file
> > in new mount?
> 
> Yes.  Not just the submount, but the whole stat information, so also the
> file type that goes into the lo_inode.
> 
> I thought this wasn’t too bad, though now I don’t really know why. Perhaps
> it was just how I started the implementation and I never could get myself to
> care enough (not good, I know).  Thanks for making me care! :)
> 
> We could theoretically open an O_PATH FD from the file handle to get the
> stat information from it, but that wouldn’t work for un-openable file
> handles.
> 
> So I think the best is to open an O_PATH FD unconditionally first, and then
> generate the file handle from it.  Then we can stat the FD.

Yes, this sounds like a more reasonable appraoch. This O_PATH fd will be
temporary in nature, so it should not be a problem.

[..]
> > > + *
> > > + * Passing true for cap_dac_read_search adds CAP_DAC_READ_SEARCH to the
> > > + * allowlist.
> > >    */
> > > -static void setup_capabilities(char *modcaps_in)
> > > +static void setup_capabilities(char *modcaps_in, bool cap_dac_read_search)
> > >   {
> > >       char *modcaps = modcaps_in;
> > >       pthread_mutex_lock(&cap.mutex);
> > > @@ -4012,6 +4266,17 @@ static void setup_capabilities(char *modcaps_in)
> > >           exit(1);
> > >       }
> > > +    /*
> > > +     * If we need CAP_DAC_READ_SEARCH (for file handles), add that, too.
> > > +     */
> > > +    if (cap_dac_read_search &&
> > > +        capng_update(CAPNG_ADD, CAPNG_PERMITTED | CAPNG_EFFECTIVE,
> > > +                     CAP_DAC_READ_SEARCH)) {
> > > +        fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for "
> > > +                 "CAP_DAC_READ_SEARCH\n", __func__);
> > > +        exit(1);
> > > +    }
> > > +
> > >       /*
> > >        * The modcaps option is a colon separated list of caps,
> > >        * each preceded by either + or -.
> > > @@ -4158,7 +4423,7 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
> > >       }
> > >       setup_seccomp(enable_syslog);
> > > -    setup_capabilities(g_strdup(lo->modcaps));
> > > +    setup_capabilities(g_strdup(lo->modcaps), lo->inode_file_handles);
> > >   }
> > >   /* Set the maximum number of open file descriptors */
> > > @@ -4498,6 +4763,14 @@ int main(int argc, char *argv[])
> > >       lo.use_statx = true;
> > > +#if !defined(CONFIG_STATX) || !defined(STATX_MNT_ID)
> > > +    if (lo.inode_file_handles) {
> > > +        fuse_log(FUSE_LOG_WARNING,
> > > +                 "No statx() or mount ID support: Will not be able to use file "
> > > +                 "handles for inodes\n");
> > > +    }
> > Again, I think we should error out if user asked for file handle support
> > explicitly and we can't enable it. But if we end up enabling by default,
> > it probably is fine to just log a message and not use it.
> > 
> > This begs the question what happens if filesystem does not support the
> > file handles. Ideally, I would think that we can error out.But for
> > submounts check will happen much later. For root mount atleast we
> > should be able to check at startup time and make sure file handles are
> > supported by filesystem.
> 
> I disagree, because we’ve decided that enabling file handles means
> best-effort.

Only for the cases where failure is temporary in nature or submounts don't
support file handles, right?

I thought you agreed that we should fail if we can't use file handles at
all.

> As for CONFIG_STATX or STATX_MNT_ID, those are things that
> will matter less over time anyway (because they will always be present).

This failure seems permanent and one will not be able to use file handles
at all.

Anyway, it probably will be nice to have first patch in the series, which
is just documentation patch and explains this best-effort nature of
file handle option and when to expect failure and when it will silently
fallback to O_PATH fd.

Vivek


