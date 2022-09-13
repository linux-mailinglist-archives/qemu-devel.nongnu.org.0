Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD365B6936
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:10:21 +0200 (CEST)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0zr-0004pg-Uy
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0qK-0001Kg-L0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:00:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0qD-0007ht-0p
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:00:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bj14so19366190wrb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=t3fku3er/LSlukd4QIdByMW7FqcN5Iqudg/exfqwopE=;
 b=idy/QXzZkYjePfejtLHk8nt7b46/bZXVAHNCXuYyQZ2GCIVSX4z1vnOZpDCnLYF3av
 XOPcEIJp9AnBhincOvMFEyiA3I2V4e4HYjVaHG3GsqYyAR0XhvEOZtjmfF5I01mcADdL
 JmmKaZbefJJIbOWqGzAU5beDB34GpAZ/F3sgLgBpPFvqDfuXnFmLqSL6kkwAg0GbmqpL
 omrfCiQWSCOEgRkSo+TyYjjtCc1GgzRq1UEDF93iJs91A9G9aGjUvIZFpgNpu6gtRuAG
 TEJ0wQ6wyrs+XjWcwMP3vKCHu+N0Btxg3uLzFO6eTuZAmnVO0L85OtDt/vfzsSK1NM/z
 izEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t3fku3er/LSlukd4QIdByMW7FqcN5Iqudg/exfqwopE=;
 b=tG3wFSRvtkdUbmaX1TlS0urdLLijOklHa/LyO39jdawdBSv1knR58BU87goFN29tRI
 lrXfX9J06uotsXh4WxmrLkFuDg3auNqjDYbrNqBwZMN681ltG4WFEozihtd3IeZYrzfx
 AufD/aH1eDiI5yfPWgESpy80fjpqqQp4oNqv6/7XK8bXxhjlHNaTCvP4T9JpQMN95FaP
 5DWtMcuvcsS4U2ReMeqzAAtFKB8W7uDHKYym4rS2LcLLN//lmjD7Cj3ZJJXTo1bTSFRp
 6WxWPCB8Wzl4kR061LFx4pVt8xnk4uOtjuimPsgJsujwJX3OD5wK4no82cp9umX7SZni
 NLvA==
X-Gm-Message-State: ACgBeo1ng6Okruo4gbWEovSMfEeKBOUs4vblW/mXlzzBMVJKiX9uckPz
 jtLtEJJreKY0C+bx9hANkhf6HQ==
X-Google-Smtp-Source: AA6agR4nQzOAWwLmh+lHl64+lObM7KZo9cgf1y5a7W3KR2INFRtJJmZD18qEFqL++PhoXeidUbHA0A==
X-Received: by 2002:adf:e508:0:b0:228:62fd:932b with SMTP id
 j8-20020adfe508000000b0022862fd932bmr18041229wrm.410.1663056019057; 
 Tue, 13 Sep 2022 01:00:19 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a056000054100b0022ac107e287sm946769wrf.113.2022.09.13.01.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:00:18 -0700 (PDT)
Message-ID: <c3f92ec4-b642-a972-00d5-4d3b5afa2348@linaro.org>
Date: Tue, 13 Sep 2022 09:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 15/24] disas/nanomips: Replace std::string type
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-16-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-16-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 13:26, Milica Lazarevic wrote:
> The return type of typedef disassembly_function is changed to char *
> instead of std::string. Therefore, for every particular
> disassembly_function function signature is changed.
> For example:
> - static std::string ABS_D(uint64 instruction, img_address m_pc) {...}
> is replaced with
> - static char *ABS_D(uint64 instruction, img_address m_pc) {...}
> 
> Every helper function used to return std::string is changed to return
> const char * or char *. Where the return value points to a static string
> that the caller must not free, the return type is const char *. If a
> function allocates memory and the caller is required to free it, the
> return type is a char *. This applies to the following functions:
> img_format, to_string, GPR, save_restore_list, FPR, etc.
> 
> Now that we replaced every std::string for const char * or char *, it is
> possible to delete multiple versions of the img_format function. The
> general version:
> - static char *img_format(const char *format, ...) {...}
> can handle all string formatting, so others have been deleted.
> 
> Where necessary, strings are dynamically allocated with g_strjoinv,
> g_strdup, g_strdup_vprintf, and g_strdup_printf. Memory leaking will be
> prevented later.
> 
> String concatenation in the save_restore_list() function is handled
> using g_strjoinv() function instead of += operator.
> 
> The type of the "dis" parameter in the Disassemble function is changed
> - from std::string &
> - to char **
> 
> Without applying all of these changes, the nanomips disassembler may be
> buildable but can't produce the appropriate output, so all of them are
> made together.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 4776 ++++++++++++++++++++++----------------------
>   1 file changed, 2337 insertions(+), 2439 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

