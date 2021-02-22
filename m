Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E2321089
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 06:49:55 +0100 (CET)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE46U-0005I4-EQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 00:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE45R-0004qy-0W
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:48:49 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE45P-0000x3-D1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:48:48 -0500
Received: by mail-pl1-x632.google.com with SMTP id p5so2183221plo.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 21:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r+xsNwLDu1IZeFSVeV00+UItoCEk20BtH2U/ndVLeLs=;
 b=e8lNvOisC7kzl85ggdT8t9QMRYPdbC9KdcNp+lUKzr8cTgLqWrsu6wdHBIIjDT8/w7
 CI0lnXr9z9SQY4qDPxBB/KtjSzqH2Ppjn9CbK/y2JKOSdOPLIH0IazQl7reixjwOtZMX
 ebJuEDxdklP8XVWEvxls8ubOqfX5KW3trJuRnUaV5QqrJ5utJ/FYf2AdHJ3h/hZVKdgP
 JGbgAJCn6whJScl8DI50iVvMtgFmTEBGmCbs69YYwUtFJQ9GqrNa942MKVFH9KjBXqW/
 zdMnZQZOqxrARdl9ibbIebrq4+Z1oGKYnBcv95piuCV7d0rbO2yrG/mHjGa3on4kRnxf
 WTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+xsNwLDu1IZeFSVeV00+UItoCEk20BtH2U/ndVLeLs=;
 b=ea8UHWA1ZAgtSf/nqU7U9olyZ+N/xkgrbh8HQZvy6+x2GCTGvHrCy5x2bLDjOrh5QY
 8eMDoI+H0JTMhT9EUxjRxIugOdfB7lkZbiipAobpPFDy4BZ6pn76LU1vXzUofUYe7ZEP
 JMKV2OD1XDyKg/ZgnCdSxmqkFoTwTfEHTvVFnbwLl12GcaXY7I/z38temQqTFOnu3Uea
 ewKrXZEOjJfy1aDUa41Ol41PY/Vj26oAbp/th6jJA4u0M0/IiWcXdeNMQmut8h10OQQ1
 QHQZ1M3q5naTfM6Aj5geJ9q21ZvE0X+RhlI9jtryOjkMf+tMm8bzTqEJIwkR4cWCKGm2
 fHfw==
X-Gm-Message-State: AOAM5311PBsUqWeB2+WVO71QB+ukARt0wQX5fnIKJJVVgPs9VpN6FkON
 PCZjocavE40kUrQgI+8zq+6QzXSsiIG4eg==
X-Google-Smtp-Source: ABdhPJwLj8x1lRWKCO40YYS8jEsdQiH4A/e75YHwJO7DJGlxfsKuwJZPsdvByFFIiqi7W9eEg7wqpA==
X-Received: by 2002:a17:903:2283:b029:e4:8a:d7cb with SMTP id
 b3-20020a1709032283b02900e4008ad7cbmr879871plh.5.1613972925726; 
 Sun, 21 Feb 2021 21:48:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 8sm18205785pfp.171.2021.02.21.21.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 21:48:45 -0800 (PST)
Subject: Re: [RFC v1 20/38] target/arm: move arm_hcr_el2_eff to common_cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-21-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0af4f3c0-368c-4115-44f8-8128b1696981@linaro.org>
Date: Sun, 21 Feb 2021 21:48:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-21-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> extract it from the tcg helpers, as functionality is needed
> for KVM too.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-common.c | 68 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/tcg/helper.c | 68 -----------------------------------------
>  2 files changed, 68 insertions(+), 68 deletions(-)

Hmm, not really.  The hypervisor (the linux kernel for kvm) uses EL2 itself,
and only exposes EL1 and EL0 to the virtualized guest.  Due to how
virtualization works on ARM, the same will be true for all hypervisors.

Thus, ARM_FEATURE_EL2 will always be unset, and arm_is_el2_enabled will always
be false.

I think you want a stub for !tcg like

/* EL2 is used by the hypervisor and never enabled for the guest. */
uint64_t arm_hcr_el2_eff(CPUARMState *env) { return 0; }


r~

