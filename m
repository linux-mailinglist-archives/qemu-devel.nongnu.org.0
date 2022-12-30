Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B8659B59
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 19:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBJwX-0000aS-7t; Fri, 30 Dec 2022 13:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1pBJwJ-0000a7-OS
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 13:17:08 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1pBJwH-00037s-8U
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 13:17:06 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 2171E72C90B;
 Fri, 30 Dec 2022 21:17:00 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 050D44A5064;
 Fri, 30 Dec 2022 21:17:00 +0300 (MSK)
Date: Fri, 30 Dec 2022 21:16:59 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Alexey Shabalin <shaba@basealt.ru>, "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: qemu-system-i386: Could not install MSR_CORE_THREAD_COUNT
 handler: Success
Message-ID: <20221230181659.obkhfe7g6jn2wkb6@altlinux.org>
References: <20221230142222.r3ahbntnlvj7jpc2@altlinux.org>
 <13D59483-BE6C-4AB5-AAB8-78B3A03D96E7@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13D59483-BE6C-4AB5-AAB8-78B3A03D96E7@csgraf.de>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alexander,

On Fri, Dec 30, 2022 at 06:44:14PM +0100, Alexander Graf wrote:
> Hi Vitaly,
> 
> This is a kvm kernel bug and should be fixed with the latest stable releases. Which kernel version are you running?

This is on latest v6.0 stable - 6.0.15.

Maybe there could be workaround for such situations? (Or maybe it's
possible to make this error non-fatal?) We use qemu+kvm for testing and
now we cannot test on x86.

Thanks,


> 
> Thanks,
> 
> Alex
> 
> 
> > Am 30.12.2022 um 15:30 schrieb Vitaly Chikunov <vt@altlinux.org>:
> > 
> > ﻿Hi,
> > 
> > QEMU 7.2.0 when run on 32-bit x86 architecture fails with:
> > 
> >  i586$ qemu-system-i386 -enable-kvm
> >  qemu-system-i386: Could not install MSR_CORE_THREAD_COUNT handler: Success
> >  i586$ qemu-system-x86_64 -enable-kvm
> >  qemu-system-x86_64: Could not install MSR_CORE_THREAD_COUNT handler: Success
> > 
> > Minimal reproducer is `qemu-system-i386 -enable-kvm'. And this only
> > happens on x86 (linux32 personality and binaries on x86_64 host):
> > 
> >  i586$ file /usr/bin/qemu-system-i386
> >  /usr/bin/qemu-system-i386: ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=0ba1d953bcb7a691014255954f060ff404c8df90, for GNU/Linux 3.2.0, stripped
> >  i586$ /usr/bin/qemu-system-i386 --version
> >  QEMU emulator version 7.2.0 (qemu-7.2.0-alt1)
> >  Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
> > 
> > Thanks,
> > 
> 

