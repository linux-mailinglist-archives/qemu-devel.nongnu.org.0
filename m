Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A16397BC4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:33:02 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loC0T-0001DJ-Jq
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loByj-0008Qe-Ev
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loByh-0001ze-No
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622583071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2H/S+9JIalK/y8vjdClmsCMGpy/orLzUo2GXYQD0cDY=;
 b=Fr0APA5DejyZtCZRIyEhz4hNLUxOo8APQZmn0L/q7nSNr3D6+tjBwhYl3XY9DK9M2vJeau
 jk7CDsDyP5RCvMJzapoIHboKJ1VEBU3PaPLUPV7dFJ7eVBPP23cPW+jfdtMXNT4s56VvdG
 s18CpxxB/MGv9spiQzDVnOwu6zxKdTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-18fVvN3COdS_13v0NxQArA-1; Tue, 01 Jun 2021 17:31:09 -0400
X-MC-Unique: 18fVvN3COdS_13v0NxQArA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693B01009446;
 Tue,  1 Jun 2021 21:31:08 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FAAE5C1C4;
 Tue,  1 Jun 2021 21:31:02 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:31:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <20210601213101.xqz7os5kje56vi3i@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-3-slp@redhat.com>
 <YLZbibzZFibabhm/@redhat.com>
 <20210601163129.wcx5li7lkdvxrxgi@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20210601163129.wcx5li7lkdvxrxgi@mhamilton>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 06:31:29PM +0200, Sergio Lopez wrote:
> > Hm, how do you get more than one coroutine per client yielding in
> > nbd_read_eof() at the same time? I thought the model is that you always
> > have one coroutine reading the next request (which is
> > client->recv_coroutine) and all the others are just processing the
> > request they had read earlier. Multiple coroutines reading from the
> > same socket would sound like a bad idea.
> 
> You're right, there's only a single coroutine yielding on
> nbd_read_eof(). I've added the list while at a moment I was trying to
> keep track of every coroutine, and I kept it without thinking if it
> was really needed.
> 
> I'll drop it, entering just client->recv_coroutine is it isn't NULL.

Sounds like I'll wait for the v2 before applying.  But the overall
logic changes made sense to me.

> > The patch looks correct to me, though I'm not sure if yield_co_list is
> > an unnecessary complication (and if it isn't, whether that's safe).
> > 
> > I would be happy enough to apply it anyway if you can explain the
> > yield_co_list thing, but I'll give Eric some time to have a look, too.

Thanks for catching my attention on this!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


