Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7582FF528
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:56:02 +0100 (CET)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2g3k-0008OM-08
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g23-0007cr-3K
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:54:15 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g21-0000cp-F7
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:54:14 -0500
Received: by mail-pf1-x433.google.com with SMTP id t29so2142612pfg.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=My/98D9JBVJIh7rQnWrZYnPXxIDIy9X2JM+TLvL4klE=;
 b=iPajnVzjTJxaetZMa9K4MyG5jGgNHg2J4uFRmXzdbYRJeD2RZBXPuqi+AnZJHsglF1
 A8BMayWgWz34ZjaZ2FuoFhdhM32pCg8BShfQITdS/YtUe00hi+zbiMsrmkqXj0r0OKBP
 bOJORkEv6zwzcDwW3FHqqriubvpAbW/iYhbj94lSGSHWGWK+6vNalk81lnOpCg4h82Uj
 Gj8B5NsTb4uGdxRpr0zLbk4v8W3x0h7URZuC0nUVOkNojMByFYCKoYqG2SFfkNxkJaIL
 EuhllPU0ILNGkSvuUmLos07T3RqNHq9Z/cNcen+ONuvmhRDTyQvH9IhzuE/eLZtHGo+M
 GnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=My/98D9JBVJIh7rQnWrZYnPXxIDIy9X2JM+TLvL4klE=;
 b=l6t+zldUYGElAbZ9C0e5Z3+ghMtXv/eOkNpJ5OrrCcRhBrtuA783Yho0Pct4kU6unR
 ApgE5xJAuu/TyXwVr+yeaAKsq3ZmQvhloFQBj4XbmjQmrb4rmyWqy0uR0Yny5dMCpp4P
 EcWa2N35gcjpkeruE6oR2xkiziMsLTzGZVZgnlfTLymlhcDC51uNayWVwZcdEPDCUzhX
 v2Yw/5tR+XD3hfSRc905hfYd4owL7chPiLoO+NOSVZvfaEgVbNOdmg7guI9ybspX9Wjr
 FGRWTS4dU79c11p8BOe44kkoU7632ey9gqNAH/gebQzi+mp4IhF9HNcvpvC4inChselJ
 EsMA==
X-Gm-Message-State: AOAM531bbZekeHy60+1AtV6oKD3oadEDHKIiOnxAWLqiIrNSQ2ttWQsB
 rlvS+DnNuvkTxCLo+HU1vTtGJw==
X-Google-Smtp-Source: ABdhPJxdHiOMcfBTIMYo0A21yDEZUZbWTCdMqGmtVOrg/3pJRzAfS/NIlo4r/Wwi/lBuoXwhDEi/fg==
X-Received: by 2002:a62:a11c:0:b029:1ba:bab6:6b02 with SMTP id
 b28-20020a62a11c0000b02901babab66b02mr1069556pff.51.1611258852003; 
 Thu, 21 Jan 2021 11:54:12 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a25sm6189850pgv.40.2021.01.21.11.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:54:11 -0800 (PST)
Subject: Re: [PATCH 2/6] target/mips: Convert Loongson DDIV.G opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63cf6d35-f648-cb52-3824-818620798eff@linaro.org>
Date: Thu, 21 Jan 2021 09:54:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> Introduce decode_loongson() to decode all Loongson vendor
> specific opcodes. Start converting a single opcode: DDIV.G
> (divide 64-bit signed integers).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h       |  1 +
>  target/mips/godson2.decode    | 16 +++++++
>  target/mips/loong-ext.decode  | 17 +++++++
>  target/mips/loong_translate.c | 89 +++++++++++++++++++++++++++++++++++
>  target/mips/translate.c       | 28 ++---------
>  target/mips/meson.build       |  3 ++
>  6 files changed, 131 insertions(+), 23 deletions(-)
>  create mode 100644 target/mips/godson2.decode
>  create mode 100644 target/mips/loong-ext.decode
>  create mode 100644 target/mips/loong_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


