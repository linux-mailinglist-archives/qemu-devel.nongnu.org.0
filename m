Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA66968FA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:13:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxvY-0004eb-UN; Tue, 14 Feb 2023 11:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxvV-0004dr-4y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:13:05 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRxvS-0005c7-W6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:13:04 -0500
Received: by mail-pl1-x635.google.com with SMTP id r8so17562711pls.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676391181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEI1jBcCGCd9wcK4QXMHYImnKlMiUwECkVipe0en9/c=;
 b=KIkbPcIKY4EqrCLlqJtHN3ILkpI5UxG9hnMhM4d6xRzQcwggJVRvJD8bRiVuuxXIbE
 H4UNV+sWuEb4yE5SbyuuGPtIYArxAxoPPCeAACBZM4bnufGMW0xArbdQOFJWG7AqokAK
 h28/rot10bC4golNgDwgEMpam6egtl1uJ9rjNd3hWTh8Mhmt8w4/uepKLqKSchqtpDbJ
 HFEkRRdn8lWlS1MJEL68848tOYjUZjsUOzWJdPUVQ94ONwMd+CONSbAyHGFQMFjxIOxJ
 ilgeHqgTqbWhe25rXTBM3y4NSMbRQ0eANs/i84oaOcEWHnSRdWs6fyDX8cgcJWnkCi2y
 JclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676391181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEI1jBcCGCd9wcK4QXMHYImnKlMiUwECkVipe0en9/c=;
 b=fvlFU7m0YWwVmxPBV2mGm9enCWagtoVbbcJTevW7MqLUf0ffY0jicxPRLQWCGDmBJY
 qgMybkJ2+Pndf34qNWVOdyQbHny4K6IqYcaxG2x7z/pLYrigO2+UZCQSJfUD96SdF7Lh
 GTj4DyWZFcqwP9paWj3X6vQGLPIQekDHFjszgAnwy0gkNkY6qgU23lscYTOyLxDSUTQE
 e8y/pWfV4L7tghjNkWpBDvbpiJql9B6opNcyJ2CWtUr0yVWCC3U1TEWe4mkBT8PGpjrs
 1pjw48aDwMDQey7g03aTi8e027GWj0w+Q/61EfVdfAaLDNIaQUVsyO7Z0m35dEBCfW+x
 Xspw==
X-Gm-Message-State: AO0yUKUYdH0Q7SCqzgSBPG5+kgUEOdfL4Zoyhm3EWnDoYh56haWFR0GS
 LZuCgUHX2MnAS9x8XXQXBCKGMNG2zSkWkOOsusey9g==
X-Google-Smtp-Source: AK7set9oitrNw87P6Rgyh0Lj3p35zp6o8Z5/HH+D0M31an0fABRb1DPpS2ABxS9d2nauCSYQn40tKzjCGRj2ucul9sI=
X-Received: by 2002:a17:902:c941:b0:19a:721b:bce1 with SMTP id
 i1-20020a170902c94100b0019a721bbce1mr859833pla.23.1676391181307; Tue, 14 Feb
 2023 08:13:01 -0800 (PST)
MIME-Version: 1.0
References: <167579147730.28776.7263330829354840538-0@git.sr.ht>
 <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
In-Reply-To: <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 16:12:50 +0000
Message-ID: <CAFEAcA95K=vTRzMtuo22DEJxGetS-LE-0x-8kWVOdPiDxGo8pA@mail.gmail.com>
Subject: Re: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 7 Feb 2023 at 17:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 7 Feb 2023 at 17:37, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
> >
> > New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
> > CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
> > is that this function is now taking up space in the user-only binary,
> > but it can (presumably?) never be used because there are no user modes
> > for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
> > CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
> > me know if you'd prefer a separate commit for renaming and moving
> > v7m_mrs_control.
>
> We do support the M-profile cores in the linux-user executables,
> so this code is "live". The view that the guest program and
> the debugger should see is that the core is always in
> user mode (aka unprivileged, Thread mode).

Having looked more closely at the registers in the
org.gnu.gdb.arm.secext set, I think the right answer here is
that for CONFIG_USER_ONLY we should never expose the second
org.gnu.gdb.arm.secext block. Because the guest is restricted
to non-secure mode only, the registers in the
org.gnu.gdb.arm.m-system block are sufficient to get all the
interesting information, and the debugger shouldn't be confused
by only seeing one of the two, because that's what it sees when
talking to a CPU which doesn't have the security extension.
The register state in the other block is OK.

(I don't think the code as it stands will be broken as such,
but it will let the debugger read a lot of confusing 0s, and
it leaves the door open for us forgetting to prevent writes
if we add system register write suport later, which would let
gdb put QEMU into states it doesn't expect to be in.)

That change is simple (couple of ifdefs in gdbstub.c, and
then it lets us avoid moving the definition of the
arm_v7m_get_sp_ptr() function). But Richard has just told
me he has a rework of some of the gdbstub handling which
he incorporated this patchset into, so I think the best
thing is if he can post that series.

thanks
-- PMM

