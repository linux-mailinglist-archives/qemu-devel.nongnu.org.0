Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C272DD073
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:35:43 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprZM-00043i-Ll
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kprWs-0002Ll-AT
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kprWo-0005fu-Eo
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6866AC7B;
 Thu, 17 Dec 2020 11:32:54 +0000 (UTC)
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
Date: Thu, 17 Dec 2020 12:32:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201217104417.436508-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 11:44 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fixes linking:
> x86_64-w64-mingw32-gcc  -o tests/test-qapi-util.exe version.rc_version.o tests/test-qapi-util.exe.p/test-qapi-util.c.obj -Wl,--allow-shlib-undefined -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase -Wl,--warn-common -m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a -pthread -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgnutls -lwinmm -lm -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgthread-2.0 -lglib-2.0 -lintl -lws2_32 -mconsole -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 -Wl,--end-group
> /usr/lib/gcc/x86_64-w64-mingw32/10.2.1/../../../../x86_64-w64-mingw32/bin/ld: libqemuutil.a(util_oslib-win32.c.obj): in function `qemu_try_set_nonblock':
> /home/elmarco/src/qemu/buildw/../util/oslib-win32.c:224: undefined reference to `qemu_fd_register'
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  util/main-loop-stub.c | 26 ++++++++++++++++++++++++++
>  util/meson.build      |  2 ++
>  2 files changed, 28 insertions(+)
>  create mode 100644 util/main-loop-stub.c
> 
> diff --git a/util/main-loop-stub.c b/util/main-loop-stub.c
> new file mode 100644
> index 0000000000..b3e175ade5
> --- /dev/null
> +++ b/util/main-loop-stub.c
> @@ -0,0 +1,26 @@
> +/*
> + * QEMU main loop stub impl
> + *
> + * Copyright (c) 2020 Red Hat, Inc.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +
> +void qemu_fd_register(int fd)
> +{
> +}
> diff --git a/util/meson.build b/util/meson.build
> index f359af0d46..462b79a61a 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -79,4 +79,6 @@ if have_block
>    util_ss.add(when: 'CONFIG_INOTIFY1', if_true: files('filemonitor-inotify.c'),
>                                          if_false: files('filemonitor-stub.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
> +else
> +  util_ss.add(files('main-loop-stub.c'))
>  endif
> 

Is the root cause elsewhere though?

I don't like stubs very much, because often they are introduced as the easy way out of a problem instead of doing the necessary refactoring,
and they end up confusing the hell out of someone trying to understand what is actually used where, never mind trying to debug the linker errors.

There is already an bunch of #ifndef _WIN32, #else , ... in util/main-loop.c (quite a bunch of them really),
is that what actually needs reworking, and putting the pieces together in the build system in a way that makes sense?

Ciao, thanks,

Claudio

