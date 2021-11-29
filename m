Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36064619BF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:38:28 +0100 (CET)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhnX-0004e6-I9
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhfW-0000Rb-Ep
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:30:10 -0500
Received: from [2a00:1450:4864:20::336] (port=43652
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhfU-0001oN-5a
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:30:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so12568466wmc.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XGfAidO6YxExLHor8ECO/OFmYgrEFhToxkbk7RYwfAU=;
 b=K16vR/xt33U0/E6mfIGFGQ9JXJQTAyDvzNXV3RLvj7HQore7eQkFqsYqjceT8aJRQz
 gK1EIUI3JeauEpT37xc5u/y7T3f/XLXO8UN3FAAS2/8WJ6t6ZqBP8lfclDx+8hZF0uJY
 ez1zpnVT0VxQj1tvnbkqvd3+0cFPPzxrDuakIxMmGMoS8f9ZBeLjKDX5W8Qk5bsFxhOf
 9SZOm3+7Ytcv7RDjAMkMkAMjptMwmsIenZ5l+dxeQMxfLXHzD7vpE+znjClSMOSbU6UA
 VcIdFGF/dUG4QODwWgSw4qyI4R6FTWoMJnyvG3/gIgoePnCbGBBL6KMbsgxZ8E4b84LZ
 yVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XGfAidO6YxExLHor8ECO/OFmYgrEFhToxkbk7RYwfAU=;
 b=vutCogeV4Wphh3Io8FQS6xLcN/LIawr/7Cq4N+VB/ViMfmUPavy7TGUywg/P+XHLGL
 kZq4yXFIKRV+8gZNx7qKExr+xwb/bbL5kaMa8odjjScelPm7WyWRhvIWp/zxwT3R2Fbt
 BVcM3268otZyN6ItrGzytx6qv+kMfGMmjUnVHRem+vrXnybDY3AmmSHMPuwIXkjzwVU5
 /bB3VZi8bk86gGsROiDSRf9wqIorIdLprSzGMTOFau0qRtXkROooWkp+jWGbzg5+Ir0Z
 gyFORKthWw5qgeg8UBXK3nwxrDrMDvoQ0A0B33OAvRg/1u98hfuoUTAcyW3nQrGHQ78N
 NFIQ==
X-Gm-Message-State: AOAM5337HQsL9TH0NZK/ZJ5dHg4FHSuFLGj1XwpiV7x2MDYd0u+f1d3d
 GITyeYbk07vw4A/6T4mrhJbcaw==
X-Google-Smtp-Source: ABdhPJxNS3+n4zhn0IavWp3DPk/cWxrYsxEAtWOXRZ/8WrhECEkJDEVbq8/qGcOFXrSG6KhgYYH6gw==
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr37725760wmq.76.1638196206643; 
 Mon, 29 Nov 2021 06:30:06 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id l3sm17289903wmq.46.2021.11.29.06.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 06:30:06 -0800 (PST)
Subject: Re: [PATCH v6 02/16] linux-user/host/ppc64: Use r11 for
 signal_pending address
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-3-richard.henderson@linaro.org>
 <CAFEAcA-x6Q_mXbFLzr=7ALGkqijj=gM5DRu_TRMAkFSm8XiZGQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72a69c85-8a99-bf06-8baf-f6dbf8f49ada@linaro.org>
Date: Mon, 29 Nov 2021 15:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-x6Q_mXbFLzr=7ALGkqijj=gM5DRu_TRMAkFSm8XiZGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 12:01 PM, Peter Maydell wrote:
> On Tue, 23 Nov 2021 at 17:40, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We don't need a register that can live across the syscall;
>> we only need a register that can live until the syscall.
> 
> What about the case where:
>   * we execute the sc instruction (r11 trashed)
>   * the syscall is one that from the host kernel point of
>     view is restartable
>   * the kernel arranges to restart the syscall by rewinding the
>     PC to point to the start of the 'sc' instruction
>   * our rewind_if_in_safe_syscall() rewinds PC further to
>     point at safe_syscall_start
>   * we want to use r11 again, but it was trashed in step 1
> ?
> 
> Put another way, this patch is effectively a revert of
> commit 5d9f3ea081721, which was a fix to an observed bug.

Whoops.  I forgot about that (a mere 3 years ago).

r~

