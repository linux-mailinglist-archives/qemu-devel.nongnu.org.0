Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4019196F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 19:49:20 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGoc2-0007tO-As
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 14:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jGoaw-0007PY-LV
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tytso@mit.edu>) id 1jGoav-0006pO-9W
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:48:10 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:55662
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tytso@mit.edu>) id 1jGoav-0006on-5D
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:48:09 -0400
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02OIlsE5019147
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 14:47:54 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 2B396420EBA; Tue, 24 Mar 2020 14:47:54 -0400 (EDT)
Date: Tue, 24 Mar 2020 14:47:54 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ext4: Give 32bit personalities 32bit hashes
Message-ID: <20200324184754.GG53396@mit.edu>
References: <20200317113153.7945-1-linus.walleij@linaro.org>
 <CAFEAcA9mXE+gPnvM6HZ-w0+BhbpeuH=osFH-9NUzCLv=w-c7HQ@mail.gmail.com>
 <CACRpkdZtLNUwiZEMiJEoB0ojOBckyGcZeyFkR6MC69qv-ry9EA@mail.gmail.com>
 <CAFEAcA-gdwi=KSW6LqVdEJWSo9VEL5abYQs9LoHd4mKE_-h=Aw@mail.gmail.com>
 <CACRpkdYuZgZUznVxt1AHCSJa_GAXy8N0SduE5OrjDnE1s_L7Zg@mail.gmail.com>
 <20200324023431.GD53396@mit.edu>
 <CAFEAcA_6RY1XFVNJCo5=tTkv2GQpXZRqh_Zz4dYadq-8MJZgTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_6RY1XFVNJCo5=tTkv2GQpXZRqh_Zz4dYadq-8MJZgTQ@mail.gmail.com>
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
Cc: "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, stable <stable@vger.kernel.org>,
 Florian Weimer <fw@deneb.enyo.de>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 24, 2020 at 09:29:58AM +0000, Peter Maydell wrote:
> 
> On the contrary, that would be a much better interface for QEMU.
> We always know when we're doing an open-syscall on behalf
> of the guest, and it would be trivial to make the fcntl() call then.
> That would ensure that we don't accidentally get the
> '32-bit semantics' on file descriptors QEMU opens for its own
> purposes, and wouldn't leave us open to the risk in future that
> setting the PER_LINUX32 flag for all of QEMU causes
> unexpected extra behaviour in future kernels that would be correct
> for the guest binary but wrong/broken for QEMU's own internals.

If using a flag set by fcntl is better for qemu, then by all means
let's go with that instead of using a personality flag/number.

Linus, do you have what you need to do a respin of the patch?

       	         	      	   	    	 - Ted

