Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE93B1E45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:06:26 +0200 (CEST)
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5OT-00084m-MW
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lw5Mf-0006L1-5v
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lw5Mc-00028L-Ip
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624464269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EpSxC+CndInHDBAYPqZP2Yhz+WwImHtCn1fIgoZQIyI=;
 b=U9xwHnVM6Mpb+AnwwnecHWk/KwDpVo1OmuO+In2LErBmNH2An3b1xie9CzeqwxG0ABaXvP
 pbdLL7ohFwx4/7X2mahfwOAt3VjyLlvKnc7Ia7Sk1xWReOLGv6w39A9m6LWz7cYHtbWpKf
 QLPfc0rolvEAi/dprtkyBMpQNNmprx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-68sKdNrNNKKMBPdHHOaohw-1; Wed, 23 Jun 2021 12:04:26 -0400
X-MC-Unique: 68sKdNrNNKKMBPdHHOaohw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3787CC73A2;
 Wed, 23 Jun 2021 16:04:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CFF910372C0;
 Wed, 23 Jun 2021 16:04:21 +0000 (UTC)
Date: Wed, 23 Jun 2021 18:04:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
Message-ID: <YNNbg6jU2dD8VNiU@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
 <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 23.06.2021 um 15:58 hat Nir Soffer geschrieben:
> On Wed, Jun 23, 2021 at 11:58 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 22.06.2021 um 18:56 hat Nir Soffer geschrieben:
> > > On Tue, Jun 22, 2021 at 6:38 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > > >
> > > > Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
> > > > > To save the user from having to check 'qemu-img info --backing-chain'
> > > > > or other followup command to determine which "depth":n goes beyond the
> > > > > chain, add a boolean field "backing" that is set only for unallocated
> > > > > portions of the disk.
> > > > >
> > > > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > > > ---
> > > > >
> > > > > Touches the same iotest output as 1/1.  If we decide that switching to
> > > > > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > > > > while keeping "depth":n is good enough, then we'd have just one patch,
> > > > > instead of this double churn.  Preferences?
> > > >
> > > > I think the additional flag is better because it's guaranteed to be
> > > > backwards compatible, and because you don't need to know the number of
> > > > layers to infer whether a cluster was allocated in the whole backing
> > > > chain. And by exposing ALLOCATED we definitely give access to the whole
> > > > information that exists in QEMU.
> > > >
> > > > However, to continue with the bike shedding: I won't insist on
> > > > "allocated" even if that is what the flag is called internally and
> > > > consistency is usually helpful, but "backing" is misleading, too,
> > > > because intuitively it doesn't cover the top layer or standalone images
> > > > without a backing file. How about something like "present"?
> > >
> > > Looks hard to document:
> > >
> > > # @present: if present and false, the range is not allocated within the
> > > #           backing chain (since 6.1)
> >
> > I'm not sure why you would document it with a double negative.
> >
> > > And is not consistent with "offset". It would work better as:
> > >
> > > # @present: if present, the range is allocated within the backing
> > > #           chain (since 6.1)
> >
> > Completely ignoring the value? I would have documented it like this, but
> > with "if true..." instead of "if present...".
> 
> This is fine, but it means that this flag will present in all ranges,
> instead of only in unallocated ranges (what this patch is doing).

An argument for always having the flag would be that it's probably
useful for a tool to know whether a given block is actually absent or
whether it's just running an old qemu-img.

If we didn't care about this, I would still define the actual value, but
also document a default.

Kevin


