Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD52BF14
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 08:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVVK8-0004Az-US
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 02:11:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVVJ1-0003j9-Mb
	for qemu-devel@nongnu.org; Tue, 28 May 2019 02:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVVJ0-0003y5-P9
	for qemu-devel@nongnu.org; Tue, 28 May 2019 02:09:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVVJ0-0003xH-KB
	for qemu-devel@nongnu.org; Tue, 28 May 2019 02:09:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B658B85539;
	Tue, 28 May 2019 06:09:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 464675F9C0;
	Tue, 28 May 2019 06:09:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8507416E08; Tue, 28 May 2019 08:09:46 +0200 (CEST)
Date: Tue, 28 May 2019 08:09:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190528060946.bujmnhmbokascf3r@sirius.home.kraxel.org>
References: <20190409161009.6322-1-marcandre.lureau@redhat.com>
	<87sgt7sxhy.fsf@dusky.pond.sub.org>
	<CAJ+F1CJ6hpQZf6199_-rAW98HwEssNT_kXBJF9he9NZFvWaGPA@mail.gmail.com>
	<87tvdlhakq.fsf@dusky.pond.sub.org>
	<CAJ+F1CJLuNVu_aWPjQtFwP_tLMqn=vd_gCtW7SWZWdhYMF6H7w@mail.gmail.com>
	<87blzo1fa5.fsf@dusky.pond.sub.org>
	<20190527090731.uohmamahlg53bu77@sirius.home.kraxel.org>
	<87pno46ngf.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pno46ngf.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 28 May 2019 06:09:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 00/20] monitor: add asynchronous command
 type
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
	John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > This is not meant for some long-running job which you have to manage.
> >
> > Allowing commands being asynchronous makes sense for things which (a)
> > typically don't take long, and (b) don't need any management.
> >
> > So, if the connection goes down the job is simply canceled, and after
> > reconnecting the management can simply send the same command again.
> 
> Is this worth its own infrastructure?
> 
> Would you hazard a guess on how many commands can take long enough to
> demand a conversion to asynchronous, yet not need any management?

Required:
  screendump with qxl (needs round-drop to spice-server display thread
  for fully up-to-date screen content, due to lazy rendering).

Nice to have:
  Move anything which needs more than a milisecond to a thread or
  coroutine, so we avoid monitor commands causing guest-visible latency
  spikes due to holding the big qemu lock for too long.

  From a quick scan through monitor help hot candidates are screendump
  and pmemsave because they might write rather large data files.

  Dunno about savevm/loadvm.  I think they stop the guest anyway.  So
  moving them to async probably doesn't buy us much, at least from a
  latency point of view.

cheers,
  Gerd


