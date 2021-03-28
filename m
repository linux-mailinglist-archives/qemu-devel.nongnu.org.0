Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366D34BE70
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:06:16 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQajn-00031g-D7
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQahK-000209-0i
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:03:42 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQahI-0000Wx-A8
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:03:41 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so10226675otb.7
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YaVEPtivnqE5fE2NJv2AEZt9kQS+lKK5WzRreFrrJpo=;
 b=kS3bhpGSVI7Xx+N1rPD7JdMxlYyIvqdruUxV4rfVYhzncf1IwRHgTBrBhJoYV3JAg5
 Yv/n9Zo++ye9SIJuKe1/ZMZfJ/ijvBjzu92L4nj9sUAj2xEPs56F++j/N2GCFdRPzR/S
 vY0SugMK3wC7vBxOUU8xv+PW8t7dVQtWzKQW7hbMKEN0mf+XMJxCkYNT70JdNnpO8fQi
 4JM+Jgf/XL5/hAl6apwKO31vXVQky/zkZp+474KN69Io0744R1X81t7PFkI0l/N2qcZt
 AkmLp3gztGcQwkEnWbDVDIOYtKxS/n+xkaJ0O0W3kXRSs9Y+ItCSV3wEP4uZOB/NHRqs
 r78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YaVEPtivnqE5fE2NJv2AEZt9kQS+lKK5WzRreFrrJpo=;
 b=EfvoZ/U5OsqaK+ySCsulZsFs+3dcxKY+F97b51aS0mmL47cYBC78MdHwCGAuvmLxm3
 qt8uOPLGPTxKr4Kp6Cscl7JhNTIM41ddSSjx4Sn9AM1m2VQUrisVvH2jVBjkbkOQrxFp
 luj/V6kcCMFbgyjm/cqRx78gfpfSLK3VN80geR4xb1+d5k3rm03ecoB/VWgYVxelSss8
 5JIKBKy8rEYwYnwlcmpIJTvo0mQwF2EPM/oJorhuGKETEvXH4HMK9dL6cwcIlIHdI2N8
 cXqAyZl9LA1eGFQAasPMnjK6CMgVB5XKzrkGmeAxLitePEIqrOG51jxwgBZhqKhfkrvS
 llpw==
X-Gm-Message-State: AOAM53004X/+qpEmrchsejFUa65h+zETe6+9VoeZ2u0Db1HpMhAPe/qI
 K8etUELfbr64eK2+s5fDgsgIxg==
X-Google-Smtp-Source: ABdhPJzrCkQExLBgRYg1ajcVZXOnWb3ivdA0y78HiWOqxI+HOro5gxUr1juVBmrNwEEFIyYkRSNdxg==
X-Received: by 2002:a05:6830:101a:: with SMTP id
 a26mr19982959otp.68.1616958219103; 
 Sun, 28 Mar 2021 12:03:39 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id l190sm3042431oig.39.2021.03.28.12.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:03:38 -0700 (PDT)
Subject: Re: [RFC v12 59/65] target/arm: move sve_zcr_len_for_el to
 TARGET_AARCH64-only cpu-sve
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-60-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <013c6e6c-c108-81cf-e165-801974810f31@linaro.org>
Date: Sun, 28 Mar 2021 13:03:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-60-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> now that we handled the dependency between HELPER(), cpregs defs
> and functions in tcg/,
> 
> we can make sve_zcr_len_for_el TARGET_AARCH64-only,
> and move it to the cpu-sve module.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-sve.h    |  3 +++
>   target/arm/cpu.h        |  4 ++--
>   target/arm/arch_dump.c  |  1 +
>   target/arm/cpu-common.c | 43 -----------------------------------------
>   target/arm/cpu-sve.c    | 33 +++++++++++++++++++++++++++++++
>   target/arm/cpu.c        |  4 ++++
>   target/arm/tcg/cpregs.c |  1 +
>   target/arm/tcg/helper.c |  4 ++++
>   8 files changed, 48 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

