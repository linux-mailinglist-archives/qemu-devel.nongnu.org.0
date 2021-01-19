Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E182FBCCF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:47:57 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uAd-0000gb-Vg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1u1I-00015U-5x
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1u1G-0007tv-Iy
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GhwcoiI9boWKT9YeHMziv/oTZ+y5h4nKr8kDrg+yisM=;
 b=W+YfbEiA/IqVMKJ4nw3Tdt0sTb0CkGEETv2vS1xRvTK7WCWCJ4JLDdFbDn/LcD45PT3ctP
 xj5Ds5khTt7wl4R8iPWI3p/4uEG+hmVXbI/h16yGqSp86t3FK2OUVRXExn0ubOwXgwBcvI
 8p4z/MfiumUKvuUv+fS+/HAFHU6C9Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-0321piYKNVyzHQKGU_k8Hw-1; Tue, 19 Jan 2021 11:38:09 -0500
X-MC-Unique: 0321piYKNVyzHQKGU_k8Hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE6DD8066E9;
 Tue, 19 Jan 2021 16:38:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-149.ams2.redhat.com [10.36.115.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AACB5D9F8;
 Tue, 19 Jan 2021 16:38:06 +0000 (UTC)
Date: Tue, 19 Jan 2021 17:38:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 06/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
Message-ID: <20210119163805.GI5012@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-7-vsementsov@virtuozzo.com>
 <20210118151336.GG11555@merkur.fritz.box>
 <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.01.2021 um 18:36 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 18.01.2021 18:13, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Add new handler to get aio context and implement it in all child
> > > classes. Add corresponding public interface to be used soon.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > 
> > Hm, are you going to introduce cases where parent and child context
> > don't match, or why is this a useful function?
> > 
> > Even if so, I feel it shouldn't be any of the child's business what
> > AioContext the parent uses.
> > 
> > Well, maybe the rest of the series will answer this.
> 
> It's for the following patch, to not pass parent (as opaque) with it's
> class, and with its ctx in separate. Just to simplify the interface of
> the function, we are going to work with a lot.

In a way, the result is nicer because we already assume that ctx is the
parent context when we move things to different AioContexts. So it's
more consistent to just directly take it from the parent.

At the same time, it also complicates things a bit because now we need a
defined state in the middle of an operation that adds, removes or
replaces a child.

I guess I still to make more progress in the review of this series until
I see how you're using the interface.

> Hm. I'll take this opportunity to say, that the terminology that calls
> graph edge "BdrvChild" always leads to the mess between parents and
> children.. "child_class" is a class of parent.. list of parents is
> list of children... It all would be a lot simpler to understand if
> BdrvChild was BdrvEdge or something like this.

Yeah, that would probably be clearer now that we actually use it to
work with both ends of the edge. And BdrvNode instead of
BlockDriverState, I guess.

Kevin


