Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3092CA6DF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:23:12 +0100 (CET)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7Uk-0007hx-1j
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7OM-0001f9-KU
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:16:34 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7OL-0002P1-5H
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:16:34 -0500
Received: by mail-oi1-x241.google.com with SMTP id k26so2111416oiw.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6VnijJvF34OysNmzUOZ15mEx4KQR1BAeNwvUYqgzD/0=;
 b=ugETyM2bZy96+AlNCkEHvFJvTNwPSlNsy7e9V96w06AvXcBXAXSJ9OrwBE304hYfe0
 9UIrcYuHZ2J42Vr9DTlPvmb+lsSUHEVCWVPhpAXFr7pbqRBTiBrRs4Vf2+RFphvgN0V4
 DMFYCrNZx3yw8pdHU0EQp3OSaKk1ibp5hS/IksiG34PhLNSLNLCRsxbakiBCI97Xp2S8
 Gq7t/n0pZ2xQeCjv0JL5FkijvZW/jyaZbpxPUfd0sf22k7ITd9dRgRO0/75+MpuVXqqy
 HuNNyj8ndHwC5hYVJW3au6lj2ohxgz6QhYaNcasYF6iy+4H2A5xEZ9KBD38IjluX7nMC
 QpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6VnijJvF34OysNmzUOZ15mEx4KQR1BAeNwvUYqgzD/0=;
 b=mLp2hZiDyNZMSNqS4Ee+VpQr2atNtQZWDNGI/B71Y8P1Kv60Ed44NRuYW3VVrw/Snt
 beKyK3wVG1zDJYzSCTZ9AMz2lc3Ri3vphiS0NE4fejRpBF4du7uxWp2s+GKeX6XqhbOT
 /gdg+WAjwBk1jg4+PbysVcBm36AbmDKYEUXiq4CSXQVSat0uXFYxw+ZOwGJGu+qgN3i/
 uHmBSzoJ3uTBWgPCiD7VLz9nBzMynHGCNYycYSW5bBXBqjmPGFAhxcKefMGgij4sBes6
 nfpLWuAvMfbGq0RqlC0EGBqsuxYNSSba82td3YQnNzXViajb0SuE3khdQ/hqI1cEfhp1
 E9Wg==
X-Gm-Message-State: AOAM530zCH6+SDI8w3GNPp1wmOAYRFxtfdfW55aY6su6KjZrJoDI64Pr
 vFMyUv1p6kKp8mFizE6oQtP5/r2TLVxP4XXY
X-Google-Smtp-Source: ABdhPJyPkfranvx43Q8iqFX5L2SQSbDYIw/ck6cCAPTEOMYykhojg9zQCZXY2JHeYm+wUqWkkeyYLA==
X-Received: by 2002:aca:2311:: with SMTP id e17mr1937438oie.50.1606835791533; 
 Tue, 01 Dec 2020 07:16:31 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k20sm449798oig.35.2020.12.01.07.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:16:30 -0800 (PST)
Subject: Re: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
Date: Tue, 1 Dec 2020 09:16:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> +        } else {
> +            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
> +            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> +                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
> +            }

This isn't WI, as you're zeroing the bit not preserving it.
I think you need to merge the current state of the bit to preserve the value
for secure state.


r~

