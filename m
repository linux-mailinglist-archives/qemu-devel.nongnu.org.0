Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD182C12FE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:25:46 +0100 (CET)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGX3-0004ND-8k
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khGV9-00030d-9K
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khGV7-0003zC-Ji
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606155824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRS/abP6x0NA22Yn+D+ZEef2qNDdTH1GLQLJ2kgefek=;
 b=fXKgoS3cjUDd+2Z/cI4ladsAbka2/QSsnXfGdCmW9qdYY/G8sNzNq7vfLvps3KHvil8pxP
 5ddtXb1iZTcvDMj9lYNjDnkVh7RWkCupic6B0vvE+EZEs7qqNvbcs7QjEb6zvqU121wnkc
 DQwD2m0x5IhFLw16NPHStMy+/RGZ8os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-VKQ2bQU_N5OoTXfJQd8DEg-1; Mon, 23 Nov 2020 13:23:42 -0500
X-MC-Unique: VKQ2bQU_N5OoTXfJQd8DEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6712C18C43C1;
 Mon, 23 Nov 2020 18:23:41 +0000 (UTC)
Received: from starship (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F22A6062F;
 Mon, 23 Nov 2020 18:23:37 +0000 (UTC)
Message-ID: <def9381b8e122301e14b7330c7eb939c5ded02e2.camel@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>
Date: Mon, 23 Nov 2020 20:23:36 +0200
In-Reply-To: <w51mtz8541b.fsf@maestria.local.igalia.com>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123160941.GD5317@merkur.fritz.box>
 <w51mtz8541b.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, zhang_youjia@126.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-23 at 19:20 +0100, Alberto Garcia wrote:
> On Mon 23 Nov 2020 05:09:41 PM CET, Kevin Wolf wrote:
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
> 
> Ouch :( Good catch!
> 
> > > -        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > >          if (unmap) {
> > >              qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
> > >          }
> > >          set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
> > > +        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> > 
> > Good catch, but I think your order is wrong, too. We need the original
> > order from before 205fa50750:
> > 
> > 1. qcow2_cache_entry_mark_dirty()
> >    set_l2_entry() + set_l2_bitmap()
> > 
> > 2. qcow2_free_any_cluster()
> 
> I agree with Kevin on this.

I also agree, I haven't thought about this.

Best regards,
	Maxim Levitsky
> 
> Berto
> 



