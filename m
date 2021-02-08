Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5DE314365
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:02:28 +0100 (CET)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FY3-0007Ja-6o
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9BkF-0000sE-0x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:58:48 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9BkB-0003vV-Vf
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:58:45 -0500
Received: by mail-pl1-x635.google.com with SMTP id a16so8318351plh.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cabQhU6vq19TXzTwT9OysY8bv1jSOwE/09QSMXdb//0=;
 b=uHs2aHbALnkGrJz7mDKcZSDHw6zCi+JLvw6mUcapYV1iE1zygABu8wKzIpx2t+rTDM
 cigw1kyMoBgDCZ9SbO01Ppw+ff8kATGbZO+5J/V1ccB8vmtsIG+gUKCEh9S/7DMsMWAJ
 IRzMeSsXQ4FugUxB6tqwUSyohRh7UQDsLZEzK01yWi+IGp82rhLBiHVoKhuUGIkN5DPC
 m7xjAbNRqSMaW2UZf1S2NqV9PEOWZNm0e3y4L79eeJnADg9pUGzwfBRcwAvNJB8Ph85t
 2Kri4gGeMR/VPcOWi1kjpAeH+EGBNZCKAt/nBM3Aosi2Ptnhpc85ZXlHzdVTGlfTWcQf
 njjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cabQhU6vq19TXzTwT9OysY8bv1jSOwE/09QSMXdb//0=;
 b=UAL29i51JuhxG9CA+ttKTagW3u7vuNW7Jqr6cmW3ftbpBxrLSd9C32KTg7Du/FA1JB
 OGJlWdeAjtE68cG+U2AkUe1SUKVDRsXQdU0h9ogU9Q9d58dDGX9ROARP/ok+rjjt4gvT
 3LjbKmM2U0jFrX0OZ+u2PLmLEbDEJljAZBOo+SFr6w/KP3Eyx0+YXLAQmACKY2qag8Xj
 A4orRbQRp4q0yR/alOXDFGyt9bmntPk+QDrUe6HCtinwErbUfsvFe/ePN/VDEBDFRHbS
 LfS8OYM95uUXFgLGHQE06iBhBQEos6WorhvRkEULY5Fg2gQycv4Y3m5nITsyNMzljoiq
 KKeA==
X-Gm-Message-State: AOAM533x+pAdL0Zqsdnc0TciIPP5Vz87k0oltG0is+O4OUJxDr5UziHX
 dRGYeVBo3vQoJPjpRumQ2W+VkVMGmPjJmw==
X-Google-Smtp-Source: ABdhPJyujv6pT0uwYayUuA/kmo7ztazdbVk14uvTUlKHuQOVecDjrw6f6NdehPCNB/YsVmXWMfA81w==
X-Received: by 2002:a17:902:e5cf:b029:e2:5300:b1b8 with SMTP id
 u15-20020a170902e5cfb02900e25300b1b8mr17340727plf.69.1612810721060; 
 Mon, 08 Feb 2021 10:58:41 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 d1sm2871072pgl.17.2021.02.08.10.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 10:58:40 -0800 (PST)
Subject: Re: [PATCH v2 02/15] tcg/arm: Add host vector framework
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-3-richard.henderson@linaro.org>
 <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
 <CAFEAcA9C+DG33fu-=zNN+6M9qc_bh6Lc=jx0ttNLg-tQWQtrxA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f830dcb-2769-ca7d-460f-6095a5a47c1b@linaro.org>
Date: Mon, 8 Feb 2021 10:58:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9C+DG33fu-=zNN+6M9qc_bh6Lc=jx0ttNLg-tQWQtrxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 10:28 AM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 17:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The AAPCS says that q4-q7 are preserved across calls.
> 
> Speaking of which, doesn't that mean we also need to
> save and restore q4-q7 in tcg_target_qemu_prologue()
> if we might be generating neon insns? (It doesn't look like
> aarch64's prologue does this, which seems like a bug.)

I just put them on the reserved list so that they don't get used.

>     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V8);
...
>     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V15);

We have way more vector registers than TCG will currently use, and we have to
assume all helpers can modify env->memory, so avoiding the call-saved ones is best.


r~

