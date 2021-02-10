Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232133166DD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:37:31 +0100 (CET)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9okM-0006ek-79
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9oii-00068b-13
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9oig-00056H-Cs
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612960545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2WhpTZgoox3BEPk3r6W9WX2ikl5rnOu8vaMnfxjrhI=;
 b=F41uWFk6n8jslyPM1UhQaCv6V+CbX/WhiEXrNLnrjwJ9zb1AXFFLNZQD/JyRmQ8u8qYfA8
 2PPq6erO0NchJUK2Mi1sTkGJWzJCDz0RQPWRYrkeMXlI2z2TaD6yEuqGxAGpYV5He+jiZX
 V/gRRgZSp7rG+/Or7qXaw3UyOdOrTDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-T-QdXabUPKyq9VzfLQlt4w-1; Wed, 10 Feb 2021 07:35:43 -0500
X-MC-Unique: T-QdXabUPKyq9VzfLQlt4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ADC31934101;
 Wed, 10 Feb 2021 12:35:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 953645D6B1;
 Wed, 10 Feb 2021 12:35:40 +0000 (UTC)
Date: Wed, 10 Feb 2021 13:35:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
Message-ID: <20210210123538.GB5144@merkur.fritz.box>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.01.2021 um 17:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> I know, I have several series waiting for a resend, but I had to switch
> to another task spawned from our customer's bug.
> 
> Original problem: we use O_DIRECT for all vm images in our product, it's
> the policy. The only exclusion is backup target qcow2 image for
> compressed backup, because compressed backup is extremely slow with
> O_DIRECT (due to unaligned writes). Customer complains that backup
> produces a lot of pagecache.
> 
> So we can either implement some internal cache or use fadvise somehow.
> Backup has several async workes, which writes simultaneously, so in both
> ways we have to track host cluster filling (before dropping the cache
> corresponding to the cluster).  So, if we have to track anyway, let's
> try to implement the cache.
> 
> Idea is simple: cache small unaligned write and flush the cluster when
> filled.

I haven't had the time to properly look at the patches, but is there
anything in it that is actually specific to compressed writes?

I'm asking because you may remember that a few years ago I talked at KVM
Forum about how a data cache could be used for small unaligned (to
cluster sizes) writes to reduce COW cost (mostly for sequential access
where the other part of the cluster would be filled soon enough).

So if we're introducing some kind of data cache, wouldn't it be nice to
use it even in the more general case instead of just restricting it to
compression?

Kevin


