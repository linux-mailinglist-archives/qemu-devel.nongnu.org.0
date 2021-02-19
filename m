Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A24631FD54
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:43:34 +0100 (CET)
Received: from localhost ([::1]:49308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8sO-0005F8-NI
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lD8rP-0004jY-8U
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:42:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lD8rL-0002db-FR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613752946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87TJHB2rfZkrsUIZKv0IRvCGTyrcaZ1YyYMDG9sUERo=;
 b=eii2jgyxs5MW2eUPW4+m9HajqSSaHE3sS2v4ux0M9dq8XGhzOcm735Qdtz0YfBXeEs4I87
 yJkDCXYXRvKIl9X3BLhuOhSPgwDiT1wvYHfQLRMh5+NwERG/X4Keuh9ygcz2CJ/eNj6wW3
 4yBP2bVk4JSGDvMybS0/WAP8VDzs3Xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-HArQxUgMMdqubsyXawPZVg-1; Fri, 19 Feb 2021 11:42:21 -0500
X-MC-Unique: HArQxUgMMdqubsyXawPZVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4544D803F48;
 Fri, 19 Feb 2021 16:42:20 +0000 (UTC)
Received: from [10.3.113.156] (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B4C5D9C2;
 Fri, 19 Feb 2021 16:42:19 +0000 (UTC)
To: Nir Soffer <nirsof@gmail.com>, qemu-devel@nongnu.org
References: <20210219160752.1826830-1-nsoffer@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] nbd: server: Report holes for raw images
Message-ID: <f136b2e8-3510-a150-27f9-e69ba14e39aa@redhat.com>
Date: Fri, 19 Feb 2021 10:42:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219160752.1826830-1-nsoffer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 10:07 AM, Nir Soffer wrote:
> When querying image extents for raw image, qemu-nbd reports holes as
> zero:
> 
> $ qemu-nbd -t -r -f raw empty-6g.raw
> 
> $ qemu-img map --output json nbd://localhost
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": true, "offset": 0}]
> 
> $ qemu-img map --output json empty-6g.raw
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]
> 
> Turns out that qemu-img map reports a hole based on BDRV_BLOCK_DATA, but
> nbd server reports a hole based on BDRV_BLOCK_ALLOCATED.
> 
> The NBD protocol says:
> 
>     NBD_STATE_HOLE (bit 0): if set, the block represents a hole (and
>     future writes to that area may cause fragmentation or encounter an
>     NBD_ENOSPC error); if clear, the block is allocated or the server
>     could not otherwise determine its status.

Notoriously, lseek(SEEK_HOLE) cannot actually tell us about which
portions of a file are allocated (it can only reliably tell us which
portions of a file read as zero); you have to use the FIEMAP ioctl or
similar to learn about allocation status of a raw file, which is too
expensive to be useful.  The fact that SEEK_HOLE does not tell us about
NBD_STATE_HOLE, but instead is solely about NBD_STATE_ZERO, is therefore
a misnomer that doesn't make it any easier to reason about.

But this patch is also an indication that our meaning of
BDRV_BLOCK_ALLOCATED is confused; there has been a mismatch over time on
whether it represents whether something is allocated by occupying space
on disk (which as pointed out above is too expensive to determine for
files, but easy to determine for qcow2) or represents allocated at this
depth within a backing chain (makes no sense for protocol layers, but
total sense for format layers like qcow2).  At one point, Vladimir
audited the code base to try and reserve BDRV_BLOCK_ALLOCATED solely for
the latter meaning (which layer of a backing chain supplies the data,
regardless of whether that extent occupies reserved storage space).

So on that grounds alone, I am inclined to agree with you that using
BDRV_BLOCK_ALLOCATED to feed NBD_STATE_HOLE is wrong: whether something
comes from the current layer of the backing image is unrelated to
whether that extent is known to occupy reserved storage in the file
system.  Failure to sest NBD_STATE_HOLE is not fatal (the NBD protocol
specifically chose NBD_STATE_HOLE and NBD_STATE_ZERO to have default
values of 0 in the common case, where setting them to 1 allows some
optimizations, but where skipping the chance to set them to 1 because
determining the answer is too expensive, such as FIEMAP, is fine as well).

> 
> qemu-img manual says:
> 
>     whether the sectors contain actual data or not (boolean field data;
>     if false, the sectors are either unallocated or stored as
>     optimized all-zero clusters);
> 
> To me, data=false looks compatible with NBD_STATE_HOLE. From user point
> of view, getting same results from qemu-nbd and qemu-img is more
> important than being more correct about allocation status.

More to the point, here is our inconsistency:

In nbd/server.c, we turn !BDRV_BLOCK_ALLOCATED into NBD_STATE_HOLE

In block/nbd.c, we turn !NBD_STATE_HOLE into BDRV_BLOCK_DATA

The fact that we are not doing a round-trip conversion means that one of
the two places is wrong.  And your argument that the server side is
wrong makes sense to me.

> 
> Changing nbd server to report holes using BDRV_BLOCK_DATA makes qemu-nbd
> results compatible with qemu-img map:
> 
> $ qemu-img map --output json nbd://localhost
> [{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]
> 
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>  nbd/server.c               | 4 ++--
>  tests/qemu-iotests/241.out | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Conflicts with my patch to make NBD_CMD_READ/NBD_CMD_BLOCK_STATUS obey
block alignment boundaries:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06010.html

Reviewed-by: Eric Blake <eblake@redhat.com>

I'll wait a few days for any other reviewer commentary before taking
this through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


