Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3A6FDFAE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:10:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkUp-0007gc-3G; Wed, 10 May 2023 10:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkUn-0007f6-3M
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkUl-0006Gj-4P
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683727721;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EpOmdPjQCuLlUEJIqqREEfLJNyxaRjxnnrsoar94CA=;
 b=VviNDKa+2+saOb5VLqRWsU0lJX83lz1vdZaCKnSENxfg2UzOUDSLCHYEU39OQFgFihtbs9
 3/L3LjLJt/s5vIHoedmIX3ytiKyqGvzmMS6NSdwO2RCpBg6ZSd0vQuIZKBEcXBQkhm2oF7
 lkgZqRcQCu12VnXEFV6/MQbi66JTX5U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-KwlFQ3RDMMWurEwqGckWuQ-1; Wed, 10 May 2023 10:08:40 -0400
X-MC-Unique: KwlFQ3RDMMWurEwqGckWuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-307977ae703so2213838f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683727718; x=1686319718;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EpOmdPjQCuLlUEJIqqREEfLJNyxaRjxnnrsoar94CA=;
 b=DJ6s/V/+nWUXxT+mtIVeInbwhZgnQpthdM5hjX/Mje77nWpFb7fLvO3YNU6z1Iwcc2
 /v488gCJlM7+cFBRWxoOtaG5GyQkkt9EU3k9yY3J3Tv6UkGZFbTwi04EGnqMg/nr0C5r
 pIdW37jlqkqt57/GkErbj/+R2Qs/81qQLVY93vVbIM7vNzZadZdGruJnQd7tEatKtZtt
 AGpj56UdHpCt9RQbBJOYvBhXnBoxwmG7I/pJSWme4e7zgGzjgOtiua4Xl4w5iNWrIfHU
 ClFGDdoeoOLvzg6rdy3pCzr4fpovd6ACiJ4DbtmjcEnmtKqiCYLbw6hVOVAaDdC3kxWk
 bFvg==
X-Gm-Message-State: AC+VfDzUz6SHwJ2q7mEVFuvIcK7B/KiYnAMuSOgmo6o0THPGDK9d3W8G
 SbkMy7kJyUHMi3DPoZrObZs61QbTrI92kmn9kEwYyQwEbJdMDpw/kBzdfXsJ+WJr2qDptfjJ9Jk
 JOzvTDAb9Bf/oX2o=
X-Received: by 2002:adf:dd87:0:b0:307:a52c:26b4 with SMTP id
 x7-20020adfdd87000000b00307a52c26b4mr3833278wrl.66.1683727718037; 
 Wed, 10 May 2023 07:08:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7se8FlnKQ/xGUcAIy0B6wrfeMZ8STEXC0St5DkmPupAUfOiHGnbiCuW5VfEJz/wO4sTLlH8A==
X-Received: by 2002:adf:dd87:0:b0:307:a52c:26b4 with SMTP id
 x7-20020adfdd87000000b00307a52c26b4mr3833258wrl.66.1683727717690; 
 Wed, 10 May 2023 07:08:37 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056000050600b003079c402762sm8071580wrf.19.2023.05.10.07.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 07:08:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,  Eric Blake
 <eblake@redhat.com>,  qemu-block@nongnu.org,  Peter Xu
 <peterx@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 00/10] Migration 20230509 patches
In-Reply-To: <fbe67cac-5135-219f-6c15-7e63e58ce10a@linaro.org> (Richard
 Henderson's message of "Wed, 10 May 2023 13:35:07 +0100")
References: <20230509191724.86159-1-quintela@redhat.com>
 <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org>
 <87ild08jjq.fsf@secure.mitica>
 <fbe67cac-5135-219f-6c15-7e63e58ce10a@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 16:08:35 +0200
Message-ID: <87a5yc8ejg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 5/10/23 13:20, Juan Quintela wrote:
>> Richard Henderson <richard.henderson@linaro.org> wrote:
>>> On 5/9/23 20:17, Juan Quintela wrote:
>>>> The following changes since commit 271477b59e723250f17a7e20f1392620579=
21b6a:
>>>>     Merge tag 'compression-code-pull-request' of
>>>> https://gitlab.com/juan.quintela/qemu into staging (2023-05-08
>>>> 20:38:05 +0100)
>>>> are available in the Git repository at:
>>>>     https://gitlab.com/juan.quintela/qemu.git
>>>> tags/migration-20230509-pull-request
>>>> for you to fetch changes up to
>>>> 5f43d297bc2b9530805ad8602c6e2ea284b08628:
>>>>     migration: block incoming colo when capability is disabled
>>>> (2023-05-09 20:52:21 +0200)
>>>> ----------------------------------------------------------------
>>>> Migration Pull request (20230509 vintage)
>>>> Hi
>>>> In this PULL request:
>>>> - 1st part of colo support for multifd (lukas)
>>>> - 1st part of disabling colo option (vladimir)
>>>> Please, apply.
>>>
>>> Build failures.
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/4257605099#L2241
>>>
>>>     85 | void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, u=
int normal_num);
>>>        |                                                              ^=
~~~
>>>        |                                                              u=
_int
>>>
>> Grrr
>> And the worst thing is that hate those types, tried to get then out
>> long, long ago for a similar problem.

While I was not looking, some of them were corrected:

commit d7df0b41dc38327388c3f19fdf4246793d4a1e4b
Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Date:   Thu Jan 17 15:43:53 2019 +0400

    slirp: prefer c99 types over BSD kind

    Replace:
    - u_char -> uint8_t
    - u_short -> uint16_t
    - u_long -> uint32_t
    - u_int -> unsigned
    - caddr_t -> char *

> Where do these types come from, and can we poison them on the qemu side?

grep " uint;" on my system includes.  I know that there are more
creative ways to define it.

/usr/include/ffi-x86_64.h\0278:  ffi_arg   uint;
/usr/include/sys/types.h\0150:typedef unsigned int uint;

#ifdef __USE_MISC
/* Old compatibility names for C types.  */
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
#endif

I guess we get those someway.

/usr/include/nspr4/obsolete/protypes.h\052:typedef PRUintn uint;
/usr/include/mysql/server/my_global.h\0465:typedef unsigned int uint;
/usr/include/boost/iostreams/filter/zlib.hpp\047:typedef uint32_t uint;
/usr/include/qt5/QtCore/qglobal.h\0275:typedef unsigned int uint;

in qt it is defined for everything.

If I disable the ones in sys/types.h

I got:

cc -m64 -mcx16 -Ilibqemu-loongarch64-linux-user.fa.p -I. -I../../../../mnt/=
code/qemu/full -Itarget/loongarch -I../../../../mnt/code/qemu/full/target/l=
oongarch -I../../../../mnt/code/qemu/full/common-user/host/x86_64 -I../../.=
./../mnt/code/qemu/full/linux-user/include/host/x86_64 -I../../../../mnt/co=
de/qemu/full/linux-user/include -Ilinux-user -I../../../../mnt/code/qemu/fu=
ll/linux-user -I../../../../mnt/code/qemu/full/linux-user/loongarch64 -Iqap=
i -Itrace -Iui -Iui/shader -I/usr/include/capstone -I/usr/include/glib-2.0 =
-I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=
=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /mnt/code/=
qemu/full/linux-headers -isystem linux-headers -iquote . -iquote /mnt/code/=
qemu/full -iquote /mnt/code/qemu/full/include -iquote /mnt/code/qemu/full/t=
cg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_F=
ILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -=
fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -Wr=
edundant-decls -Wold-style-declaration -Wold-style-definition -Wtype-limits=
 -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-bo=
dy -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallth=
rough=3D2 -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-n=
egative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../../../..=
/mnt/code/qemu/full/linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCON=
FIG_TARGET=3D"loongarch64-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D=
"loongarch64-linux-user-config-devices.h"' -MD -MQ libqemu-loongarch64-linu=
x-user.fa.p/linux-user_syscall.c.o -MF libqemu-loongarch64-linux-user.fa.p/=
linux-user_syscall.c.o.d -o libqemu-loongarch64-linux-user.fa.p/linux-user_=
syscall.c.o -c ../../../../mnt/code/qemu/full/linux-user/syscall.c
../../../../mnt/code/qemu/full/linux-user/syscall.c:317:32: error: unknown =
type name =E2=80=98uint=E2=80=99; did you mean =E2=80=98guint=E2=80=99?
  317 | _syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, d=
irp, uint, count);
      |                                ^~~~

There are some other friends that fail in linux-user/syscall.c

I will post an RFC with my findings.

Later, Juan.


