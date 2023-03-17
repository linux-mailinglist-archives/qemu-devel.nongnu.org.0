Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60E6BEE87
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdD5O-0005uc-1W; Fri, 17 Mar 2023 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdD5M-0005r7-6v
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:37:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdD5K-0005l5-D7
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:37:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id fa2so1880501pfb.7
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679071061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bXjDhVXGMhnumxyVHUzpj0olGsdargOsMsFYmhE4nEk=;
 b=EAsZfvAcqTW192AqI28UuUCFzeJ/Y1isNdi+8QpeTQV9rN8WhBTt2X/dDDGF3EWXq6
 cai7r2bikB5MKpJjrEHaOh7JLshA4yOpY8jFo+dQN1H9UG1XIWDbZuOoeTGw2AvE5Cv5
 OnZ4M0epayxXujbs32XOfMMrREmJ+dSDXvNBEDlWRwIMBaXbii6ky+zIm6agVq3AseVQ
 tuQod8byxNUuaTBnPULHyha9edEooAuI6D6mxZ76Ov1k+EY6Cd5OsOSkt9grGKqXQLBb
 VJBAX9SLko5acaMYFJvSsYOQp2ummKKZZ1HMGBiNzorxjWKz00kvnhjK5JmevZGNXsBC
 fRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679071061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bXjDhVXGMhnumxyVHUzpj0olGsdargOsMsFYmhE4nEk=;
 b=tubcXZTdhDjI29dkUXC4288Vc12X95mgYrutdMrH8/ah3In/J9yda17PD4nbLhuZHH
 9UlzNUHHk60ijGwTmFmQF2ioHY/U/rSt6AcPdNhPoIEYjMR5PdHVmtScHGcJ+tu82LjT
 iHAqiP9fBE8WipVcsjvJqjhCDgm/lpsusnKex6BGjygGv0Z12SLTg+IefL+F3FZ8TTca
 BH5cRWD97J2x6Fifmr69tnSsV2OyeZwQje89e5+ubHmykooRVbRbeHRm3ePSlhNbTNmb
 Ib6lRxfvNDp0Ky2VcMJ0DPcvPdPkHtxotZGWoqa0NsPBGlORCD3JU05Sp1abwPpgym/I
 84TA==
X-Gm-Message-State: AO0yUKUJDSCRE0y0U25cdDOHa9P6Ay2KowOAUFLZwklJpBI1/c7PTs1F
 xpC+3dhNYyCmRTPEVu4xlSSTmiSrC/QidAMgJsLeRw==
X-Google-Smtp-Source: AK7set8rCN/moXRSQZiutfvZ8gC+LveEcdQh80LRcFgwNHE9ebfl7xe5nhSJG73LV00oRxPpkc5p9lHEWXDIeLkZ9dk=
X-Received: by 2002:a65:4544:0:b0:4fc:2369:811 with SMTP id
 x4-20020a654544000000b004fc23690811mr2035530pgr.6.1679071060848; Fri, 17 Mar
 2023 09:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
In-Reply-To: <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 16:37:29 +0000
Message-ID: <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Luis Machado <luis.machado@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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

On Wed, 15 Mar 2023 at 09:51, Luis Machado <luis.machado@arm.com> wrote:
> On 3/13/23 11:44, Luis Machado wrote:
> > On 3/13/23 11:22, Peter Maydell via Gdb wrote:
> >> Luis and I came up with two options:
> >>
> >> (1) leave QEMU outputting the pauth xml as-is, and tell people
> >> whose gdb 12 crashes that they should upgrade to a newer gdb
> >>
> >> (2) make QEMU output the pauth info under a different XML namespace,
> >> and tell people who need backtraces when pauth is enabled
> >> that they should upgrade to a newer gdb
> >>
> >> Neither of these feel great, but on balance I guess 2 is better?
> >>
> >> Luis: I think that rather than doing (2) with a QEMU namespace,
> >> we should define a gdb namespace for this. That makes it clear
> >> that this is still a gdb-upstream-sanctioned way of exposing
> >> the pauth registers.
> >
> > That should be fine as well, and would work to side-step the gdb 12 bug so it doesn't crash.
> >
> > We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and slowly stop using the original
> > "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a compliant pauth_v2.
> >
> > FYI, I've pushed a better documentation for the arm/aarch64 xml descriptions here:
> >
> > https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=d7001b29e9f256dfc60acb481d9df8f91f2ee623
> > https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=e0994165d1b8469dfc27b09b62ac74862d535812

> Just an update on this. I had a chat with Richard Henderson yesterday, and it might actually be easier and more convenient to backport
> fixes to older gdb versions (at least gdb-12 and gdb-11, but gdb-10 and gdb-9 are also affected). This will ensure those won't crash when
> they connect to a qemu that advertises the pauth feature.
>
> It also means we won't need qemu-side changes. My understanding is that we're close to the 8.0.0 release, and the code is already in place.

Having run into this problem in another couple of situations, one of
which involved gdb 10, I think I'm increasingly favouring option
2 here. The affected gdbs seem to be quite widely deployed, and
the bug results in crashes even for users who didn't really
care about pauth. So I'd rather we didn't release a QEMU 8.0
which crashes these affected deployed gdbs.

So:
 (a) if on the gdb side you can define (within the next week) a
suitable new XML name you want QEMU to expose, we can commit a
change to switch to that before we do the 8.0 release
 (b) if that's too tight a timescale, we can commit a patch which
just stops QEMU from exposing the pauth.xml, and we can come up
with a better solution after 8.0 releases

In fact, I think I'm going to submit a patch to do (b) for
now and we can follow up with a patch for (a) if we want.

thanks
-- PMM

