Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F46373D54
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:12:12 +0200 (CEST)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIG3-0004iX-7b
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1leIDG-0002hm-KP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:09:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1leIDE-0003EW-Qr
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:09:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id o127so1517667wmo.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLJFif9hX/1RjVhENBsjtOSWfSSNJX7I9pO1HdpNHHE=;
 b=UK19LphQ/hY+873DVWZ5Zno5N9guPCOcGjCn1e9dvKdh70wGooWgNxgDLXy4MGi9Bu
 BJm9iA9mmq5MNOSqCwhnYHIt34AO1ZGHNufsrzbYJMskt/Z4UbRdhowi6Jf4jwWypFYD
 dKFeMIyKiqBDJ0spjQEA9tHDHbBWAR08s7hFTRnVWwzFFxqRs2Q3EIldtA0fu193J5mF
 7xEx3CjqOmzO8g/wIpZB5Rf7IcBTxfJjSLCNOQutTdcmhTb00GPD4ON5+LUhZFcphlpY
 X+pJ8qgde8MfNL5Fb0564a/+seuejq1lEHXZxfCYXkzes2PWycaE8unSjm9eP8jRNWX2
 WYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLJFif9hX/1RjVhENBsjtOSWfSSNJX7I9pO1HdpNHHE=;
 b=T6cA67xk9jHv5c2Pj7dNhQYVd4/wFs3a4Ry2Ey/pMsjmuRjb4ICLvpPdpl0+jH+/Ae
 dB0k2IQ0dwQJewRwSd4j2mhCPtFEKmQPodGgwPbAIE2AI7wky/HLdG211XrysaihAgt3
 5IkyzsAPjid9i+bKHdh/4D64uLVcmZ0aNZoQ38aNxEb/USG05wrAGuzsDJmU1PJUMOQb
 SXTwuzR8O8KJmTD5VZBDCHHtI+m3vbPgvP147wBy5BgEBUwahwUYdfH0URWLiEjSAMi0
 LWsuFsQFMtrsRhczFG/c6Ez92/u/8isTD4oxxR1GiCZJMFYYBx62Klp1tD9Mpy+kWJ0N
 rCqg==
X-Gm-Message-State: AOAM530PSVT7Wir1AsabKSmUBw+up2wkhJ4HonzhMn7DDAJWVTtg97TF
 O2G3v4N4fn6kP8k7GIqziO8wM5cEbNdqb8u5MmUNOg==
X-Google-Smtp-Source: ABdhPJyUor975gI6stLLPrNyVPf/Vzgj601CpOa+vrw2ZwOA1n5Umo938gummtlHkIdow0GAQs5/+WIwLCUDCjRBpTI=
X-Received: by 2002:a05:600c:48a8:: with SMTP id
 j40mr33804713wmp.114.1620223753671; 
 Wed, 05 May 2021 07:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210505135516.21097-1-peter.maydell@linaro.org>
In-Reply-To: <20210505135516.21097-1-peter.maydell@linaro.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 5 May 2021 07:09:01 -0700
Message-ID: <CAFQmdRZyt6o+A8cSZ+MVsKYC0F-Prp2H09Obxk=U9uY6C1sbtw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=hskinnemoen@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 5, 2021 at 6:55 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the glib API, the distinction between g_assert() and
> g_assert_true() is that the former is for "bug, terminate the
> application" and the latter is for "test check, on failure either
> terminate or just mark the testcase as failed".  For QEMU, g_assert()
> is always fatal, so code can assume that if the assertion fails
> execution does not proceed, but this is not true of g_assert_true().
>
> In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
> include some assertions that are just guarding against possible bugs
> in the test code that might lead us to out-of-bounds array accesses.
> These should use g_assert() because they aren't part of what the test
> is testing and the code does not correctly handle the case where the
> condition was false.
>
> This fixes some Coverity issues where Coverity knows that
> g_assert_true() can continue when the condition is false and
> complains about the possible array overrun at various callsites.
>
> Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

