Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B1A55B9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 14:16:28 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4lFz-000151-DC
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 08:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i4lEZ-0000LA-Ln
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 08:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i4lEY-0003uH-CQ
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 08:14:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i4lET-0003rE-MZ; Mon, 02 Sep 2019 08:14:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D241B83BDD;
 Mon,  2 Sep 2019 12:14:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-189.ams2.redhat.com
 [10.36.116.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8B3610016EA;
 Mon,  2 Sep 2019 12:14:48 +0000 (UTC)
Date: Mon, 2 Sep 2019 14:14:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190902121447.GC13140@localhost.localdomain>
References: <20190814100735.24234-1-vsementsov@virtuozzo.com>
 <20190814100735.24234-3-vsementsov@virtuozzo.com>
 <de4667c2-7fd7-932d-6ce3-9844f284a0b4@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4667c2-7fd7-932d-6ce3-9844f284a0b4@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 02 Sep 2019 12:14:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] qapi: deprecate implicit filters
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
Cc: Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.08.2019 um 11:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 14.08.2019 13:07, Vladimir Sementsov-Ogievskiy wrote:
> > To get rid of implicit filters related workarounds in future let's
> > deprecate them now.
> 
> Interesting, could we deprecate implicit filter without deprecation of
> unnecessity of parameter? As actually, it's good when this parameter
> is not necessary, in most cases user is not interested in node-name.

A modern client is supposed to be interested in node-names. We basically
expect it to manage the whole block graph at a node level, so it should
certainly make sure to know the node-name of every node. It will need it
to take snapshots, insert filter drivers or anything like this on top of
the implicit node.

So once we make the option mandatory (which means returning an error for
legacy clients that don't do node-level management), I don't see a good
reason to ever make it optional again.

Kevin

