Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A253B165F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:00:41 +0200 (CEST)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvykS-0006V7-UP
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvyhx-0004Kp-Ss
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvyhv-0005up-AT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624438682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YCokCUFuLoE+0MlWFXfH92Hrll5te9LlYq7rCVIrqmc=;
 b=AaVWwwv4ou6wwbwkZNDDHEIGgsOra6i56X6hQ9UtkZvlWrtHLYHZyYjYDv9CVFPRN4H7FK
 U9Jpfs1t2XisDhQgVJYxNQzjZ2k+IrISalvd1piaXtNCgIkT1DcbcxxvMLvf1yHSSQ4gIl
 wCxY8ydhhcIGbn6cLRKCvzQWEvqi0Kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-P4LjkZt4NNGhF8CYHo9U2A-1; Wed, 23 Jun 2021 04:57:58 -0400
X-MC-Unique: P4LjkZt4NNGhF8CYHo9U2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 954F944803;
 Wed, 23 Jun 2021 08:57:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 144B619C66;
 Wed, 23 Jun 2021 08:57:55 +0000 (UTC)
Date: Wed, 23 Jun 2021 10:57:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
Message-ID: <YNL3kpqnhi15glTC@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.06.2021 um 18:56 hat Nir Soffer geschrieben:
> On Tue, Jun 22, 2021 at 6:38 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
> > > To save the user from having to check 'qemu-img info --backing-chain'
> > > or other followup command to determine which "depth":n goes beyond the
> > > chain, add a boolean field "backing" that is set only for unallocated
> > > portions of the disk.
> > >
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > ---
> > >
> > > Touches the same iotest output as 1/1.  If we decide that switching to
> > > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > > while keeping "depth":n is good enough, then we'd have just one patch,
> > > instead of this double churn.  Preferences?
> >
> > I think the additional flag is better because it's guaranteed to be
> > backwards compatible, and because you don't need to know the number of
> > layers to infer whether a cluster was allocated in the whole backing
> > chain. And by exposing ALLOCATED we definitely give access to the whole
> > information that exists in QEMU.
> >
> > However, to continue with the bike shedding: I won't insist on
> > "allocated" even if that is what the flag is called internally and
> > consistency is usually helpful, but "backing" is misleading, too,
> > because intuitively it doesn't cover the top layer or standalone images
> > without a backing file. How about something like "present"?
> 
> Looks hard to document:
> 
> # @present: if present and false, the range is not allocated within the
> #           backing chain (since 6.1)

I'm not sure why you would document it with a double negative.

> And is not consistent with "offset". It would work better as:
> 
> # @present: if present, the range is allocated within the backing
> #           chain (since 6.1)

Completely ignoring the value? I would have documented it like this, but
with "if true..." instead of "if present...".

> Or:
> 
> # @absent: if present, the range is not allocated within the backing
> #           chain (since 6.1)

This is possible, too, but generally positive flags are preferable to
negative ones, and the internal one is already positive.

> This is used by libnbd now:
> https://github.com/libguestfs/libnbd/commit/1d01d2ac4f6443b160b7d81119d555e1aaedb56d
> 
> But I'm fine with "backing", It is consistent with BLK_BACKING_FILE,
> meaning this area exposes data from a backing file (if one exists).
> 
> We use "backing" internally to be consistent with future qemu-img.

I just realised that I actually misunderstood "backing" to mean the
opposite of what it is in this patch!

It really means "the data comes from some imaginary additional backing
file that doesn't exist in the backing chain", while I understood it as
"something in the (real) backing chain contains the data".

"present" or "absent" should be much less prone to such
misunderstandings.

Kevin


