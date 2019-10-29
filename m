Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E85E9337
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 23:55:23 +0100 (CET)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPaOX-0004Pw-RE
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 18:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1iPaN4-0003Mv-F4
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 18:53:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iPaN3-0003xD-4p
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 18:53:50 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:35132)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iPaN2-0003v6-Ff
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 18:53:49 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id 4C3E64BA08
 for <qemu-devel@nongnu.org>; Wed, 30 Oct 2019 09:53:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1572389626;
 bh=0+U2r/elV5WDGiokxyhq45aA7qy6JvbBnLXwU6igEiE=;
 h=To:Subject:Date:From:In-Reply-To:References:From;
 b=SmVcbjNnxIt2dUrI7Gm/ZjKROtdoIhdhd81g8DlktWENuxDFdJcfejttjppvI7SZt
 gNy+c7i+wAObqJz6RPO+V75DjdqS6G9xBmjTPPur5P6CdBWciSU7K12MWdqfr+fWpO
 I9ec6g+V5gx8NWouNSIhzcruryaAPCeUyCKV2a5U=
Received: by www1.hostfission.com (Postfix, from userid 1000)
 id 3DC3281EB8; Wed, 30 Oct 2019 09:53:46 +1100 (AEDT)
To: qemu-devel@nongnu.org
Subject: Re: RFC: New device for zero-copy VM memory access
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 30 Oct 2019 09:53:46 +1100
From: geoff@hostfission.com
In-Reply-To: <c83fe0e7157562c3c17598917977eb4d@hostfission.com>
References: <c83fe0e7157562c3c17598917977eb4d@hostfission.com>
Message-ID: <028c23b219913d1f734d95a05d2b5809@hostfission.com>
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

Just to follow this up, here is a sample client application for this 
device

https://gist.github.com/gnif/77e7fb54604b42a1a98ecb8bf3d2cf46

-Geoff

On 2019-10-30 01:31, geoff@hostfission.com wrote:
> Hi All,
> 
> Over the past week, I have been working to come up with a solution to 
> the
> memory transfer performance issues that hinder the Looking Glass 
> Project.
> 
> Currently Looking Glass works by using the IVSHMEM shared memory device 
> which
> is fed by an application that captures the guest's video output. While 
> this
> works it is sub-optimal because we first have to perform a CPU copy of 
> the
> captured frame into shared RAM, and then back out again for display. 
> Because
> the destination buffers are allocated by closed proprietary code 
> (DirectX, or
> NVidia NvFBC) there is no way to have the frame placed directly into 
> the
> IVSHMEM shared ram.
> 
> This new device, currently named `introspection` (which needs a more 
> suitable
> name, porthole perhaps?), provides a means of translating guest 
> physical
> addresses to host virtual addresses, and finally to the host offsets in 
> RAM for
> file-backed memory guests. It does this by means of a simple protocol 
> over a
> unix socket (chardev) which is supplied the appropriate fd for the VM's 
> system
> RAM. The guest (in this case, Windows), when presented with the address 
> of a
> userspace buffer and size, will mlock the appropriate pages into RAM 
> and pass
> guest physical addresses to the virtual device.
> 
> This device and the windows driver have been designed in such a way 
> that it's a
> utility device for any project and/or application that could make use 
> of it.
> The PCI subsystem vendor and device ID are used to provide a means of 
> device
> identification in cases where multiple devices may be in use for 
> differing
> applications. This also allows one common driver to be used for any 
> other
> projects wishing to build on this device.
> 
> My ultimate goal is to get this to a state where it could be accepted 
> upstream
> into Qemu at which point Looking Glass would be modified to use it 
> instead of
> the IVSHMEM device.
> 
> My git repository with the new device can be found at:
> https://github.com/gnif/qemu
> 
> The new device is:
> https://github.com/gnif/qemu/blob/master/hw/misc/introspection.c
> 
> Looking Glass:
> https://looking-glass.hostfission.com/
> 
> The windows driver, while working, needs some cleanup before the source 
> is
> published. I intend to maintain both this device and the windows driver
> including producing a signed Windows 10 driver if Redhat are unwilling 
> or
> unable.
> 
> Kind Regards,
> Geoffrey McRae
> 
> HostFission
> https://hostfission.com

