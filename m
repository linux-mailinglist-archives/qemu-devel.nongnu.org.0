Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61503AF760
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:29:10 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvRTh-0005jT-Fx
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvRSP-0004XV-L1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 17:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvRSK-0002dU-F3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 17:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624310862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phsnxhoHPpNeJwyWy5NgPw+8nCgkvhrnm3EV05c2VOg=;
 b=X95+POm1bNFk4DsMQmwULCuaok/sAgpxS73ItmmqU0SSMg7kmmFyEtFgvubFYXVHKT4aBn
 mFuQLIV0dDBMDvQ7H6y8tjqIlQD8ZTMWUvkQ0yzjF4wmNGiZ/y4C0+P4NBf5Q48WWeBBfc
 gvjzJPauME76In4Sxwg+I5/ECrbK34I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ojqxLBO4MACThTpAyVK49g-1; Mon, 21 Jun 2021 17:27:41 -0400
X-MC-Unique: ojqxLBO4MACThTpAyVK49g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5DD2100B3AC
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 21:27:39 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-230.rdu2.redhat.com [10.10.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A6DD19C79;
 Mon, 21 Jun 2021 21:27:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 085AD22054F; Mon, 21 Jun 2021 17:27:36 -0400 (EDT)
Date: Mon, 21 Jun 2021 17:27:35 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
Message-ID: <20210621212735.GD1394463@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
 <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
 <20210618182901.GB1252241@redhat.com>
 <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
 <20210621155130.GB1394463@redhat.com>
 <263469d1-7347-dcc1-3cc9-eb873c0c1d48@redhat.com>
MIME-Version: 1.0
In-Reply-To: <263469d1-7347-dcc1-3cc9-eb873c0c1d48@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 07:07:19PM +0200, Max Reitz wrote:
> On 21.06.21 17:51, Vivek Goyal wrote:
> > On Mon, Jun 21, 2021 at 11:02:16AM +0200, Max Reitz wrote:
> > > On 18.06.21 20:29, Vivek Goyal wrote:
> 
> [snip]
> 
> > > > What am I not able to understand is that why we can't return error if
> > > > we run into a temporary issue and can't generate file handle. What's
> > > > that requirement that we need to hide the error and try to cover it
> > > > up by some other means.
> > > There is no requirement, it’s just that we need to hide ENOTSUPP errors
> > > anyway (because e.g. some submounted filesystem may not support file
> > > handles), so I considered hiding temporary errors
> > ENOTSUPP is not a temporary error I guess. But this is a good point that
> > if host filesystem does not support file handles, should we return
> > error so that user is forced to remove "-o inode_file_handles" option.
> > 
> > I can see multiple modes and they all seem to be useful in different
> > scenarios.
> > 
> > A. Do not use file handles at all.
> > 
> > B. Use file handles if filesystem supports it. Also this could do some
> >     kind of mix and matching so that some inodes use file handles while
> >     others use fd. We could think of implementing some threshold and
> >     if open fds go above this threshold, switch to file handle stuff.
> > 
> > C. Strictly use file handles otherwise return error to caller.
> > 
> > One possibility is that we implement two options inode_file_handles
> > and no_inode_file_handles.
> > 
> > - User specified -o no_inode_file_handles, implement A.
> > - User specified -o inode_file_handles, implement C.
> > - User did not specify anything, then use file handles opportunistically
> >    as seen fit by daemon. This provides us the maximum flexibility and
> >    this practically implements option B.
> > 
> > IOW, if user did not specify anything, then we can think of implementing
> > file handles by default and fallback to using O_PATH fds if filesystem
> > does not support file handles (ENOTSUPP). But if user did specify
> > "-o no_inode_file_handles" or "-o inode_file_handles", this kind
> > of points to strictly implementing respective policy, IMHO. That's how
> > I have implemented some other options.
> > 
> > Alternatively, we could think of adding one more option say
> > "inode_file_handles_only.
> > 
> > - "-o no_inode_files_handles" implements A.
> > - "-o inode_files_handles" implements B.
> > - "-o inode_files_handles_only" implements C.
> > - If user did not specify anything on command line, then its up to the
> >    daemon whatever default policy it wants and default can change
> >    over time.
> 
> I think it makes sense not to punish the user for wanting to use file
> handles as much as possible and still gracefully handling submounts that
> don’t support them.  So I’d want to implement B first, and have that be -o
> inode_files_handles.

Agreed. B probably will be most common.

> I think A as -o no_inode_file_handles is also there,
> automatically...?

I do see you have added it.

    { "inode_file_handles", offsetof(struct lo_data, inode_file_handles), 1 },
    { "no_inode_file_handles",
      offsetof(struct lo_data, inode_file_handles),
      0 },

> 
> I don’t think there’s much of a problem with implementing C, except we
> probably want to log ENOTSUPP errors then, so the user can figure out what’s
> going on.  I feel like we can still wait with such an option until there’s a
> demand for it.

Agreed.

> 
> (Except that perhaps the demand would come in the form of “please help I use
> -o inode_file_handles but virtiofsd’s FD count is still too high I don’t
> know what to do”, and that probably wouldn’t be so great.  But then again,
> inodes_files_handles_only wouldn’t help a user in that case either, because
> it changes “works badly” to “doesn’t work at all”.

May be we should log it. Will be good if some of the Info logs go into
syslogs and users can look at it.

> Now I’m wondering what
> the actual use case of inodes_files_handles_only would be.)

I was thinking more of debugging use cases. (Assuming, "-o
inode_file_handles" can take liberties and use O_PATH fd for some inodes
and file handle for other inodes). For example, determining what's the
overhead of using file handles. In that case I will like to make sure
O_PATH fds are not being used.

But we don't need it now. We can add it when we need it later.

> 
> > > not to really add
> > > complexity.  (Which is true, as can be seen from the diff stat I posted
> > > below: Dropping the second hash table and making the handle part of lo_key,
> > > so that temporary errors are now fatal, generates a diff of +37/-66, where
> > > -20 are just two comments (which realistically I’d need to replace by
> > > different comments), so in terms of code, it’s +37/-46.)
> > > 
> > > I’d just rather handle errors gracefully when I find it doesn’t really cost
> > > complexity.
> > > 
> > > 
> > > However, you made a good point in that we must require name_to_handle_at()
> > > to work if it worked before for some inode, not because it would be simpler,
> > > but because it would be wrong otherwise.
> > > 
> > > As for the other way around...  Well, now I don’t have a strong opinion on
> > > it.  Handling temporary name_to_handle_at() failure after it worked the
> > > first time should not add extra complexity, but it wouldn’t be symmetric.
> > > Like, allowing temporary failure sometimes but not at other times.
> > Right. If we decided that we need to generate file handle for an inode
> > and underlying filesystem supports file handles, then handling temporary
> > failures only sometimes will make it assymetric. At this point of time
> > I am more inclined to return error to caller on temporary failures. But
> > if this does not work well in practice, I am open to change the policy.
> > 
> > > The next question is, how do we detect temporary failure, because if we look
> > > up some new inode, name_to_handle_at() fails, we ignore it, and then it
> > > starts to work and we fail all further lookups, that’s not good.  We should
> > > have the first lookup fail.  I suppose ENOTSUPP means “OK to ignore”, and
> > > for everything else we should let lookup fail?
> > ENOTSUPP will be a permanent failure right? And not a temporary one.
> 
> I sure hope so.  The man page says “The filesystem does not support decoding
> of a pathname to a file handle.”, which sounds pretty permanent, unless
> perhaps the filesystem driver is updated in-place.
> 
> > It seems reasonable that we gracefully fall back to O_PATH fd in case
> > of ENOTSUPP (Assuming -o inode_file_handles means try to use file
> > handles and fallback to O_PATH fds if host filesystem does not
> > support it).
> > 
> > But for temporary failures we probably will have to return errors to callers.
> > Do you have a specific temporary failure in mind which you are concerned
> > about.
> 
> Oh, no.  It’s just, there can be errors other than EOPNOTSUPP (now that I
> looked into the man page I know that’s what it actually is), and we have to
> decide what to do then.  Nothing more.
> 
> > > (And that pretty much
> > > answers my "what if name_to_handle_at() works the first time, but then
> > > fails" question.  If we let anything but ENOTSUPP let the lookup fail, then
> > > we should do so every time.)
> > Agreed. ENOTSUPP seems to be the only error when falling back to O_PATH
> > fd makes most sense to me. Rest of them probably should be propagated
> > to caller.
> 
> Perhaps also EOVERFLOW, which indicates that our file handle storage is too
> small.  This shouldn’t happen, given that we use MAX_HANDLE_SZ to size it,
> but I imagine it’s possible that MAX_HANDLE_SZ is increased in the future,
> and when you then compile virtiofsd on one system and run it on another,
> it’s possible that some filesystem driver wants to store larger handles. 
> Given that we expect a file handle to always be the same for a given inode,
> such an EOVERFLOW error should be permanent, too (for a given inode).

man page says that EOVERFLOW can also indicate that no file handle is
available.

*******
Some care  is needed here as EOVERFLOW can also indicate that no file
handle is available for this particular name in a filesystem which
does  normally  support  file-handle lookup.  This case can be detected
when the EOVERFLOW error is returned without handle_bytes being increased.
*****

> 
> > And given ENOTSUPP is a permanent failure, you probably will be able
> > to add fhandle to lo_key and not require a separate mapping which
> > looks up inode by fhandle.
> 
> Sure, but again, this doesn’t make anything simpler.
> 
> What I particularly don’t like about this is that for doing so, we have a
> choice between (A) adding fhandle to lo_key inline (i.e. of type
> lo_fhandle), or (B) adding it as a pointer (i.e. of type lo_fhandle *).
> 
> (A) seems the more obvious solution, but then lo_inode.fhandle would either
> not exist (one would have to go through lo_inode.key.fhandle, which I don’t
> really like), or be a pointer to &lo_inode.key.fhandle, which is also kind
> of weird.  Also, if there is no file handle, it would need to be explicitly
> 0, which wastes memory when not using -o inode_file_handles (and cycles,
> because hashing and comparing will take longer).
> 
> So (B) would do it the other way around, lo_inode.key.fhandle would be a
> copy of lo_inode.fhandle.  But having a pointer be part of a key is, while
> perfectly feasible, again strange.

Thinking more about it. So an inode is uniquely identified either by
lo_key1 (dev, ino, mnt_id) or lo_key2 (fhandle, mnt_id). 

Ideally we will add inodes in hash table using lo_key2 if file handles
are enabled and using lo_key1 if file handles are not enabled.

Given we support submounts and its possible that we have mix if inodes
where for some inodes we use lo_key1 while for other we use lo_key2.

But it will never happen that for same inode we keep flipping the
mode between lo_key1 and lo_key2. (We will return temporary errors
from file system).

> 
> I find two hash maps to just be cleaner.

Given an inode is supposed to be looked up either by lo_key1 or 
lo_key2 (depending on whether file system support file handles)
, I guess it makes less sense to merge two keys and come
up with single lo_key which contains everything. So I am fine
with adding another key type for fhandle and lookup in separate
hash map.

Thanks
Vivek


