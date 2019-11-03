Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DADED302
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Nov 2019 12:04:54 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRDgj-0000br-3o
	for lists+qemu-devel@lfdr.de; Sun, 03 Nov 2019 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1iRDfj-00005g-CZ
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 06:03:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iRDfi-0003cN-5G
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 06:03:51 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:40468)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iRDfh-0003bw-K7
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 06:03:50 -0500
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id D1E704BBD9;
 Sun,  3 Nov 2019 22:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1572779027;
 bh=wLLwT2MRptkCIJ3CqY2xGjkNuA3nvdR8pumBuNtXC8M=;
 h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
 b=W8FEJ5YEAUVTsqPiHDx7prk/tBW4dApCFLkdE0Qz1HjDb4zPiDj220GmotIryBmQL
 4fWCVjfo9tOe48XNZG8MsI4/8QeYlkXIJPO2rvsJS8/hAesxVPGlmXuJa/gKWY8N0I
 uCpACRpxfWv5GMi2DyyFckmQID6mQoJJKisgbEMA=
Received: by www1.hostfission.com (Postfix, from userid 1000)
 id C6FA483FAC; Sun,  3 Nov 2019 22:03:47 +1100 (AEDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: RFC: New device for zero-copy VM memory access
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 03 Nov 2019 22:03:47 +1100
From: geoff@hostfission.com
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>
In-Reply-To: <cd00c2ba412361d707ab02575d74aacd@hostfission.com>
References: <c83fe0e7157562c3c17598917977eb4d@hostfission.com>
 <20191030185248.GC3114@work-vm>
 <88f1c3701740665b0ebe2f24c8ce7ade@hostfission.com>
 <20191031132443.GB3128@work-vm>
 <b36330ecd38ce872982df4d41d3d4695@hostfission.com>
 <CAFEAcA8uWCQY8GwtH4oHU8ybXsvmYaB4Qa5hnxyd+344WFjJ_Q@mail.gmail.com>
 <b87d5b2fb84ac0a3c98a62dcc0c19077@hostfission.com>
 <20191031155204.GD3128@work-vm>
 <cd00c2ba412361d707ab02575d74aacd@hostfission.com>
Message-ID: <e23eb129dddc5d18bb9f9b15d116f957@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.2.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 139.99.139.48
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



On 2019-11-03 21:10, geoff@hostfission.com wrote:
> On 2019-11-01 02:52, Dr. David Alan Gilbert wrote:
>> * geoff@hostfission.com (geoff@hostfission.com) wrote:
>>> 
>>> 
>>> On 2019-11-01 01:52, Peter Maydell wrote:
>>> > On Thu, 31 Oct 2019 at 14:26, <geoff@hostfission.com> wrote:
>>> > > As the author of Looking Glass, I also have to consider the
>>> > > maintenance
>>> > > and the complexity of implementing the vhost protocol into the
>>> > > project.
>>> > > At this time a complete Porthole client can be implemented in 150
>>> > > lines
>>> > > of C without external dependencies, and most of that is boilerplate
>>> > > socket code. This IMO is a major factor in deciding to avoid
>>> > > vhost-user.
>>> >
>>> > This is essentially a proposal that we should make our project and
>>> > code more complicated so that your project and code can be simpler.
>>> > I hope you can see why this isn't necessarily an argument that will hold
>>> > very much weight for us :-)
>>> 
>>> Certainly, I do which is why I am still going to see about using 
>>> vhost,
>>> however, a device that uses vhost is likely more complex then the 
>>> device
>>> as it stands right now and as such more maintenance would be involved 
>>> on
>>> your end also. Or have I missed something in that vhost-user can be 
>>> used
>>> directly as a device?
>> 
>> The basic vhost-user stuff isn't actually that hard;  if you aren't
>> actually shuffling commands over the queues you should find it pretty
>> simple - so I think your assumption about it being simpler if you 
>> avoid
>> it might be wrong.  It might be easier if you use it!
> 
> I have been looking into this and I am yet to find some decent
> documentation or a simple device example I can use to understand how to
> create such a device. Do you know of any reading or examples I can 
> obtain
> on how to get an initial do nothing device up and running?
> 
> -Geoff

Scratch that, the design just solidified for me and I am now making
progress, however it seems that vhost-user can't do what we need here:

1) I dont see any way to recieve notification of socket disconnection, 
in
our use case the client app needs to be able to be (re)connected
dynamically. It might be possible to get this event by registering it on
the chardev manually but this seems like it would be a kludge.

2) I don't see any method of notifying the vhost-user client of the
removal of a shared memory mapping. Again, these may not be persistently
mapped in the guest as we have no control over the buffer allocation, 
and
as such, we need a method to notify the client that the mapping has 
become
invalid.

3) VHOST_USER_SET_MEM_TABLE is a one time request, again this breaks our
usage as we need to change this dynamically at runtime.

Unless there are viable solutions to these problems there is no way that
vhost-user can be used for this kind of a device.

-Geoff

> 
>> 
>> Dave
>> 
>>> >
>>> > thanks
>>> > -- PMM
>> --
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

