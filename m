Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC736DD2F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:38:23 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnCg-0004H0-9Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbnA1-0002sJ-H1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbn9z-0001Ar-5x
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wjy2TuNAowimD11QcF4B40DCawzqKi7hL8gIYLaeLUM=;
 b=jVfoibbEIEcTZ6eobK7QbHaToedzecCz29eRqmyEa8/+tZ1ydFWLaEQ8sBnxUxCOKMwnCu
 x7gOTk+TpaAb+NkxSj86qPMRngw0/lB6vFXvzmmtGX9ZkPVL0LgglSV2Y5ldGw5BUtmG8r
 RzOHDc4Q2aprCAPQQh3MWqUjV+rj+zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-nn4u9FWpNvi4ncMekz7avA-1; Wed, 28 Apr 2021 12:35:30 -0400
X-MC-Unique: nn4u9FWpNvi4ncMekz7avA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760711009632;
 Wed, 28 Apr 2021 16:35:29 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C2EA6064B;
 Wed, 28 Apr 2021 16:35:14 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:35:13 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 00/15] RAM_NORESERVE, MAP_NORESERVE and hostmem
 "reserve" property
Message-ID: <20210428163513.sx6rim2s7tkz5ss7@habkost.net>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421210611.wradfrdrbw6ebcdn@habkost.net>
 <df7ac86b-7371-5518-9914-f24e9efc91f8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <df7ac86b-7371-5518-9914-f24e9efc91f8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 12:35:35PM +0200, David Hildenbrand wrote:
> On 21.04.21 23:06, Eduardo Habkost wrote:
> > On Wed, Apr 21, 2021 at 02:26:09PM +0200, David Hildenbrand wrote:
> > > Based-on: 20210406080126.24010-1-david@redhat.com
> > > 
> > > Some cleanups previously sent in other context (resizeable allocations),
> > > followed by RAM_NORESERVE, implementing it under Linux using MAP_NORESERVE,
> > > and letting users configure it for memory backens using the "reserve"
> > > property (default: true).
> > > 
> > > MAP_NORESERVE under Linux has in the context of QEMU an effect on
> > > 1) Private/shared anonymous memory
> > > -> memory-backend-ram,id=mem0,size=10G
> > > 2) Private fd-based mappings
> > > -> memory-backend-file,id=mem0,size=10G,mem-path=/dev/shm/0
> > > -> memory-backend-memfd,id=mem0,size=10G
> > > 3) Private/shared hugetlb mappings
> > > -> memory-backend-memfd,id=mem0,size=10G,hugetlb=on,hugetlbsize=2M
> > > 
> > > With MAP_NORESERVE/"reserve=off", we won't be reserving swap space (1/2) or
> > > huge pages (3) for the whole memory region.
> > > 
> > > The target use case is virtio-mem, which dynamically exposes memory
> > > inside a large, sparse memory area to the VM. MAP_NORESERVE tells the OS
> > > "this mapping might be very sparse". This essentially allows
> > > avoiding having to set "/proc/sys/vm/overcommit_memory == 1") when using
> > > virtio-mem and also supporting hugetlbfs in the future.
> > 
> > For the memory backend and machine core code:
> > 
> > Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> > 
> 
> Thanks Eduardo. I assume Paolo will be the right maintainer to pick this up?
> (I hope he'll have time to look at this and some of my
> pending-for-a-long-time series soon :( )

I can pick it up (or you could merge it through your tree if you
prefer), but I would like to get at least an Acked-by from Paolo
first.

On the other hand, maybe v7 is mature enough to not require
waiting too much longer.

-- 
Eduardo


