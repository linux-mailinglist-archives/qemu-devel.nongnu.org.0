Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054D3228EA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:37:22 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEV4D-0000ys-6a
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEV2g-0000Rl-61
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEV2e-00075h-H7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614076543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DoaDdjDrc2x23Lu682aneJcNPUu30Zku365gQI9nOs4=;
 b=WWHGgU1FGAgPlGavlKXXSS2GV+APRBY6Sv1WA8qU/IyoD1QzhCWfeLsT06EdOJWJzZ1tr7
 RjxN/1Ngms97Cb5t/WtiMIYTtRohNSMIoF8SqVabEeWIhM9Uylqo76inMIHL3E+SLNHZzX
 7tgLZt8ETgAdDcwKa9c5dIxQwN/4S+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-tD4y324ZPAep3BmlJzcgaA-1; Tue, 23 Feb 2021 05:35:39 -0500
X-MC-Unique: tD4y324ZPAep3BmlJzcgaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70CEC801979;
 Tue, 23 Feb 2021 10:35:38 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-233.ams2.redhat.com [10.36.113.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 014DA5F706;
 Tue, 23 Feb 2021 10:35:35 +0000 (UTC)
Date: Tue, 23 Feb 2021 11:35:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: What prevents discarding a cluster during rewrite?
Message-ID: <20210223103534.GD5083@merkur.fritz.box>
References: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
 <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Denis V. Lunev" <den@openvz.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.02.2021 um 22:42 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 23.02.2021 00:30, Vladimir Sementsov-Ogievskiy wrote:
> > Thinking of how to prevent dereferencing to zero (and discard) of
> > host cluster during flush of compressed cache (which I'm working on
> > now), I have a question.. What prevents it for normal writes?
> 
> I have no idea about why didn't it fail for years.. May be, I'm
> missing something?

Ouch. I suppose the reason why we never ran into it is that afaik Linux
drains the queue before sending discard requests.

Of course, we still need to protect against this in QEMU. We can't just
unref a cluster that is still in use.

> I have idea of fixing: increase the refcount of host cluster before
> write to data_file (it's important to increase refacount in same
> s->lock critical section where we get host_offset) and dereference it
> after write.. It should help. Any thoughts?

It would cause metadata updates for rewrites. I don't know whether the
intermediate value would ever be written to disk, but at least we'd
rewrite the same refcounts as before. I don't think we want that.

Discard requests might be rare enough that not considering the cluster
at all could work. We could then take a reader CoRwlock during most
operations, and a writer lock for discard.

Actually, maybe s->lock should be this CoRwlock, and instead of dropping
it temporarily like we do now we would just upgrade and downgrade it as
needed. Maybe this would allow finer grained locking in other places,
too.

Kevin


