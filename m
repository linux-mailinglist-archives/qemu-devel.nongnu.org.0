Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E381247BA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:10:41 +0100 (CET)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihZ65-000563-2Q
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ihYLd-0007XI-Qz
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:22:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ihYLc-0001D6-Bt
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:22:37 -0500
Received: from 20.mo4.mail-out.ovh.net ([46.105.33.73]:54563)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ihYLc-00010d-3D
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:22:36 -0500
Received: from player776.ha.ovh.net (unknown [10.108.54.9])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 9907721B5F1
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 13:22:33 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id C9E1CD68B869;
 Wed, 18 Dec 2019 12:22:31 +0000 (UTC)
Date: Wed, 18 Dec 2019 13:22:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 0/9] 9pfs: readdir optimization
Message-ID: <20191218132230.36cfbffc@bahia.lan>
In-Reply-To: <2173137.yh4lSEn6Y2@silver>
References: <E1ihMuX-00076B-Qf@lizzy.crudebyte.com>
 <20191218085937.53a59594@bahia.lan> <2173137.yh4lSEn6Y2@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1876030721919850816
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.33.73
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 13:05:29 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 18. Dezember 2019 08:59:37 CET you wrote:
> > Hi Christian,
> > 
> > It seems that there was an issue with the posting of these series. Threading
> > is inexistant. All the emails appear scattered and unsorted in my mailbox,
> > between 12/16 and 12/18... which is a bit painful. I'll try to find some
> > time to have a look anyway, but this greatly lowers the odds for these
> > series to get multiple reviews, which seems problematic given the ** NOTE:
> > ** section you've added to the cover. Please fix this.
> 
> Yeah, I accidentally dropped the --thread switch this night. Sorry for that.
> 
> If you want I can resend these patches as v2 or something? Like mentioned, 
> except of fixing the threading, I won't have the time to do any more polishing 
> in the next few weeks at least.
> 

Yeah please resend with the treading fixed at least.

> Best regards,
> Christian Schoenebeck
> 
> 


