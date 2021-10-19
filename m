Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58F433CD1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:54:53 +0200 (CEST)
Received: from localhost ([::1]:52448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsO3-0007iW-Ec
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrY3-00063c-0w
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:01:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrY0-0001t4-W8
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:01:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so202061pjc.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ItzDsHy/eoRICmTkA+53DaMcDAISZdVlQOWPPy0w1Y0=;
 b=YXI3gGZ9a/GQco87pVZlDMNLfNHGU5w8wBPXu511ZZsJeVdIWuc/J5ywxTSW9fJNBA
 eata2DFAFXkOPngeylOZtyKjbbLYvI9bOQKjG1QrSX8tgm53yx5lNfXNpf6kX0kW0SB3
 bnS9xM4Y62mo8QpR17y7slcHCZGm1ulBfSjmOIT9k7A4O7ISSZOsvWV3KUixiWepEHVM
 9Zc+HMAxzldl/ql8Iuo7a9uk8XtSKs6gPRiPiXEgOyjSDmaJrrDRJZ88cGuqGP9b6s0s
 bgjNw9t4nM3iJgN25bZNK8p7LPCr+zp+2sfoWEPm8N5XTlq/0NE1oBibvbJubZPaf26A
 TOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItzDsHy/eoRICmTkA+53DaMcDAISZdVlQOWPPy0w1Y0=;
 b=ejpbZhPbn5Bd34RFYN0LAfPyd2qOHvKRHErntaIOktiwqcfg3FFIHcTVRTh5Fz28Hh
 aBGe6bW3OQXJifA/UxxXzPcbozMDC9DieSmPv8u1oXwh3KvCC/HUiKtW4Q165SWMeP57
 5og0EkhZTJO0d+vfBdTym2etXoJZR4LvD4k3ZcnAmk4XvUGW/Z4f/5r27wj+2nOCc/la
 38JCxlycZClw5H2x3u4P4NUo9X96Nxins2ovM3yqZ7JiDEHud/evzZ0A0QKuJxbhOBP9
 eMxnv5j/eDbj3qD/UR7cE7DME4j65dYTrcK/6bSvYfKB4Pz4OIF4UHTRH/j+Sfw8swZj
 FzoQ==
X-Gm-Message-State: AOAM5316qztkhzjv+VNAqShgwgjPP1XKN4xMVKsMh1vlE0eaneM0lNq8
 LCwTfJwdENYORNF4LtuwuS7Dozk5oRtvJw==
X-Google-Smtp-Source: ABdhPJwz8pmwDDtoiBNV0u2tkeXh6fgClPI9ZmhhYQ15USuzwgKGu1fKtkO0pmHS7BRnw698NWycgA==
X-Received: by 2002:a17:902:8f8a:b0:13f:9c2c:de84 with SMTP id
 z10-20020a1709028f8a00b0013f9c2cde84mr22595760plo.66.1634659263297; 
 Tue, 19 Oct 2021 09:01:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q13sm17568561pfj.26.2021.10.19.09.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 09:01:02 -0700 (PDT)
Subject: Re: [PATCH v2 40/48] tcg/optimize: Expand fold_addsub2_i32 to 64-bit
 ops
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-41-richard.henderson@linaro.org>
 <87mtn5xbzt.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f2ec0b9-c496-6af1-384f-53a3a3f990a2@linaro.org>
Date: Tue, 19 Oct 2021 09:01:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87mtn5xbzt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 8:34 AM, Alex Bennée wrote:
>    ../../tcg/optimize.c: In function ‘fold_addsub2’:
>    ../../tcg/optimize.c:865:13: error: unknown type name ‘Int128’
>      865 |             Int128 a = int128_make128(al, ah);
>          |             ^~~~~~
>    ../../tcg/optimize.c:865:24: error: implicit declaration of function ‘int128_make128’ [-Werror=implicit-function-declaration]
>      865 |             Int128 a = int128_make128(al, ah);
> 
> 
> possibly we are just missing:
> 
> #include "qemu/int128.h"

Ah, this patch set predates a cleanup to tcg_ldst.h.
Previously we included int128.h in tcg.h.

Will fix.


r~

