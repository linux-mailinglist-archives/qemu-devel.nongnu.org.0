Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202832530D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:06:55 +0100 (CET)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJAE-0007xH-Hy
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFJ7U-0005rJ-H0
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFJ7R-0004xb-MM
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614269040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l84kCTxuHuGXS7zFhprm68Ln0u+I3pftZClszemSCMc=;
 b=BBsrshukEEboKOj9jcNq/iWThgIPqh9+312lp8VoESet5ltLFJAEscZqd8IO2IrNAjCBcx
 Ufyfqil+wCVx+2fTNfjlPZ9KYZ+oEMtd/Uv6aLsilJsv7dqoVzWkqRmk/AaTMAomYO58KE
 biIAS5l/Tra/aMOMQxOFpr3IdgQcZ1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-KyD_X-XWMNuvEC6bM8Yp4A-1; Thu, 25 Feb 2021 11:03:58 -0500
X-MC-Unique: KyD_X-XWMNuvEC6bM8Yp4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F201B19611A3;
 Thu, 25 Feb 2021 16:03:56 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A25A161F38;
 Thu, 25 Feb 2021 16:03:53 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-3-eblake@redhat.com>
 <35c70ab7-e536-9893-9575-a471e19497ec@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/5] block: Fix BDRV_BLOCK_RAW status to honor alignment
Message-ID: <aa338b81-9e89-ac40-a3da-aff9c8b512ee@redhat.com>
Date: Thu, 25 Feb 2021 10:03:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <35c70ab7-e536-9893-9575-a471e19497ec@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 8:55 AM, Vladimir Sementsov-Ogievskiy wrote:
> 18.02.2021 23:15, Eric Blake wrote:
>> Previous patches mentioned how the blkdebug filter driver demonstrates
>> a bug present in our NBD server (for example, commit b0245d64); the
>> bug is also present with the raw format driver when probing
>> occurs. Basically, if we specify a particular alignment > 1, but defer
>> the actual block status to the underlying file, and the underlying
>> file has a smaller alignment, then the use of BDRV_BLOCK_RAW to defer
>> to the underlying file can end up with status split at an alignment
>> unacceptable to our layer.  Many callers don't care, but NBD does - it
>> is a violation of the NBD protocol to send status or read results
>> split on an unaligned boundary (in 737d3f5244, we taught our 4.0
>> client to be tolerant of such violations because the problem was even
>> more pronounced with qemu 3.1 as server; but we still need to fix our
>> server for the sake of other stricter clients).
>>

>> + * - BDRV_BLOCK_ALLOCATED is set if the flag is set for at least one
>> subregion
> 
> Hmm about this..
> 
> We already have mess around ALLOCATED:
> 
>  [1] for format drivers it means that "read is handled by this layer,
> not by backing", i.e. data (or zero) is placed exactly on that layer of
> backing-chain

If we're reading at a given granularity, then the 4k read is satisfied
at this layer even if portions of the read came from lower layers.  So
the logic works here.

> 
>  [2] for protocol drivers it's up to the driver, which may always report
> ALLOCATED (being more compatible with format drivers) or it may
> sometimes return UNALLOCATED to show that data is not allocated in FS..

We've been moving away from this particular overload.  What's more, most
protocol drivers that set it at all set it for every single byte,
because protocol layers don't have a notion of a backing file; which
means that if it is set at all, it will be set for every byte anyway, so
the logic works here.

> 
> And this way, bdrv_co_block_status_aligned() is compatible with protocol
> drivers but not with format drivers (as you can't combine
> "go-to-backing" information of several flags, as for some scenarios it's
> safer to consider the whole region ALLOCATED and for another it's safer
> to consider it UNALLOCATED.
> 
> For example for stream target it's safer to consider target block
> UNALLOCATED and do extra copy-on-read operation. And for stream base
> it's safer to consider block ALLOCATED (and again do extra copying, not
> missing something significant).
> 
> 
> I think, to avoid increasing of the mess, we should first split [1] from
> [2] somehow..
> Assume we change it to BDRV_BLOCK_PROTOCOL_ALLOCATED and
> BDRV_BLOCK_GO_TO_BACKING.

Maybe it is indeed worth splitting out two different flags to fully
distinguish between the two overloaded meanings, but that seems like an
independent patch to this series.

> 
> Then, for BDRV_BLOCK_PROTOCOL_ALLOCATED we probably can just report
> BDRV_BLOCK_PROTOCOL_ALLOCATED if at least one of extents reports
> BDRV_BLOCK_PROTOCOL_ALLOCATED. (probably we don't need
> BDRV_BLOCK_PROTOCOL_ALLOCATED at all and can drop this logic)
> 
> But for BDRV_BLOCK_GO_TO_BACKING we'll have to also add
> BDRV_BLOCK_GO_TO_BACKING_VALID and report
> 
>  * BDRV_BLOCK_GO_TO_BACKING | BDRV_BLOCK_GO_TO_BACKING_VALID if all
> extents report BDRV_BLOCK_GO_TO_BACKING
>  
>  * BDRV_BLOCK_GO_TO_BACKING if all extents report no
> BDRV_BLOCK_GO_TO_BACKING
> 
>  * <nothing> if some extents report BDRV_BLOCK_GO_TO_BACKING but others
> not.
> 
> 
> Hmm.. And, I think that there is a problem is in NBD protocol. Actually,
> with allocation-depth context we started to report internal layers of
> backing chain. And if we have layers with different request-alignment
> it's not correct to report allocation-depth "aligned" to top image
> request-alignment.. So, for allocation-depth to work correctly we should
> extend NBD protocol to allow unaligned chunks in BLOCK_STATUS report.

The NBD protocol says that base:allocation must obey allocation rules.
If we want to declare that "because qemu:allocation-depth is an
extension, we choose to NOT obey allocation rules, and if your client
connects to our extension, it MUST be prepared for what would normally
be non-compliant responses to NBD_CMD_BLOCK_STATUS", then we are free to
do so (it is our extension, after all).  Particularly since the only way
I could actually trigger it was with blkdebug (most format layers
support byte-level access, even when layered on top of a protocol layer
with a 512 or 4k minimum byte access).

So if you think it is better for me to respin the patch to fix ONLY
base:allocation bugs, but not qemu:allocation-depth, and instead merely
document the issue there, I could be persuaded to do so.

> 
> So, finally:
> 
> 1. making bitmap export extents aligned is a separate simple thing -
> that's OK
> 
> 2. making base:allocation aligned is possible due to good NBD_STATE_HOLE
> definition. So for it it's correct to combine BDRV_BLOCK_ALLOCATED as
> you do even keeping in mind format layers. We call block_status_above
> for the whole chain. ALLOCATED=0 only if all format layers refer to
> backing and bottom protocol driver(if exists) reports "unallocated in
> FS" so that correspond to
> 
> "If an extent is marked with NBD_STATE_HOLE at that context, this means
> that the given extent is not allocated in the backend storage, and that
> writing to the extent MAY result in the NBD_ENOSPC error"
> 
>    And this way, I'd prefer to fix exactly base:allocation context
> handling in nbd-server not touching generic block_status which already
> has enough mess.
> 
> 3. fixing qemu:allocation-depth I think is impossible without allowing
> unaligned chunks in NBD spec (really, why we should restrict all
> possible metadata contexts so hard?) Or, if we are still going to align
> allocation-depth results to top layer request-alignment we should change
> allocation-depth specification so that that's not "actual allocation
> depth" but something >= than actual allocation depth of all subchunks...
> And that becomes useless.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


