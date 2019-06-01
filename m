Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175CB31922
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jun 2019 04:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWu6H-00055Y-Gu
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 22:50:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hWu5G-0004lb-NC
	for qemu-devel@nongnu.org; Fri, 31 May 2019 22:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hWtxY-0004N5-25
	for qemu-devel@nongnu.org; Fri, 31 May 2019 22:41:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hWtxX-0004MC-TN
	for qemu-devel@nongnu.org; Fri, 31 May 2019 22:41:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4FC43179B49
	for <qemu-devel@nongnu.org>; Sat,  1 Jun 2019 02:41:25 +0000 (UTC)
Received: from xz-x1 (ovpn-12-71.pek2.redhat.com [10.72.12.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47BBC19C69;
	Sat,  1 Jun 2019 02:41:21 +0000 (UTC)
Date: Sat, 1 Jun 2019 10:41:15 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190601024115.GA4958@xz-x1>
References: <20190530092919.26059-1-peterx@redhat.com>
	<20190530092919.26059-5-peterx@redhat.com>
	<87a7f2ok0m.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a7f2ok0m.fsf@trasno.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sat, 01 Jun 2019 02:41:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 04/12] memory: Don't set migration
 bitmap when without migration
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 31, 2019 at 03:01:29PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Similar to 9460dee4b2 ("memory: do not touch code dirty bitmap unless
> > TCG is enabled", 2015-06-05) but for the migration bitmap - we can
> > skip the MIGRATION bitmap update if migration not enabled.
> >
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> But if we ever decide to _not_ dirty all the bitmap at start (only used
> pages) we need to fix this.

Right, but IMHO we can never avoid doing it, because kvm (and also the
per-ramblock dirty bitmaps) will only capture "dirtied pages" after
log sync has started.  One example is what if one page P is never been
touched after log_sync?  Then in kvm dirty log it'll never be set, and
the only way to make sure we will still migrate that page P (that
could be touched before log_sync so it might still contain valid data
rather than a zero page) is to dirty all the pages at the start of
migration (for now, it's ram_list_init_bitmaps).

Thanks for the review!

-- 
Peter Xu

