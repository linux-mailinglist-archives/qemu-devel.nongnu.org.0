Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5124300155
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:19:45 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uTg-0006rI-2G
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uSh-0006Ly-O9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2uSe-0004Sg-U5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611314319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mx7C/hZH2mfJ4Ozr7WHkRbozlW6QKvVVVshHdaaJyP8=;
 b=RVYXDW6OVZw6OVghi8f1SXsLpHKlUWOW7c74Gwyq1vDZHehzr4gpkulWiWgF8Vw+Q9d3vJ
 VpssPLGbIXfjIx7n22i5vEoXaMwW1/lrWXpseyohQKPG0CFLLJfgRs50FCisCAax+DloRo
 C+An4iQgwAZV+8zvPweiitfhZTNd2FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-5WLnz7W_PsGH29dYrMK5cA-1; Fri, 22 Jan 2021 06:18:38 -0500
X-MC-Unique: 5WLnz7W_PsGH29dYrMK5cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E4E18C89DA;
 Fri, 22 Jan 2021 11:18:36 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE80E60855;
 Fri, 22 Jan 2021 11:18:34 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:18:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 06/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
Message-ID: <20210122111833.GA15866@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-7-vsementsov@virtuozzo.com>
 <20210118151336.GG11555@merkur.fritz.box>
 <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
 <20210119163805.GI5012@merkur.fritz.box>
 <fb41291e-45c3-31d6-3f56-5ef5c42feaf3@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <fb41291e-45c3-31d6-3f56-5ef5c42feaf3@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 22.01.2021 um 12:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 19.01.2021 19:38, Kevin Wolf wrote:
> > Am 18.01.2021 um 18:36 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 18.01.2021 18:13, Kevin Wolf wrote:
> > > > Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > Add new handler to get aio context and implement it in all child
> > > > > classes. Add corresponding public interface to be used soon.
> > > > > 
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > 
> > > > Hm, are you going to introduce cases where parent and child context
> > > > don't match, or why is this a useful function?
> > > > 
> > > > Even if so, I feel it shouldn't be any of the child's business what
> > > > AioContext the parent uses.
> > > > 
> > > > Well, maybe the rest of the series will answer this.
> > > 
> > > It's for the following patch, to not pass parent (as opaque) with it's
> > > class, and with its ctx in separate. Just to simplify the interface of
> > > the function, we are going to work with a lot.
> > 
> > In a way, the result is nicer because we already assume that ctx is the
> > parent context when we move things to different AioContexts. So it's
> > more consistent to just directly take it from the parent.
> > 
> > At the same time, it also complicates things a bit because now we need a
> > defined state in the middle of an operation that adds, removes or
> > replaces a child.
> > 
> > I guess I still to make more progress in the review of this series until
> > I see how you're using the interface.
> > 
> > > Hm. I'll take this opportunity to say, that the terminology that calls
> > > graph edge "BdrvChild" always leads to the mess between parents and
> > > children.. "child_class" is a class of parent.. list of parents is
> > > list of children... It all would be a lot simpler to understand if
> > > BdrvChild was BdrvEdge or something like this.
> > 
> > Yeah, that would probably be clearer now that we actually use it to
> > work with both ends of the edge. And BdrvNode instead of
> > BlockDriverState, I guess.
> 
> Do you think, we can just rename them? Or it would be too painful for developers,
> who get used to current names? I can make patches

I think getting used to new names wouldn't be too bad. I would be more
afraid of the merge conflicts.

Not sure, but it might in the category that we would do it differently
if we were starting over, but maybe not worth changing now.

Kevin


