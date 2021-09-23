Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB24166F4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:55:01 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVkC-0000gQ-2o
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVj5-00084U-V5
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVj3-0002cG-3s
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632430427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNjdTwPLuuTbKFkJ0xsVz54uQA8lFzBSIcRUJFcw/8g=;
 b=B+FRpeiJvnqg3xAOYv51dAVnoS5EK93CZUYsHtgKN0eY6i9HgxToBDgGhXzwN2O+DSQOIE
 Hb/r34CiAENBAmmd4wI9vejOa0ZukU1F4eccP/Uc9AGXwSWGPAYTsXkf1KOiqoGvP8m5kH
 VLm40bjjmdgA2vorigt9Zaq82CN6Edw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-mM-4qKDwPky9EFUr8r60Ow-1; Thu, 23 Sep 2021 16:53:43 -0400
X-MC-Unique: mM-4qKDwPky9EFUr8r60Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086391966320;
 Thu, 23 Sep 2021 20:53:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E86F219C59;
 Thu, 23 Sep 2021 20:53:15 +0000 (UTC)
Date: Thu, 23 Sep 2021 15:53:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Message-ID: <20210923205314.yqzrdpb524h4fumy@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-8-vsementsov@virtuozzo.com>
 <20210923203345.efajcgbm3qd2sam5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923203345.efajcgbm3qd2sam5@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-block@nongnu.org, ari@tuxera.com,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, philmd@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 idryomov@gmail.com, jsnow@redhat.com, ronniesahlberg@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 03:33:45PM -0500, Eric Blake wrote:
> > +++ b/block/nbd.c
> > @@ -1407,15 +1407,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
> >  }
> >  
> >  static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> > -                                       int bytes, BdrvRequestFlags flags)
> > +                                       int64_t bytes, BdrvRequestFlags flags)
> >  {
> >      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> >      NBDRequest request = {
> >          .type = NBD_CMD_WRITE_ZEROES,
> >          .from = offset,
> > -        .len = bytes,
> > +        .len = bytes,  /* .len is uint32_t actually */
> >      };
> >  
> > +    assert(bytes < UINT32_MAX); /* relay on max_pwrite_zeroes */
> 
> And again.  Here, you happen to get by with < because we clamped
> bl.max_pwrite_zeroes at BDRV_REQUEST_MAX_BYTES, which is INT_MAX
> rounded down.  But I had to check; whereas using <= would be less
> worrisome, even if we never get a request that large.

Whoops, I was reading a local patch of mine.  Upstream has merely:

    uint32_t max = MIN_NON_ZERO(NBD_MAX_BUFFER_SIZE, s->info.max_block);

    bs->bl.max_pdiscard = QEMU_ALIGN_DOWN(INT_MAX, min);
    bs->bl.max_pwrite_zeroes = max;

which is an even smaller limit than BDRV_REQUEST_MAX_BYTES (and
obviously one we're trying to raise).  But the point remains that
using <= rather than < will make it easier to review the code where we
raise the limits (either up to the 4G-1 limit of the current protocol,
or with protocol extensions to finally get to 64-bit requests).

> 
> If you agree with my analysis, I can make that change while preparing
> my pull request.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


