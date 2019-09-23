Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088BBB594
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 15:39:54 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOZF-0005qn-JZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 09:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iCOWU-0003Dw-P1
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iCOWT-0006aR-KW
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:37:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iCOWT-0006aC-FG
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:37:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6F623D966;
 Mon, 23 Sep 2019 13:37:00 +0000 (UTC)
Received: from work-vm (ovpn-117-213.ams2.redhat.com [10.36.117.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DDD5601A2;
 Mon, 23 Sep 2019 13:36:59 +0000 (UTC)
Date: Mon, 23 Sep 2019 14:36:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/2] migration test tweeks
Message-ID: <20190923133657.GE2822@work-vm>
References: <20190923131022.15498-1-dgilbert@redhat.com>
 <20190923132407.GA28074@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923132407.GA28074@xz-x1>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 23 Sep 2019 13:37:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Mon, Sep 23, 2019 at 02:10:20PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Alex noticed that some of the postcopy tests would occasionally
> > hang; this series adds some checks to make them more likely
> > to assert than hang in some failure cases, and changes
> > the migration bandwidth so that under load it's much more likely
> > to manage to land in postcopy.
> > 
> > Dr. David Alan Gilbert (2):
> >   tests/migration: Fail on unexpected migration states
> >   tests/migration/postcopy: trim migration bandwidth
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> I might be even more aggresive on patch 2 when turning down the
> bandwidth. :)
> 
> Another thing I thought about on the hang issue is that maybe we can
> give a timeout for the waits and when the timeout triggers before a
> directly assert in the test case we send sigabrt to QEMU (just like
> what kill_qemu does) then we could have a chance to see the cores.
> Not sure whether that could help, though.

Yes I might need to add that; I can see there's another hang somewhere
even with these two patches.
(I *think* it's at the end while it's waiting for completion after
resumption - but I've not figured out what's going on yet).

Dave

> Regards,
> 
> -- 
> Peter Xu
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

