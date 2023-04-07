Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510E6DB113
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 19:03:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkpTO-0003BD-L3; Fri, 07 Apr 2023 13:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pkpTK-00037i-Bz
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 13:01:58 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pkpTI-0006Em-7u
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 13:01:57 -0400
Received: from [192.168.178.59] (pd9ec3018.dip0.t-ipconnect.de [217.236.48.24])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D33DDDA0D45
 for <qemu-devel@nongnu.org>; Fri,  7 Apr 2023 19:01:51 +0200 (CEST)
Message-ID: <32ca1552-0177-bdd7-405d-b95abb938338@weilnetz.de>
Date: Fri, 7 Apr 2023 19:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-20-marcandre.lureau@redhat.com>
Subject: Re: [PATCH 19/41] compiler.h: replace QEMU_NORETURN with G_NORETURN
In-Reply-To: <20220420132624.2439741-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.03,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please excuse the late report, but this old patch causes a build failure 
for me:

Am 20.04.22 um 15:26 schrieb marcandre.lureau@redhat.com:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
> glib-compat.
> 
> Note that this attribute must be placed before the function declaration
> (bringing a bit of consistency in qemu codebase usage).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 848916f5165c..14b6b65a5fa9 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -177,7 +177,8 @@ extern "C" {
>    * supports QEMU_ERROR, this will be reported at compile time; otherwise
>    * this will be reported at link time due to the missing symbol.
>    */
> -extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
> +extern G_NORETURN
> +void QEMU_ERROR("code path is reachable")
>       qemu_build_not_reached_always(void);
>   #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
>   #define qemu_build_not_reached()  qemu_build_not_reached_always()

The placement of G_NORETURN causes a compiler error for C++ code in 
cross builds for Windows (see below). C++ expects the attribute 
[[noreturn]] before the extern statement.

I updated my Debian build environment to Debian bookworm and a recent 
cross glib, so maybe the problem was hidden in previous builds because I 
used a rather old glib or an older g++ cross compiler.

Regards,
Stefan


In file included from /mingw64/lib/glib-2.0/include/glibconfig.h:9,
                  from /mingw64/include/glib-2.0/glib/gtypes.h:34,
                  from /mingw64/include/glib-2.0/glib/galloca.h:34,
                  from /mingw64/include/glib-2.0/glib.h:32,
                  from 
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/glib-compat.h:32,
                  from 
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/qemu/osdep.h:144,
                  from ../../../qga/vss-win32/requester.cpp:13:
/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: error: standard 
attributes in middle of decl-specifiers
  1076 | # define G_NORETURN [[noreturn]]
       |                     ^
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/qemu/osdep.h:240:8: 
note: in expansion of macro ‘G_NORETURN’
   240 | extern G_NORETURN
       |        ^~~~~~~~~~
/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: note: standard 
attributes must precede the decl-specifiers to apply to the declaration, 
or follow them to apply to the type
  1076 | # define G_NORETURN [[noreturn]]
       |                     ^
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/qemu/osdep.h:240:8: 
note: in expansion of macro ‘G_NORETURN’
   240 | extern G_NORETURN
       |        ^~~~~~~~~~
/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: warning: attribute 
ignored [-Wattributes]
  1076 | # define G_NORETURN [[noreturn]]
       |                     ^
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/qemu/osdep.h:240:8: 
note: in expansion of macro ‘G_NORETURN’
   240 | extern G_NORETURN
       |        ^~~~~~~~~~
/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: note: an attribute 
that appertains to a type-specifier is ignored
  1076 | # define G_NORETURN [[noreturn]]
       |                     ^
/home/stefan/src/qemu/repo.or.cz/qemu/ar7/include/qemu/osdep.h:240:8: 
note: in expansion of macro ‘G_NORETURN’
   240 | extern G_NORETURN
       |        ^~~~~~~~~~
../../../qga/vss-win32/requester.cpp: In function ‘HRESULT 
requester_init()’:
../../../qga/vss-win32/requester.cpp:72:34: warning: cast between 
incompatible function types from ‘FARPROC’ {aka ‘long long int (*)()’} 
to ‘t_CreateVssBackupComponents’ {aka ‘long int 
(*)(IVssBackupComponents**)’} [-Wcast-function-type]
    72 |     pCreateVssBackupComponents = (t_CreateVssBackupComponents)
       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    73 |         GetProcAddress(hLib,
       |         ~~~~~~~~~~~~~~~~~~~~
    74 | #ifdef _WIN64 /* 64bit environment */
       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    75 | 
"?CreateVssBackupComponents@@YAJPEAPEAVIVssBackupComponents@@@Z"
       | 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    76 | #else /* 32bit environment */
       | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    77 | 
"?CreateVssBackupComponents@@YGJPAPAVIVssBackupComponents@@@Z"
       | 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    78 | #endif
       | ~~~~~~
    79 |         );
       |         ~
../../../qga/vss-win32/requester.cpp:85:34: warning: cast between 
incompatible function types from ‘FARPROC’ {aka ‘long long int (*)()’} 
to ‘t_VssFreeSnapshotProperties’ {aka ‘void (*)(VSS_SNAPSHOT_PROP*)’} 
[-Wcast-function-type]
    85 |     pVssFreeSnapshotProperties = (t_VssFreeSnapshotProperties)
       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    86 |         GetProcAddress(hLib, "VssFreeSnapshotProperties");
       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

