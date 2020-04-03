Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3519DBBE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 18:32:38 +0200 (CEST)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKPFE-0002bf-ER
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 12:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jKPEP-00026f-3Y
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 12:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jKPEO-0002GM-2H
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 12:31:45 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:51303)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1jKPEK-00020n-Eu; Fri, 03 Apr 2020 12:31:41 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 8B4464297A;
 Fri,  3 Apr 2020 18:31:37 +0200 (CEST)
Date: Fri, 3 Apr 2020 18:31:35 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <1466731307.175.1585931495885@webmail.proxmox.com>
In-Reply-To: <20200403084729.GB5336@linux.fritz.box>
References: <20200401181256.GB27663@linux.fritz.box>
 <1403939459.52.1585765681569@webmail.proxmox.com>
 <20200401184431.GD27663@linux.fritz.box>
 <903538836.29.1585818619688@webmail.proxmox.com>
 <20200402121403.GB4006@linux.fritz.box>
 <20200402142524.GD4006@linux.fritz.box>
 <1043934808.59.1585842050330@webmail.proxmox.com>
 <20200402164744.GE4006@linux.fritz.box>
 <20200402171007.GF4006@linux.fritz.box>
 <2091214547.43.1585902379938@webmail.proxmox.com>
 <20200403084729.GB5336@linux.fritz.box>
Subject: Re: bdrv_drained_begin deadlock with io-threads
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev23
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Cc: qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On April 3, 2020 10:47 AM Kevin Wolf <kwolf@redhat.com> wrote:
> 
>  
> Am 03.04.2020 um 10:26 hat Dietmar Maurer geschrieben:
> > > With the following patch, it seems to survive for now. I'll give it some
> > > more testing tomorrow (also qemu-iotests to check that I didn't
> > > accidentally break something else.)
> > 
> > Wow, that was fast! Seems your patch fixes the bug!
> > 
> > I wonder what commit introduced that problem, maybe:
> > 
> > https://github.com/qemu/qemu/commit/cf3129323f900ef5ddbccbe86e4fa801e88c566e#diff-7cb66df56045598b75a219eebc27efb6
> > 
> > If so, version 4.1.X in not affected by this bug, but 4.2.0 and later?
> 
> Yes, I'm pretty sure that's the one.

I also wonder if we can loose an aio_wait_kick() by directly accessing blk->in_flight.
I thought this should use atomic_mb_read()?

diff --git a/block/block-backend.c b/block/block-backend.c
index 8b8f2a80a0..48f3721505 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2275,7 +2275,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     assert(blk->quiesce_counter);
-    return !!blk->in_flight;
+    return !!atomic_mb_read(&blk->in_flight);
 }
 
 static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)


