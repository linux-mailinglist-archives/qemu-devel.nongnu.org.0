Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139A5EC6C5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:47:05 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBrS-0002Zj-Qk
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1odAH8-0000QH-Uj; Tue, 27 Sep 2022 09:05:27 -0400
Received: from sosiego.soundray.org ([116.203.207.114]:56344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1odAH5-0002d6-B5; Tue, 27 Sep 2022 09:05:25 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1664283916;
 bh=qYlB6YTtaz+95XyXSI9BbZJWsQUDAyX1h7bRyQZL/bU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=oDAP07qhinDnKCZfaVw8QRcWoVVmBQANP1r1sJxz0abjTxNkyQ4uifEyEoCI5iSNr
 0Nj4Fw/cwy6T2AiZQquFgMwT0Njb2gHvfsvcBfJewxzvoCzKsAyi+RGYCGtt4NeLQp
 qMJCwRtIyf+pkEukJoajwlc/e+WpuCTka26b5tNg=
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
In-Reply-To: <1697950.a32zQFXn7i@silver>
References: <20220926124207.1325763-1-git@sphalerite.org>
 <1697950.a32zQFXn7i@silver>
Date: Tue, 27 Sep 2022 15:05:13 +0200
Message-ID: <ygav8p9vugm.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=116.203.207.114; envelope-from=git@sphalerite.org;
 helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> Ah, you sent this fix as a separate patch on top. I actually just meant that 
> you would take my already queued patch as the latest version (just because I 
> had made some minor changes on my end) and adjust that patch further as v4.
>
> Anyway, there are still some things to do here, so maybe you can send your 
> patch squashed in the next round ...

I see, will do!

>> @Christian: I still haven't been able to reproduce the issue that this
>> commit is supposed to fix (I tried building KDE too, no problems), so
>> it's a bit of a shot in the dark. It certainly still runs and I think it
>> should fix the issue, but it would be great if you could test it.
>
> No worries about reproduction, I will definitely test this thoroughly. ;-)
>
>>  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++----------------
>>  1 file changed, 30 insertions(+), 16 deletions(-)
>> 
>> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>> index f4c1e37202..825c39e122 100644
>> --- a/hw/9pfs/9p.c
>> +++ b/hw/9pfs/9p.c
>> @@ -522,33 +522,47 @@ static int coroutine_fn
>> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) V9fsFidState *fidp;
>>      gpointer fid;
>>      GHashTableIter iter;
>> +    /*
>> +     * The most common case is probably that we have exactly one
>> +     * fid for the given path, so preallocate exactly one.
>> +     */
>> +    GArray *to_reopen = g_array_sized_new(FALSE, FALSE,
>> sizeof(V9fsFidState*), 1); +    gint i;
>
> Please use `g_autoptr(GArray)` instead of `GArray *`, that avoids the need for 
> explicit calls to g_array_free() below.

Good call. I'm not familiar with glib, so I didn't know about this :)

>> -            fidp->flags |= FID_NON_RECLAIMABLE;
>
> Why did you remove that? It should still be marked as FID_NON_RECLAIMABLE, no?

Indeed, that was an accident. 

>> +            /*
>> +             * Ensure the fid survives a potential clunk request during
>> +             * v9fs_reopen_fid or put_fid.
>> +             */
>> +            fidp->ref++;
>
> Hmm, bumping the refcount here makes sense, as the 2nd loop may be interrupted 
> and the fid otherwise disappear in between, but ...
>
>> +            g_array_append_val(to_reopen, fidp);
>>          }
>> +    }
>> 
>> -        /* We're done with this fid */
>> +    for (i=0; i < to_reopen->len; i++) {
>> +        fidp = g_array_index(to_reopen, V9fsFidState*, i);
>> +        /* reopen the file/dir if already closed */
>> +        err = v9fs_reopen_fid(pdu, fidp);
>> +        if (err < 0) {
>> +            put_fid(pdu, fidp);
>> +            g_array_free(to_reopen, TRUE);
>> +            return err;
>
> ... this return would then leak all remainder fids that you have bumped the 
> refcount for above already.

You're right. I think the best way around it, though it feels ugly, is
to add a third loop in an "out:".

> Also: I noticed that your changes in virtfs_reset() would need the same 2-loop 
> hack to avoid hash iterator invalidation, as it would also call put_fid() 
> inside the loop and be prone for hash iterator invalidation otherwise.

Good point. Will do.


One more thing has occurred to me. I think the reclaiming/reopening
logic will misbehave in the following sequence of events:

1. QEMU reclaims an open fid, losing the file handle
2. The file referred to by the fid is replaced with a different file
   (e.g. via rename or symlink) outside QEMU
3. The file is accessed again by the guest, causing QEMU to reopen a
   _different file_ from before without the guest having performed any
   operations that should cause this to happen.

This is neither introduced nor resolved by my changes. Am I overlooking
something that avoids this (be it documentation that directories exposed
via 9p should not be touched by the host), or is this a real issue? I'm
thinking one could at least detect it by saving inode numbers in
V9fsFidState and comparing them when reopening, but recovering from such
a situation seems difficult.

Linus

