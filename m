Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3342420
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 13:37:14 +0200 (CEST)
Received: from localhost ([::1]:59118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb1Z3-0006j6-9i
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 07:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hb1VE-00048f-AK
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 07:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hb1QJ-0003gW-RX
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 07:28:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hb1QI-0003eF-MM; Wed, 12 Jun 2019 07:28:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 078413082E71;
 Wed, 12 Jun 2019 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-60.ams2.redhat.com
 [10.36.117.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6905282CA;
 Wed, 12 Jun 2019 11:28:08 +0000 (UTC)
Date: Wed, 12 Jun 2019 13:28:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190612112807.GB9699@localhost.localdomain>
References: <20190611134043.9524-1-kwolf@redhat.com>
 <20190611134043.9524-4-kwolf@redhat.com>
 <875zpb5j4b.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zpb5j4b.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 12 Jun 2019 11:28:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 03/11] monitor: Make MonitorQMP a child
 class of Monitor
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.06.2019 um 09:59 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Currently, struct Monitor mixes state that is only relevant for HMP,
> > state that is only relevant for QMP, and some actually shared state.
> > In particular, a MonitorQMP field is present in the state of any
> > monitor, even if it's not a QMP monitor and therefore doesn't use the
> > state.
> >
> > As a first step towards a clean separation between QMP and HMP, let
> > MonitorQMP extend Monitor and create a MonitorQMP object only when the
> > monitor is actually a QMP monitor.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> This is a bit harder to review than necessary, because it mixes the
> largely mechanical "replace QMP member by child class" with the
> necessary prerequisite "clean up to access QMP stuff only when the
> monitor is actually a QMP monitor".  I'm going to post a split.
> 
> Effectively preexisting: we go from Monitor * to MonitorQMP * without
> checking in several places.  I'll throw in assertions.

Since I don't think doing both in one patch makes review a lot harder
(and in fact think your patch 2.5 is harder to review for completeness
that the combined patch) and since both Dave and you already reviewed
the patch in its current form and I don't want to invalidate that
review, I'm going to keep it as a single patch and just squash in the
additional assertions where container_of() is used. The resulting code
is the same anyway.

Kevin

