Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304819039C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 03:35:41 +0100 (CET)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGZPn-0003JF-S2
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 22:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jGZOy-0002a2-2H
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 22:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tytso@mit.edu>) id 1jGZOw-0004sO-GV
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 22:34:47 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:42846
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tytso@mit.edu>) id 1jGZOw-0004rm-C2
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 22:34:46 -0400
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02O2YVaA028612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 22:34:32 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3DEAA420EBA; Mon, 23 Mar 2020 22:34:31 -0400 (EDT)
Date: Mon, 23 Mar 2020 22:34:31 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ext4: Give 32bit personalities 32bit hashes
Message-ID: <20200324023431.GD53396@mit.edu>
References: <20200317113153.7945-1-linus.walleij@linaro.org>
 <CAFEAcA9mXE+gPnvM6HZ-w0+BhbpeuH=osFH-9NUzCLv=w-c7HQ@mail.gmail.com>
 <CACRpkdZtLNUwiZEMiJEoB0ojOBckyGcZeyFkR6MC69qv-ry9EA@mail.gmail.com>
 <CAFEAcA-gdwi=KSW6LqVdEJWSo9VEL5abYQs9LoHd4mKE_-h=Aw@mail.gmail.com>
 <CACRpkdYuZgZUznVxt1AHCSJa_GAXy8N0SduE5OrjDnE1s_L7Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYuZgZUznVxt1AHCSJa_GAXy8N0SduE5OrjDnE1s_L7Zg@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 18.9.28.11
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
 Linux API <linux-api@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 stable <stable@vger.kernel.org>, Florian Weimer <fw@deneb.enyo.de>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 19, 2020 at 11:23:33PM +0100, Linus Walleij wrote:
> OK I guess we can at least take this opportunity to add
> some kerneldoc to the include file.
> 
> > As a concrete example, should "give me 32-bit semantics
> > via PER_LINUX32" mean "mmap should always return addresses
> > within 4GB" ? That would seem like it would make sense --
> 
> Incidentally that thing in particular has its own personality
> flag (personalities are additive, it's a bit schizophrenic)
> so PER_LINUX_32BIT is defined as:
> PER_LINUX_32BIT =       0x0000 | ADDR_LIMIT_32BIT,
> and that is specifically for limiting the address space to
> 32bit.
> 
> There is also PER_LINUX32_3GB for a 3GB lowmem
> limit.
> 
> Since the personality is kind of additive, if
> we want a flag *specifically* for indicating that we want
> 32bit hashes from the file system, there are bits left so we
> can provide that.
> 
> Is this what we want to do? I just think we shouldn't
> decide on that lightly as we will be using up personality
> bug bits, but sometimes you have to use them.

I've been looking at the personality bug bits more detailed, and it
looks... messy.  Do we pick a new personality, or do we grab another
unique flag?

Another possibility, which would be messier for qemu, would be use a
flag set via fcntl.  That would require qemu from noticing when the
guest is calling open, openat, or openat2, and then inserting a fcntl
system call to set the 32-bit readdir mode.  That's cleaner from the
kernel interface complexity perspective, but it's messier for qemu.

       		 	    		     	  - Ted

       		 

