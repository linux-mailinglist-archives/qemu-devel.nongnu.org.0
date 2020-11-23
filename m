Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9172C1524
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:05:20 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI5P-000390-Ne
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khHtU-0001MA-RT
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:53:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khHtS-0000iQ-LV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:53:00 -0500
Received: by mail-ej1-x62f.google.com with SMTP id o21so25038156ejb.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 11:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=FM26smcj6RkOp7JxLodNg9o5Zajg5g/mDT4X2wnKHUk=;
 b=kW1a5i6JHGqhlKxt49v2AESC1ekfOVIcWUEvZzT8K3m559GUhoO4287NcXZvPghiwU
 MgKmjM1zSvd2/pkcj8wWeMerE2cJVoUKp+jvjJIQ39UY/9VI3GGp/s78tBVlVkJ5+mZ4
 O+ZYoAzdcLydQ0KOcgYxDxhtGn2XRLmFov3A6cLq0aH4VND3/T7HNfXdtyFvQGuVXdkj
 bETt3z2hJxoYK8jz3WTNhlWSL8F9KmD064qqZTOVDTo8XCgmEXJfZHqTNQ/TH0qX+uSl
 C0yOBspw8df5WZx5c9MTWugUn90NnRFmjcRLDmctH3P5fR3lfEwOk8VWj4P4yFVRLRbY
 XsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FM26smcj6RkOp7JxLodNg9o5Zajg5g/mDT4X2wnKHUk=;
 b=QVt1/WNF0p5uKsYboEWJZQqohttXfO2ILOdLxSoSNTQkCCksVSsVkMCoM9rnJIIJeI
 legC9EzzGPWlo+lrZNtZHdumxi1KI1FUNYqnh6Jg12IHfqguNYMlYQtx79F8H3HPjIkb
 SewH3ZupIGzYplloYarVnOGf1frTRglFUlhEZ1W/FGLDpaosznmTFgyGtl8WoLiRKcDf
 3248UoAffvea6MigkE6dj7PGLUZdHr63SYdhnZlwO1LRekjCiRTohAg8ozuFI7pOvD0t
 fdM7Rp9U4AKgrbV8CsqCT3FuAyIP/Uz4HAz1R1G4z2TSutVLNyE6UpBfCSNV0+IF9M+d
 SKYw==
X-Gm-Message-State: AOAM5325CCrXz02CTMSqumOqvWDcJ/n8b96MXuRLvhN/GWlhEzO3lrf+
 DLyFyAgr9Vc2rIbSF1kyPilCaU8+21OpwiPEXuoGAtK4FG9TZA==
X-Google-Smtp-Source: ABdhPJxHlCOxwhRVp+ozxZZ9Unq8J1Imp234EYsZzeflDRrfjqsQXSFMlzQd/a64YNwBHMZydhJ9LObRkdJmzCfRLls=
X-Received: by 2002:a17:906:c084:: with SMTP id f4mr1172376ejz.4.1606161176250; 
 Mon, 23 Nov 2020 11:52:56 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 19:52:44 +0000
Message-ID: <CAFEAcA_=RGziK6H4Pip+heE3JfjTYaZgrTgkwM=tNTwsqvuLfg@mail.gmail.com>
Subject: simple aarch64 binary can cause linux-user QEMU to segv in zero_bss()
To: QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Somebody reported this on stackoverflow. Before I spend too
much time thinking about how this ought to work, does anybody
have the elfload.c intended operation in their head still?
Bug description and analysis of what goes wrong below:

https://stackoverflow.com/questions/64956322/alignment-requirements-for-arm64-elf-executables-run-in-qemu-assembled-by-gas

Given this trivial asm:

===begin program.s===
// GNU Assembler, ARM64 Linux

.bss

.lcomm ARRAY, 16

.text

.global _start

_start:
    mov x8, 93 // exit sys num
    mov x0, 0 // success
    svc 0
===endit===

clang -nostdlib -fno-integrated-as -target aarch64-linux-gnu -s
program.s -o program.out

the resulting program.out works fine on a real kernel but makes
qemu-aarch64 SEGV:
$ ./build/x86/qemu-aarch64 /tmp/program.out
Segmentation fault (core dumped)

Looking at it with gdb, the segv is from QEMU itself, in zero_bss():

    if (host_start < host_map_start) {
        memset((void *)host_start, 0, host_map_start - host_start);
    }

We try to clear the memory from 'host_start' to 'host_map_start'
(the latter being the round-up-to-host-page version of the former),
but for this binary we never mmap()ed host_start as writeable,
so we segv inside the memset.

The guest-binary relevant bits of /proc/maps are:
00400000-00401000 r--p 00000000 08:15 5767333
  /tmp/program.out
00401000-01411000 ---p 00000000 00:00 0

The program header is:
Program Header:
    LOAD off    0x0000000000000000 vaddr 0x0000000000400000 paddr
0x0000000000400000 align 2**16
         filesz 0x00000000000000bc memsz 0x00000000000000bc flags r-x
    LOAD off    0x00000000000000c0 vaddr 0x00000000004100c0 paddr
0x00000000004100c0 align 2**16
         filesz 0x0000000000000000 memsz 0x0000000000000010 flags rw-

and in zero_bss() host_start == 0x4100c0, host_map_start == 0x411000,
last_bss == 0x411000. The code calls
 page_set_flags(start = 0x410000, end = 0x411000,
flags=PAGE_VALID|PAGE_READ|PAGE_WRITE)
with, I assume, the intention that that will make the memset() OK,
but page_set_flags() just sets up some data structure bits which will
mean that a subsequent SEGV will cause us to do a page_unprotect() that
sets the page as actually writeable. Unfortunately the SIGSEGV handler
is not installed until quite late in linux-user/main.c, so when the
memset() in zero_bss() SEGVs QEMU just dies.

Should we try to get the SEGV handler working earlier in initialization
(it's pretty hairy machinery so that could be tricky) or should
elfload.c be mprotect()ing things appropriately itself?

thanks
-- PMM

