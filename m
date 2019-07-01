Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3B36221
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 19:14:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYZUJ-0007ww-3v
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 13:14:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hYZSy-0007TH-3E
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 13:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hYZSi-0005VO-Go
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 13:12:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hYZSW-0004cS-3y; Wed, 05 Jun 2019 13:12:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFCF96EB8C;
	Wed,  5 Jun 2019 17:11:42 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-86.ams2.redhat.com [10.36.116.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45E04546E0;
	Wed,  5 Jun 2019 17:11:39 +0000 (UTC)
Date: Wed, 5 Jun 2019 19:11:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190605171137.GC5491@linux.fritz.box>
References: <20190605123229.92848-1-vsementsov@virtuozzo.com>
	<20190605123229.92848-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605123229.92848-3-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 05 Jun 2019 17:11:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] blockjob: use blk_new_pinned in
 block_job_create
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.06.2019 um 14:32 hat Vladimir Sementsov-Ogievskiy geschrieben:
> child_role job already has .stay_at_node=true, so on bdrv_replace_node
> operation these child are unchanged. Make block job blk behave in same
> manner, to avoid inconsistent intermediate graph states and workarounds
> like in mirror.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This feels dangerous. It does what you want it to do if the only graph
change below the BlockBackend is the one in mirror_exit_common. But the
user could also take a snapshot, or in the future hopefully insert a
filter node, and you would then want the BlockBackend to move.

To be honest, even BdrvChildRole.stay_at_node is a bit of a hack. But at
least it's only used for permissions and not for the actual data flow.

Kevin

