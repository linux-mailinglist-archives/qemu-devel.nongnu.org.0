Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95163697CD2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHW3-0008Go-9t; Wed, 15 Feb 2023 08:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSHW1-0008GZ-Vt
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:08:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSHVy-0005Z4-HK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6T9AjnkqeQDMkotFNzAZurUBd6HfYf5wSG1ncRoL0Xg=;
 b=YuOiEtE/fk7nQrTD36a5uS/sadFNuk5/24GdD4ncROVYgAw6BYe+wQeTbIaH2trWo+chSJ
 PQlf7gyLke2yL08desleZSUEwSW/PbAe70vTapv0jheIysxr/ATYa8wZmIsDRH55TG7C16
 i95z1EXjj+ZAuAsQnrukc8mouheHj3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-bFLwCy0rMBGPy3KFhFhe5w-1; Wed, 15 Feb 2023 08:08:00 -0500
X-MC-Unique: bFLwCy0rMBGPy3KFhFhe5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 642DF882824;
 Wed, 15 Feb 2023 13:07:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A521121318;
 Wed, 15 Feb 2023 13:07:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D46A221E6A1F; Wed, 15 Feb 2023 14:07:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org,  hreitz@redhat.com,  aesteve@redhat.com,
 nsoffer@redhat.com,  qemu-devel@nongnu.org,  vsementsov@yandex-team.ru
Subject: Re: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image
References: <20230112191454.169353-1-kwolf@redhat.com>
 <874jsu51sj.fsf@pond.sub.org> <Y8FAkAC3L7oF5q48@redhat.com>
Date: Wed, 15 Feb 2023 14:07:57 +0100
In-Reply-To: <Y8FAkAC3L7oF5q48@redhat.com> (Kevin Wolf's message of "Fri, 13
 Jan 2023 12:29:20 +0100")
Message-ID: <87cz6b9ivm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> writes:

> Am 13.01.2023 um 08:30 hat Markus Armbruster geschrieben:
>> Drive-by comment...
>> 
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > This series addresses the problem described in these bug reports:
>> > https://gitlab.com/qemu-project/qemu/-/issues/1330
>> > https://bugzilla.redhat.com/show_bug.cgi?id=2147617
>> >
>> > qcow2 can fail when writing back dirty bitmaps in qcow2_inactivate().
>> > However, when the function is called through blk_unref(), in the case of
>> > such errors, while an error message is written to stderr, the callers
>> > never see an error return. Specifically, 'qemu-img bitmap/commit' are
>> > reported to exit with an exit code 0 despite the errors.
>> 
>> After having tead the "potential alternative" below, I figure this
>> failure happens within blk_unref().  But I can't see a call chain.  Am I
>> confused?
>
> When I put an abort() into the error path:
>
> #0  0x00007ffff6aa156c in __pthread_kill_implementation () from /lib64/libc.so.6
> #1  0x00007ffff6a54d76 in raise () from /lib64/libc.so.6
> #2  0x00007ffff6a287f3 in abort () from /lib64/libc.so.6
> #3  0x00005555556108f3 in qcow2_inactivate (bs=0x555555879a30) at ../block/qcow2.c:2705
> #4  0x0000555555610a08 in qcow2_do_close (bs=0x555555879a30, close_data_file=true) at ../block/qcow2.c:2741
> #5  0x0000555555610b38 in qcow2_close (bs=0x555555879a30) at ../block/qcow2.c:2770
> #6  0x00005555555a1b4e in bdrv_close (bs=0x555555879a30) at ../block.c:4939
> #7  0x00005555555a2ad4 in bdrv_delete (bs=0x555555879a30) at ../block.c:5330
> #8  0x00005555555a5b49 in bdrv_unref (bs=0x555555879a30) at ../block.c:6850
> #9  0x000055555559d6c5 in bdrv_root_unref_child (child=0x555555873300) at ../block.c:3207
> #10 0x00005555555c7beb in blk_remove_bs (blk=0x5555558796e0) at ../block/block-backend.c:895
> #11 0x00005555555c6c3f in blk_delete (blk=0x5555558796e0) at ../block/block-backend.c:479
> #12 0x00005555555c6fb0 in blk_unref (blk=0x5555558796e0) at ../block/block-backend.c:537
> #13 0x0000555555587dc9 in img_bitmap (argc=7, argv=0x7fffffffd760) at ../qemu-img.c:4820
> #14 0x0000555555589807 in main (argc=7, argv=0x7fffffffd760) at ../qemu-img.c:5450

Thanks!

>> > The solution taken here is inactivating the images first, which can
>> > still return errors, but already performs all of the write operations.
>> > Only then the images are actually blk_unref()-ed.
>> >
>> > If we agree that this is the way to go (as a potential alternative,
>> > allowing blk_unref() to fail would require changes in all kinds of
>> > places, many of which probably wouldn't even know what to do with the
>> > error),
>> 
>> blk_unref() could fail only when it destroys @blk (refcnt goes to zero).
>> Correct?
>
> I think so, yes.

Thanks again!

>> We have a bunch of "unref" functions in the tree, and, as far as I can
>> tell from a quick grep, none of them can fail.  Supports your apparent
>> preference for not changing blk_unref().
>> 
>> >         then I suppose doing the same for other qemu-img subcommands
>> > would make sense, too.
>> 
>> I was about to ask whether there could be more silent failures like the
>> ones in commit and bitmap.  This suggests there are.
>> 
>> Say we do the same for all known such failures.  Would any remaining (or
>> new) such failures be programming errors?
>
> Let's be honest: What I'm proposing here is not pretty and not a full
> solution, it only covers the simplest part of the problem, which happens
> to be the part that has shown up in practice.
>
> If you have a good idea how to solve the general problem, I'm all ears.
>
> I haven't checked other qemu-img subcommands, but I don't see why they
> wouldn't be able to run into an error in .bdrv_close. They could be
> fixed the same way.
>
> The next level in difficulty might be QMP block-delete. It's still easy
> because like in qemu-img, we know that we're freeing the last reference,
> and so we could actually do the same here. Well, more or less the same
> at least: Obviously not inactivate_all(), but just for a single node. We
> also need to do this recursively for children, except only for those
> that would actually go away together with our parent node and aren't
> referenced elsewhere. Even if we manage to implement this correctly,
> what do we do with the error? Would returning a QMP error imply that we
> didn't actually close the image and it's still valid (and not
> inactivated)?
>
> Too easy? Let's make it a bit harder. Let's say a commit job completes
> and we're now removing the intermediate nodes. One of these images could
> in theory fail in .bdrv_close. We have successfully committed the data,
> the new graph is ready and in good state. Just one of the old images
> we're throwing out runs into ENOSPC in its .bdrv_close. Where do we
> report that error? We don't even necessarily have a QMP command here, we
> could only let the whole block job fail, which is probably not a good
> way to let libvirt know what was happening. Also, we can't just
> unconditionally inactivate the image beforehand there, it might still be
> in use by other references.  Which may actually be dropped while we're
> draining the node in bdrv_close().
>
> Not enough headaches yet? There are plenty of places in QEMU that just
> want to make sure that the node doesn't go away while they are still
> doing something with it. So they use a bdrv_ref/unref pair locally.
> These places could end up freeing the last reference if the node would
> have gone away otherwise. They are almost certainly a very confusing
> place to report the error. They might not even be places that can return
> errors at all currently.

Yes.

> So the main reason why I'm not doing this properly by returning the
> errors from qcow2_close() (and .bdrv_close in all other drivers) through
> bdrv_unref() down to the callers of that is not only that it would be a
> major conversion that would touch lots of places, but also that I
> wouldn't even know what to do with the error in most callers. And that
> I'm not sure what the semantics of an error in a close function should
> be.

Understand.

> Another thing that could be tried is making failure in .bdrv_close less
> likely by doing things earlier. At least ENOSPC could probably be
> avoided if dirty bitmaps clusters were allocated during the write
> request that first sets a bit in them (I know too little about the
> details how bitmaps are implemented in qcow2, though, maybe Vladimir can
> help here). But ultimately, you'll always get some I/O requests in
> .bdrv_close and they could fail even if we made it less likely.

Let me try to summarize to make sure I understand.

Closing an image can fail for the same reason close() can fail: flushing
caches can fail, and not caching is not an option.

The close is commonly hidden within a bdrv_unref().  It closes when the
last reference goes away.

Sometimes we know which bdrv_unref() will close.  Sometimes we don't.

Some bdrv_unref() callers can report errors sanely.  Others simply
can't.

Some failures to close can be safely ignored, such as closing a
temporary image that is going away anyway.  But it's hard to tell when
this is the case.

Ideally, things fail cleanly: we either do what's asked and succeed, or
do nothing and fail.  A failure to close is commonly unclean.  So, even
if we can report it, recovery can be hard or impossible.


A common criticism of garbage collection is that finalization is delayed
and runs "out of context".  The above shows that reference counting
isn't all that better.

We could have two variants of bdrv_unref(), one that must not fail, and
one that can fail and must be checked.  But as you explained, ensuring
failure only happens in places where we can handle an error sanely is
somewhere between hard and impossible.

No better ideas, I'm afraid.


