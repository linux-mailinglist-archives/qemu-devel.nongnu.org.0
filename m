Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE23A3516
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:47:35 +0200 (CEST)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRaQ-0006hF-Bz
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrRZO-0005zD-Vp
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrRZH-0002vm-B8
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623357982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEyIYgfhm4H5bIIkfE4Tx1cW2GVfG7KrSqNMQ4RisXg=;
 b=fPmNJ+VoBhcj80PaZrGd+7VBKiwyttJK7JQk+wvoKr93nlr2tqngQ5VCW7TfZssJe4KEiL
 H+jNuxkV9BQqCYhB7vaXXV+IoY1SxJfnDman3g72LlNgcAX4PJQ3yqQ8z7pZ8deSLieJHe
 ed/hTnPh928vWFE+2LcfX2LY46bamt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-oN4yCQ3FMH-tJHNtfnB6fQ-1; Thu, 10 Jun 2021 16:46:21 -0400
X-MC-Unique: oN4yCQ3FMH-tJHNtfnB6fQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF0468186E6;
 Thu, 10 Jun 2021 20:46:19 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2A8C189BB;
 Thu, 10 Jun 2021 20:46:18 +0000 (UTC)
Date: Thu, 10 Jun 2021 15:46:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210610204617.fuj4ivqrixpz4qfj@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
> > But:
> >
> > $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
> >   "file":{"driver":"file","filename":"top.qcow2"}}'
> > [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
> > { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> > { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
> >
> > also reports the entire file at "depth":0, which is misleading, since
> > we have just been arguing from the qemu:allocation-depth perspective
> > (and also from bdrv_block_status) that the qcow2 image is NOT 100%
> > allocated (in the sense where allocation == data comes locally).
> > Perhaps it might be better if we tweaked the above qemu-img map to
> > produce:
> >
> > [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
> > { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> > { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
> > { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
> 
> It will be more consistent with "offset" to drop "depth" from output
> if we don't have it:
> 
>     [{ "start": 0, "length": 65536, "zero": true, "data": false},
>      { "start": 65536, "length": 65536, "depth": 0, "zero": false,
> "data": true, "offset": 327680},
>      { "start": 131072, "length": 65536, "depth": 0, "zero": true,
> "data": false},
>      { "start": 196608, "length": 65536, "zero": true, "data": false}]

Yes, that might work as well.  But we didn't previously document
depth to be optional.  Removing something from output risks breaking
more downstream tools that expect it to be non-optional, compared to
providing a new value.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


