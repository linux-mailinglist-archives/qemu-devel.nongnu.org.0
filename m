Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF73F60EF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:49:45 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXkG-0003NG-3K
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXiv-0001GS-4W
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:48:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXis-0004XT-Do
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:48:20 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn28so32097108edb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BmGB4IgqH4PsPc3PxixkqnQkR+9eFyZdvD1mHlwuMIM=;
 b=mwyeLzE9WIAiQd6fW8p+S82Ff0xIMjDoWYKmwVaCh7M9jAZDUG9jRoK8HaUGeJ15oa
 d7BULpDvRYRruZs9/r2Rz4Vnu/qtZ4XtLbbNA/40nQU3+KGmpsIy8cUn3eDfDzymVnZA
 u86CmyEQ/tUWWp2PT5fc3eo/D6DUrKODwo4+jTYcyCloEnRP8BmUZWF3/310bBF11VhD
 iP9Xyf0KKtb9MthQQlZmDjnP2CuSnisZwUg05YyZP5eGem/Mv6nvJ695t234nyDUwZcK
 bxlT6j7UaOu8R4NDVdPwzF9ym3jkpZ9JtQ+kkTrtd/5oFscnbvVsQ+xmyc50bRCP5DZj
 dqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmGB4IgqH4PsPc3PxixkqnQkR+9eFyZdvD1mHlwuMIM=;
 b=h2eP52Pq6/XSZybljQ3xtRkZmc6hYaoDfzC2Dw81c9BKtrpOHAV2Kt0nlvqonlhExf
 iGk7DPUXAQ1N3sjwcPAx+Tozda1kpGsDus07Iw4Xj7yUY6XgMR6c6GBuUjU1CPYqbe8r
 dHFdFewpvNIfwjI7HrIPygJrgJOhUeOLJddkxNzJsJa3enizYv1A+xrKIa6F5AXTRc2/
 oAB8swPNAT76UDdT4U1VKIw2PXK9jkwvt/KG2NIZkrIiTIndk134z/MjrVRvtz+kEH5K
 EixFrJ02GVknFd7N8O4aW5yxmPs0Z/ntx6C71pr40w10HizzR+e/bQmcJItIqBKXVlbt
 UaPQ==
X-Gm-Message-State: AOAM5327+KmXGeY68XJTbCMoItTxHdQOO/FXep5O8Cac2wL8CexZRnxg
 gIfzsSMyos3BG77wnFb8KmtRrFDpm6FLFDLb567Ysg==
X-Google-Smtp-Source: ABdhPJxl4LdEwBJYjv0DwJPjA9NRAnU/f8apuZU5YVWrU7nl8BygfhmYknhFZe7c6BNXwKSUSG7H8xU/x1kC1dl0MUg=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr32610447edp.146.1629816496486; 
 Tue, 24 Aug 2021 07:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
 <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
 <22e65815-7aaa-69d1-fa72-d40f3d480498@fs.ei.tum.de>
In-Reply-To: <22e65815-7aaa-69d1-fa72-d40f3d480498@fs.ei.tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 15:47:29 +0100
Message-ID: <CAFEAcA9itqeya5WVhfsVEvjvFStSW=yrAtOw6tcak9QrG+nxeQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 15:34, Florian Hauschild
<florian.hauschild@fs.ei.tum.de> wrote:
>
>
>
> Am 21.08.21 um 15:18 schrieb Peter Maydell:
> > On Sat, 21 Aug 2021 at 10:48, Florian Hauschild
> > <florian.hauschild@fs.ei.tum.de> wrote:
> >>
> >> This extension covers functions:
> >>   * to read and write guest memory
> >>   * to read and write guest registers
> >>   * to flush tb cache
> >>   * to control single stepping of qemu from plugin
> >>
> >> These changes allow the user to
> >>   * collect more information about the behaviour of the system
> >>   * change the guest state with a plugin during execution
> >>   * control cache of tcg
> >>   * allow for precise instrumentation in execution flow
> >
> >> +
> >> +static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
> >> +{
> >> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> >> +    if (reg < cc->gdb_num_core_regs) {
> >> +        return cc->gdb_read_register(cpu, buf, reg);
> >> +    }
> >> +    return 0;
> >> +}
> >
> > At the point where these functions execute is the emulation
> > definitely stopped (ie no register values currently held
> > live in TCG locals) ?

> I am not sure, if it is definitely stopped.
> I call them during tb_exec_cb and insn_exec_cb.
> I have used the extension on ARM and RISC-V single cpu guests and the
> data collected is the one i would expect during normal execution on real
> hardware. How this would behave on a multi cpu/core system i have not
> tested yet.

Multicore isn't relevant here. What you want to check for
is what happens when the TB covers multiple guest instructions
such that a later insn in the TB uses a register that is
set by an earlier insn in the TB, eg:

    mov x0, 0
    add x0, x0, 1
    add x0, x0, 1

In this case TCG is likely to generate code which does not
write back the intermediate 0 and 1 values of x0 to the CPUState
struct, and so reading x0 via the gdb_read_register interface
before the execution of the 3rd insn will continue to return
whatever value x0 had before execution of the TB started.

For the gdbstub's use of the gdb_read_register API, this
can't happen, because we always completely stop the CPU
(which means it is not inside a TB at all) before handling
gdbstub packets requesting register information.

I don't know whether the TCG plugin infrastructure takes steps
with its various callbacks to ensure that intermediate values
get written back to the CPU state before the callback is
invoked: it's possible that this is safe, or can be made to
be safe.

thanks
-- PMM

