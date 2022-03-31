Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64844EE0BF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:38:59 +0200 (CEST)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzhC-0004ni-Il
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:38:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZzBk-0007bk-V7
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:06:30 -0400
Received: from [2607:f8b0:4864:20::b34] (port=44757
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZzBj-0007r7-Eo
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:06:28 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y142so783027ybe.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3k1faZdyEo4y5x0J4B1Cwk/iDDHL9dGGKHKTVy/788=;
 b=rTGHQPxtl3N7CI8P00QcRLOCWu2uzGfsdsXZgMl2FomVWd0WGeZ2x66aUYTnhsMPTa
 wbdNAxJK9D5ZDwuD8TxWlLb7dd/Ka+uOWKaWPy4VSW49FpoEE5//NFIGo+ElPMEgEyor
 oALcHN+GncGULtiOdqoBg8CzuJ693pl1PG9+TIA/bIeASmVeaqVNeJu2yYLpGR+TBvmX
 woV/68LcsAmshAazo2kbtX5REoY064MeSvJFbCfO3jg5Qa6VMeeKk4JxLG4gKgYfTbb9
 xrGCo2DNuG2+Wjxf25pxwZU/SP9qr71/uEPAaNst6EzFQH+pEGqscwvVGi/rE0EXHkPw
 r5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3k1faZdyEo4y5x0J4B1Cwk/iDDHL9dGGKHKTVy/788=;
 b=eLiKMouKP7fg1hJcL77Abg7ZvcaLTV/zWVed6ietbsrBITMD6M8Z3wJIF7wW+SrFiR
 5wo26NvPgCRY+tfQn7a5TFwpuSJFX1bJ2FkEY+6yx4BPEajJMcEztLWaaSW9kkePvfjt
 tU4j7w1rQ9EwmaDwTCXDmtSWhVzx5bkd26CXqYRE3noZGRGvlZcIdC/FZywoj36Jsbsd
 ShbKLD878aVOaXv4Z57BE4dXdNgF38zE3qmyCSMZ0f9SeOFySPyg1EKqqEfqHefejb0+
 Bd4adIwZz9197whgf2BAiN4kyfKhxf7WABV5kki0OMskim0CEOwscmvVVZzJ88GiGwPH
 g5kw==
X-Gm-Message-State: AOAM53340iUmal5RgUXxRzTobvl2VTj29nCMx3/oYh0MVIW+UXzbniAT
 OOP2VsLBRvnu8jfY7a4dGdMhRhvn7sQ9ewMU4Uepq7sDgGL3tQ==
X-Google-Smtp-Source: ABdhPJwXN2VMYcFdsvoyHzzaJ2Wes7n8D1kWy8PRJSvERzdxXUssC9CHPph+EnRuBRSVHuHhI+uESSkhkpU9jeaVBYo=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr1856757ybu.140.1648749986439; Thu, 31
 Mar 2022 11:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-7-richard.henderson@linaro.org>
 <CAFEAcA9tV_3VMwgAgN4BKc1GW9w59kwHB-xFhn1pi4pBH2YxrQ@mail.gmail.com>
 <aeaebbd2-1d63-d392-9f3f-30419cb09e0f@linaro.org>
In-Reply-To: <aeaebbd2-1d63-d392-9f3f-30419cb09e0f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 19:06:15 +0100
Message-ID: <CAFEAcA9cwmv3xFP+T6UOhbRL+pWxOAqqc2Q_Uk1cZKHofxGS+Q@mail.gmail.com>
Subject: Re: [PULL 06/29] softfloat: Move compare_floats to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 18:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/31/22 04:46, Peter Maydell wrote:
> > FWIW, the Coverity issues are CID 1487134, 1487139, 1487151, 1487184,
> > where for some reason it thinks that floatx80_compare() and
> > floatx80_compare_quiet() can return 3 and thus that there is a
> > potential array overrun. (I've marked these all as false positives
> > in the UI, anyway.)
>
> Interesting about '3'.  I'll have a look.

Unfortunately it doesn't seem to give its reasoning for deciding
that the function can return [-1..3] rather than [-1..2].
But maybe it will make more sense to you.

PS: while you're there, there are also a bunch of new TCG related
issues where it alleges array indexes being out of bounds. I
suspect these are false positives, but it's probably faster
for you to analyse them. (I have a feeling Coverity can get
confused and claim an error because it's looking at an array
size it has cached from one target's NB_MMU_MODES value and
a code flow for a different target with a different NB_MMU_MODES.)

-- PMM

