Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA128264CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRO3-000695-2A
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:34:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>) id 1hTRIR-0002z7-T6
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>) id 1hTRIP-0007Vq-FN
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:28:43 -0400
Received: from ivanoab6.miniserver.com ([5.153.251.140]:57232
	helo=www.kot-begemot.co.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton.ivanov@kot-begemot.co.uk>)
	id 1hTRIO-0007RA-OM
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:28:41 -0400
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>)
	id 1hTRIH-00045N-3j; Wed, 22 May 2019 13:28:33 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
	by jain.kot-begemot.co.uk with esmtp (Exim 4.89)
	(envelope-from <anton.ivanov@kot-begemot.co.uk>)
	id 1hTRIE-0003iF-IX; Wed, 22 May 2019 14:28:32 +0100
To: Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
	virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
From: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Message-ID: <ddeee710-d546-ff05-5c53-991a7d807067@kot-begemot.co.uk>
Date: Wed, 22 May 2019 14:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.153.251.140
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/05/2019 14:02, Johannes Berg wrote:
> Hi,
> 
> While my main interest is mostly in UML right now [1] I've CC'ed the
> qemu and virtualization lists because something similar might actually
> apply to other types of virtualization.
> 
> I'm thinking about adding virt-io support to UML, but the tricky part is
> that while I want to use the virt-io basics (because it's a nice
> interface from the 'inside'), I don't actually want the stock drivers
> that are part of the kernel now (like virtio-net etc.) but rather
> something that integrates with wifi (probably building on hwsim).
> 
> The 'inside' interfaces aren't really a problem - just have a specific
> device ID for this, and then write a normal virtio kernel driver for it.
> 
> The 'outside' interfaces are where my thinking breaks down right now.
> 
> Looking at lkl, the outside is just all implemented in lkl as code that
> gets linked to the library, so in UML terms it'd just be extra 'outside'
> code like the timer handling or other netdev stuff we have today.
> Looking at qemu, it's of course also implemented there, and then
> interfaces with the real network, console abstraction, etc.
> 
> However, like I said above, I really need something very custom and not
> likely to make it upstream to any project (because what point is that if
> you cannot connect to the rest of the environment I'm building), so I'm
> thinking that perhaps it should be possible to write an abstract
> 'outside' that lets you interact with it really from out-of-process?
> Perhaps through some kind of shared memory segment? I think that gets
> tricky with virt-io doing DMA (I think it does?) though, so that part
> would have to be implemented directly and not out-of-process?
> 
> But really that's why I'm asking - is there a better way than to just
> link the device-side virt-io code into the same binary (be it lkl lib,
> uml binary, qemu binary)?
> 
> Thanks,
> johannes
> 
> [1] Actually, I've considered using qemu, but it doesn't have
> virtualized time and doesn't seem to support TSC virtualization. I guess
> I could remove TSC from the guest CPU and add a virtualized HPET, but
> I've yet to convince myself this works - on UML I made virtual time as a
> prototype already:
> https://patchwork.ozlabs.org/patch/1095814/
> (though my real goal isn't to just skip time forward when the host goes
> idle, it's to sync with other simulated components)
> 
> 
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
> 

I have looked at using virtio semantics in UML in the past around the 
point when I wanted to make the recvmmsg/sendmmsg vector drivers common 
in UML and QEMU. It is certainly possible,

I went for the native approach at the end though.

-- 
Anton R. Ivanov
https://www.kot-begemot.co.uk/

