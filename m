Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB53D24E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:54:24 +0200 (CEST)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Z9b-0000Ug-R4
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.guenther@gmail.com>)
 id 1m6XYs-0001f1-9P
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:12:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.guenther@gmail.com>)
 id 1m6XYq-0008EL-Hd
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:12:22 -0400
Received: by mail-ej1-x634.google.com with SMTP id nd37so8057816ejc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7UgXvimVSLr+dKWli3yEDd0WSUAx6/649dwuJ2AmB4=;
 b=KH7N9dQui9RBxwqdkHfovQ07zkASYqh8ZJNKw7fKPCb0n4qsUHySUSB1PAVUE6PBE2
 VdnRkyd1GpJJYB5TK4IglF3X2C4FNoFaIQs35hIrMc/GN6SZhnELfn9uhAZRI48V7sWT
 7R41C223wZe8NRxV/SFUqXuqj3ClM87FKnGe3CYdO6R5V1XT4aB7CLsAXLr/AE7yh26o
 CGbBkvfeI1gpQ0yobeMnBYaDPTZPBAdC52S8kUHgILsYBE6majXt3viJW7M7hs8Avj9B
 rYW+kK5HgO2ZyuMpDDZfUIm3CTAhKX+trJN3lVXbSqmgGYZ9RD4YjgikR0SGhxtj9sem
 pvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7UgXvimVSLr+dKWli3yEDd0WSUAx6/649dwuJ2AmB4=;
 b=dkUatfM5FMrRiRgzVcDmvefmx6fk+gFk2lvZhPt5I2+SJQTPCpGia2WurO+7SsuC2F
 taS+zGTDB1PiQCBMJUcSfgCQ9o5Xp9XTZJ79ZhZDP7NYusbEhG2oFbnWC13EzVbms+lb
 FXfxbZzRoC8u8rMou5dQ3qb1pluZmJfnRudQ/bYA5SbZ3UVRhiqwFCnFAEEhgawGsmRP
 JkQUG9UN+mizpe6WHkJ7+lVZDNfqyNHZSRlVD3SSBuI2HgbincoicMLrTz4xd/J6kJMt
 VYQXd0JhOO/USvYREaLkrcoogiooKeK97mGfYJ1aoDplehij+EFYmdP9ntbsjtQiSZ0u
 Wjsg==
X-Gm-Message-State: AOAM530r0+zku+3+6N4SCryL/28113POq3Y1zbwb+gYbmNiCmM+QBkFd
 zT7Q1hrP0DSEZwcirPy0Z7eyDrFvPwOMRWQz6k0=
X-Google-Smtp-Source: ABdhPJzE8oolrUdTVPizUzMWyzjiaIvOB4PqJEbyMk52LF6pJOEm7NG6l3S5IrChnNGe0OIVTlIy6pSRFwpetFONatk=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr43398181ejb.482.1626955938200; 
 Thu, 22 Jul 2021 05:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <87im15qbp3.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87im15qbp3.fsf@oldenburg.str.redhat.com>
From: Richard Biener <richard.guenther@gmail.com>
Date: Thu, 22 Jul 2021 14:12:07 +0200
Message-ID: <CAFiYyc2UuO8qXhwzVQ63DhPPiBjecm7rzY2t4Z-UMiserEfKKQ@mail.gmail.com>
Subject: Re: Disabling TLS address caching to help QEMU on GNU/Linux
To: Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.guenther@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Jul 2021 09:51:36 -0400
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
Cc: GCC Development <gcc@gcc.gnu.org>,
 GNU C Library <libc-alpha@sourceware.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 4:54 PM Florian Weimer via Gcc <gcc@gcc.gnu.org> wrote:
>
> Currently, the GNU/Linux ABI does not really specify whether the thread
> pointer (the address of the TCB) may change at a function boundary.
>
> Traditionally, GCC assumes that the ABI allows caching addresses of
> thread-local variables across function calls.  Such caching varies in
> aggressiveness between targets, probably due to differences in the
> choice of -mtls-dialect=gnu and -mtls-dialect=gnu2 as the default for
> the targets.  (Caching with -mtls-dialect=gnu2 appears to be more
> aggressive.)
>
> In addition to that, glibc defines errno as this:
>
> extern int *__errno_location (void) __attribute__ ((__const__));
> #define errno (*__errno_location ())
>
> And the const attribute has the side effect of caching the address of
> errno within the same stack frame.
>
> With stackful coroutines, such address caching is only valid if
> coroutines are only ever resumed on the same thread on which they were
> suspended.  (The C++ coroutine implementation is not stackful and is not
> affected by this at the ABI level.)  Historically, I think we took the
> position that cross-thread resumption is undefined.  But the ABIs aren't
> crystal-clear on this matter.
>
> One important piece of software for GNU is QEMU (not just for GNU/Linux,
> Hurd development also benefits from virtualization).  QEMU uses stackful
> coroutines extensively.  There are some hard-to-change code areas where
> resumption happens across threads unfortunately.  These increasingly
> cause problems with more inlining, inter-procedural analysis, and a
> general push towards LTO (which is also needed for some security
> hardening features).
>
> Should the GNU toolchain offer something to help out the QEMU
> developers?  Maybe GCC could offer an option to disable the caching for
> all TLS models.  glibc could detect that mode based on a new
> preprocessor macro and adjust its __errno_location declaration and
> similar function declarations.  There will be a performance impact of
> this, of course, but it would make the QEMU usage well-defined (at the
> lowest levels).

But how does TLS usage transfer between threads?  On the gimple
level the TLS pointer is not visible and thus we'd happily CSE its address:

__thread int x[2];

void bar (int *);

int *foo(int i)
{
  int *p = &x[i];
  bar (p);
  return &x[i];
}

results in

int * foo (int i)
{
  int * p;
  sizetype _5;
  sizetype _6;

  <bb 2> [local count: 1073741824]:
  _5 = (sizetype) i_1(D);
  _6 = _5 * 4;
  p_2 = &x + _6;
  bar (p_2);
  return p_2;
}

to make this work as expected one would need to expose the TLS pointer
access.

> If this is a programming model that should be supported, then restoring
> some of the optimizations would be possible, by annotating
> context-switching functions and TLS-address-dependent functions.  But I
> think QEMU would immediately benefit from just the simple approach that
> disables address caching of TLS variables.
>
> Thanks,
> Florian
>

