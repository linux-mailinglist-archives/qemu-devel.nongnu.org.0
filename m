Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EA5B4FF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 08:24:06 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhpjR-0007WJ-Rr
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 02:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hhpic-00071N-OC
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 02:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hhpib-0003Cx-Dq
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 02:23:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hhpiZ-0002r5-5v; Mon, 01 Jul 2019 02:23:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6150D30821DF;
 Mon,  1 Jul 2019 06:22:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5196A97C;
 Mon,  1 Jul 2019 06:22:38 +0000 (UTC)
Date: Mon, 1 Jul 2019 08:22:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Message-ID: <20190701062237.GA6377@localhost.localdomain>
References: <20190627135914.xlzohrdwr6mz2aq3@perseus.local>
 <4453cfc4-cff7-c004-1f4c-7cab462e4661@virtuozzo.com>
 <w51a7e3domn.fsf@maestria.local.igalia.com>
 <434b102d-9d8e-ccc2-cb53-7f49a3fbd6fb@virtuozzo.com>
 <w51r27dixcm.fsf@maestria.local.igalia.com>
 <20190628145708.GN5179@dhcp-200-226.str.redhat.com>
 <w51o92hiwi2.fsf@maestria.local.igalia.com>
 <20190628150911.GP5179@dhcp-200-226.str.redhat.com>
 <w51imspiw0u.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51imspiw0u.fsf@maestria.local.igalia.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 01 Jul 2019 06:22:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] Re-evaluating subcluster allocation for
 qcow2 images
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
Cc: Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.06.2019 um 17:12 hat Alberto Garcia geschrieben:
> On Fri 28 Jun 2019 05:09:11 PM CEST, Kevin Wolf wrote:
> > Am 28.06.2019 um 17:02 hat Alberto Garcia geschrieben:
> >> On Fri 28 Jun 2019 04:57:08 PM CEST, Kevin Wolf wrote:
> >> > Am 28.06.2019 um 16:43 hat Alberto Garcia geschrieben:
> >> >> On Thu 27 Jun 2019 06:05:55 PM CEST, Denis Lunev wrote:
> >> >> > Please note, I am not talking now about your case with COW. Here the
> >> >> > allocation is performed on the sub-cluster basis, i.e. the abscence of
> >> >> > the sub-cluster in the image means hole on that offset. This is
> >> >> > important difference.
> >> >> 
> >> >> I mentioned the possibility that if you have a case like 2MB / 64KB
> >> >> and you write to an empty cluster then you could allocate the
> >> >> necessary subclusters, and additionally fallocate() the space of the
> >> >> whole cluster (2MB) in order to try to keep it contiguous.
> >> >> 
> >> >> With this we would lose the space saving advantage of having
> >> >> subclusters. But perhaps that would work for smaller cluster sizes
> >> >> (it would mitigate the fragmentation problem).
> >> >
> >> > There seem to be use cases for both ways. So does this need to be an
> >> > option?
> >> 
> >> Probably a runtime option, or a heuristic that decides what to do
> >> depending on the cluster size.
> >
> > How would the heuristic decide whether the user wants to save disk space
> > or whether they consider avoiding fragmentation (i.e. performance) more
> > important?
> 
> Well I suppose the fragmentation problem is more important when you have
> small clusters and less so when you have large clusters, so that would
> be a way to do it.

On the other hand, if the user cares about fragmentation, they will
probably use large clusters, and if they care about disk space, they
will probably use smaller clusters.

> Of course with an option the user would have the final choice.

Ah, okay, if it's only a default, then guessing wrong isn't as much of a
problem.

Kevin

