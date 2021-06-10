Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14533A3332
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:36:08 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPXD-0003bR-5d
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrPW1-0002d8-4z
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrPVy-0005Jr-NX
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623350090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lVK0gzswXUQ5fZggUaFqFu36pHJyxp0aSi6HYRK3TzE=;
 b=aPdV3itj3KglBm2y1NmUEhGXNMCadtBa0DeKvwcW4Ss6YPkbbkaBilcnB+HPiAd2n5okLk
 9/V1Kq4wP0RTVoyAYF3HCMggbCvMkEsGFcsA4bLzu43ot12dDoTZbefQ0VNcIGwpU+oraa
 fBygUSX6BMDtaqqU4pHK6N5JweG3lF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-XTVv35fxOe6JvaqTOBW9oQ-1; Thu, 10 Jun 2021 14:34:46 -0400
X-MC-Unique: XTVv35fxOe6JvaqTOBW9oQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3F1100D683;
 Thu, 10 Jun 2021 18:34:45 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD9D5C1C5;
 Thu, 10 Jun 2021 18:34:44 +0000 (UTC)
Date: Thu, 10 Jun 2021 13:34:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210610183443.clk43ngkobzyjopy@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 07:38:10PM +0300, Nir Soffer wrote:
> The example I provided was not detailed enough, what we actually do is:
> 
>     qemu-nbd .. 'json:{"driver": "qcow2", "backing": null, "file":
> {"driver": "file", "filename": "top.qcow2"}}'
> 
> So there is no backing chain and allocation depth is not relevant.
> - Allocated areas should be reported with flags 0
> - Zero areas which are not holes should be reported as NBD_STATE_ZERO
> - Zero areas which are holes (not allocated in this image) should be
> reported as NBD_STATE_HOLE

Thinking about this a bit more, here's something I noticed:

$ qemu-img map --output=json -f raw base.raw
[{ "start": 0, "length": 196608, "depth": 0, "zero": false, "data": true, "offset": 0},
{ "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]

which matches what I've said elsewhere in this thread: the entire
image is reported as "depth":0 because the raw file is responsible for
100% of the content.

But:

$ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
  "file":{"driver":"file","filename":"top.qcow2"}}'
[{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
{ "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
{ "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]

also reports the entire file at "depth":0, which is misleading, since
we have just been arguing from the qemu:allocation-depth perspective
(and also from bdrv_block_status) that the qcow2 image is NOT 100%
allocated (in the sense where allocation == data comes locally).
Perhaps it might be better if we tweaked the above qemu-img map to
produce:

[{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
{ "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
{ "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
{ "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]

that is, use "depth":-1 to explicitly denote portions of a qcow2 file
which are NOT provided locally, and which are not found anywhere in
the backing chain.  In other words, make it explicit in qemu-img map
output what is possible with qemu:allocation-depth==0.

Or tweak it slightly to mean that "depth":-1 corresponds to "cluster
is not provided by the current layer, but we could not determine if it
is provided by a particular backing layer or if it was unallocated
overall".  Then positive depth means we know which point in the
backing chain we deferred to, 0 is local, and negative depth means
that we defer to a backing layer (but could not report WHICH layer, if
any).  This tweak would make it easier for my thoughts of having qemu
NBD clients automatically request qemu:allocation-depth without having
to resort to x-dirty-bitmap hacks, and still be able to expose the
information via qemu-img map.

I'm off to another round of code hacking to see how it looks...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


