Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7185388D2F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:46:10 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKeP-0003Vy-SK
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKco-0002gX-HR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljKch-0002CO-Ed
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621424662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JHAI1yrQucyWrsok6ylM8PFhaDwghEoz2f3TvU7iPRs=;
 b=DiAKT/IKE+B5qnljgkQ54/xGbN2D6uHDutCW1swjJmPPfXsOEp+D9bBL7Vald6czp5CNAd
 UblQc7ZPBlU9UmZfb9TW732z3j6NL6PoVG4MTN+rMMh/Pncl5NKxzJa28m/bL5MNsepvKW
 KI5HDMZHjvSNQO05CJL9LAL4+EvZ8nE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338--YSD_02wPDWLIO0FOXOEew-1; Wed, 19 May 2021 07:44:21 -0400
X-MC-Unique: -YSD_02wPDWLIO0FOXOEew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D5C101962A;
 Wed, 19 May 2021 11:44:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA295D6D5;
 Wed, 19 May 2021 11:44:17 +0000 (UTC)
Date: Wed, 19 May 2021 13:44:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: Qemu block filter insertion/removal API
Message-ID: <YKT6D1jg4gYi8nZE@merkur.fritz.box>
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-block@nongnu.org,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, armbru@redhat.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 yur@virtuozzo.com, Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.05.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> I'd like to be sure that we know where we are going to.
> 
> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
> 
> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
> 
> Still, it would be good to insert/remove filters on demand.
> 
> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
> 
> 1. filter above root node X:
> 
> inserting:
> 
>   - do blockdev-add to add a filter (and specify X as its child)
>   - do qom-set to set new filter as a rood node instead of X
> 
> removing
> 
>   - do qom-set to make X a root node again
>   - do blockdev-del to drop a filter
> 
> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
> 
> inserting
> 
>   - do blockdev-add to add a filter (and specify X as its child)
>   - do blockdev-reopen to set P.backing = filter
> 
> remvoing
> 
>   - do blockdev-reopen to set P.backing = X
>   - do blockdev-del to drop a filter
> 
> 
> And, probably we'll want transaction support for all these things.
> 
> 
> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
> 
> inserting:
>   - blockdev-add filter
>   - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
> 
> removing
>   - blockdev-replace (make all parante of filter to be parents of X instead)
>   - blockdev-del filter
> 
> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?

One reason I remember why we didn't decide to go this way in the many
"dynamic graph reconfiguration" discussions we had, is that it's not
generic enough to cover all cases. But I'm not sure if we ever
considered root nodes as a separate case. I acknowledge that having two
different interfaces is inconvenient, and integrating qom-set in a
transaction is rather unlikely to happen.

The reason why it's not generic is that it restricts you to doing the
same thing for all parents. Imagine this:

                    +- virtio-blk
                    |
    file <- qcow2 <-+
                    |
                    +- NBD export

Now you want to throttle the NBD export so that it doesn't interfere
with your VM too much. With your simple blockdev-replace this isn't
possible. You would have to add the filter to both users or to none.

In theory, blockdev-replace could take a list of the edges that should
be changed to the new node. The problem is that edges don't have names,
and even the parents don't necessarily have one (and if they do, they
are in separate namespaces, so a BlockBackend, a job and an export could
all have the same name), so finding a good way to refer to them in QMP
doesn't sound trivial.

Kevin


