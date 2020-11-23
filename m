Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C42C12F1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:15:47 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGNN-0005GU-Sz
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khGJu-0002ln-Fo
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khGJs-0008J5-Bh
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606155126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRsWDADpHtNKAP6L/gK+z4PZjiFnpgyt2TYRo0TRgwk=;
 b=ZdEbQ92lbm/goGur82wQDcItiUI0+AjlJm2rUozfwbqIBUS7sP/zxQrpQfh6cG74WpXW4u
 ZSdqKT5ZeJlmxqBvKNZDHoaJqejHY4UEvdhwGarjq+zYhjcj5N+RbvLLYLWDKrq4ytA6kW
 EAPmSvOPcLS62zj3FAL8Sz0qWFb4o8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-V6lqNApBOGSInXhfv086BA-1; Mon, 23 Nov 2020 13:11:57 -0500
X-MC-Unique: V6lqNApBOGSInXhfv086BA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7877F18C89C4;
 Mon, 23 Nov 2020 18:11:56 +0000 (UTC)
Received: from starship (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A6655D705;
 Mon, 23 Nov 2020 18:11:52 +0000 (UTC)
Message-ID: <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Date: Mon, 23 Nov 2020 20:11:51 +0200
In-Reply-To: <20201123173853.GE5317@merkur.fritz.box>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, zhang_youjia@126.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-23 at 18:38 +0100, Kevin Wolf wrote:
> Am 23.11.2020 um 16:49 hat Maxim Levitsky geschrieben:
> > Commit 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
> > introduced a subtle change to code in zero_in_l2_slice:
> > 
> > It swapped the order of
> > 
> > 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > 2. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
> > 3. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
> > 
> > To
> > 
> > 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > 2. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
> > 3. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
> > 
> > It seems harmless, however the call to qcow2_free_any_clusters
> > can trigger a cache flush which can mark the L2 table as clean,
> > and assuming that this was the last write to it,
> > a stale version of it will remain on the disk.
> 
> Do you have more details on this last paragraph? I'm trying to come up
> with a reproducer, but I don't see how qcow2_free_any_clusters() could
> flush the L2 table cache. (It's easy to get it to flush the refcount
> block cache, but that's useless for a reproducer.)
> 
> The only way I see to flush any cache with it is in update_refcount()
> the qcow2_cache_set_dependency() call. This will always flush the cache
> that the L2 cache depends on - which will never be the L2 cache itself,
> but always either the refcount cache or nothing.
> 
> There are more options in alloc_refcount_block() if we're allocating a
> new refcount block, but in the context of freeing clusters we'll never
> need to do that.
> 
> Whatever I tried, at the end of zero_in_l2_slice(), I have a dirty L2
> table and a dirty refcount block in the cache, with a dependency that
> makes sure that the L2 table will be written out first.
> 
> If you don't have the information yet, can you try to debug your manual
> reproducer a bit more to find out how this happens?
I'll do this tomorrow.
Best regards,
	Maxim Levitsky

> 
> Kevin
> 
> > Now we have a valid L2 entry pointing to a freed cluster. Oops.
> > 
> > Fixes: 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  block/qcow2-cluster.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> > index 485b4cb92e..267b46a4ca 100644
> > --- a/block/qcow2-cluster.c
> > +++ b/block/qcow2-cluster.c
> > @@ -2010,11 +2010,11 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
> >              continue;
> >          }
> >  
> > -        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> >          if (unmap) {
> >              qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
> >          }
> >          set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
> > +        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> >          if (has_subclusters(s)) {
> >              set_l2_bitmap(s, l2_slice, l2_index + i, new_l2_bitmap);
> >          }
> > -- 
> > 2.26.2
> > 



