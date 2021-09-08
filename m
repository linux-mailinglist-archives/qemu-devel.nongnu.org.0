Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E3140374B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:52:48 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuG7-0006JS-0L
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1mNuAE-00040h-Bp
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:46:42 -0400
Received: from 13thmonkey.org ([80.100.255.32]:61398
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1mNuAB-0004Tz-Ua
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:46:42 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 279E92FF07A7; Wed,  8 Sep 2021 11:46:27 +0200 (CEST)
Date: Wed, 8 Sep 2021 11:46:27 +0200
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined
Message-ID: <YTiGc/0K+rupGIgD@gorilla.13thmonkey.org>
References: <20210718134650.1191-1-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <6059b24a-a5ee-822f-8ff8-7277eb99896c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6059b24a-a5ee-822f-8ff8-7277eb99896c@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@NetBSD.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 06:20:33PM +0200, Philippe Mathieu-Daudé wrote:
> On 7/18/21 3:46 PM, Reinoud Zandijk wrote:
> > Userland targers will otherwise use a poisoned CONFIG_NVMM
> 
> Typo "targets", but do you mean bsd-user or linux-user?

Since its on NetBSD, I guess its bsd-user :)

> But what is the error you get here?
> 
> cpu_report_tpr_access() is protected for !CONFIG_USER_ONLY,
> target/i386/nvmm/ is only build on system emulation.
> 
> So when can this happen? Last candidate is "sysemu/hw_accel.h";
> does it really need to include "sysemu/nvmm.h"?

[5560/6718] Compiling C object libcommon.fa.p/hw_core_cpu-common.c.o
FAILED: libcommon.fa.p/hw_core_cpu-common.c.o 
gcc -Ilibcommon.fa.p -I../slirp -I../slirp/src -I../dtc/libfdt
-I../capstone/include/capstone -I. -Iqapi -Itrace -Iui -Iui/shader
-I/usr/pkg/include -I/usr/pkg/include/glib-2.0 -I/usr/pkg/lib/glib-2.0/include
-I/usr/pkg/include/gio-unix-2.0 -I/usr/X11R7/include
-I/usr/pkg/include/spice-1 -I/usr/pkg/include/spice-server
-I/usr/X11R7/include/pixman-1 -I/usr/pkg/include/libpng16
-I/usr/pkg/include/SDL2 -I/usr/pkg/include/ncursesw
-I/usr/X11R7/include/libdrm -I/usr/include -I/usr/pkg/include/ncurses
-I/usr/pkg/include/python3.8 -I/usr/include/krb5 -fdiagnostics-color=auto
-pipe -Wall -Winvalid-pch -std=gnu11 -O2 -iquote . -iquote
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b
-iquote
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include
-iquote
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/disas/libvixl
-iquote
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/tcg/i386
-pthread -U_FORTIFY_SOURCE -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE_EXTENDED=1
-fPIC -D_NETBSD_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -D_REENTRANT
-D_THREAD_SAFE -Wno-undef -MD -MQ libcommon.fa.p/hw_core_cpu-common.c.o -MF
libcommon.fa.p/hw_core_cpu-common.c.o.d -o
libcommon.fa.p/hw_core_cpu-common.c.o -c ../hw/core/cpu-common.c
In file included from
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include/sysemu/hw_accel.h:19:0,
                 from ../hw/core/cpu-common.c:24:
/tmp/pkgsrc-gorilla/emulators/qemu-walking/work/qemu-9ad4c7c9b63f89c308fd988d509bed1389953c8b/include/sysemu/nvmm.h:16:8:
error: attempt to use poisoned "CONFIG_NVMM"
 #ifdef CONFIG_NVMM
        ^
[5589/6718] Compiling C object libcommon.fa.p/hw_net_e1000e_core.c.o
ninja: build stopped: subcommand failed.

With the patch it works fine.

With regards,
Reinoud


> > Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> > ---
> >  include/sysemu/nvmm.h | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
> > index 6d216599b0..833670fccb 100644
> > --- a/include/sysemu/nvmm.h
> > +++ b/include/sysemu/nvmm.h
> > @@ -10,8 +10,7 @@
> >  #ifndef QEMU_NVMM_H
> >  #define QEMU_NVMM_H
> >  
> > -#include "config-host.h"
> > -#include "qemu-common.h"
> > +#ifdef NEED_CPU_H
> >  
> >  #ifdef CONFIG_NVMM
> >  
> > @@ -23,4 +22,6 @@ int nvmm_enabled(void);
> >  
> >  #endif /* CONFIG_NVMM */
> >  
> > -#endif /* CONFIG_NVMM */
> > +#endif /* NEED_CPU_H */
> > +
> > +#endif /* QEMU_NVMM_H */
> > 

