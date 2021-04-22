Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409D3676FD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:47:37 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZORM-00042W-EQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZONo-0001VD-5M
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:43:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZONl-0005R9-NE
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:43:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y1so7041369plg.11
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XUJyQC09XBS77p06soDGfu+6ECNMzMdA1KbznqQXjOM=;
 b=VN0ktxat2f4nWng7EyXYDwpnc6vf8d0dBa52kx5vB9R6hu/lRA8A7ToHGEuG5Rq15D
 /UJpLyZXGAtyjhz5uaGrJKFo8GQThVGfJumfVz1PDT7pvQX+pbdeLqjsfP/58MNOFwod
 /lBa6yB1QDEs9AO9q7tmtwMJaSYPjjWYJY3jgTgxjCzmvzGgWw53QcdPBe7N28TzctNZ
 TTYMNUJq+vX8M6zZN+AgEDKh5opkW7DWDgk3RnANJ/bVxlX6W2V7YeO4WNKITsPX6mZD
 4+pBNVye/H5tiLXvaC/fKz50flgcTF8rEdc0NfCk9T51fqKuRMkYDNeQZFssafX2fkfN
 itEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XUJyQC09XBS77p06soDGfu+6ECNMzMdA1KbznqQXjOM=;
 b=osBH63JSkJbNpqWgvkJHtzXfxgwRKyP6LPjahLW8zuG8PBL5qfaWfQ6lqVdpfKwGhL
 P6zl6H5rwLEltAB5CXHTSDRrZQccfR8GiwusWVuehek+HupHKttbT2XJ5IganJgTEyby
 F+swIOpOc94hqYRuPHdzlOJXuNGaV/ObpjkXZI8cSLb9LscS+b0g3+ZlPikgFV3IJnDY
 0s+wEKiWjOOJln+NF/FWWlsS26ABMkhkD5x7QFQE3KzdFYIjzW2Zdhow3fTXwPCaV7xO
 3eIFBvH0zFVUUfN+9rYqjNSIU/oYqKjUTWANqHE7Qoz+wdA+Zbf+PDBu6pLusFV6CvR4
 e0gQ==
X-Gm-Message-State: AOAM531ibHVfDdTQIGONXHjkzqGMR2l0TYfIugnTHLUO+Fzmwx1D8Tmb
 kAqum/QXAaeTA1zI9Ew38Xl20mzDnTXGhA==
X-Google-Smtp-Source: ABdhPJwvNX3gqvU23I6PpU7pIA6SZRr9ASQhMlpjO38Ycl4rQ6JkUub4uY5CEofDjg/IUjUGJMCDaw==
X-Received: by 2002:a17:90a:6b84:: with SMTP id
 w4mr1196198pjj.134.1619055832344; 
 Wed, 21 Apr 2021 18:43:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id lk6sm3356553pjb.36.2021.04.21.18.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:43:51 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] hw/arm/digic: Map flash using
 memory_region_add_subregion_aliased()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dec790d2-9fa7-169b-c2c7-2b8ab3ac187d@linaro.org>
Date: Wed, 21 Apr 2021 18:43:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a device specific feature for mapping the
> flash memory multiple times over a wider region, use the
> generic memory_region_add_subregion_aliased() helper.
> 
> There is no change in the memory layout.
> 
> * before:
> 
>    $ qemu-system-arm -M canon-a1100 -S -monitor stdio
>    QEMU 5.2.90 monitor - type 'help' for more information
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000003ffffff (prio 0, ram): ram
>        00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
>        00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
>        00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
>        00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
>        00000000f8000000-00000000ffffffff (prio 0, i/o): pflash
>          00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          ...
>          00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
> 
> * after:
> 
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000003ffffff (prio 0, ram): ram
>        00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
>        00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
>        00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
>        00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
>        00000000f8000000-00000000ffffffff (prio 0, i/o): masked pflash [span of 4 MiB]
>          00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash [#0/32] @pflash 0000000000000000-00000000003fffff
>          00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash [#1/32] @pflash 0000000000000000-00000000003fffff
>          00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash [#2/32] @pflash 0000000000000000-00000000003fffff
>          ...
>          00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash [#29/32] @pflash 0000000000000000-00000000003fffff
>          00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash [#30/32] @pflash 0000000000000000-00000000003fffff
>          00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash [#31/32] @pflash 0000000000000000-00000000003fffff
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/arm/digic_boards.c | 8 +++++---
>   hw/arm/Kconfig        | 1 +
>   2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

