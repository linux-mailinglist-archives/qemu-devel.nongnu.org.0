Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4B3AECD5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:53:13 +0200 (CEST)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMEa-0001U4-KB
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvMD7-0008Ra-0G
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvMD3-0001QR-St
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624290697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqBjqLdiGfz3tiBL7Pi4hPt4scw7MMqE+DwkfNY7NXY=;
 b=KEbcLXuqlLhc86ze/Yby0ZFvxPft4jEn32JtjWy1CWArvzjsLYMCihLfqUATxx+oSZKhrP
 Wsk6wiQShq49ii4IziFZfSZ//ONVysKD4jzWuvfpWNhlcAOEmopz7ov/wGRAx24D/ew6aC
 xi++AnYsr//QUkGdqh+tniQstPzQOus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Id3KUEwONCO62z2cSEeMjA-1; Mon, 21 Jun 2021 11:51:35 -0400
X-MC-Unique: Id3KUEwONCO62z2cSEeMjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04187100C660
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 15:51:35 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-230.rdu2.redhat.com [10.10.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6380A60871;
 Mon, 21 Jun 2021 15:51:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E7E7922054F; Mon, 21 Jun 2021 11:51:30 -0400 (EDT)
Date: Mon, 21 Jun 2021 11:51:30 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
Message-ID: <20210621155130.GB1394463@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
 <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
 <20210618182901.GB1252241@redhat.com>
 <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Mon, Jun 21, 2021 at 11:02:16AM +0200, Max Reitz wrote:
> On 18.06.21 20:29, Vivek Goyal wrote:
> > On Fri, Jun 18, 2021 at 10:28:38AM +0200, Max Reitz wrote:
> > > On 17.06.21 23:21, Vivek Goyal wrote:
> > > > On Wed, Jun 16, 2021 at 03:38:13PM +0200, Max Reitz wrote:
> > > > > On 11.06.21 22:04, Vivek Goyal wrote:
> > > > > > On Wed, Jun 09, 2021 at 05:55:49PM +0200, Max Reitz wrote:
> > > > > > > Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
> > > > > > > FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
> > > > > > > its inode ID will remain in use until we drop our lo_inode (and
> > > > > > > lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
> > > > > > > the inode ID as an lo_inode key, because any inode with an inode ID we
> > > > > > > find in lo_data.inodes (on the same filesystem) must be the exact same
> > > > > > > file.
> > > > > > > 
> > > > > > > This will change when we start setting lo_inode.fhandle so we do not
> > > > > > > have to keep an O_PATH FD open.  Then, unlinking such an inode will
> > > > > > > immediately remove it, so its ID can then be reused by newly created
> > > > > > > files, even while the lo_inode object is still there[1].
> > > > > > > 
> > > > > > > So creating a new file can then reuse the old file's inode ID, and
> > > > > > > looking up the new file would lead to us finding the old file's
> > > > > > > lo_inode, which is not ideal.
> > > > > > > 
> > > > > > > Luckily, just as file handles cause this problem, they also solve it:  A
> > > > > > > file handle contains a generation ID, which changes when an inode ID is
> > > > > > > reused, so the new file can be distinguished from the old one.  So all
> > > > > > > we need to do is to add a second map besides lo_data.inodes that maps
> > > > > > > file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
> > > > > > > clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
> > > > > > > 
> > > > > > > Unfortunately, we cannot rely on being able to generate file handles
> > > > > > > every time.
> > > > > > Hi Max,
> > > > > > 
> > > > > > What are the cases where we can not rely being able to generate file
> > > > > > handles?
> > > > > I have no idea, but it’s much easier to claim we can’t than to prove that we
> > > > > can. I’d rather be resilient.
> > > > Assuming that we can not genererate file handles all the time and hence
> > > > mainitaing another inode cache seems little problematic to me.
> > > How so?
> > It is extra complexity. Need to worry about one more hash table. Sure,
> > I give it to you that we are not creating two copies of inodes. Same
> > inode object is being added to two different hash tables and is being
> > looked up using two different keys.
> > 
> > > > I would rather start with that we can generate file handles and have
> > > > a single inode cache.
> > > The assumption that we can generate file handles all the time is a much
> > > stronger one (and one which needs to be proven) than assuming that failure
> > > is possible.
> > So if temporary failures can happen (like -ENOMEM, as you mentioned),
> > these can happen with openat() too. And in that case we return error
> > to caller. So why to try to hide temporary failures from
> > name_to_handle_at().
> 
> Well, for openat() we don’t have a choice, if that fails, there is no
> fallback, so we must return an error.  For name_to_handle_at(), there is a
> fallback.
> 
> > I am still reading your code and trying to understand it. But one
> > question came to mind. What happens if we can generate file handle
> > during lookup. But can't generate when same file is looked up again.
> > 
> > - A file foo.txt is looked. We can create file handle and we add it
> >    to lo->inodes_by_handle as well as lo->inodes_by_ds.
> > 
> > - Say somebody deleted file and created again and inode number got
> >    reused.
> > 
> > - Now during ->revalidation path, lookup happens again. This time say
> >    we can't generate file handle. If am reading lo_do_find() code
> >    correctly, it will find the old inode using ids and return same
> >    inode as result of lookup. And we did not recognize that inode
> >    number has been reused.
> 
> Oh, that’s a good point.  If an lo_inode has no O_PATH fd but is only
> addressed by handle, we must always look it up by handle.
> 
> > And issues might arise if we could not generate file handle in first
> > lookup but could generate in second.
> > 
> > - A file foo.txt is lookedup. We can not create file handle and we add it
> >    to lo->inodes_by_ids.
> > 
> > - Say somebody deleted file and created again and inode number got
> >    reused.
> 
> This is not possible, because if we could not generate a file handle on the
> first lookup, the lo_inode will have an O_PATH fd attached to it, so the
> inode number cannot be reused while the lo_inode still exists.
> 
> > - Now during ->revalidation path, lookup happens again. This time say
> >    we can generate file handle. If am reading lo_do_find() code
> >    correctly, it will find the old inode using ids and return same
> >    inode as result of lookup. And we did not recognize that inode
> >    number has been reused.
> > 
> > IOW, because we could not generate the file handle, we lost the
> > ability to recognize that inode number has been reused. That means
> > either we don't switch to using file handles or if we do switch,
> > it is important that we can generate file handle to differentiate
> > whether inode number has been used or not. If not, return error to
> > caller. Caller probably will mark inode bad and let and do a lookup
> > again.
> > 
> > > Also, it is still a single inode cache. I'm just adding a third key. (The
> > > two existing keys are lo_key (through lo->inodes) and fuse_ino_t (through
> > > lo->ino_map).)
> > > 
> > > > > > > Therefore, we still enter every lo_inode object into
> > > > > > > inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
> > > > > > > potential inodes_by_handle entry then has precedence, the inodes_by_ids
> > > > > > > entry is just a fallback.
> > > > > > If we have to keep inodes_by_ids around, then can we just add fhandle
> > > > > > to the lo_key. That way we can manage with single hash table and still
> > > > > > be able to detect if inode ID has been reused.
> > > > > We cannot, because I assume we cannot rely on name_to_handle_at() working
> > > > > every time.
> > > > I guess either we need concrete information that we can't generate
> > > > file handle every time or we should assume we can until we are proven
> > > > wrong. And then fix it accordingly, IMHO.
> > > I don’t know why we need this other than because it would simplify the code.
> > > 
> > > Under the assumption that for a specific file we can either generate file
> > > handles all the time or never, the code as it is will behave correct. It’s
> > > just a bit more complicated than it would need to be, but I don’t find the
> > > diffstat of +64/-16 to be indicative of something that’s really bad.
> > > 
> > > > > Therefore, maybe at one point we can generate a file handle, and
> > > > > at another, we cannot – we should still be able to look up the inode
> > > > > regardless.
> > > > > 
> > > > > If the file handle were part of inodes_by_ids, then we can look up inodes
> > > > > only if we can generate a file handle either every time (for a given inode)
> > > > > or never.
> > > > Right. And is there a reason to belive that for the same file we can
> > > > sometimes generate file handles and other times not.
> > > Looking into name_to_handle_at()’s man page, there is no error listed that I
> > > could imagine happening only sometimes. But it doesn’t give an explicit
> > > guarantee that it will either always succeed or fail for a given inode.
> > > 
> > > Looking into the kernel, I can see that most filesystems only fail
> > > .encode_fh() if the buffer is too small. Overlayfs can also fail with ENOMEM
> > > (which will be translated to EOVERFLOW along the way, so so much for
> > > name_to_handle_at()’s list of error conditions), and EIO on conditions I
> > > don’t understand well enough (again, will become EOVERFLOW for the user).
> > > 
> > > You’re probably right that at least in practice we don’t need to accommodate
> > > for name_to_handle_at() sometimes working for some inode and sometimes not.
> > What am I not able to understand is that why we can't return error if
> > we run into a temporary issue and can't generate file handle. What's
> > that requirement that we need to hide the error and try to cover it
> > up by some other means.
> 
> There is no requirement, it’s just that we need to hide ENOTSUPP errors
> anyway (because e.g. some submounted filesystem may not support file
> handles), so I considered hiding temporary errors

ENOTSUPP is not a temporary error I guess. But this is a good point that
if host filesystem does not support file handles, should we return
error so that user is forced to remove "-o inode_file_handles" option.

I can see multiple modes and they all seem to be useful in different
scenarios.

A. Do not use file handles at all.

B. Use file handles if filesystem supports it. Also this could do some
   kind of mix and matching so that some inodes use file handles while
   others use fd. We could think of implementing some threshold and
   if open fds go above this threshold, switch to file handle stuff.

C. Strictly use file handles otherwise return error to caller.

One possibility is that we implement two options inode_file_handles
and no_inode_file_handles.

- User specified -o no_inode_file_handles, implement A.
- User specified -o inode_file_handles, implement C.
- User did not specify anything, then use file handles opportunistically
  as seen fit by daemon. This provides us the maximum flexibility and
  this practically implements option B.

IOW, if user did not specify anything, then we can think of implementing
file handles by default and fallback to using O_PATH fds if filesystem
does not support file handles (ENOTSUPP). But if user did specify
"-o no_inode_file_handles" or "-o inode_file_handles", this kind
of points to strictly implementing respective policy, IMHO. That's how
I have implemented some other options.

Alternatively, we could think of adding one more option say
"inode_file_handles_only.

- "-o no_inode_files_handles" implements A.
- "-o inode_files_handles" implements B.
- "-o inode_files_handles_only" implements C.
- If user did not specify anything on command line, then its up to the
  daemon whatever default policy it wants and default can change
  over time.

> not to really add
> complexity.  (Which is true, as can be seen from the diff stat I posted
> below: Dropping the second hash table and making the handle part of lo_key,
> so that temporary errors are now fatal, generates a diff of +37/-66, where
> -20 are just two comments (which realistically I’d need to replace by
> different comments), so in terms of code, it’s +37/-46.)
> 
> I’d just rather handle errors gracefully when I find it doesn’t really cost
> complexity.
> 
> 
> However, you made a good point in that we must require name_to_handle_at()
> to work if it worked before for some inode, not because it would be simpler,
> but because it would be wrong otherwise.
> 
> As for the other way around...  Well, now I don’t have a strong opinion on
> it.  Handling temporary name_to_handle_at() failure after it worked the
> first time should not add extra complexity, but it wouldn’t be symmetric. 
> Like, allowing temporary failure sometimes but not at other times.

Right. If we decided that we need to generate file handle for an inode
and underlying filesystem supports file handles, then handling temporary
failures only sometimes will make it assymetric. At this point of time
I am more inclined to return error to caller on temporary failures. But
if this does not work well in practice, I am open to change the policy.

> 
> The next question is, how do we detect temporary failure, because if we look
> up some new inode, name_to_handle_at() fails, we ignore it, and then it
> starts to work and we fail all further lookups, that’s not good.  We should
> have the first lookup fail.  I suppose ENOTSUPP means “OK to ignore”, and
> for everything else we should let lookup fail?

ENOTSUPP will be a permanent failure right? And not a temporary one.

It seems reasonable that we gracefully fall back to O_PATH fd in case
of ENOTSUPP (Assuming -o inode_file_handles means try to use file
handles and fallback to O_PATH fds if host filesystem does not 
support it).

But for temporary failures we probably will have to return errors to callers.
Do you have a specific temporary failure in mind which you are concerned
about.

> (And that pretty much
> answers my "what if name_to_handle_at() works the first time, but then
> fails" question.  If we let anything but ENOTSUPP let the lookup fail, then
> we should do so every time.)

Agreed. ENOTSUPP seems to be the only error when falling back to O_PATH
fd makes most sense to me. Rest of them probably should be propagated
to caller.

And given ENOTSUPP is a permanent failure, you probably will be able
to add fhandle to lo_key and not require a separate mapping which
looks up inode by fhandle.

Thanks
Vivek

> 
> Max
> 
> > > But I feel quite uneasy relying on this being the case, and being the case
> > > forever, when I find it quite simple to just have some added complexity to
> > > deal with it. It’s just a third key for our inode cache.
> > > 
> > > If you want to, I can write a 10/9 patch that simplifies the code under the
> > > assumption that name_to_handle_at() will either fail or not, but frankly I
> > > wouldn’t want to have my name under it. (Which is why it would be a 10/9 so
> > > I can have some explicit note that my S-o-b would be there only for legal
> > > reasons, not because this is really my patch.)
> > > 
> > > (And now I tentatively wrote such a patch (which requires patch 9 to be
> > > reverted, of course), and that gives me a diffstat of +37/-66. Basically,
> > > the difference is just having two comments removed.)
> > > 
> > > Max
> > > 
> 


