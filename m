Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE53C2C20FD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:18:59 +0100 (CET)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUTS-0002lj-Ex
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khUS8-0002Es-Jy
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:17:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khUS5-0003VK-Kj
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606209452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kgduawD1Mhmp8e6ovymPM2l6a6U4/pJ77FYki16+7rE=;
 b=Kwve2/qR8EZf1ILb9YKbKdmSZIWMt3y4ejdeERyTyCI4Ju2sNTmKqYMjue8TLzgQPFnoYy
 /K06noysyKn+8lmH9gJ4GervB+p2DjOkOGCG49+av6G7rQcxty6bp9lGvyPWoS4kcvf9Qp
 DdrPW3f5xVWeLLi0bkXNTdpXFcEDj9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-n98BvP6KPvW_z-7s-bHWng-1; Tue, 24 Nov 2020 04:17:30 -0500
X-MC-Unique: n98BvP6KPvW_z-7s-bHWng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86D503E75D;
 Tue, 24 Nov 2020 09:17:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-111.ams2.redhat.com [10.36.114.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 779F219C71;
 Tue, 24 Nov 2020 09:17:25 +0000 (UTC)
Date: Tue, 24 Nov 2020 10:17:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
Message-ID: <20201124091723.GA22385@merkur.fritz.box>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
 <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, zhang_youjia@126.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.2020 um 19:11 hat Maxim Levitsky geschrieben:
> On Mon, 2020-11-23 at 18:38 +0100, Kevin Wolf wrote:
> > Am 23.11.2020 um 16:49 hat Maxim Levitsky geschrieben:
> > > Commit 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
> > > introduced a subtle change to code in zero_in_l2_slice:
> > > 
> > > It swapped the order of
> > > 
> > > 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > > 2. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
> > > 3. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
> > > 
> > > To
> > > 
> > > 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > > 2. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
> > > 3. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
> > > 
> > > It seems harmless, however the call to qcow2_free_any_clusters
> > > can trigger a cache flush which can mark the L2 table as clean,
> > > and assuming that this was the last write to it,
> > > a stale version of it will remain on the disk.
> > 
> > Do you have more details on this last paragraph? I'm trying to come up
> > with a reproducer, but I don't see how qcow2_free_any_clusters() could
> > flush the L2 table cache. (It's easy to get it to flush the refcount
> > block cache, but that's useless for a reproducer.)
> > 
> > The only way I see to flush any cache with it is in update_refcount()
> > the qcow2_cache_set_dependency() call. This will always flush the cache
> > that the L2 cache depends on - which will never be the L2 cache itself,
> > but always either the refcount cache or nothing.
> > 
> > There are more options in alloc_refcount_block() if we're allocating a
> > new refcount block, but in the context of freeing clusters we'll never
> > need to do that.
> > 
> > Whatever I tried, at the end of zero_in_l2_slice(), I have a dirty L2
> > table and a dirty refcount block in the cache, with a dependency that
> > makes sure that the L2 table will be written out first.
> > 
> > If you don't have the information yet, can you try to debug your manual
> > reproducer a bit more to find out how this happens?
> I'll do this tomorrow.

As the last RC for 5.2 is today, I will send a v2 that changes the fix
to restore the original order.

We can then continue work to find a minimal reproducer and merge the
test case in the early 6.0 cycle.

Kevin


