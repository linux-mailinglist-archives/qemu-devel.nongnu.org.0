Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7889F98
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 15:24:33 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxAJM-0002iU-E7
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 09:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hxAIt-0002Bg-1q
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hxAIs-00067q-4m
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:24:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hxAIp-00065x-QP; Mon, 12 Aug 2019 09:23:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D22FC3CA0B;
 Mon, 12 Aug 2019 13:23:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-66.ams2.redhat.com
 [10.36.116.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0246E3849;
 Mon, 12 Aug 2019 13:23:53 +0000 (UTC)
Date: Mon, 12 Aug 2019 15:23:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190812132352.GA6400@localhost.localdomain>
References: <6826e3c2-bc6e-b2a2-1bf1-3ed31079f0ee@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6826e3c2-bc6e-b2a2-1bf1-3ed31079f0ee@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 12 Aug 2019 13:23:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] backup bug or question
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.08.2019 um 15:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi!
> 
> Hmm, hacking around backup I have a question:
> 
> What prevents guest write request after job_start but before setting
> write notifier?
> 
> code path:
> 
> qmp_drive_backup or transaction with backup
> 
>     job_start
>        aio_co_enter(job_co_entry) /* may only schedule execution, isn't it ? */
> 
> ....
> 
> job_co_entry
>     job_pause_point() /* it definitely yields, isn't it bad? */
>     job->driver->run() /* backup_run */
> 
> ----
> 
> backup_run()
>     bdrv_add_before_write_notifier()
> 
> ...
> 
> And what guarantees we give to the user? Is it guaranteed that write notifier is
> set when qmp command returns?
> 
> And I guess, if we start several backups in a transaction it should be guaranteed
> that the set of backups is consistent and correspond to one point in time...

Do the patches to switch backup to a filter node solve this
automatically because that node would be inserted in
backup_job_create()?

Kevin

