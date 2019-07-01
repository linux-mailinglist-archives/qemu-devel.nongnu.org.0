Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D221D33FF2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 09:21:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY3kr-0003Hn-V4
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 03:21:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hY3ii-00027o-0r
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hY3We-0002aj-S1
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:06:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hY3We-0002XZ-03
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:06:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E617C3078AD8;
	Tue,  4 Jun 2019 07:06:21 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B8260570;
	Tue,  4 Jun 2019 07:06:17 +0000 (UTC)
Date: Tue, 4 Jun 2019 15:06:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190604070614.GD15459@xz-x1>
References: <20190604061727.6857-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190604061727.6857-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 04 Jun 2019 07:06:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] migratioin/ram: leave RAMBlock->bmap
 blank on allocating
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 04, 2019 at 02:17:27PM +0800, Wei Yang wrote:
> During migration, we would sync bitmap from ram_list.dirty_memory to
> RAMBlock.bmap in cpu_physical_memory_sync_dirty_bitmap().
> 
> Since we set RAMBlock.bmap and ram_list.dirty_memory both to all 1, this
> means at the first round this sync is meaningless and is a duplicated
> work.
> 
> Leaving RAMBlock->bmap blank on allocating would have a side effect on
> migration_dirty_pages, since it is calculated from the result of
> cpu_physical_memory_sync_dirty_bitmap(). To keep it right, we need to
> set migration_dirty_pages to 0 in ram_state_init().
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks for updating the comments.

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

