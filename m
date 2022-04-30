Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB3515F7D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:14:31 +0200 (CEST)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqfu-0005l6-Su
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nkqaP-0004vp-Tv
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:08:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nkqaO-0001wW-4S
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 79FF1407EB;
 Sat, 30 Apr 2022 20:08:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6DF6B2A;
 Sat, 30 Apr 2022 20:03:31 +0300 (MSK)
Message-ID: <18da14fc-c582-c6f6-8d3d-bf3b47d2a15c@msgid.tls.msk.ru>
Date: Sat, 30 Apr 2022 20:08:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Building tools on unsupported cpu/arch
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
 <61fb585e-3ca6-b218-750c-9e833edd9f3f@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <61fb585e-3ca6-b218-750c-9e833edd9f3f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

30.04.2022 19:57, Richard Henderson wrote:
..
>> What's the way to build tools on an unsupported architecture these days?
> 
> Hmm, well, there isn't a way.  This seems like a bug in common-user/meson.build.
> We should not add this include directory if neither linux-user and bsd-user are enabled.

Aftr adding an if similar to linux-user/meson.build (with this condition), it
fails down the line anyway:

cc -Ilibui-sdl.a.p -I. -I../.. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/SDL2 -I/usr/include/pixman-1 -I/usr/include/glib-2.0 
-I/usr/lib/hppa-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall -Winvalid-pch -std=gnu11 -O2 -g -isystem 
/home/mjt/qemu-7.0+dfsg/linux-headers -isystem linux-headers -iquote . -iquote /home/mjt/qemu-7.0+dfsg -iquote /home/mjt/qemu-7.0+dfsg/include -iquote 
/home/mjt/qemu-7.0+dfsg/disas/libvixl -iquote /home/mjt/qemu-7.0+dfsg/tcg/tci -pthread -U_FORTIFY_SOURCE -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv 
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
-Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -g -O2 
-ffile-prefix-map=/home/mjt/qemu-7.0+dfsg=. -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -fPIC -D_REENTRANT -Wno-undef -DBUILD_DSO 
-MD -MQ libui-sdl.a.p/ui_x_keymap.c.o -MF libui-sdl.a.p/ui_x_keymap.c.o.d -o libui-sdl.a.p/ui_x_keymap.c.o -c ../../ui/x_keymap.c
In file included from ../../ui/x_keymap.c:15:
../../ui/trace.h:1:10: fatal error: trace/trace-ui.h: No such file or directory
     1 | #include "trace/trace-ui.h"
       |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

This is, again, --disable-system --disable-user --enable-tools,
so it should not, I guess, compile ui-sdl.  Or should it?

Thanks,

/mjt

