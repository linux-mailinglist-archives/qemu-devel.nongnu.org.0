Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D235E92A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 00:44:39 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWRlu-0005NL-Ja
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 18:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <husseydevin@gmail.com>)
 id 1lWR8Y-000431-MB
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 18:03:58 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <husseydevin@gmail.com>)
 id 1lWR8V-0003Bl-Lm
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 18:03:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id f15so9914262iob.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ts9YDO9StrH6laFFKgSYK+SPOiHYVlS95fgkkGqfo80=;
 b=U2myOs87nTXHMbq3eb+gMidNlOo+BzO8j+31nn2PObNzTpB58FE1BRLDDNWZRVkg2d
 7egxrwTFoqYO9vheauvpu2hxpyhKpeAW+rbG00fGVjQFXjaH1Ke0ydReX10cUsZnlBKX
 gQ4CWif3g8QBeWExLudB8piGjFdHYiVmG+vP0ftElN78jX2LeB7F/hxAmEB2tMW1b34F
 8suVYbXRRYxzGXJu3PBdtmUkkqudfKLGnDy/S6McOvh1LWU52pPmPP/H9OzXrEQ/vXuY
 88uMUQ6W9sorru0T5J8boC1D6Lkb6ZtV1Ryd/SiyVyO29EwKHCkuxORFON0PELBVRi9h
 QMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ts9YDO9StrH6laFFKgSYK+SPOiHYVlS95fgkkGqfo80=;
 b=DWbc8Xn65BMjrqQ3+AZwARA0xexbpL3dxG+UEFofgQXy424aIP+VOrqmrmkpZN9uvw
 H6XuiTEGEI+yDkDD23UOxBNjm+OtnEU2QUFGnh2MZbXA1YfYTfnw0Fg0T9Q3xkw6zktH
 FXcd/WHLqGJ/rY4tJctb5NwC2qta7SIqvEV/xr+hrT35/SdB4R+72nmbmM5yt/7qKWcl
 sMb/SFJniK/E+0J2ddeiYqh3aOxDrkxO5bfL2wUA9vjdDM5GGeL/+t8BYtUBAdPk5iev
 c0OOxTrwOidwYaw0TJGg5++6izuCH/6a6okAgNVW5zHiGNTifgibBIBYYh/QGl6DqLJQ
 iJdg==
X-Gm-Message-State: AOAM530naXYNE2q8tAEFWMib3jADazR1SylkoRxqYAXHJ/lkaFrfJC/x
 BiBPNZKZP/Hnal7ZnC4tNzSoGMKCXf+9dUQr7WnW9XL+fCk=
X-Google-Smtp-Source: ABdhPJziDNIYaeUXUv/DVwvRQlG4fc1eq4B5Vj0s/hKcdsZ1ojBcEkgnBGnIpa6vN1hWWT9MeVUb1T6BevHnW3r4/Ng=
X-Received: by 2002:a02:9048:: with SMTP id y8mr35503738jaf.66.1618351433088; 
 Tue, 13 Apr 2021 15:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:8490:0:0:0:0:0 with HTTP; Tue, 13 Apr 2021 15:03:52
 -0700 (PDT)
From: Devin Hussey <husseydevin@gmail.com>
Date: Tue, 13 Apr 2021 18:03:52 -0400
Message-ID: <CAEtFKsuPfRS1_exHPBNE-BLthbXoudUOcX6ND80FA=JqV8LrzA@mail.gmail.com>
Subject: Issues with modifying pc in a sigaction handler
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=husseydevin@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Apr 2021 18:43:41 -0400
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

In a toy project I was doing
(https://github.com/easyaspi314/ThumbGolf), I found that qemu will
incorrectly handle modifying pc in a handler.

Specifically, on platforms with instruction alignment requirements
(most notably ARM), if you set the pc to an odd address, QEMU will
start reading unaligned instructions.

Naturally, this is frustrating when dealing with ARM Thumb functions
which have the lowest bit set when referenced, as you must manually
clear the Thumb bit instead of it being implicit on hardware.

The following code exhibits this bug for ARM:

---
#include <signal.h>
#include <ucontext.h>
#include <stdio.h>

static void hello(void)
{
    printf("Hello,");
}

static void handler(int signo, siginfo_t *si, void *data)
{
    ucontext_t *uc = (ucontext_t *)data;
    // Effectively bl hello although we assume thumb state
    uc->uc_mcontext.arm_lr = uc->uc_mcontext.arm_pc + 2 | 1;
    uc->uc_mcontext.arm_pc = (unsigned long)&hello;
}

int main(void)
{
    // Set up the signal handler
    struct sigaction sa, osa;
    sa.sa_flags = SA_ONSTACK | SA_RESTART | SA_NODEFER | SA_SIGINFO;
    sa.sa_sigaction = handler;
    sigaction(SIGILL, &sa, &osa);
    sigaction(SIGTRAP, &sa, &osa);

    // Throw a SIGILL, which we do a runtime patch to call hello().
    // Make sure we mark the caller saved registers.
    __asm__ ("udf #0" ::: "r0", "r1", "r2", "r3", "r12", "lr", "memory");
    printf(" world!\n");
}
---
Compile with:
clang -O2 -march=armv7-a -mthumb file.c -static

(The same should happen with GCC).

On hardware (specifically, a Snapdragon 730g in Termux on Android 11),
the code prints "Hello, world!" and exits normally.

However, qemu-arm will get tripped up by the pc being odd, and execute this:

---
... snip
----------------
IN: main
0x00010288:  4c05       ldr      r4, [pc, #0x14]
0x0001028a:  de00       udf      #0

----------------
IN: handler
0x000102a4:  4804       ldr      r0, [pc, #0x10]
0x000102a6:  6dd1       ldr      r1, [r2, #0x5c]
0x000102a8:  4478       add      r0, pc
0x000102aa:  3102       adds     r1, #2
0x000102ac:  f041 0101  orr      r1, r1, #1
0x000102b0:  e9c2 1016  strd     r1, r0, [r2, #0x58]
0x000102b4:  4770       bx       lr

----------------
IN: __restore_rt
0x0004c36c:  e3a070ad  mov      r7, #0xad
0x0004c370:  ef000000  svc      #0

----------------
IN: hello
0x000102bd:  7848       ldrb     r0, [r1, #1]
0x000102bf:  0644       lsls     r4, r0, #0x19
0x000102c1:  5cf0       ldrb     r0, [r6, r3]
0x000102c3:  06bb       lsls     r3, r7, #0x1a
0x000102c5:  053e       lsls     r6, r7, #0x14
0x000102c7:  f000 89b5  beq.w    #0x90635

qemu: uncaught target signal 11 (Segmentation fault) - core dumped

---

Note the odd addresses in hello().

It should be interpreted as so, which happens when you manually clear
the Thumb bit:

---
0x000102b8:  4801       ldr      r0, [pc, #4]
                         0x000102ba:  4478       add      r0, pc
                                                  0x000102bc:  f006
bb5c  b.w      #0x16978 (printf)
---

