Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2D53A2C7A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:07:34 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKPF-00046w-5i
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrKOI-00034b-QQ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrKOE-0003JG-2P
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9HlqpFw37zx8bUteR+MOhAlUdUruuiSPGYJ2XuG6os=;
 b=UAz9pvAa7CNthQYq3ajEw4336+jiivbm44W6k1Mf9ObW0OtPf+z8OrAtN9EPo/4hOfNTbt
 LfajXuOBxvSyrZL7l25mnw5T0FFmBlIZltRPciknvpVJz799Tq4V8jkvOvj/HswHn5+qwt
 hSvCpjpwes7MGgHB04Cn+5fiST/BsfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-5RWLxhjSMLilK3YmfZ9xIw-1; Thu, 10 Jun 2021 09:06:26 -0400
X-MC-Unique: 5RWLxhjSMLilK3YmfZ9xIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD75E100CF64;
 Thu, 10 Jun 2021 13:06:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D87165C1CF;
 Thu, 10 Jun 2021 13:06:17 +0000 (UTC)
Date: Thu, 10 Jun 2021 08:06:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [RFC libnbd PATCH] info: Add support for new qemu:joint-allocation
Message-ID: <20210610130616.nmmckl7v5l5n3agn@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609213154.1012848-1-eblake@redhat.com>
 <CAMRbyysYRyALDan9D0L-FphGqQLUOkKrKp0eg0iP8ThHnSatgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyysYRyALDan9D0L-FphGqQLUOkKrKp0eg0iP8ThHnSatgw@mail.gmail.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:20:13AM +0300, Nir Soffer wrote:
> > +  else if (strcmp (metacontext, "qemu:joint-allocation") == 0) {
> > +    /* Combo of base:allocation and stripped-down qemu:allocation-depth */
> > +    const char *base, *depth;
> > +    switch (type & 3) {
> > +    case 0: base = "allocated"; break;
> > +    case 1: base = "hole"; break;
> > +    case 2: base = "zero"; break;
> > +    case 3: base = "hole,zero"; break;
> > +    }
> > +    switch (type & 0xc) {
> > +    case 0: depth = "unallocated"; break;
> 
> Is this possible? qemu reports BDRV_BLOCK_DATA but not BDRV_BLOCK_ALLOCATED?

No, qemu should never report a status of 0 (which in this code would
produce the string "allocated,unallocated", although a v2 may change
to print "<unexpected value>").

Remember, BDRV_BLOCK_ALLOCATED is a bit of a misnomer - it has nothing
to do with whether a cluster occupies allocated space, but rather
whether the local image in the backing chain provides the contents of
the cluster (rather than deferring to the backing chain).  The code in
block/io.c guarantees that if a block device reports BDRV_BLOCK_DATA,
then the block layer also reports BDRV_BLOCK_ALLOCATED (that is, any
cluster that provides guest-visible data by necessity implies that the
current layer of the backing chain is important).

However, it DOES point out that "allocated" might not be the best name
in libnbd; perhaps "data" or "normal" would be better for the NBD
base:allocation status of 0.

> 
> Anyway this seems like a valid way to present qemu response.
> 
> > +    case 4: depth = "local"; break;
> > +    case 8: depth = "backing"; break;
> > +    case 12: depth = "<unexpected depth>"; break;
> 
> This should not be possible based on the qemu patch, but printing this
> seems like a good solution, and can help to debug such an issue.
> 
> Thinking about client code trying to copy extents based on the flags,
> the client should abort the operation since qemu response is invalid.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


