Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD71C1551
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 16:06:03 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUWIk-0001KM-Vq
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 10:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jUWHd-0000PG-P9
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jUWHc-00035P-SE
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:04:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jUWHc-00033r-7M
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KiXG7dDfi1XKZV7Zf1pVusW80Li1FtUHGgVnP1Ql4cM=; b=p+gUHfPI4VdZceva3FC2ewPfwX
 2EWDp86AYM6uGsAUhpRez7jbcdu7X49sUb4wtdYB2KIAcJEhDZK+cYucpgUhzECYi6RVPKWIqsPdM
 WcfWiU83xMvHdSX1VSnIW3IfW6q9yDfMEp7W5MpEpP/tSyZd8qzzG2t3yEHsExxJosCGUfwByqyQe
 VqFYHD1SQwYtFqU9/kCz4LbUtIlG1vv1gYHWNSq+bmaJeKeoDisvGWf4n5aZK563HCJg8GFXKZgo/
 Co7SHRLYGpUjg1k/+/LUo7nChDCt5MaZoTs1z4zUF188Xe5XeLfaiTyfot7kb4Nve7j5HnhGwQKPO
 6Q26yPZ+xqcBH7SkX4jwDblpbtZ5ETjs4Hlw2hGRZOB+nA3R5ia0KR63mqX6yO7VCjkMWvH0s8/g5
 n5eTlJ2Alrqw9tJiAXa/xNCDQLoGzMHuprkU7UT3iIYmftFZ/n06TpKHc5DgMPst1pCMiMIlVF11r
 x0sc+cSDr6jFGMvRvq3fG4ZpBD/FDuQSdSm/Ufwt8qAee4W0Iu/wTdkk2vMtSUyG6AfSgWVK6sbNB
 38Egoaz91XAUm6Ggz8hanXbPB8hABAJig2hn6x3AgYA3jbZW0O0Fzo6HWlY7hiE986ztu/Wqd9abp
 aozKDhC3TlP+qAPMjE9QJx5cLnbNgSn0KRXfS3chs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v6 3/5] 9pfs: add new function v9fs_co_readdir_many()
Date: Fri, 01 May 2020 16:04:41 +0200
Message-ID: <5819799.mbObChnQ2B@silver>
In-Reply-To: <20200430153049.12488a1d@bahia.lan>
References: <cover.1587309014.git.qemu_oss@crudebyte.com>
 <5059845.6LZZmIoT5M@silver> <20200430153049.12488a1d@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 10:04:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 5.189.157.229
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

On Donnerstag, 30. April 2020 15:30:49 CEST Greg Kurz wrote:
> > > I agree that a client that issues concurrent readdir requests on the
> > > same fid is probably asking for troubles, but this permitted by the
> > > spec. Whether we should detect such conditions and warn or even fail
> > > is discussion for another thread.
> > > 
> > > The locking is only needed to avoid concurrent accesses to the dirent
> > > structure returned by readdir(), otherwise we could return partially
> > > overwritten file names to the client. It must be done for each
> > > individual
> > > call to readdir(), but certainly not for multiple calls.
> > 
> > Yeah, that would resolve this issue more appropriately for 9p2000.L, since
> > Treaddir specifies an offset, but for 9p2000.u the result of a concurrent
> > read on a directory (9p2000.u) would still be undefined.
> 
> The bad client behavior you want to tackle has nothing to do with
> the locking itself. Since all the code in 9p.c runs serialized in
> the context of the QEMU main loop, concurrent readdir requests could
> easily be detected up-front with a simple flag in the fid structure.

Well, it's fine with me. I don't really see an issue here right now. But that 
all the code was serialized is not fully true. Most of the 9p.c code is still 
heavily dispatching between main thread and worker threads back and forth. And 
for that reason the order of request processing might change quite arbitrarily 
in between. Just keep that in mind.

> > > > +
> > > > +    /* save the directory position */
> > > > +    saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> > > > +    if (saved_dir_pos < 0) {
> > > > +        err = saved_dir_pos;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    while (true) {
> > > > +        /* get directory entry from fs driver */
> > > > +        err = do_readdir(pdu, fidp, &dent);
> > > > +        if (err || !dent) {
> > > > +            break;
> > > > +        }
> > > > +
> > > > +        /*
> > > > +         * stop this loop as soon as it would exceed the allowed
> > > > maximum
> > > > +         * response message size for the directory entries collected
> > > > so
> > > > far, +         * because anything beyond that size would need to be
> > > > discarded by +         * 9p controller (main thread / top half) anyway
> > > > +         */
> > > > +        v9fs_string_init(&name);
> > > > +        v9fs_string_sprintf(&name, "%s", dent->d_name);
> > > > +        len = v9fs_readdir_response_size(&name);
> > > > +        v9fs_string_free(&name);
> > > > +        if (size + len > maxsize) {
> > > > +            /* this is not an error case actually */
> > > > +            break;
> > > > +        }
> > > > +
> > > > +        /* append next node to result chain */
> > > > +        if (!e) {
> > > > +            *entries = e = g_malloc0(sizeof(V9fsDirEnt));
> > > > +        } else {
> > > > +            e = e->next = g_malloc0(sizeof(V9fsDirEnt));
> > > > +        }
> > > > +        e->dent = g_malloc0(sizeof(struct dirent));
> > > 
> > > So we're allocating a bunch of stuff here...
> > > 
> > > > +        memcpy(e->dent, dent, sizeof(struct dirent));
> > > > +
> > > > +        /* perform a full stat() for directory entry if requested by
> > > > caller */ +        if (dostat) {
> > > > +            err = s->ops->name_to_path(
> > > > +                &s->ctx, &fidp->path, dent->d_name, &path
> > > > +            );
> > > > +            if (err < 0) {
> > > > 
> > > >                  err = -errno;
> > > > 
> > > > -            } else {
> > > > -                *dent = entry;
> > > > -                err = 0;
> > > > +                break;
> > > 
> > > ... but we're erroring out there and it seems that we're leaking
> > > all the entries that have been allocated so far.
> > 
> > No, they are not leaking actually.
> > 
> > You are right that they are not deallocated in do_readdir_many(), but
> > that's intentional: in the new implementation of v9fs_do_readdir() you
> > see that v9fs_free_dirents(entries) is *always* called at the very end of
> > the function, no matter if success or any error. That's one of the
> > measures to simplify overall code as much as possible.
> 
> Hmm... I still don't quite like the idea of having an erroring function
> asking for extra cleanup. I suggest you come up with an idem-potent version
> of v9fs_free_dirents(), move it to codir.c (I also prefer locality of calls
> to g_malloc and g_free in the same unit), make it extern and call it
> both on the error path of v9fs_co_readdir_many() and in v9fs_do_readdir().

I understand your position of course, but I still won't find that to be a good 
move.

My veto here has a reason: your requested change would prevent an application 
that I had in mind for future purpose actually: Allowing "greedy" fetching 
directory entries, that is returning all successful read entries while some of 
the entries might have been errored for some reason. Think about a directory 
where one entry is another device which errors for some reason, then a user 
probably still would want to see the other entries at least. I know that 
purpose would still need some minor adjustments, but no changes to the current 
structure of this function actually.

But to also make this clear: there is no "extra" cleanup right now. 
v9fs_free_dirents(entries) is *always* called by caller, no matter if success, 
error, allocated list or NULL. It couldn't be more simple. A user of this 
function must call v9fs_free_dirents(entries) at a certain point anyway.

If you have a bad feeling about it, I can make it more clear by an API doc 
comment on v9fs_co_readdir_many() if you want, like e.g. "You @b MUST @ ALWAYS 
call v9fs_free_dirents() after using this function, both on success or 
error.".

> > I think you mean the case when there's an error inside the if (dostat) {}
> > block: The comments on struct V9fsDirEnt already suggest that the "st"
> > member is optional and may be NULL. So if there's an error inside if
> > (dostat) {} then caller still has a valid "dent" field at least and it's
> > up to caller whether or not it's a problem for its purpose that "st" is
> > empty. For that reason I would not move the block forward.
> 
> Hrm... the comment is:
> 
>     /*
>      * optional (may be NULL): A full stat of each directory entry is just
>      * done if explicitly told to fs driver.
>      */
> 
> I don't read that it is optional for the fs driver to populate "st"
> if this was required by the caller.

Well, if you find that ambigious, I could add an additional sentence "It might 
also be NULL if stat failed.".

> Also, looking at the next patch
> I see that the condition for calling stat() is V9FS_REMAP_INODES and
> the code explicitly requires "st" to be available in this case.

Yes, but there is also an if (!st) { ... } in the subsequent patch already. So 
I don't see an issue here.

Changing the order in readdir_many() would prevent future applications of that 
function that I described. Or let's say, order would need to be reverted back 
again later on.

Best regards,
Christian Schoenebeck



