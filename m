Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB95AD178
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:24:51 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVADc-0001PS-AF
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9qT-0004Mr-Mm
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9qO-0003I4-Fp
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id az27so10843630wrb.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0jXlotk9Fvxr7DrrV7T4jhQgTY4Zr71WORY6L/VYvAw=;
 b=h4ysvyZL+aFj0KxOxeiXUXFmGU39fcIbM8yMdv69I5WTX+VRwpYTB8g5JNodRITjgY
 YAOqMzRXVsB02DH2RnTrdLyCoRo+hi8onSNRRp9/EsPn7QOqA9kqlg3MYBul9B0hEOpt
 0BpL2w09igWM+49fQNcL/q9ZYblfymzclFxJG01+kTbTQbHP8wrEp8bYhelcAgA8PYVD
 6G7jDVQLpMP6x3RjgoWQbmsFRVHIrzlSiX26xwzuUgCa0TWVp6Jt1o9VT4SlEuJdMtb7
 ctSn5vtSoEXL9GwhrBegtCT5aoaLLwy7DkTR5TUwvrU2SHcm/QFXmkUf078JdU99Jn2I
 q7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0jXlotk9Fvxr7DrrV7T4jhQgTY4Zr71WORY6L/VYvAw=;
 b=qxqgPjWabq5T48GIu0txYqWPPc79/TWtmpzQig9p0kG18tT/kKBJDKZaBtTuDBDEL3
 pos6Pj4REF9d3zuojk+6VLbmTzVu/zUlY/A67MkSN55OpOLwpBgiXXViqL3QCTuWpmry
 zHx616VioLC+OFS+QEgxqU7Y+EiS6dhj3Ly8uWstNHwr1zFmAShaFhHUBAxOIJRqtp+l
 z9ByPVO67KlEW3Ls6BJv5zQxkBrvQ2vHSz3acE/xfPikh88HYfhu9mipbJRW/9K8LZPI
 7B3slSWLIl/DdoyFn9fH7DfX1/YNHPkz/Lvg5jjHBmeTD2G8cwNpvj5kqsnTvvljLomv
 GOIg==
X-Gm-Message-State: ACgBeo28FUF1EcJ0EfoXhN/vJGPQ6OF8wIC2AvjQjPjBsJb0lFD0/5Bv
 RAXnCu/sFmugPMv5oVtQ6VZuPQ==
X-Google-Smtp-Source: AA6agR7KdTi2rI8fOw0pbZzO/4mWHKs9kQDAyskBKwUzXftpCsRz/TeMUL+v3zko9OfHoay+J0aH1A==
X-Received: by 2002:adf:ef49:0:b0:225:8602:9a4d with SMTP id
 c9-20020adfef49000000b0022586029a4dmr23267513wrp.221.1662375641118; 
 Mon, 05 Sep 2022 04:00:41 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a056000014f00b00228c2462a78sm1131788wrx.24.2022.09.05.04.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:00:40 -0700 (PDT)
Message-ID: <4f7c0953-9fa3-08f9-05c4-fe66ca0c90de@linaro.org>
Date: Mon, 5 Sep 2022 12:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/20] disas/nanomips: Remove namespace img
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-2-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-2-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Since there's no namespace feature in C, namespace img has been replaced
> with adding the prefix "img" to the namespace members.
> 
> Prefix "img" has been added to the function names of functions that used
> to be wrapped in namespace img. Those are img::format() functions.
> I.e. replaced img::format with the img_format.
> 
> Typedef address that used to belong to namespace img now is called
> img_address.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   disas/nanomips.cpp | 1433 ++++++++++++++++++++++----------------------
>   disas/nanomips.h   |   10 +-
>   2 files changed, 712 insertions(+), 731 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

