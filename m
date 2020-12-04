Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DD2CF532
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:59:03 +0100 (CET)
Received: from localhost ([::1]:42488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHEL-0004fz-QP
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1klEa8-0006wJ-Bj
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:09:22 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1klEZI-00067E-7I
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:08:56 -0500
Received: by mail-lf1-x144.google.com with SMTP id a9so8632993lfh.2
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x21ViHKE8gzgFzcgovKz4qGIY6AqAc/2iDUN+mzcJws=;
 b=DrBXTq9iwPhBhcNIaejzmU86137Wg4cLvB/g9whh+Z/PphkZKx7QGLap0poB2ujEpa
 6C172x1qUWqPj/se9kOxjbMUGQDbR7yal3wGrdBSwsgL0xVMtY5X4FqNtHGYHixbAeNh
 A+a1zb24pTsg8pq5lKXIW5jaeQ5npqz5HZdyls24sSr7JTt3sQ74jddBXJfYow9sgQKr
 2iukEVyhHNvoClATLLR0ujPfCUy0rPdiBhDS/jjytj1VJoCRS0ieeymvpA9eOP5V9uKD
 7MH/Dg8C7mARrz42Dx7hyfft+tCZRFlsvprbzQr6Slu4yZU4S28jqGTSYy4HtbpQIWDB
 xz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x21ViHKE8gzgFzcgovKz4qGIY6AqAc/2iDUN+mzcJws=;
 b=A2FtZ9HNVUoIusHAyxiTIRU68/qsfyp9APTMRn3f6VSMudLlFTPBYrzMFefHb7D3oz
 ZkMxYqVBCRYpEz6VEli1YqXvGobkfEalX9K0eB02e1H8aq+5xf4h8Ep9mEYHOiNNruwj
 KZMuAigGy+iWhhmQIbw3bOEoxuzlVObxKr/6wbe8do59n+xSCtDml24RW1pWkISjpG2D
 VurIvUvWvPnfKkrVSspaPk1BcgdEh+qLAJ2kXgyS1l+SwUwMJSLWWujIQ4kDar6Cac/Q
 +s9GDMWjIx+/d2F5LDEknXgJw6itlxLTvQFKjHvhqat2MjvBmSHgn0cpxO+RnXB5fV0m
 8mYg==
X-Gm-Message-State: AOAM531UCr1SdfvoRlNWWZ+CWnIhaLExpNDCgi1fHjAF7xzb7sJYAXCJ
 VnVOUDtmcAWapcU8RzxOLi14nXE07vTNRl0nFfEt2yDd+BY=
X-Google-Smtp-Source: ABdhPJz+tC/89xYumgdKnNFdNxHibFC9yljQYbjwId0WBLXEEbHf4qa4DbdIQ/RzbWhZK/hMN2MDxRTJzH6A+evc/aI=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2146422edw.52.1607099783375;
 Fri, 04 Dec 2020 08:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
 <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
 <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
 <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
In-Reply-To: <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Dec 2020 16:36:12 +0000
Message-ID: <CAFEAcA9wBVjurjNLoRw9UbWnp-N1=oNVP0en90_QU7h+rZ0MeA@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x144.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 at 06:17, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wr=
ote:
>
> On 03.12.2020 19:14, Peter Maydell wrote:
> > On Thu, 3 Dec 2020 at 16:10, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru=
> wrote:
> >>
> >> On 03.12.2020 15:30, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Cc'ing Pavel
> >>>
> >>> On 12/1/20 4:55 PM, Peter Maydell wrote:
> >>>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> >>>> <richard.henderson@linaro.org> wrote:
> >>>>>
> >>>>> As reported in https://bugs.launchpad.net/bugs/1905356
> >>>>>
> >>>>> Not implementing SCTLR.A, but all of the other required
> >>>>> alignment for SCTLR.A=3D0 in Table A3-1.
> >>>>
> >>>> Something in this series breaks the 'make check-acceptance'
> >>>> record-and-replay test:
> >>>>
> >>>>    (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test=
_aarch64_virt:
> >>>> PASS (9.14 s)
> >>>>    (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test=
_arm_virt:
> >>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> >>>> Timeout reached\nOriginal status: ERROR\n{'name':
> >>>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_vi=
rt',
> >>>> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-cla=
ng/tests/result...
> >>>> (90.19 s)
> >>>>
> >>>> The log shows the "recording execution" apparently hanging,
> >>>> with the last output from the guest
> >>>> [    3.183662] Registering SWP/SWPB emulation handler
> >>
> >> I looked through the patches and it does not seem that they can break
> >> anything.
> >> Could it be the same avocado/chardev socket glitch as in some previous
> >> failures?
> >> What happens when re-running this test?
> >
> > I ran it a couple of times with the patchset and it failed the same
> > way each time. Without is fine.
>
> I applied the patches and got no failures on my local machine.
>
> Do you have any ideas on debugging this bug?
> What does "arm-clang" means? Is the host compiler is clang?

Yes, it's a clang build (with the sanitizers enabled, though I didn't
see any output from the sanitizers in the logfile).

thanks
-- PMM

