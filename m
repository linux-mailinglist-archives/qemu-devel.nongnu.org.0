Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC72836B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 15:38:55 +0200 (CEST)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPQha-0004C9-7L
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 09:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQft-0002mW-1V
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:37:09 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQfq-0006Ph-It
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:37:08 -0400
Received: by mail-ot1-x341.google.com with SMTP id f10so66837otb.6
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9TvVX21fq0kro5HekZZ6FHhWDsWPZeF1mOEcUdHXG8A=;
 b=u5s4J3sxE2mmaV+M3pSwKGm2rafofDwvXVFDCxsrRGX6jx+YPmIHnGYDK8+tbo1c7W
 6PZ6ISH5BMKBsvOh6C4m9g17G7X6FM0/H9R4mkFDZ3nSJ0oygfUWN7DrbasVk7p2/gNx
 h9A10+TaHoeZP67D1SNfMsf7Yjcu9tkSV+R/5VvfRWPzMBN31Tl84VBvGPNvylHJP7Vh
 tqSo3dGBaKPTTYENBH5N40I+F2snKV/96fqu1OBRyCSCBsvxr1VfeMbIA75hhobCR4LK
 YDffk5x5JisgZITub7tEwfUyemjYi1CJ8IU/43Zn4sGa+dMBrYvMFme3BIO/Vq5ssOjW
 d+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9TvVX21fq0kro5HekZZ6FHhWDsWPZeF1mOEcUdHXG8A=;
 b=c/FhZyLdL2kBmcVV+9VGwRigXjnHR5whKTdqOKy3vyc3wPNfslmmNzxqjbWnVpyz+f
 SFYXAmIyEYtwTsxK8xlpYlo2OMsmU8/5WhZIHDLJ8I7s9Nr5bx4t0aTmeKH7IFJmz4A0
 xcnG/enWEOzDMpSnw+8YB/Hot6OOGeSAupcYFCCt2vObxywL4SwfERiHErYdvvlxY5t5
 xvjPh5ujxFc04IMF33HU+19bx98MdrFqDKPOgm1PCEJ4LubSUVmFZNECmF4jOYjmIigC
 CGDmVwnIutCcnAjJ3/rhEd3g25bbrNG1zqxbmo68sdgnuVjWo37STY5+Y7n/IFh7/eSF
 Zm6Q==
X-Gm-Message-State: AOAM531Uir/ttWlgBib+NRpw0KNXBmD+dGsyHe/nbgFrqKCBttPbANhF
 QFbzHmj3byfyXvXUM5P2dhNr0w==
X-Google-Smtp-Source: ABdhPJxaO6VGoWMUPuwV0gLZ/aZ4I6B1qbTZKU1kTA77PDtg48PQbOf4vZc48xG9ThpsSYqcfKsXgg==
X-Received: by 2002:a9d:1:: with SMTP id 1mr11794835ota.81.1601905025531;
 Mon, 05 Oct 2020 06:37:05 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m187sm2270404oia.39.2020.10.05.06.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 06:37:04 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/mips: Simplify code using
 ROUND_UP(INITRD_PAGE_SIZE)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200927163943.614604-1-f4bug@amsat.org>
 <20200927163943.614604-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa3c770e-b1c5-261c-e0e0-42fb84677600@linaro.org>
Date: Mon, 5 Oct 2020 08:37:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200927163943.614604-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/20 11:39 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a INITRD_PAGE_MASK definition, use the
> simpler INITRD_PAGE_SIZE one which allows us to simplify
> the code by using directly the self-explicit ROUND_UP()
> macro.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/mips/mips.h | 4 +++-
>  hw/mips/fuloong2e.c    | 3 +--
>  hw/mips/malta.c        | 6 +++---
>  hw/mips/mipssim.c      | 3 +--
>  hw/mips/r4k.c          | 3 +--
>  5 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


