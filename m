Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C514420249
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:33:39 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3Ug-0001hC-01
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Rz-0007dj-I8
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:30:52 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Rw-0001Uy-Ma
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:30:51 -0400
Received: by mail-qv1-xf36.google.com with SMTP id dk4so8614264qvb.2
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F3i5BSL4N5+JnC1TKy7PotGXjz64v5zuWydrRYfeTrI=;
 b=SFqAnC7yYbt0mVjmV7czkVpDzjlDebiMJEb7CHbqk/tsqjt3Kkis2p8MqGMtgd2IU0
 IUqB/of+RJndB9wfrhNVq8Iz9jjOGmCBlFntB8PwCXTfMO/Yxlpt1gUGOoyebf9r1QGx
 GpKMRIhzUk6bhU3pzvNK0whX1kAi6gkk0fhATQXlndXTAep8eyF+ltA3Iq5EYeXBhp3g
 MZ8GE/iJ99UePOjs5fTrOja2qKBaWJ0gk1Hts/9af4e6YwPIZP8XbyUfX6qtp92KO1kT
 y+0AqWPmb6RIpz0KGxYGtRIUV/LrK/9coBezbncMiJNGN3luvS8oLeIQM7O+3cKXxiGL
 gS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F3i5BSL4N5+JnC1TKy7PotGXjz64v5zuWydrRYfeTrI=;
 b=2/jVMKQCr/O3eshgBBYIWmDnTM2N+8mVjbcI77VCmt3qVxQTuXrBTzfhZZMVje3pGq
 8VQCyZWc8VGcGBgryMGAVwee0Y+TZKvTnx3atQAbuG4Gt+HU/sEbbR20qOJeg3gAQZuJ
 ZBh1rYK27cqQzZkTCYMYRY2S3UwCnBPk95e5p39/gTAmbhOT6qmoM05V4ghsoLO3+Htd
 rbBA8ITOEfojBrIweVyyhOXVu/EnAT9bzmUD154B1lRVmQvpWb0E8lbM0RhCpoWWiLBq
 DjvEyY+tX29M6z4dKLmglFcNPnYMgLQRhMepR9oIe6uWHEK5O7xPP30zV+rEefK8RzVN
 U8Jg==
X-Gm-Message-State: AOAM5313B+mJT4tcrMLYUN6RXy6iQP0W5Yfhb4U99g7j4NjHFoerQLtl
 VokuwYwhcZRxXAh3iFqyZdBpcA==
X-Google-Smtp-Source: ABdhPJyjrDbKaX9REwDuiqxJPQuD1xmHHEGBKcAq4kNJ+rBc/NqHz7JXdL//VbwiaLJuNb/cGtDqmg==
X-Received: by 2002:a05:6214:12ac:: with SMTP id
 w12mr18121241qvu.44.1633275047616; 
 Sun, 03 Oct 2021 08:30:47 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id d24sm6103151qka.7.2021.10.03.08.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:30:47 -0700 (PDT)
Subject: Re: [PATCH] target/m68k: Optimize shift_mem() using extract() TCG
 opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003142428.3676092-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7f14d9b-d952-beff-e4be-d4a6a6ef5e0e@linaro.org>
Date: Sun, 3 Oct 2021 11:30:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003142428.3676092-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:24 AM, Philippe Mathieu-Daudé wrote:
> When running the scripts/coccinelle/tcg_gen_extract.cocci
> Coccinelle semantic patch on target/m68k/, we get:
> 
>      [DBG] candidate at target/m68k/translate.c:3668
> 
> Manually inspect and replace combinations of (shri, andi)
> and (movi, andi) opcodes by the extract opcode.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/m68k/translate.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

