Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81A246425
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 12:11:27 +0200 (CEST)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7c6w-0003ZA-RV
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 06:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7c61-0002vg-Dq
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 06:10:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44483
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7c5y-0006Tq-JU
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 06:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597659025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0S9dELHctsr0xLhkBaCmqhqqVe7Wgm6WREL/3d+ksk=;
 b=bpNp8c/U2mSOj4uH8ZXIvkGRj7BLQ0dpsV2Mk5WrveApo8WKexfY/I/Cjx40g6N8uMgVXj
 Zaufh8af8wVwqxHrvtUpt6vyDjiV0nFhCzN+nWHxVd4nkEx8kKvvP8gkJ1IwEDpmc9QJxG
 T+5Fys7xkmnFlvliDf6WH30Uc9GfPXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-PPcGNad4PsCz7-zQMg00Zw-1; Mon, 17 Aug 2020 06:10:23 -0400
X-MC-Unique: PPcGNad4PsCz7-zQMg00Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B8C51006703;
 Mon, 17 Aug 2020 10:10:22 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A32821E82;
 Mon, 17 Aug 2020 10:10:20 +0000 (UTC)
Date: Mon, 17 Aug 2020 12:10:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
Message-ID: <20200817101019.GD11402@linux.fritz.box>
References: <cover.1597416317.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <cover.1597416317.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.08.2020 um 16:57 hat Alberto Garcia geschrieben:
> Hi,
> 
> the patch is self-explanatory, but I'm using the cover letter to raise
> a couple of related questions.
> 
> Since commit c8bb23cbdbe / QEMU 4.1.0 (and if the storage backend
> allows it) writing to an image created with preallocation=metadata can
> be slower (20% in my tests) than writing to an image with no
> preallocation at all.

A while ago we had a case where commit c8bb23cbdbe was actually reported
as a major performance regression, so it's a big "it depends".

XFS people told me that they consider this code a bad idea. Just because
it's a specialised "write zeroes" operation, it's not necessarily fast
on filesystems. In particular, on XFS, ZERO_RANGE causes a queue drain
with O_DIRECT (probably hurts cases with high queue depths) and
additionally even a page cache flush without O_DIRECT.

So in a way this whole thing is a two-edged sword.

> So:
> 
> a) shall we include a warning in the documentation ("note that this
>    preallocation mode can result in worse performance")?

To be honest, I don't really understand this case yet. With metadata
preallocation, the clusters are already marked as allocated, so why
would handle_alloc_space() even be called? We're not allocating new
clusters after all?

Or are you saying that ZERO_RANGE + pwrite on a sparse file (= cluster
allocation) is faster for you than just the pwrite alone (= writing to
already allocated cluster)?

> b) why don't we also initialize preallocated clusters with
>    QCOW_OFLAG_ZERO? (at least when there's no subclusters involved,
>    i.e. no backing file). This would make reading from them (and
>    writing to them, after this patch) faster.

Because the idea with metadata preallocation is that you don't have to
perform any COW and update any metdata because everything is already
allocated. If you set the zero flag, you get cluster allocations with
COW again, defeating the whole purpose of the preallocation.

Kevin


