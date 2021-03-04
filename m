Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A932DAA3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:55:39 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHu4Q-00075u-Vx
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu22-0006E1-8Y
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:53:11 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu1r-00042C-Jx
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:53:04 -0500
Received: by mail-pj1-x1029.google.com with SMTP id jx13so7281061pjb.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zXy9gFQPLNhKDKZB3qV0+lZKdpYYhXe9c8Wt1+fjN0o=;
 b=b/BHSeNjc7RU3PAhjs1t6kHIJ84j0AtiMB9T7+NBO0vPx1Zp/C/utdNbVd+A1zuSys
 U7TEC6yQnj4QXEx1zAIODN46tnkmTNIgisYtaksY08fr+B1C+jTzDz8h2ZQIkRDNvfrT
 N8raSUPfgOJ15pA400b7vbecTQAz2cKxQfPu1p7EV3IDG0KVmrRhpuk+l7YEC3zzJHZV
 luhfymSkd3uC//sOPyMyLPI2W0x6DM3NCowixrbQAUJ1v39J8hZVaqhVcGtltRO6t4Fi
 1kbOJWnW33VbJTykPpiLLU14Jz1PTYGhxBa1Isz0j1pyebeOKc9zJZm650q6Jr1rqKxO
 tOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zXy9gFQPLNhKDKZB3qV0+lZKdpYYhXe9c8Wt1+fjN0o=;
 b=Rg3PkwXuUcwtiEsN0khxLy5Q29Fw95FFMLE8HQkjqt4iPohuAZc4Vs44tcNPiyGDWk
 49WPDbuwhAjXAVVGHUvPOKenwAGj+SnaTm9UhPShAWuoB5p3fDn8tGwCHDugqqXES0Qi
 sFLFvOd0j4eCjTj2lrZpAbZ+BJxUn0UbCyfNvXvmZ1pNzcGA5pCb+fNSvkLV3rVCBlg2
 GfPgPtljv7oYaOaavQ+SR6p5/nyTQjqVWMcnMMUrN39z+/UaFsqT0kjRMZfdV6NwvJQU
 F5PVcNT6nidYgBmwFOBuiG5iop1u16nH1Ma2XjaSlIdgeceLd0vFlbQqmOLeEsKQ2FTz
 19hw==
X-Gm-Message-State: AOAM5338GTbvHY/E8v/qMhc19jfKcAyPPhvzWVQNA39Qb8UWALX2rwyy
 s273fAETCZW6hjDUQ7+unQstcnSYAlzHuQ==
X-Google-Smtp-Source: ABdhPJwjvEA4WAcc7fxNVoXJeAFG+CgFAiRY3CzsZuHjDAfKfd7S1Hw998p2JNU9L7zOBGvnyN1xZg==
X-Received: by 2002:a17:90a:8908:: with SMTP id
 u8mr5983545pjn.135.1614887575890; 
 Thu, 04 Mar 2021 11:52:55 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d124sm196319pfa.149.2021.03.04.11.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:52:55 -0800 (PST)
Subject: Re: [PATCH 17/44] hw/misc/iotkit-sysctl: Handle SSE-300 changes to
 PDCM_PD_*_SENSE registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <add2e2d2-5115-c9af-d5e7-4a8974ee17d1@linaro.org>
Date: Thu, 4 Mar 2021 11:52:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The sysctl PDCM_PD_*_SENSE registers control various power domains in
> the system and allow the guest to configure which conditions keep a
> power domain awake and what power state to use when the domain is in
> a low power state.  QEMU doesn't model power domains, so for us these
> registers are dummy reads-as-written implementations.
> 
> The SSE-300 has a different power domain setup, so the set of
> registers is slightly different:
> 
>   Offset   SSE-200               SSE-300
> ---------------------------------------------------
>   0x200    PDCM_PD_SYS_SENSE     PDCM_PD_SYS_SENSE
>   0x204    reserved              PDCM_PD_CPU0_SENSE
>   0x208    reserved              reserved
>   0x20c    PDCM_PD_SRAM0_SENSE   reserved
>   0x210    PDCM_PD_SRAM1_SENSE   reserved
>   0x214    PDCM_PD_SRAM2_SENSE   PDCM_PD_VMR0_SENSE
>   0x218    PDCM_PD_SRAM3_SENSE   PDCM_PD_VMR1_SENSE
> 
> Offsets 0x200 and 0x208 are the same for both, so handled in a
> previous commit; here we deal with 0x204, 0x20c, 0x210, 0x214, 0x218.
> 
> (We can safely add new lines to the SSE300 vmstate because no board
> uses this device in an SSE300 yet.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

