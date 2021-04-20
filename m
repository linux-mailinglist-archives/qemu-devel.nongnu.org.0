Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76767365BDC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:06:19 +0200 (CEST)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrxC-0005LO-J4
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYrvT-000473-0a
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lYrvJ-0001Kv-B2
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618931056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5FK0Fx02DGF3319NZ3ezHf/gnEsXiXoiwzDPJbhcG/g=;
 b=PoAu+0XcvjcE+FHZ3FKXMm+35zxe7Mnun5OcMWB+XzhUYcI+rOpUtHjjw5SqGxPMUqhdDL
 avv2Zb34l9r26CWk1geCJRqJfr0+VbzjQmUfNCESJYWWrPC77r5rOpbYMv1Db0zEPvB9l0
 cdfNtjcprsI0cbIa3vHgs1nBtm1tTOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-9zlvN684O6aIzKOo1P-ipw-1; Tue, 20 Apr 2021 11:04:14 -0400
X-MC-Unique: 9zlvN684O6aIzKOo1P-ipw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A2396D59B;
 Tue, 20 Apr 2021 15:04:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C17A101E5AF;
 Tue, 20 Apr 2021 15:04:12 +0000 (UTC)
Date: Tue, 20 Apr 2021 17:04:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
Message-ID: <YH7tah47XxdYs3VW@merkur.fritz.box>
References: <20210415152214.279844-1-kwolf@redhat.com>
 <20210415152214.279844-3-kwolf@redhat.com>
 <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pl@kamp.de, qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.04.2021 um 16:31 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 15.04.2021 18:22, Kevin Wolf wrote:
> > In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
> > like non-zero data if the end of the checked area isn't aligned. This
> > can improve the efficiency of the conversion and was introduced in
> > commit 8dcd3c9b91a.
> > 
> > However, it comes with a correctness problem: qemu-img convert is
> > supposed to sparsify areas that contain only zeros, which it doesn't do
> > any more. It turns out that this even happens when not only the
> > unaligned area is zeroed, but also the blocks before and after it. In
> > the bug report, conversion of a fragmented 10G image containing only
> > zeros resulted in an image consuming 2.82 GiB even though the expected
> > size is only 4 KiB.
> > 
> > As a tradeoff between both, let's ignore zeroed sectors only after
> > non-zero data to fix the alignment, but if we're only looking at zeros,
> > keep them as such, even if it may mean additional RMW cycles.
> > 
> 
> Hmm.. If I understand correctly, we are going to do unaligned
> write-zero. And that helps.

This can happen (mostly raw images on block devices, I think?), but
usually it just means skipping the write because we know that the target
image is already zeroed.

What it does mean is that if the next part is data, we'll have an
unaligned data write.

> Doesn't that mean that alignment is wrongly detected?

The problem is that you can have bdrv_block_status_above() return the
same allocation status multiple times in a row, but *pnum can be
unaligned for the conversion.

We only look at a single range returned by it when detecting the
alignment, so it could be that we have zero buffers for both 0-11 and
12-16 and detect two misaligned ranges, when both together are a
perfectly aligned zeroed range.

In theory we could try to do some lookahead and merge ranges where
possible, which should give us the perfect result, but it would make the
code considerably more complicated. (Whether we want to merge them
doesn't only depend on the block status, but possibly also on the
content of a DATA range.)

Kevin


