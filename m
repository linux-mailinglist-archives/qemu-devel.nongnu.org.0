Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2AB48EE94
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:43:19 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8PfZ-00082J-VY
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:43:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8Pe3-0007Ez-Nw; Fri, 14 Jan 2022 11:41:46 -0500
Received: from [2607:f8b0:4864:20::332] (port=34406
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8Pdo-0003hk-DJ; Fri, 14 Jan 2022 11:41:43 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso7517018otf.1; 
 Fri, 14 Jan 2022 08:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWdArF1DZPGsAoS444Kcg8YCjjpZ0B/iCMzrUY0UjCE=;
 b=JJgvXt5zRhD3CTaXj5At/d5oOg7sH/7xM8MgvLKQp3WgeqfPrZoDkixZzJarRjgaJr
 QOF+s/I/gCGlbSPkeQnZ59FbHJTHaowZ4RkX6qPvNQZB2Laj+ioR+TxE9/hq2k1pVY9c
 HrKyCT22/jC5Ru8ITzGE7X1NRIH2gmtP9wfx3wi8/IHc+/XK+omZPysSb6q4Sj0qXMO7
 xuTWsMQJWiRUwheP0st4ApPQiBrv+pq/FlFYQHCs8KBY54kvbrrHLDID0NyxZHqUg3IS
 taCqrINjU1JCvCCwwz9mzJNac7B1NvvmoKT1YWwUGcQzFGnHDChEUyxCyvWz4OSdNQGu
 Q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWdArF1DZPGsAoS444Kcg8YCjjpZ0B/iCMzrUY0UjCE=;
 b=ev7o80etEBlcPbMbr9C2WC3ZNMuLqxRBHKOf8akfAk2tXWbV9DgNQaah3du4vEZpQi
 EE1lD6wKj/OOZDRD2Vvad6DbUrLaPiypfZxNxy1ozh8wPREjeCVH1mo0ZHppT0+4IeaH
 BZY5Jgb0vX2CIEOD245W6pijqI0BlShH0yncUfaCCL1Gkvfu9aEl2YkpbQJWlL1MRJRS
 QMkKcdeym4F766CJikQUzVF015jZB/PDAqTRTAq1DQXkblazeOfit0SryArULVNkjfRA
 SkSv8mJQB3arAgptQWfDb7fCCdzIsRNO9QUvRRoXlrKrK+f47GKGo+smeYsRJ+iHOxsn
 8sjQ==
X-Gm-Message-State: AOAM533jccGmu19x/cZG/ndEc1sxdcTOBhJhE9lrkNDQlwuZG9pw4Aws
 8qG50O3LA4dybeyDqBd05xeUHLExQZ5S9I0fP/Y=
X-Google-Smtp-Source: ABdhPJxajsxdSiX/Yu10d/OYbRfarsRNiiMwQRu50IF61Qw6b7w0a63k3fRtjLn6rpTv8muDB6bw5pnk7CrNpndZVw8=
X-Received: by 2002:a9d:27c1:: with SMTP id c59mr5382189otb.150.1642178483836; 
 Fri, 14 Jan 2022 08:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <87ilum8gfp.fsf@linaro.org>
In-Reply-To: <87ilum8gfp.fsf@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Fri, 14 Jan 2022 18:41:12 +0200
Message-ID: <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range
 flush
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>
> For multi-patch series please include a cover letter which is the parent
> of all the patches. This is the default for git-send-email.
>

Sorry, I will do so from now on.

>
> The code itself looks fine but what sort of improvements are we talking
> about here? What measurements have you taken and under what conditions?
>

Execution time of the following assembly snippet in TCG
aarch64-softmmu with icount (shift=3D10) enabled decreased from 4
minutes and 53 seconds to below 1 second:

movk    x0, #0x0
movk    x0, #0x0, lsl #16
movk    x0, #0xff80, lsl #32
movk    x0, #0x0, lsl #48
mov      x9, #0x64
str         x9, [x8]
tlbi        rvae1, x0
ldr         x9, [x8]
sub       x9, x9, #0x1
str         x9, [x8]
cbnz     x9, 0x5168abc8

>
> --
> Alex Benn=C3=A9e

Idan Horowitz

