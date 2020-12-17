Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D862DD842
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:27:30 +0100 (CET)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxzt-0005MD-5f
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kpxu0-0003Zm-Kx
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:21:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kpxty-0007Nf-6H
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:21:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 36584405D1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 21:21:10 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 661D57C
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 21:21:10 +0300 (MSK)
To: qemu-devel <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Logging, abnormal cases, ...
Message-ID: <5517eec6-1b0f-7c36-c1a7-61bd24bfb6cd@msgid.tls.msk.ru>
Date: Thu, 17 Dec 2020 21:21:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

I want to bring a topic which is mostly neglected in qemu but it is
one of very important, especially for serious usage of qemu.

This is about logging of various events or even some unexpected events
coming from guest.

Let's see for example a very easy to understand situation: a virtual
disk image of a VM runs out of space _on the host_, so that qemu does
not have space to write newly allocated blocks to.  What does it do?
By default it pauses the VM and just sits there waiting. But does it
lets someone to know that it run onto something which it can't handle?
Does it write at least some information about it somewhere?

I know this very situation should not happen in any serious environment
to start with, but everything happens, and the should ring a very loud
bell somewhere so that people can react sooner than later after numerous
attempt to _understand_ what's going on.

What I'm talking about is that we should have some standard way of
logging such events, at least, or a way of notifying something about these.
Including for example start/stop, suspend/resume, migration out/migration
in etc - while these might look like a job of some management layer on
top of qemu (like libvirt), it's still better do that in qemu so that
all possible tools using it will benefit.

But it is not restricted to such global events like outlined already,
there are much more interesting cases there. For another example,
there's a lot of places where qemu checks validity of various requests
coming to virtual hardware it emulates, - so that DMA is done to a
valid address, register holds valid index, etc etc. A majority of
these checks results in a simple error return or even abort().
But it'd be very interesting to be able to log these events, maybe
with some context, and be able to turn that logging on/off at runtime.

The thing is - there ara at least 2 types of guests out there, one
is possible "hostile" - this is what all the recent CVEs are about,
it is possible to abuse qemu in one way or another by doing some
strange things within a guest. And another is entirely different -
a "friendly" guest which is here just for easy management, so that
various migrations, expansions and reconfigurations are possible.
And there, it should not do evil things, and if it does, we'd better
know about that, as it is a possible bug which might turn into a
smoking gun one day.

The other day we had a quite bad system crash in a VMWare environment
which resulted in a massive data loss, interruption of service and
lots of really hard work for everyone.  A crash which actually started
after vmware side discovered that it does not have any place where to
put a new write for a (production, "friendly") guest. After that issue
were fixed, there were several more conditions _like_ this happened, -
not with lack of free space, but with the same freezing, vmware stopped
the guest for a few seconds several times, and I've seen brief change
in the guest's icon color (turning to red) in the monitor at least twice,
during these freezes. But there's nothing in the logs - *why* it stopped
the guest, what happened?? - nothing's left.  And finally it crashed
hard after live-migrating the VM into another host with larger capacity
storage - at the moment the migration finished, the VM freeze for a few
seconds, there was tons of kernel messages about stuck processes and
kernel threads after that, and, among other things, there were a few
error messages about failed writes into the (virtual) storage. Which,
in turn, hit some bugs in oracle and finally the db become corrupt and
oracle instance refused to open it in any way, crashing with sigsegvs
at startup, so we had to resort to the harder way.

The thing was that there was absolutely nothing on the vmware side,
even the fact of migration weren't obvious in its logs. I bet there
were some inconsistences within data request handling from the guest
at least, or if system clocks were different this could have been
logged too, or anything else not-so-expected. But there's nothing,
so we don't sill know what happened. Sure it is a bug somewhere,
maybe several bugs at once (vmware tools are running in the vm and
the hypervisor surely can assume a safe state of the vm while doing
last steps of the migration, oracle should not sigsegv on bad blocks,
and so on). But if there were logs, we had at least some chance to
debug and maybe fix it, or to work around this if fixing isn't possible.
But there's nothing.

I think we can do much better in qemu.

Comments?

Thanks,

/mjt

