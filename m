Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A72DD659
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:37:24 +0100 (CET)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxDP-0002IL-Op
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1kpwxS-0006YG-OV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:20:54 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:20053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1kpwxQ-0006zq-Hj
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:20:54 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 738FA3F655;
 Thu, 17 Dec 2020 18:20:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsaQYzt0WxEy; Thu, 17 Dec 2020 18:20:25 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BB8EA3F59B;
 Thu, 17 Dec 2020 18:20:24 +0100 (CET)
Date: Thu, 17 Dec 2020 18:20:45 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
Message-ID: <X9uTbY//orPUA+oS@sx9>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
 <a081586a-c136-3766-6c28-9c054b24e84b@vivier.eu>
 <e1e6feeb-3bb3-d628-a87f-3696e9809d01@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1e6feeb-3bb3-d628-a87f-3696e9809d01@amsat.org>
Received-SPF: softfail client-ip=213.80.101.71; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa2.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 05:10:24PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/17/20 11:40 AM, Laurent Vivier wrote:
> > Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
> >> o32 ABI syscalls start at offset 4000.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >> ---
> >>  linux-user/mips64/syscall_nr.h | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
> >> index 672f2fa51cb..6579421fa63 100644
> >> --- a/linux-user/mips64/syscall_nr.h
> >> +++ b/linux-user/mips64/syscall_nr.h
> >> @@ -1,4 +1,7 @@
> >> -#ifdef TARGET_ABI_MIPSN32
> >> +#if defined(TARGET_ABI_MIPSO32)
> >> +#define TARGET_SYSCALL_OFFSET 4000
> > 
> > The value of the offset is hardcoded in linux-user/mips/meson.build, so either you remove
> > TARGET_SYSCALL_OFFSET here or you update meson.build to use it.
> 
> I don't understand what this Meson rule does, as this
> doesn't work without this patch...
> 
> You can download PS2 64-bit O32 binaries from 2002 (before
> the official MIPS TLS ABI) there:
> https://sourceforge.net/projects/kernelloader/files/

These look rather like 128 bits, as there are R5900 MMIs. For instance,
one can find LQ, SQ, PEXTLB, PEXTLW and so on in /lib/ld.so in
ps2linux_live_v5_pal_netsurf_usb.7z.

There may be other surprises. R5900 Linux 2.x kernels are not IEEE 754
compatible, as opposed to both 5.x kernels and QEMU, for instance.

I would suggest compiling tests with a recent GCC.

Fredrik

