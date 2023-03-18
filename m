Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8F6BFCBD
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:31:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pddBp-0007jT-Re; Sat, 18 Mar 2023 16:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pddBn-0007j2-AH
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:30:07 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pddBl-0003ON-4f
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:30:06 -0400
Received: by mail-lj1-x22c.google.com with SMTP id t14so8426489ljd.5
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679171403;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhh0yqzaC/JCYmytfjp00tl+vwD38NkWFcefPes7rwA=;
 b=FM8Ieid2Oizygtl5h+7Sn6OPNjPtdKreLTYVrB/i5X+ltcLeruKqDKvCkTEHcyANy2
 UBRtvDZyUGdRMhtaTUicbjoYtdloF1/FlCyPdMjxVjh6BUSdKp/xXvRt1MUgaaemIiOy
 HiRbb78eoFuYwW1R0LBPdXzSbuRqjshsKCUww3p74GsbzBD61uGknvs6MouObv3pJr9j
 LMM7Yuu3iFj48aHwo3BpXL0CLQMO0o44smWDAWX8Ba4IpoKZl/i1yIyuJM7HjYnyCRa7
 8qRHodHoTV7fmUED/mEzlITBBoX5CSokRbYuGFe15/s5e2XdOWaU4QPozBShmrMfN5rc
 +WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679171403;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhh0yqzaC/JCYmytfjp00tl+vwD38NkWFcefPes7rwA=;
 b=u/fSPOARBlw3cBhSAwV3/VJ4Q/d+ebd72CScG0wB0Rq80N0fmZNGqijKEILEfqhwdb
 h7fIPCkbewJMYbHzuh4SCcxlZfbFVfpKdIWkKlC9wwpmM1JBeofz4A0477zoquYLHWJy
 YIIcoTFK+ROWKxc6Qy0y6H4eAIOqEdoaJec+Zna1YqzK3sLF508N9hDE5XxlrSacHXNb
 oO6Le9rSt8KbsjHJp2l71d+Wc7IYbzcTvOZOGq2Zg+UaUUKbfamW9wSWEkgfUSwMNS6p
 tJU3poH8aVePF4kaRReCiV+c1SXIsItEGPcByZnX+cgk202hjaMldke+2WGAmIIo5tEi
 nVNw==
X-Gm-Message-State: AO0yUKXt83nbyrN7flsCMAHYIkOr+TeHPM4XFn1HjBeHSXJqHd8dj44P
 M7+jpNMwRPKemI8IWdCompK+PQw/c7M=
X-Google-Smtp-Source: AK7set/Bk4+CZJyXXnzsdKw+uaHCBweZM6zKtnlm0J3vG05jTwdbnbdzmfCvA+kxQGG2Z/1u1xBWmw==
X-Received: by 2002:a17:906:c293:b0:8af:3382:e578 with SMTP id
 r19-20020a170906c29300b008af3382e578mr4007114ejz.4.1679170998181; 
 Sat, 18 Mar 2023 13:23:18 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-121-187.77.11.pool.telefonica.de.
 [77.11.121.187]) by smtp.gmail.com with ESMTPSA id
 r10-20020a1709063d6a00b00930e95446d0sm2491556ejf.120.2023.03.18.13.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Mar 2023 13:23:17 -0700 (PDT)
Date: Sat, 18 Mar 2023 20:23:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Stefan Weil <sw@weilnetz.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for_8=2E0=5D_qemu/osdep=3A_Switch?=
 =?US-ASCII?Q?_position_of_=22extern=22_and_=22G=5FNORETURN=22?=
In-Reply-To: <20230318185931.181659-1-shentey@gmail.com>
References: <20230318185931.181659-1-shentey@gmail.com>
Message-ID: <63A14BB7-4ED0-4BA4-BC6C-5704AED811C1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=shentey@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

+ Thomas, Daniel (gitlab issue) and Stefan (Windows)

Am 18=2E M=C3=A4rz 2023 18:59:31 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>Fixes the Windows build under msys2 using GCC 12 which fails with the fol=
lowing
>error:
>
>  [184/579] Compiling C++ object qga/vss-win32/qga-vss=2Edll=2Ep/install=
=2Ecpp=2Eobj
>  FAILED: qga/vss-win32/qga-vss=2Edll=2Ep/install=2Ecpp=2Eobj
>  "c++" "-m64" "-mcx16" "-Iqga/vss-win32/qga-vss=2Edll=2Ep" "-Iqga/vss-wi=
n32" "-I=2E=2E/src/qga/vss-win32" "-I=2E" "-Iqapi" "-Itrace" "-Iui" "-Iui/s=
hader" "-IC:/msys64/mingw64/include/glib-2=2E0" "-IC:/msys64/mingw64/lib/gl=
ib-2=2E0/include" "-fdiagnostics-color=3Dauto" "-Wall" "-Winvalid-pch" "-Wn=
on-virtual-dtor" "-Werror" "-std=3Dgnu++11" "-g" "-iquote" "=2E" "-iquote" =
"C:/msys64/home/shentey/Projects/qemu/src" "-iquote" "C:/msys64/home/shente=
y/Projects/qemu/src/include" "-iquote" "C:/msys64/home/shentey/Projects/qem=
u/src/tcg/i386" "-D__STDC_LIMIT_MACROS" "-D__STDC_CONSTANT_MACROS" "-D__STD=
C_FORMAT_MACROS" "-fno-pie" "-no-pie" "-D_GNU_SOURCE" "-D_FILE_OFFSET_BITS=
=3D64" "-D_LARGEFILE_SOURCE" "-fno-strict-aliasing" "-fno-common" "-fwrapv"=
 "-Wundef" "-Wwrite-strings" "-Wtype-limits" "-Wformat-security" "-Wformat-=
y2k" "-Winit-self" "-Wignored-qualifiers" "-Wempty-body" "-Wendif-labels" "=
-Wexpansion-to-defined" "-Wimplicit-fallthrough=3D2" "-Wmissing-format-attr=
ibute" "-Wno-missing-include-dirs" "-Wno-shift-negative-value" "-Wno-psabi"=
 "-fstack-protector-strong" "-Wno-unknown-pragmas" "-Wno-delete-non-virtual=
-dtor" "-Wno-non-virtual-dtor" -MD -MQ qga/vss-win32/qga-vss=2Edll=2Ep/inst=
all=2Ecpp=2Eobj -MF "qga/vss-win32/qga-vss=2Edll=2Ep/install=2Ecpp=2Eobj=2E=
d" -o qga/vss-win32/qga-vss=2Edll=2Ep/install=2Ecpp=2Eobj "-c" =2E=2E/src/q=
ga/vss-win32/install=2Ecpp
>  In file included from C:/msys64/mingw64/lib/glib-2=2E0/include/glibconf=
ig=2Eh:9,
>              from C:/msys64/mingw64/include/glib-2=2E0/glib/gtypes=2Eh:3=
4,
>              from C:/msys64/mingw64/include/glib-2=2E0/glib/galloca=2Eh:=
34,
>              from C:/msys64/mingw64/include/glib-2=2E0/glib=2Eh:32,
>              from C:/msys64/home/shentey/Projects/qemu/src/include/glib-=
compat=2Eh:32,
>              from C:/msys64/home/shentey/Projects/qemu/src/include/qemu/=
osdep=2Eh:144,
>              from =2E=2E/src/qga/vss-win32/install=2Ecpp:13:
>  C:/msys64/mingw64/include/glib-2=2E0/glib/gmacros=2Eh:1075:21: error: s=
tandard attributes in middle of decl-specifiers
>  1075 | # define G_NORETURN [[noreturn]]
>        |                     ^
>  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep=2Eh:240:8: =
note: in expansion of macro 'G_NORETURN'
>  240 | extern G_NORETURN
>        |        ^~~~~~~~~~
>  C:/msys64/mingw64/include/glib-2=2E0/glib/gmacros=2Eh:1075:21: note: st=
andard attributes must precede the decl-specifiers to apply to the declarat=
ion, or follow them to apply to the type
>  1075 | # define G_NORETURN [[noreturn]]
>        |                     ^
>  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep=2Eh:240:8: =
note: in expansion of macro 'G_NORETURN'
>  240 | extern G_NORETURN
>        |        ^~~~~~~~~~
>  C:/msys64/mingw64/include/glib-2=2E0/glib/gmacros=2Eh:1075:21: error: a=
ttribute ignored [-Werror=3Dattributes]
>  1075 | # define G_NORETURN [[noreturn]]
>        |                     ^
>  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep=2Eh:240:8: =
note: in expansion of macro 'G_NORETURN'
>  240 | extern G_NORETURN
>        |        ^~~~~~~~~~
>  C:/msys64/mingw64/include/glib-2=2E0/glib/gmacros=2Eh:1075:21: note: an=
 attribute that appertains to a type-specifier is ignored
>  1075 | # define G_NORETURN [[noreturn]]
>        |                     ^
>  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep=2Eh:240:8: =
note: in expansion of macro 'G_NORETURN'
>  240 | extern G_NORETURN
>        |        ^~~~~~~~~~
>  cc1plus=2Eexe: all warnings being treated as errors
>
>Apparently it also fixes the compilation with Clang 15 (see
>https://gitlab=2Ecom/qemu-project/qemu/-/issues/1541 )=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> include/qemu/osdep=2Eh | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/qemu/osdep=2Eh b/include/qemu/osdep=2Eh
>index f68b5d8708=2E=2E9eff0be95b 100644
>--- a/include/qemu/osdep=2Eh
>+++ b/include/qemu/osdep=2Eh
>@@ -237,7 +237,7 @@ extern "C" {
>  * supports QEMU_ERROR, this will be reported at compile time; otherwise
>  * this will be reported at link time due to the missing symbol=2E
>  */
>-extern G_NORETURN
>+G_NORETURN extern
> void QEMU_ERROR("code path is reachable")
>     qemu_build_not_reached_always(void);
> #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)

