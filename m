Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22651442BC6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:43:54 +0100 (CET)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrGj-0006aR-6z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrFo-0005t2-Uf
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:42:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhrFm-0003yd-SE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:42:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso1473377wmd.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJiDErMUBBMNke4VbyZYe1cd7pzlxtcuD79FA/kzWLY=;
 b=uAHO5Lejj9CLuNUbpxfKhsFeok1t6g0bGT3aTuhXKfxa7jeqss6+K9ZX8FDP7sn2dd
 yt/nd7nEPEcuEjaxFJ6Qo6P+KytGd54LF0SnGwpFde42awCY2dFQ0xyjwVRB9CDZpMts
 9B3aO1XvZLGcNbKfnK3xlOmqsVtilThdf4M0R7s608bYvrmZecdYDq1mtC/mB6PRD1Mj
 cWlInpJHZAYDPNkEbMbAZ0LQu8hSRRuu/z9q4wLpJtScMhh2RandMjGxrGI9QAHCb9mj
 G0obpwd6GFDsDM1v2Eql+MP+Jt4zaHiB4MZh7VKJUzC+4b8NaKBNSEJVpLh9+FhhidXv
 CViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJiDErMUBBMNke4VbyZYe1cd7pzlxtcuD79FA/kzWLY=;
 b=AJu9gL1j/e+W8N2/hc9/fLT38eI/7NAIfcvh8UOdsiYraWG/pWjjxDEWHwcXKDudUE
 cwc2N74DG6/bgCFYkvsoHudGE/hkzuQgqCyKZdx4rHU8MMVUkzvMXvsburv1ECnzC34l
 2Q8dZAPJ+Jvuom9pCowlMlG0iNoPYVSK9inRG8XQNAY+B/7M3ClMJJyAL8Mjtbhe+YVL
 UMq2jSmf+hvg3XQTrgBfI1SUVW8SSz2R+9OE/O5TP8MoSzSEGdFqZ7cLOhyt+qE3iar/
 A6r9ZcaAxOlKU7jZZUqfI3hC3ubh+mE6uSzGt9ZIKMUVCMkE2LXg63/y7jAWiLpOkKP8
 7kgg==
X-Gm-Message-State: AOAM531aOYeKegcAWDzOtCq9xO2hvuESiiMuwO22HL1lIBicP+tiaVf5
 PrAB5sPdXIvBS680712dcC2LmoaeegNwq7ygVJZDAQ==
X-Google-Smtp-Source: ABdhPJxJLZ4kJaeTqWGsA4J9nkgiKt+Ihv4dB/vEKS3p8cV5KXxt3YzU6SI468rwznthvPnaHEaN4f0+zjYGqQJS6oQ=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr6067771wmq.21.1635849773240; 
 Tue, 02 Nov 2021 03:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211026071241.74889-1-agraf@csgraf.de>
 <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
 <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
 <47d35b2d-bfbf-6ee8-a004-ad74e713db13@linaro.org>
In-Reply-To: <47d35b2d-bfbf-6ee8-a004-ad74e713db13@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 10:42:42 +0000
Message-ID: <CAFEAcA9gwpXQ6MbbaBDXNsCOca+Zyd3jRWYrCqoSZ44U-KAjeg@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 10:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/21 3:35 PM, Peter Maydell wrote:
> > On Mon, 1 Nov 2021 at 19:28, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 10/26/21 3:12 AM, Alexander Graf wrote:
> >>> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> >>> into user space. For MMIO however, these have no meaning: There is no
> >>> cache attached to them.
> >>>
> >>> So let's just treat cache data exits as nops.
> >>>
> >>> This fixes OpenBSD booting as guest.
> >>>
> >>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >>> Reported-by: AJ Barris <AwlsomeAlex@github.com>
> >>> Reference: https://github.com/utmapp/UTM/issues/3197
> >>> ---
> >>>    target/arm/hvf/hvf.c | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>
> >> Thanks, applied to target-arm.next
> >
> > ...did you see my email saying I think we also need
> > to test S1PTW ?
>
> That arrived afterward.

Thinking it over later, I wouldn't be opposed to taking this
patch now and adding the S1PTW second -- I think we're
currently going to do the wrong thing for the "page tables
not in RAM case anyway", so you could regard it as a
separate bug fix.

-- PMM

