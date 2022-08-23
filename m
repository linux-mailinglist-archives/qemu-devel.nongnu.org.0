Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9659EE31
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:27:11 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbQV-0005mN-48
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbNu-0003oZ-FW
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:24:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbNt-00046C-3K
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:24:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id v23so8663060plo.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=BNKiuiT+PU7qCnYr7FA47mAteTxcWpxY/uiCw2amMs8=;
 b=EYDb370bwesxlkUjTj1x9jCuttKygnFQb+MuBtOodnzCLufs5SqIH9yXPtFrEMowYp
 K2EW5lnjMhNPSxI1Ats2zreUa3bUWUQOQGQOC+Gfu/L0XnbY06WuTPiUBh3GwAeFbkAE
 gFcKnJyhKBpGuVXmQkggCoKL6tWByxxU3dwpPL9eF2lqQBzBeLDCi3Pjb8cZ5rFPfx1b
 3fDw1xNjq6jOn4IpZS8ZAOsdkOUsWF1L5SZCCcxY8Xsz6i5Nwh3dohfcv7MPHetKF6g1
 uUxyWADxHotCp/sW6OLKbRpbrIDWduy0uSGtyQ+w5gnlTPYu2A31H9+3Utr/PIZiXVIB
 xoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BNKiuiT+PU7qCnYr7FA47mAteTxcWpxY/uiCw2amMs8=;
 b=VzzYdJueeSP+O+1rV/JFbU2p5oPGOAtfI2wDWFJRYvp/xHWkFFkDO7uCJbt8iMcwky
 biE0DiCBAfw9OuZkQoGeID3XFX8/B/DMqCdeatrD+ZaAEWk6NC6YNR9x810oTtuhQ3e0
 939XVpKbIkbrib+DtQ14q/PmGtc6iC7Rkj0J4V8O7wkSbLJzDhdiz/rRZ3r1djBGW9pP
 Z6gucwpnPggG05Wlwm3/hy9+FsTGDRCNnb8fVjZc3gS0TZ+3n8dXHHvOx+XudT9gwTid
 Muke5uUr7e/RUJEIuP9+BCmDsBdW1jeVhKBAm/pA3+NR/ZeU1bJNZf5QUIWBmeefhvc5
 cYyg==
X-Gm-Message-State: ACgBeo3V+NupgGMECy1rgyT7MoDCKBfC5pra9U5Q2bsxd4oeWOvaU+hZ
 pP89/SCPNR+6mo+Z5XXLSa7e6Q==
X-Google-Smtp-Source: AA6agR6LXTkgMWHcBTFTW8cI/hXm7RaMvR9KYvqWlHqxhJYFp0tl2zlkvwAbPjviYpbYahq/mzSMJA==
X-Received: by 2002:a17:902:8f92:b0:172:e476:f9e with SMTP id
 z18-20020a1709028f9200b00172e4760f9emr12177880plo.82.1661289867654; 
 Tue, 23 Aug 2022 14:24:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a63f905000000b003fdc16f5de2sm9584128pgi.15.2022.08.23.14.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:24:26 -0700 (PDT)
Message-ID: <6b18f51c-5594-39f3-fb40-60b2ebc8393b@linaro.org>
Date: Tue, 23 Aug 2022 14:24:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] target/arm: Make boards pass base address to
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/22 09:04, Peter Maydell wrote:
> Currently armv7m_load_kernel() takes the size of the block of memory
> where it should load the initial guest image, but assumes that it
> should always load it at address 0.  This happens to be true of all
> our M-profile boards at the moment, but it isn't guaranteed to always
> be so: M-profile CPUs can be configured (via init-svtor and
> init-nsvtor, which match equivalent hardware configuration signals)
> to have the initial vector table at any address, not just zero.  (For
> instance the Teeny board has the boot ROM at address 0x0200_0000.)
> 
> Add a base address argument to armv7m_load_kernel(), so that
> callers now pass in both base address and size. All the current
> callers pass 0, so this is not a behaviour change.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

