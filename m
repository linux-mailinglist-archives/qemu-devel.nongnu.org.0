Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E40933A4FA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 14:20:46 +0100 (CET)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLQfl-0004Pa-IP
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 09:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQdc-0003M2-F7
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:18:32 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQda-0004HO-25
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:18:32 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dm8so14165338edb.2
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McFs42ILNKixEv2gIpOsYdm7tY2XM7v6iokt0UWP/jw=;
 b=op1Ge9qwVGstGdaxYpuXmLt+TOGylNwm2VHYAH9aiqHA9cWBt+GVdsm0yI3LJfNqk5
 nYKZ3ux0ohxes4fgRvtBDQevgcYfOcNgZKaxXw9SuTidUd9SKnMAWqvZHo5HVKA4TtXu
 Z+nyO1pm4lZWzmnchgDnrIWF1P+TWkJLbG39dD0ilvxoc+st1GZXf8bVLX0lGQm7hePS
 T+8Wz7GCx5daAGR7OcJXCNf9oN3e1qcB57kMa12hUYiN4E20nMwec8SsTP9KeMsvGtcj
 5Lyv1KpTh4YeTTQFk5UJCqJM6UcFsuai0BcAZYJYhuYghwiD4g94OS7H4WgCK8IIfVXf
 f8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McFs42ILNKixEv2gIpOsYdm7tY2XM7v6iokt0UWP/jw=;
 b=L/R5a6qO/fpSvxBHAYD92H0mcvS+KCYm2123SwMzU7M8WZNAVI79InDUEkMono75Qf
 R8ZucIcPXCl+Ddv2xRi5ICtMPiDBm1ZEs+xVxsuUTmn6+szAKa1cvgwdY+ACXAORTdFT
 9qYBqbb1Uk82TrHzxTpZLDpc8xHEdLSYVws2CjHUlvoTQqYMB5iBT5OHJZGxLu6j9tsy
 mbsYnorJ7Gc3sw+0EzIBHBTwoM7bCNjmGGPTG/NsFLrdtYnXSnYP5ord0hcY052bAZme
 LHF+ZX+r4aOG+ikcw9gZ0ddKDvYk2KM1F1uV1+foQQrj1xk4gS3dDhGY93U7JhxjWvoC
 eQMw==
X-Gm-Message-State: AOAM533Eb+yi081ZWVLFtvEz/eOrlLk5ye0EuqsI6dGlu5Qb3HhSYeaE
 XnxEabHHJVg8FyTQKIJNZ458vLOyCMQkBsa3eOA8tQ==
X-Google-Smtp-Source: ABdhPJzru4M2bWWbNb03WpsrTedKLUQaVBPHqCV8ur1jRjM7CaHUq2ruzMW7Bar2s6VO/eNh4GMGQK9QqLAiFC2Chg4=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr24625041edt.36.1615727908450; 
 Sun, 14 Mar 2021 06:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <20210311180855.149764-6-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 13:18:06 +0000
Message-ID: <CAFEAcA8fHD5jrg-nak=sFPf0CvA0bzYqVEh_ZDCxX+DjPPPuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] tests/qtest: Test PWM fan RPM using MFT in PWM test
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 18:09, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds testing of PWM fan RPMs in the existing npcm7xx pwm
> test. It tests whether the MFT module can measure correct fan values
> for a PWM fan in NPCM7XX boards.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


> +static void mft_verify_rpm(QTestState *qts, const TestData *td, uint64_t duty)
> +{
> +    int index = mft_compute_index(td);
> +    uint16_t cnt, cr;
> +    uint32_t rpm = DEFAULT_RPM * duty / MAX_DUTY;
> +    uint64_t clk = read_pclk(qts, true);
> +    int32_t expected_cnt = mft_compute_cnt(rpm, clk);
> +
> +    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
> +    g_test_message(
> +        "verifying rpm for mft[%d]: clk: %lu, duty: %lu, rpm: %u, cnt: %d",
> +        index, clk, duty, rpm, expected_cnt);

Hi -- this won't build on 32-bit hosts (or on OSX, and it warns on OpenBSD),
because uint64_t and 'long' aren't the same thing. You need to use the
PRIu64 etc macros when printing uint64_t values, so the argument type and
the format string match.

I've fixed this up in the pullreq.

thanks
-- PMM

