Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CE2B6E0C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:08:29 +0100 (CET)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6L5-00062I-Lr
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6K6-0005D5-0Z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:07:26 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6K4-0005Sx-60
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:07:25 -0500
Received: by mail-pj1-x1044.google.com with SMTP id oc3so1044651pjb.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cI5vzjMjkZwOCABGdt4PTtHtT649Rp34MdRuM72kzf0=;
 b=tak9mN5pLXHGFZd1r4Lc3WYSIWZPANmdTkWOL7cpfPpffbax+YU6Ni+4NuxhTL/Y8a
 RBd6+HvGmuUhd1ffxy3xqAaXaG7K7W6aiCr5/GF8m1ybK2RsTplVPKbciwKDWUW/sigE
 dB7k39z2XWWw2vrZltCLFdkDKVQM5hJbBeLUOglFU/IXO8CTBM2JyJzdIPg4scBZNyZy
 3yI0TdFec92/zMdGEQ1rk02JQ9Kw7fKlPCzUOh0s5F3EynLiVW1JeXIUaaPBYnf8tXyp
 Y56GeXAz7mW/sz8GaHc8BUC+GDHspv4WxoRzAYYWxANHWn8LEjiiE5LGJYigiVWanjQP
 0sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cI5vzjMjkZwOCABGdt4PTtHtT649Rp34MdRuM72kzf0=;
 b=CvD9WOQeZvhYZ9uVe4jCZRicWdxKEqpeaGhey6Pjs68Fv7mBrsVKI3N+ZnPyMACmm6
 YwsD0ORLd2zN7ahze6FzYzz6zzLeKM0yjWS89M2UH8JoxJM5ZEeLS+iAKJUDS1QIxChf
 a02BE+5F1d9LhQ6iSkkQ5CXgvqmrNsNGOzaowQWHNtQ+PRCkt90mjMTnhXfVypJJ+i0a
 ePP6tCz1RLngp3vj+yWenKTqpos/J/0zFdBu/0tiVUGnUkvBtCmOV9uJMBjPrxmfTGU+
 D5485GFMSYrf2U3wLkcxQFoNine5Yj1wCOkXN8cIF9CMQMSNwxKBLH3h+o5naDmCw4oV
 NtEw==
X-Gm-Message-State: AOAM530CMixkIS7092KDZEWqIRCXSSbQs1XZwyXEgakuC9dyyQ7BxEvo
 BdwwBCzFPp6+ss2zPDNufPGbPyNClqc+vw==
X-Google-Smtp-Source: ABdhPJygyVAz5q88b/feHc0znGtvKxKBRznN4+rcMfFOiUgU9vP9tzM7Pm3a8I74grkbCbi6yIbNeQ==
X-Received: by 2002:a17:90a:5309:: with SMTP id x9mr503800pjh.98.1605640042294; 
 Tue, 17 Nov 2020 11:07:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g18sm21603192pfu.131.2020.11.17.11.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:07:21 -0800 (PST)
Subject: Re: [PATCH 01/15] hw/intc/armv7m_nvic: Make all of system PPB range
 be RAZWI/BusFault
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3b2e0dd-0a7f-3c9c-1e14-d358ea15f1f7@linaro.org>
Date: Tue, 17 Nov 2020 11:07:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> For M-profile CPUs, the range from 0xe0000000 to 0xe00fffff is the
> Private Peripheral Bus range, which includes all of the memory mapped
> devices and registers that are part of the CPU itself, including the
> NVIC, systick timer, and debug and trace components like the Data
> Watchpoint and Trace unit (DWT).  Within this large region, the range
> 0xe000e000 to 0xe000efff is the System Control Space (NVIC, system
> registers, systick) and 0xe002e000 to 0exe002efff is its Non-secure
> alias.
> 
> The architecture is clear that within the SCS unimplemented registers
> should be RES0 for privileged accesses and generate BusFault for
> unprivileged accesses, and we currently implement this.
> 
> It is less clear about how to handle accesses to unimplemented
> regions of the wider PPB.  Unprivileged accesses should definitely
> cause BusFaults (R_DQQS), but the behaviour of privileged accesses is
> not given as a general rule.  However, the register definitions of
> individual registers for components like the DWT all state that they
> are RES0 if the relevant component is not implemented, so the
> simplest way to provide that is to provide RAZ/WI for the whole range
> for privileged accesses.  (The v7M Arm ARM does say that reserved
> registers should be UNK/SBZP.)
> 
> Expand the container MemoryRegion that the NVIC exposes so that
> it covers the whole PPB space. This means:
>  * moving the address that the ARMV7M device maps it to down by
>    0xe000 bytes
>  * moving the off and the offsets within the container of all the
>    subregions forward by 0xe000 bytes
>  * adding a new default MemoryRegion that covers the whole container
>    at a lower priority than anything else and which provides the
>    RAZWI/BusFault behaviour
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

