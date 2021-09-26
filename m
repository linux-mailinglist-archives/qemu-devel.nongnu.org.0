Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EA418A84
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:38:13 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZ2S-0003gC-8t
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYzO-0000uy-U2
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:35:02 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYzM-0005aT-Cv
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:35:02 -0400
Received: by mail-oi1-f178.google.com with SMTP id w19so22522324oik.10
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=padQWss6nEwCJp5lRHYoSK5Tn702fFuZZrIGlviuyX8=;
 b=fYmtUm1x2b7vtiH9G/94F5oeqMkwXvvwoA3KBA9h7bGzEu5FskFloBSkwQ+Nt0piJV
 GX+5+wiYLJpmIp+Jb8Kq6kVDPBNt02roftEkBDOC4oJT2hfnN6AH6Rh95e/NiIBlfWq1
 kRsnGytvIZm2kmF6zXUNGvs4P/Eo8+y40N6yOAvaS4BLGI50DajWXjD7FCn5J7oBuv+u
 1Lohl3Vc2caU8EpfaccLbdFgz3hgbu4A+jeKsVx5J7NREcky5EdBZPgiwSKvcRA8zrgr
 zzWwssbeOCCTG45ySHQmFYb+CvA5wCyHxQffqMO5XxIODgvW5+OMMJugyuDqL4sCUxI8
 V3iw==
X-Gm-Message-State: AOAM5307RHTrmwKCUHfHbfiJs2hzQazjCE7ZDsEdkB8617oziVIhy8aG
 7ii7fd8dq9khHK/29034wm3CRKy6d66w2ClH4pA=
X-Google-Smtp-Source: ABdhPJzZptB3sQ5uwWlFxdmYBJ15MEU88Jt7irs9hAPemtfq66bnp/lnKCzQTAarZB1DdjxsW9WoJwaZ8TFC6OqlSSc=
X-Received: by 2002:a05:6808:168e:: with SMTP id
 bb14mr9143890oib.121.1632681299335; 
 Sun, 26 Sep 2021 11:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
 <CANCZdfpdy9EFgr-ushGeEnPZFEPD2_sOc4vii+2by9ksbC3YVg@mail.gmail.com>
In-Reply-To: <CANCZdfpdy9EFgr-ushGeEnPZFEPD2_sOc4vii+2by9ksbC3YVg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 26 Sep 2021 20:34:48 +0200
Message-ID: <CAAdtpL7bsDbd9GeSqBgJyr6JnBdF9vi01qk9z582Tuwv8-MpBA@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.178;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 8:14 PM Warner Losh <imp@bsdimp.com> wrote:
> On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <richard.henderson@linaro.org> wrote:
>> On 9/21/21 11:14 PM, Warner Losh wrote:
>> > Create dummy signal queueing function so we can start to integrate other
>> > architectures (at the cost of signals remaining broken) to tame the
>> > dependency graph a bit and to bring in signals in a more controlled
>> > fashion.
>> >
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > ---
>> >   bsd-user/qemu.h   | 1 +
>> >   bsd-user/signal.c | 8 ++++++++
>> >   2 files changed, 9 insertions(+)

>> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
>> > +{
>> > +    return 1;
>> > +}
>>
>> Both here and in linux-user, there are no error conditions.  We should change the return
>> to void.
>
>
> In this stubbed out version, there's no errors. But bsd-user can return -EAGAIN when
> alloc_sigqueue fails (which it can if there are no free qemu_sigqueue structures in
> the preallocated list0. However, having said that, nothing checks the return value
> so it's as if it is void... So I'll change it to void here...

kinda related:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg836833.html

