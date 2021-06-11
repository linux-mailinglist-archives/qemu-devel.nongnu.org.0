Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311443A4490
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 17:00:54 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrieR-0001Cq-15
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 11:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrid8-0008Cv-7C
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrid4-0008GP-Bs
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623423565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8gnUv4t0d7qL3H93JKYlHNSYK7N9iPuFUdSFLwpAQhs=;
 b=ReQsBf5KaqYADibDsmUeAKaDTf4hRxUenW7w7gozcTCh9SQWhNhyiZ7xei9K9VCjcnstr2
 rm5DTHQSHMKY/l/3heWX9FcQD56mj1Y662y6Tn4kHF+PhpbUCiQF0Px2YAtiibeozSl5sv
 taPiiWoegkqhg+7lqkyk5VMTtASlscI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-csQa-RjCO0ir9z7N85a8tg-1; Fri, 11 Jun 2021 10:59:21 -0400
X-MC-Unique: csQa-RjCO0ir9z7N85a8tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F094C193F562;
 Fri, 11 Jun 2021 14:59:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56C7619C59;
 Fri, 11 Jun 2021 14:59:20 +0000 (UTC)
Date: Fri, 11 Jun 2021 09:59:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] qemu-img: Make unallocated part of backing chain
 obvious in map
Message-ID: <20210611145918.pslzaqiuxyjttcmj@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <6a0aabb6-441c-8671-fc07-a7113043ccc8@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6a0aabb6-441c-8671-fc07-a7113043ccc8@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 05:35:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > An obvious solution is to make 'qemu-img map --output=json'
> > distinguish between clusters that have a local allocation from those
> > that are found nowhere in the chain.  We already have a one-off
> > mismatch between qemu-img map and NBD qemu:allocation-depth (the
> > former chose 0, and the latter 1 for the local layer), so exposing the
> > latter's choice of 0 for unallocated in the entire chain would mean
> > using using "depth":-1 in the former, but a negative depth may confuse
> > existing tools.  But there is an easy out: for any chain of length N,
> > we can simply represent an unallocated cluster as "depth":N+1.  This
> > does have a slight risk of confusing any tool that might try to
> > dereference NULL when finding the backing image for the last file in
> > the backing chain, but that risk sseems worth the more precise output.
> > The iotests have several examples where this distinction demonstrates
> > the additional accuracy.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> > 
> > Replaces v1: 20210610213906.1313440-1-eblake@redhat.com
> > (qemu-img: Use "depth":-1 to make backing probes obvious)
> > 
> > Use N+1 instead of -1 for unallocated [Kevin]
> > 
> 
> Bit in contrast with -1, or with separate boolean flag, you lose the possibility to distinguish case when we have 3 layers and the cluster is absent in all of them, and the case when we have 4 layers and the cluster is absent in top 3 but in 4 it is qcow2 UNALLOCATED_ZERO cluster.

Using just 'qemu-img map --output-json', you only see depth numbers.
You also have to use 'qemu-img info --backing-chain' to see what file
those depth numbers correspond to, at which point it becomes obvious
whether "depth":4 meant unallocated (because the chain was length 3)
or allocated at depth 4 (because the chain was length 4 or longer).
But that's no worse than pre-patch, where you had to use qemu-img info
--backing-chain to learn which file a particular "depth" maps to.

> 
> So, if someone use this API to reconstruct the chain, then for original 3 empty layers he will create 3 empty layers and 4rd additional ZERO layer. And such reconstructed chain would not be equal to original chain (as if we take these two chains and add additional backing file as a new bottom layer, effect would be different).. I'm not sure is it a problem in the task you are solving :\

It should be fairly easy to optimize the case of a backing chain where
EVERY listed cluster at the final depth was "data":false,"zero":true
to omit that file after all.

And in oVirt's case, Nir pointed out that we have one more tool at our
disposal in recreating a backing chain: if you use
json:{"driver":"qcow2", "backing":null, ...} as your image file, you
don't have to worry about arbitrary files in the backing chain, only
about recreating the top-most layer of a chain.  And in that case, it
becomes very obvious that "depth":0 is something you must recreate,
and "depth":1 would be a non-existent backing file because you just
passed "backing":null.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


