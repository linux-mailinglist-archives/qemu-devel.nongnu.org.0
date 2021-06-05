Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97139CA90
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 20:58:24 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbV0-0005n0-Su
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 14:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpbTt-0004Pb-UE
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:57:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpbTs-0004w8-7l
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:57:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f3so738305plg.2
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qGgnvp9E2IUHKX1ZUyEJHuFMFSiqnp54KMP0FuDmEb8=;
 b=ILvxCqgckK58CfayGZ3LDvC42200HdDh+ihZm+VSm3uzBxHX/pROfQSbWoJ6MvIA8t
 w/x5ZYy3Yxgrpvu1QsDt1l+pYGGuGqmfmwHd7RoE0fSEaOfwBYXhbIsCCuGIVW6a7kMD
 XkZwZhaTtXbRfoQBtFCP7DUWs/wz+YTcBfTLWdbDQCfJr/yTn8thgmtddPW8n9j2iCOh
 mdeoRFo38rruKyYch86bSYPokNHFaEMCoJK00b7v7hiDpdWpW6L/XfaNILowS+0ABXou
 6xo06NB3W5S3dISGkR39wCUiYdO7+yiVz/W/JySnafPfztg7yJ8mc9EARFpLXixCA6pw
 njJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qGgnvp9E2IUHKX1ZUyEJHuFMFSiqnp54KMP0FuDmEb8=;
 b=P6is2I+Qrj6E4jGxEYlJ6UlhUTwehiDXIsfEsujCAIm+OzO3YgqSYlncZBplU4X1+J
 imQm2BX0xpfiRgbRfmTPuEvj3w2f0mR5V4C3P7md/IuzzY7oVn/m7f94z3RM2hgO/3V1
 USrngqiuLK3UhQxarQJ72Rcv+HTrdA61ktsKxPdStI6lwYhi2+WmxOnnxx33vhrpdiys
 CAE6H4t7GxNLKYIkrUF5jRjbVzA5YHbnT7t6ozckVr/vSmu2qARX/p4FjDXlB7FnmpRh
 x0jJNeGZYjy6YwHUOII+7KHaXD57vIlEgeXJC/v4xKa+O0QR8xJiqKYgz8a6QTwGhwPm
 yhng==
X-Gm-Message-State: AOAM532NJ9A2thooZhzI8TQH04OVkFGeEwFRkDnAbgiq5jgXjK92c8aV
 EcP0Ml6wa/SflY/TgpwfTSYIlQ==
X-Google-Smtp-Source: ABdhPJwi5jKUNspYwbHI6kCuKEiHDcvUW3Y4N2i/mMyEdxmK61mfRHWlGUZbzUL4Y0+Rn6N6VmyzsQ==
X-Received: by 2002:a17:90a:a509:: with SMTP id
 a9mr11456913pjq.190.1622919430702; 
 Sat, 05 Jun 2021 11:57:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s24sm4663128pfh.104.2021.06.05.11.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 11:57:10 -0700 (PDT)
Subject: Re: [PATCH v16 74/99] target/arm: cpu-sve: make
 cpu_sve_finalize_features return bool
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-75-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c215771-9493-0397-781e-1924fe3eb34f@linaro.org>
Date: Sat, 5 Jun 2021 11:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-75-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> return false on error, true on success.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sve.h |  2 +-
>   target/arm/cpu-sve.c | 17 +++++++++--------
>   target/arm/cpu.c     |  3 +--
>   3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

