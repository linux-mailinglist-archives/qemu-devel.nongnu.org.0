Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB6397BB9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:26:11 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBtp-0000dj-Ii
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loBsS-0008GE-79
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loBsP-0005pI-1e
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622582679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zhj0YZDEgJ7eRp9B4A5XOQs3vFf+KbYfVxdtrTrXgco=;
 b=OTr27t4jW/t3dgYl6q11nBCXoJdcOHb99BEAsxKmiFC/Z86o9m8V7hNRHxkYHetCBFaEa5
 drOQ3TuRUDE0cWEWjc4k1pd/984sD04JBD+VhX+81WMX7cESO91igzcIijK4/mrrMI+JQL
 ipfU5A1C12Elx1O272BzriO7/WbDpPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-x39RzzjWP5qwfMoB_GiFBA-1; Tue, 01 Jun 2021 17:24:36 -0400
X-MC-Unique: x39RzzjWP5qwfMoB_GiFBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 376B4802B78;
 Tue,  1 Jun 2021 21:24:35 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 382665D6D3;
 Tue,  1 Jun 2021 21:24:31 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:24:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] block-backend: add drained_poll
Message-ID: <20210601212429.r2lu7jzh5y3w5e6q@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-2-slp@redhat.com>
 <YLZZTgcWUliRhtT2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YLZZTgcWUliRhtT2@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 05:59:10PM +0200, Kevin Wolf wrote:
> > +++ b/block/block-backend.c
> > @@ -2393,8 +2393,13 @@ static void blk_root_drained_begin(BdrvChild *child)
> >  static bool blk_root_drained_poll(BdrvChild *child)
> >  {
> >      BlockBackend *blk = child->opaque;
> > +    int ret = 0;
> 
> It's really a bool.
> 
> >      assert(blk->quiesce_counter);
> > -    return !!blk->in_flight;
> > +
> > +    if (blk->dev_ops && blk->dev_ops->drained_poll) {
> > +        ret = blk->dev_ops->drained_poll(blk->dev_opaque);
> > +    }
> > +    return ret || !!blk->in_flight;
> >  }
> 
> Doesn't make a difference for correctness, of course, so whether you
> change it or not:
> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Likewise, with that cosmetic change,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


