Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF27EA961
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 03:57:02 +0100 (CET)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQ0dx-00089O-8z
	for lists+qemu-devel@lfdr.de; Wed, 30 Oct 2019 22:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1iQ0cv-0007bF-TE
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 22:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iQ0cu-0005Nh-FO
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 22:55:57 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:51196)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iQ0ct-0005KX-Sw
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 22:55:56 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id 701A64B9E5;
 Thu, 31 Oct 2019 13:55:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1572490551;
 bh=o/M6q1P+FMBSfVh5MpJUaryKUo50sWRIq5gfdVXnQc8=;
 h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
 b=qw2urAcu7q6fnI7sN1As56EDuzXCQqnCmAO2ARM8WOmn/AR8IJ1yTypBEC9gd57Nu
 CVF+MMa0p2vbXOKdLEE17g2NNOJAKvbe636TgJgBaFWVbDNGuHyS7vFZ1BI+acutZ4
 FRvlMyJZrOt6MFfg0H0bD4b/f/S0tzxBcOSPCqmM=
Received: by www1.hostfission.com (Postfix, from userid 1000)
 id 6856281EB8; Thu, 31 Oct 2019 13:55:51 +1100 (AEDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: RFC: New device for zero-copy VM memory access
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 31 Oct 2019 13:55:51 +1100
From: geoff@hostfission.com
Cc: qemu-devel@nongnu.org
In-Reply-To: <20191030185248.GC3114@work-vm>
References: <c83fe0e7157562c3c17598917977eb4d@hostfission.com>
 <20191030185248.GC3114@work-vm>
Message-ID: <88f1c3701740665b0ebe2f24c8ce7ade@hostfission.com>
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

Hi Dave,

On 2019-10-31 05:52, Dr. David Alan Gilbert wrote:
> * geoff@hostfission.com (geoff@hostfission.com) wrote:
>> Hi All,
>> 
>> Over the past week, I have been working to come up with a solution to 
>> the
>> memory transfer performance issues that hinder the Looking Glass 
>> Project.
>> 
>> Currently Looking Glass works by using the IVSHMEM shared memory 
>> device
>> which
>> is fed by an application that captures the guest's video output. While 
>> this
>> works it is sub-optimal because we first have to perform a CPU copy of 
>> the
>> captured frame into shared RAM, and then back out again for display. 
>> Because
>> the destination buffers are allocated by closed proprietary code 
>> (DirectX,
>> or
>> NVidia NvFBC) there is no way to have the frame placed directly into 
>> the
>> IVSHMEM shared ram.
>> 
>> This new device, currently named `introspection` (which needs a more
>> suitable
>> name, porthole perhaps?), provides a means of translating guest 
>> physical
>> addresses to host virtual addresses, and finally to the host offsets 
>> in RAM
>> for
>> file-backed memory guests. It does this by means of a simple protocol 
>> over a
>> unix socket (chardev) which is supplied the appropriate fd for the 
>> VM's
>> system
>> RAM. The guest (in this case, Windows), when presented with the 
>> address of a
>> userspace buffer and size, will mlock the appropriate pages into RAM 
>> and
>> pass
>> guest physical addresses to the virtual device.
> 
> Hi Geroggrey,
>   I wonder if the same thing can be done by using the existing 
> vhost-user
> mechanism.
> 
>   vhost-user is intended for implementing a virtio device outside of 
> the
> qemu process; so it has a character device that qemu passes commands 
> down
> to the other process, where qemu mostly passes commands via the virtio
> queues.   To be able to read the virtio queues, the external process
> mmap's the same memory as the guest - it gets passed a 'set mem table'
> command by qemu that includes fd's for the RAM, and includes 
> base/offset
> pairs saying that a particular chunk of RAM is mapped at a particular
> guest physical address.
> 
>   Whether or not you make use of virtio queues, I think the mechanism
> for the device to tell the external process the mappings might be what
> you're after.
> 
> Dave
> 

While normally I would be all for re-using such code, the vhost-user 
while
being very feature-complete from what I understand is overkill for our
requirements. It will still allocate a communication ring and an events 
system
that we will not be using. The goal of this device is to provide a dumb 
&
simple method of sharing system ram, both for this project and for 
others that
work on a simple polling mechanism, it is not intended to be an 
end-to-end
solution like vhost-user is.

If you still believe that vhost-user should be used, I will do what I 
can to
implement it, but for such a simple device I honestly believe it is 
overkill.

-Geoff

>> This device and the windows driver have been designed in such a way 
>> that
>> it's a
>> utility device for any project and/or application that could make use 
>> of it.
>> The PCI subsystem vendor and device ID are used to provide a means of 
>> device
>> identification in cases where multiple devices may be in use for 
>> differing
>> applications. This also allows one common driver to be used for any 
>> other
>> projects wishing to build on this device.
>> 
>> My ultimate goal is to get this to a state where it could be accepted
>> upstream
>> into Qemu at which point Looking Glass would be modified to use it 
>> instead
>> of
>> the IVSHMEM device.
>> 
>> My git repository with the new device can be found at:
>> https://github.com/gnif/qemu
>> 
>> The new device is:
>> https://github.com/gnif/qemu/blob/master/hw/misc/introspection.c
>> 
>> Looking Glass:
>> https://looking-glass.hostfission.com/
>> 
>> The windows driver, while working, needs some cleanup before the 
>> source is
>> published. I intend to maintain both this device and the windows 
>> driver
>> including producing a signed Windows 10 driver if Redhat are unwilling 
>> or
>> unable.
>> 
>> Kind Regards,
>> Geoffrey McRae
>> 
>> HostFission
>> https://hostfission.com
>> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

