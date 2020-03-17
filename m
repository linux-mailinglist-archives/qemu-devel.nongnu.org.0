Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CC18829A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 12:54:27 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEAni-0006oj-Rn
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 07:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fw@deneb.enyo.de>) id 1jEAmz-0006OW-1J
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fw@deneb.enyo.de>) id 1jEAmx-0004mn-9w
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:53:40 -0400
Received: from albireo.enyo.de ([37.24.231.21]:39144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fw@deneb.enyo.de>) id 1jEAmx-0004Qx-33
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:53:39 -0400
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jEAmp-0003yE-1g; Tue, 17 Mar 2020 11:53:31 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jEAlQ-0004mu-4A; Tue, 17 Mar 2020 12:52:04 +0100
From: Florian Weimer <fw@deneb.enyo.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ext4: Give 32bit personalities 32bit hashes
References: <20200317113153.7945-1-linus.walleij@linaro.org>
Date: Tue, 17 Mar 2020 12:52:04 +0100
In-Reply-To: <20200317113153.7945-1-linus.walleij@linaro.org> (Linus Walleij's
 message of "Tue, 17 Mar 2020 12:31:53 +0100")
Message-ID: <87lfnzdwrf.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 37.24.231.21
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, qemu-devel@nongnu.org, stable@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Linus Walleij:

> It was brought to my attention that this bug from 2018 was
> still unresolved: 32 bit emulators like QEMU were given
> 64 bit hashes when running 32 bit emulation on 64 bit systems.
>
> The personality(2) system call supports to let processes
> indicate that they are 32 bit Linux to the kernel. This
> was suggested by Teo in the original thread, so I just wired
> it up and it solves the problem.
>
> Programs that need the 32 bit hash only need to issue the
> personality(PER_LINUX32) call and things start working.
>
> I made a test program like this:
>
>   #include <dirent.h>
>   #include <errno.h>
>   #include <stdio.h>
>   #include <string.h>
>   #include <sys/types.h>
>   #include <sys/personality.h>
>
>   int main(int argc, char** argv) {
>     DIR* dir;
>     personality(PER_LINUX32);
>     dir = opendir("/boot");
>     printf("dir=%p\n", dir);
>     printf("readdir(dir)=%p\n", readdir(dir));
>     printf("errno=%d: %s\n", errno, strerror(errno));
>     return 0;
>   }
>
> This was compiled with an ARM32 toolchain from Bootlin using
> glibc 2.28 and thus suffering from the bug.

Just be sure: Is it possible to move the PER_LINUX32 setting into QEMU?
(I see why not.)

However, this does not solve the issue with network file systems and
other scenarios.  I still think need to add a workaround to the glibc
implementation.

