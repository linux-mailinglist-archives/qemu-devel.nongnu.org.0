Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7BCFB95
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 15:49:19 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHprb-0006UR-0H
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 09:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iHpqA-0005t1-MU
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iHpq9-0006fJ-5W
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:47:50 -0400
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:59558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iHpq8-0006ah-VH
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:47:49 -0400
Received: from player734.ha.ovh.net (unknown [10.108.54.36])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 88B496BC0B
 for <qemu-devel@nongnu.org>; Tue,  8 Oct 2019 15:47:40 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id E0ACFAA6D878;
 Tue,  8 Oct 2019 13:47:32 +0000 (UTC)
Date: Tue, 8 Oct 2019 15:47:29 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [Qemu-devel] [PATCH v7 0/3] 9p: Fix file ID collisions
Message-ID: <20191008154729.5b16ef26@bahia.lan>
In-Reply-To: <2456208.kOTvEbKLdM@silver>
References: <cover.1567680121.git.qemu_oss@crudebyte.com>
 <1590425.yRI6RxI3rl@silver> <20191008111459.048e659f@bahia.lan>
 <2456208.kOTvEbKLdM@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10627369224858409280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.42.102
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Antonios Motakis <antonios.motakis@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Oct 2019 14:05:28 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 8. Oktober 2019 11:14:59 CEST Greg Kurz wrote:
> > > No, it is not a feature. It is still a fix. :) I cannot use 9p without
> > > this
> > > fix at all, so it is not some optional "feature" for me.
> > 
> > I understand your need but this is still arguable. The 9p device has
> > a limitation with cross-device setups. The actual bug is to silently
> > cause inode number collisions in the guest. This is partly fixed by the
> > "9p: Treat multiple devices on one export as an error" patch. Thinking
> > again, it would even make sense to move "remap" from "9p: Added virtfs
> > option 'multidevs=remap|forbid|warn'" to its own patch. We could then
> > consider that the bug is fully fixed with "multidevs=forbid|warn".
> > 
> > Then comes the "remap" feature which is expected to lift the limitation
> > with cross-device setups, with a "not yet determined" performance cost
> > and light reviewing of the code.
> 
> Are these patch transfer requests addressed at me to be done?
> 

It would certainly be appreciated :) and if it happens to be done
before 2019-10-29, it can even be shipped with QEMU 4.2.

> > Also, I strongly recommend you try out "virtio-fs" which is
> > going to be soon the production grade way of sharing files
> > between host and guest.
> > 
> > https://www.mail-archive.com/libvir-list@redhat.com/msg182457.html
> 
> Yes I know, I am following the development of virtio-fs already of course. 
> However for me it is far too early to actually use it in a production 
> environment. It e.g. seems to require bleeding edge kernel versions. And the 
> real argument for switching from 9p to virtio-fs would be a significant 
> performance increase. However so far (correct me if I am wrong) I have not 
> seen benchmarks that would show that this was already the case (yet).
> 
> I wonder though whether virtio-fs suffers from the same file ID collisions 
> problem when sharing multiple file systems.
> 

I don't know.

> What is your long-term plan for 9p? Will it be dropped completely after 
> virtio-fs became stable?
> 

No, 9p will survive. The local backend has an advantage despite its various
limitations: it is really easy to use. No extra command needed. I also want
to keep the synth backend around for testing, but I'll gladly drop the
proxy backend which is clearly superseded by virtio-fs.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 

