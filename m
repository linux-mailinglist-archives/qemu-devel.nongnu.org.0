Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0330439E002
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:11:57 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGux-00043O-7E
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqGtL-00038b-1M
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:10:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqGtJ-0008Dd-Hx
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623078611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMrOWrM4IJWpJ/SE2R/EUfJQk3RhoYzEVO37RGUiVv0=;
 b=DlDcuAv590g7oXt+g2epKuu/4Tb3WtNNgjXv0wlMnYp8Tt7qpYaUl2jL8NJZKI01asrTb/
 7+y7+ICy727Qod0uVUgL6ZNvOKiRxaZCHjcQ5XCMJSmEYlOfYcwIJ2tPTINtWu5EwBQIne
 kevJaSYNleZrh5+T7OLmgBO5NBOLirk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-VpGJRW2IPhKRthjlvzlukg-1; Mon, 07 Jun 2021 11:10:10 -0400
X-MC-Unique: VpGJRW2IPhKRthjlvzlukg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 720B61883526;
 Mon,  7 Jun 2021 15:10:09 +0000 (UTC)
Received: from redhat.com (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8300F2B168;
 Mon,  7 Jun 2021 15:10:04 +0000 (UTC)
Date: Mon, 7 Jun 2021 17:10:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
Message-ID: <YL42y/CZIFJ6ICLB@redhat.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain>
 <YLd33jBVl5k3RAZK@redhat.com>
 <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
MIME-Version: 1.0
In-Reply-To: <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: eesposit@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.06.2021 um 09:38 hat Paolo Bonzini geschrieben:
> On 02/06/21 14:21, Kevin Wolf wrote:
> > Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
> > > On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > Hi all!
> > > > 
> > > > This is my suggestion how to refactor block-copy to avoid extra atomic
> > > > operations in
> > > > "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
> > > > 
> > > > Vladimir Sementsov-Ogievskiy (2):
> > > >    block-copy: fix block_copy_task_entry() progress update
> > > >    block-copy: refactor copy_range handling
> > > > 
> > > >   block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
> > > >   1 file changed, 53 insertions(+), 26 deletions(-)
> > > 
> > > I posted suggestions for the doc comment on Patch 2, otherwise:
> > > 
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Thanks, fixed up the comment accordingly and applied to the block
> > branch.
> 
> I'm a bit confused.  Vladimir said in his review of Emanuele's patches
> that he was okay with patch 7 and that he would rebase this
> refactoring on top of it.
> 
> Vladimir's main complaint for the s->method state machine was the
> extra lines of code.  Here we have just as many new lines of code and
> new parameters that are passed by reference.  Kevin, can you please
> look at Emanuele's patches and possibly unqueue the second patch here?
> It seems to me that it should have been tagged as RFC.

Sorry, I was not aware that Vladimir intended to rebase this one. This
has already landed in master, so if rebasing the other patch is a real
problem, we'd have to revert this one first.

Kevin


