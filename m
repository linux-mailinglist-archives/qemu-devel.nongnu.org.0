Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA17980B3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 18:51:50 +0200 (CEST)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Tpt-0006lB-LN
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 12:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1i0TZk-000736-KZ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1i0TRt-0001jf-Cq
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:27:02 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:40311
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1i0TRt-0001j0-5M; Wed, 21 Aug 2019 12:27:01 -0400
Received: from [95.90.100.178] (helo=tweek.localnet)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1i0TRq-00084L-04; Wed, 21 Aug 2019 18:26:58 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: Jim Wilson <jimw@sifive.com>, qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 18:26:55 +0200
Message-ID: <2129929.Dvzsi9MTMp@tweek>
In-Reply-To: <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
References: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
 <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c1c:b490::2
Subject: Re: [Qemu-devel] [PATCH v2] RISC-V: Select FPU gdb xml file based
 on the supported extensions
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 20 August 2019 22:06:51 CEST Jim Wilson wrote:
> The current XML files were identical to the XML files in gdb when
> implemented.  This seems to be existing practice, as this is true of all
> of the other targets I looked at when I implemented this.  Also, the
> file names are the same with a / replaced with a -.  These files are in
> the gdb/features/riscv dir in a gdb source tree.  It would be a shame to
> break this.  I'm not sure if they are still identical.  The gdb copies
> might have been updated since then, and may need to be copied into qemu
> to update qemu, but we don't have a dedicated gdb/qemu maintainer to do
> this.
> 
> I don't see a need to remove the fp csr's from the csr list.  There are
> other extension dependent CSRs, like hypervisor ones. I think it makes
> more sense for the csr list to contain all of the csrs, and then disable
> access to them if that extension is not enabled.  If there is a good
> reason to require changes to the csr XML files, then it probably should
> be discussed with the gdb developers too, so that the gdb and qemu
> copies of the files remain consistent.
> 
> Fixing the rvf/rvd 32/64-bit support is good.  That is a bug in my
> original implementation.
> 
> Jim

My motivation behind renaming the xml files was to work against the 
misconception that e.g. 64bit-cpu and 64bit-fpu are related to one another. 
But of course, 32bit-fpu and 64bit-fpu is technically not incorrect.

Regarding the removal of the fp csrs from the csr list: I found it confusing 
that the fp csr registers were listed in two files. In addition the bitsize of 
the fp csr registers was stated as 64 in riscv-64bit-csr.xml, wheras the other 
xml files (32bit-csr, 32bit-fpu and 64bit-fpu) stated 32, in accordance with 
the RISC-V ISA specification.
Then I had a look at the gdb source code, and came to the conclusion that gdb 
does not use the fp csr registers from the org.gnu.gdb.riscv.csr feaure set, 
but instead the ones from org.gnu.gdb.riscv.fpu. Therefore, I decided to 
remove the fp csr registers from the csr list.
However, as I don't have any prior experience with QEMU or gdb development is 
quite likely that I misinterpreted or overlooked something.

For now I prepared a third version of the patch that only fixes the rvf/rvd 
32/64-bit support.

Georg



