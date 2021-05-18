Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6383387DED
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:53:51 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2yc-0006CQ-Dl
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj2vu-0004DJ-Nq
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj2vr-0005xP-Dr
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621356658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQGswRwxWt51vx5UQqvMgViazo3LFbiANBgR0pP24pw=;
 b=cLtoPuDmNSuyE5nn8HlLK7lRHrr5camqhJ4pq/eGpQJRPR+9tKNCjqTfvMV1Hr72EwEXOZ
 0Z3K3fqH/LdsbbCpodjLDXu29vSSQsTTIqZ9Fj9rUulvvo6jwkkBxIH2ztWrp503OJUZz/
 pPXaJg454zrUOLqcn7P/VbXZ5klkf0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-yJFOBfisNnmrffK8-eIJzg-1; Tue, 18 May 2021 12:50:55 -0400
X-MC-Unique: yJFOBfisNnmrffK8-eIJzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF97910CE788;
 Tue, 18 May 2021 16:50:40 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9457C69322;
 Tue, 18 May 2021 16:49:58 +0000 (UTC)
Subject: Re: Qemu block filter insertion/removal API
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0f0ede72-5b40-4896-a9c4-488b31e74d5f@redhat.com>
Date: Tue, 18 May 2021 18:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, yur@virtuozzo.com,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 14:44, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> I'd like to be sure that we know where we are going to.
> 
> In blockdev-era where qemu user is aware about block nodes, all nodes 
> have good names and controlled by user we can efficiently use block 
> filters.
> 
> We already have some useful filters: copy-on-read, throttling, compress. 
> In my parallel series I make backup-top filter public and useful without 
> backup block jobs. But now filters could be inserted only together with 
> opening their child. We can specify filters in qemu cmdline, or filter 
> can take place in the block node chain created by blockdev-add.
> 
> Still, it would be good to insert/remove filters on demand.
> 
> Currently we are going to use x-blockdev-reopen for this. Still it can't 
> be used to insert a filter above root node (as x-blockdev-reopen can 
> change only block node options and their children). In my series "[PATCH 
> 00/21] block: publish backup-top filter" I propose (as Kevin suggested) 
> to modify qom-set, so that it can set drive option of running device. 
> That's not difficult, but it means that we have different scenario of 
> inserting/removing filters:
> 
> 1. filter above root node X:
> 
> inserting:
> 
>    - do blockdev-add to add a filter (and specify X as its child)
>    - do qom-set to set new filter as a rood node instead of X
> 
> removing
> 
>    - do qom-set to make X a root node again
>    - do blockdev-del to drop a filter
> 
> 2. filter between two block nodes P and X. (For example, X is a backing 
> child of P)
> 
> inserting
> 
>    - do blockdev-add to add a filter (and specify X as its child)
>    - do blockdev-reopen to set P.backing = filter
> 
> remvoing
> 
>    - do blockdev-reopen to set P.backing = X
>    - do blockdev-del to drop a filter
> 
> 
> And, probably we'll want transaction support for all these things.
> 
> 
> Is it OK? Or do we need some kind of additional blockdev-replace 
> command, that can replace one node by another, so in both cases we will do
> 
> inserting:
> 
>    - blockdev-add filter
>    - blockdev-replace (make all parents of X to point to the new filter 
> instead (except for the filter itself of course)
> 
> removing
>    - blockdev-replace (make all parante of filter to be parents of X 
> instead)
>    - blockdev-del filter
> 
> 
> It's simple to implement, and it seems for me that it is simpler to use. 
> Any thoughts?

I’m afraid as a non-user of the blockdev interface, I can’t give a 
valuable opinion that would have some actual weight.

Doesn’t stop me from giving my personal and potentially invaluable 
opinion, though, obviously:

I think we expect all users to know the block graph, so they should be 
able to distinguish between cases 1 and 2.  However, I can imagine 
having to distinguish still is kind of a pain, especially if it were 
trivial for qemu to let the user not having to worry about it at all.

Also, if you want a filter unconditionally above some node, all the 
qom-set and blockdev-reopen operations for all of the original node’s 
parents would need to happen atomically.  As you say, those operations 
should perhaps be transactionable anyway, but...  Implementing 
blockdev-replace would provide this for much less cost now, I suppose?

I guess it can be argued that the downside is that having 
blockdev-replace means less pressure to make qom-set for drive and 
blockdev-reopen transactionable.

But well.  I don’t really have anything against a blockdev-replace, but 
again, I don’t know whether my opinion on this topic really has weight.

Max


