Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D839342AF18
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:38:41 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPTs-0002Mi-Vs
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1maPSj-0000X2-Ll
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1maPSh-0002CK-0w
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Ov/HeRio/2qrg1gb2glPH9C2QxO/YALl5oF4wVtEV4=;
 b=QEH1O8y86XtxqL5wsaBKvM+in46PNF67vAkAs7Lu3j/3vEfU01WIZ8CXQYAolHRri8LQPm
 9ZCBWG7Hk+rEBtD5MfMugHlDUu1x/yE3OEg9C/2btOOpOuZDQHZPRNm3qPFEEZDCpvEWq+
 koMwVCMCEHdOA6z6esJDsm/x3E4eNfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-RJno8eNON8GpilkUprCkhQ-1; Tue, 12 Oct 2021 17:37:21 -0400
X-MC-Unique: RJno8eNON8GpilkUprCkhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548FF801A93;
 Tue, 12 Oct 2021 21:37:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E360104253A;
 Tue, 12 Oct 2021 21:37:05 +0000 (UTC)
Date: Tue, 12 Oct 2021 16:37:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 10/12] block-backend: convert blk_aio_ functions to
 int64_t bytes paramter
Message-ID: <20211012213703.5knzppc4rzgymp5v@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-11-vsementsov@virtuozzo.com>
 <20211006202925.x56o344sxsgbkrvh@redhat.com>
 <b251f39d-d727-311e-e6e4-f84c360cb3af@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b251f39d-d727-311e-e6e4-f84c360cb3af@virtuozzo.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 07:13:23PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > @@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
> > >                              QEMUIOVector *qiov, BdrvRequestFlags flags,
> > >                              BlockCompletionFunc *cb, void *opaque)
> > >   {
> > > +    assert(qiov->size <= INT64_MAX);
> > 
> > I hope this doesn't cause 32-bit compilers to warn about an
> > always-true expression; but if it does, we'll figure something out.
> > That's not enough for me to ask for you to respin this, though, so:
> > 
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > 
> 
> So, here we need
> 
> assert((uint64_t)qiov->size <= INT64_MAX);
> 
> as in recent fix by Hanna.
>

Indeed.

> Eric, will you stage this as continuation of 64bit series, or do we wait for Kevin or Hanna, or for me resending it with this small fix and your wording fixes?

At this point, I think I'm fine touching up the series and staging it
through my tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


