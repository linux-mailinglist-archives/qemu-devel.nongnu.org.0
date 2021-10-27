Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1737C43D606
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:49:12 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqnH-0007iz-5S
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfql0-000705-Nf
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:46:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqky-0002Mr-QR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:46:49 -0400
Received: by mail-pl1-x631.google.com with SMTP id s24so3012265plp.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ukS9EWnDUAylSpjcvvzh78lb2IJitQrTTjcmSNbtNA0=;
 b=GkO+wwjZ8LL/wZaGIEnNAFhumSuyXR9PYZlTuORjUgr3CoKe/nN59tmmYvqsBeTGla
 +YHjfyzGGOJUBc/cC15CKotkU77MDylduoP3Qp3ynqzdZr0Qdp5V3I/KELYYak2D5hV3
 Wt5YHwLXiye8BTQ/UDYg7ITdwxSYcmUS9OS1mu5C6a3zTayxMREV7/eLShIh9OnOtdMj
 QJaqxSG6ryHtq0biIthgq59EGsyP9/ZHVjKKrz28mrL8jH2kegXVnaiOUGaa3uU8tZ2l
 jORY0xlAj8S9P9O6eax914C8i4xBOnqI5//aflyz77SipL3icaMKxqTt7z2nqJm1wLEo
 NS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ukS9EWnDUAylSpjcvvzh78lb2IJitQrTTjcmSNbtNA0=;
 b=dmItJ5lMU8b55nQJH14BadkC76WMFOi5s2xXK1j7VTBXK8Pu30YqtFokktMoyCeLA9
 7DgCAfRtRH9/ANo7xrvytykW771cLoDA/nSbTt1vk+cVkbmK3xqujIMqYy+2dv4GWzGE
 JIraWbyXC9HWCd50wB0i9uNnIz4yklwIbZRIV0AyD58GwZtmxHC3JWVQ16S70tPd0zWh
 lL5XaEVXTwdFXGKDiJiY0IytjH4gYJXiqgHcstXETUoGWcQBvSqRCANtupIxoOedCvje
 eFBxygJcL3QUUG3KXQnAcc0em/a85uahfC3cDKH0Xp4kWukdCo3v5xhTJ0iBV64PmlN7
 mYAA==
X-Gm-Message-State: AOAM532WVpxlQ3pzsbJd2xqr8K0ai9IlRgzbLZGVn0zyw1RoHHOJD2EE
 /Y//2FdKnP3PY9mP6ZawihabJdziivnegg==
X-Google-Smtp-Source: ABdhPJxKkDBzN4HoFPgRExYi1ma+81gLr4Yeu1Sctxx56DPwoMFzD3DNqMmbiGYf09yoqMPLWQv4RA==
X-Received: by 2002:a17:903:228d:b0:140:4074:a711 with SMTP id
 b13-20020a170903228d00b001404074a711mr98353plh.75.1635371207325; 
 Wed, 27 Oct 2021 14:46:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c20sm861551pfl.169.2021.10.27.14.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:46:47 -0700 (PDT)
Subject: Re: [PATCH v2 15/32] target/mips: Convert MSA FILL opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05b91dc5-4c93-4f01-8e0b-45ef896c1c69@linaro.org>
Date: Wed, 27 Oct 2021 14:46:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
> +{
> +    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
> +        /* Double format valid only for MIPS64 */
> +        gen_reserved_instruction(ctx);
> +        return true;
> +    }

Here you have the option to return false.  But either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

