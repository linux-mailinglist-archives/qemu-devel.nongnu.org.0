Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9259775
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 11:27:39 +0200 (CEST)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgnAQ-0006DN-RM
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 05:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hgn7W-0004YM-A8
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 05:24:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hgn7V-0004ef-7G
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 05:24:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59262)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hgn7S-0004cY-Pw; Fri, 28 Jun 2019 05:24:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14A13307E040;
 Fri, 28 Jun 2019 09:24:34 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3CCB60920;
 Fri, 28 Jun 2019 09:24:30 +0000 (UTC)
Date: Fri, 28 Jun 2019 11:24:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190628092429.GB5179@dhcp-200-226.str.redhat.com>
References: <20190626215301.30733-1-jsnow@redhat.com>
 <20190627083453.GC5618@localhost.localdomain>
 <5a374041-10a2-5ae3-6db1-966c7589b1cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a374041-10a2-5ae3-6db1-966c7589b1cd@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 28 Jun 2019 09:24:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] block/qcow: Improve error when opening
 qcow2 files as qcow
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
Cc: Qemu-Trivial <qemu-trivial@nongnu.org>, radmehrsaeed7@gmail.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.06.2019 um 19:17 hat John Snow geschrieben:
> 
> 
> On 6/27/19 4:34 AM, Kevin Wolf wrote:
> > Am 26.06.2019 um 23:53 hat John Snow geschrieben:
> >> Reported-by: radmehrsaeed7@gmail.com
> >> Fixes: https://bugs.launchpad.net/bugs/1832914
> >> Signed-off-by: John Snow <jsnow@redhat.com>
> >> ---
> >>  block/qcow.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/block/qcow.c b/block/qcow.c
> >> index 6dee5bb792..a9cb6ae0bd 100644
> >> --- a/block/qcow.c
> >> +++ b/block/qcow.c
> >> @@ -156,7 +156,12 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
> >>          goto fail;
> >>      }
> >>      if (header.version != QCOW_VERSION) {
> >> -        error_setg(errp, "Unsupported qcow version %" PRIu32, header.version);
> >> +        error_setg(errp, "qcow (v%d) does not support qcow version %" PRIu32,
> >> +                   QCOW_VERSION, header.version);
> >> +        if (header.version == 2 || header.version == 3) {
> >> +            error_append_hint(errp, "Try the 'qcow2' driver instead.");
> > 
> > I think we want a \n at the end here.
> > 
> 
> D'oh.
> 
> > Kevin
> 
> Can a maintainer pretty-please make the edit?

A maintainer did that now. (read: thanks, applied)

Kevin

