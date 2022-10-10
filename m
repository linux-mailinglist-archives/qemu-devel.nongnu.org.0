Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB265F99BA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:15:44 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohn0p-0001u5-DA
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohmyT-0000Dw-0T
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohmyP-0006nJ-0O
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665385991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW5bSiQFXX49q30RTMEn89k90gEHaaLElq0f/2HfjFI=;
 b=Qt2107G/wKDyOt4Jf8JRYPyAM6G+PsBU63KeLo7+uMlmSvGsM7yVZBXhJtCcrOVB51KGyZ
 BTUiesB0H4rUzYg58vGLaBUhic3apggp3tBjYfv/7TzchaGQebj0dpthODq7TrFQDaWGBN
 qtreXJSW72uHYvK5k7ge1zjDieNX7ys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-LY3P8ye1MNupbElHFiz1VA-1; Mon, 10 Oct 2022 03:13:09 -0400
X-MC-Unique: LY3P8ye1MNupbElHFiz1VA-1
Received: by mail-wm1-f69.google.com with SMTP id
 2-20020a05600c268200b003c4290989e1so1318721wmt.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:cc:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CW5bSiQFXX49q30RTMEn89k90gEHaaLElq0f/2HfjFI=;
 b=BOSEt5EK/qRo0hKf/GJ21qlOd33TRbWwZGRMg3gczgUvBzNF03BFtBuxdLEIC3gCrr
 FZocbtPuIz+Iem2FIVUB+X+PFVrdLk/ivWoHpZPrTnkBbKUV/cGrldGXVu0yveuuxKgy
 x+iuiPMd2CuiybLnpYEfEOMsUaocKRSpYy1peSJqRGbwxmAC7GS/dSSTcN8T0cETMOaw
 7pJXTY39QykP3sVjV+KxQfl/qaDHGdzk4D4RE6N9G33muy2bhE943PgvIY/jp/+YflDq
 hEkxlgsy/6wQ91XO2lU58+Xl98gjJPFi2Mw/p4nln0TtBv7p5CVfLRmhl3+v1e9Y5ddP
 O7Ww==
X-Gm-Message-State: ACrzQf1vhmRVArplwGocQX778QErF2QbQ9kY2ss+Ajy2VbdglF6i88XB
 ugn2Vpa6L8MTmuUd+V/mjfib5+Z52cVl91Sx6GZolCcbCpouNw/MX0YF+eldQpCt2j+6y5AwmBL
 JlT5jjNIDImWL8zA=
X-Received: by 2002:a5d:5231:0:b0:22e:2ff9:3a65 with SMTP id
 i17-20020a5d5231000000b0022e2ff93a65mr10539612wra.171.1665385988422; 
 Mon, 10 Oct 2022 00:13:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jQEly6MGzBlHmWS1U58RXNR1zHRdLGOqj69b5TL3EGGe23+TgiC3iTkdPaE3+w4an02/01A==
X-Received: by 2002:a5d:5231:0:b0:22e:2ff9:3a65 with SMTP id
 i17-20020a5d5231000000b0022e2ff93a65mr10539592wra.171.1665385988147; 
 Mon, 10 Oct 2022 00:13:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-99.web.vodafone.de.
 [109.43.178.99]) by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b0022cdeba3f83sm8125168wro.84.2022.10.10.00.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 00:13:07 -0700 (PDT)
Message-ID: <d7faf945-401b-b848-c32a-732e031c1a0a@redhat.com>
Date: Mon, 10 Oct 2022 09:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Dennis Clarke <dclarke@blastwave.org>, qemu-devel@nongnu.org
References: <af7a54fd-8194-a7fc-cfed-0c8e0cf101a0@blastwave.org>
From: Thomas Huth <thuth@redhat.com>
Cc: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: Re: FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
In-Reply-To: <af7a54fd-8194-a7fc-cfed-0c8e0cf101a0@blastwave.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/2022 08.18, Dennis Clarke wrote:
> 
> On FreeBSD 14.0 CURRENT amd64 everything seems to go swimmingly until :
> 
> [5679/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_mmap.c.o
> [5680/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
> FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
> /usr/bin/cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. -Itarget/arm 
> -I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include 
> -Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64 
> -Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/local/include -I/usr/local/include/glib-2.0 
> -I/usr/local/lib/glib-2.0/include -fcolor-diagnostics -Wall -Winvalid-pch 
> -std=gnu11 -O0 -g -iquote . -iquote /opt/bw/build/qemu -iquote 
> /opt/bw/build/qemu/include -iquote /opt/bw/build/qemu/tcg/i386 -pthread 
> -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition 
> -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self 
> -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels 
> -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs 
> -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition 
> -Wno-tautological-type-limit-compare -Wno-psabi 
> -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong -m64 -g -O0 
> -fno-builtin -fPIE -DNEED_CPU_H 
> '-DCONFIG_TARGET="arm-bsd-user-config-target.h"' 
> '-DCONFIG_DEVICES="arm-bsd-user-config-devices.h"' -MD -MQ 
> libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -MF 
> libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o.d -o 
> libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -c ../bsd-user/signal.c
> In file included from ../bsd-user/signal.c:27:
> In file included from ../bsd-user/host/x86_64/host-signal.h:14:
> In file included from /usr/include/vm/pmap.h:92:
> /usr/include/machine/pmap.h:452:2: error: fields must have a constant size: 
> 'variable length array in structure' extension will never be supported
>          PV_CHUNK_HEADER
>          ^
> /usr/include/machine/pmap.h:448:12: note: expanded from macro 'PV_CHUNK_HEADER'
>          uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */  \
>                                  ^
> /usr/include/machine/pmap.h:456:2: error: fields must have a constant size: 
> 'variable length array in structure' extension will never be supported
>          PV_CHUNK_HEADER
>          ^
> /usr/include/machine/pmap.h:448:12: note: expanded from macro 'PV_CHUNK_HEADER'
>          uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */  \
>                                  ^
> 2 errors generated.
> ninja: build stopped: subcommand failed.
> gmake[1]: *** [Makefile:165: run-ninja] Error 1
> gmake[1]: Leaving directory '/opt/bw/build/qemu/build'
> gmake: *** [GNUmakefile:11: all] Error 2
> 
> phobos#
> 
> Is there a trivial patch ?  Or perhaps try again using GCC and not LLVM/Clang?

I'm not using FreeBSD, so no real clue, but this pretty much sounds like 
_NPCM is not properly defined by your system headers anymore, so I assume 
this is a problem on the FreeBSD side ... I'd suggest to report it on the 
FreeBSD mailing list.

  Thomas


