Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D83F0D51
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:26:27 +0200 (CEST)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGT4s-0004Ui-4F
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT3a-000362-0I
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:25:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT3X-0002Yu-7i
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:25:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id q6so5644873wrv.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ka/VU93O7MQD1mZXQH7xiDDFKHz7ZV9AXHRJrZx8L44=;
 b=p1GJAEKlkl0GgjZb48D78LZsGjP5Gm9RjbbeshDr7S1i2UH8iGB3w8mahac7WG/i8g
 yRcAKlgvFD/dpjdrE3n3qWWVeCgXY+yAoFMS+c6rArG98OboiVwjLdESpOt3U97prFwA
 7OJImB/OXNkc+Rr9Kav9urqZFUzkG3hBCROMJq4ebCtu2H4xcDe+lIRBZr23raSmwcs3
 6Mt8zgPdcBimpxzEIm9HsZ6oPi/rcQGBGkOB+9OuUxF4F2WY795AXTA57vDbB7JDjJfn
 KUCiztJalP4UE4RtgHYfe12tLC3dhhpjeSjlKL06MzS3rt8cFEekDaRNjaulMp4KmZ3K
 9vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ka/VU93O7MQD1mZXQH7xiDDFKHz7ZV9AXHRJrZx8L44=;
 b=mC/fTkGqFFiXcYjcUbKYuZ/2vC3aWz+dIMCu5nrWEv48iD3IFiSqMsR94tV58KNCCW
 UYEXR4nayKGcebS8wr0T5yNd9NPI1h9INXhykfWbNWp8Zkb9c+DLo8bAWLNVLxjPyUiB
 bPivO3dMTHXy3ho34QVObha5ihDdqMuPiKtNL0qAZlzFZJKdRCchmuA99ZWDntsLrbMo
 1galXy5thm+3oaXM0kH33BDYOCBwRHVu5yqLcVNmsq49e/mPzTEZUXZdTJJlHCYid2XF
 pBIRZAa3NWy05SrPj/jrViFgE+rhm0afwoJUUfyKer8JJJu7jJBqZeIC12pNFXWYkQgk
 hdHA==
X-Gm-Message-State: AOAM530IVR6xKfyVLphLTyeNqOW22oac/7CXJjGr+kmQkaM5I0k3EhTW
 EKEhcqxGH/Ms/rxwe+QkZc7Am4R1mAQ=
X-Google-Smtp-Source: ABdhPJzy5cB2x+Z+ge26LlqQ2gA2BBEoB8Oe3PhfUA14dAzojP/Q7domAO/mU3M4xqdqN7BL/vzJrA==
X-Received: by 2002:a5d:4691:: with SMTP id u17mr13136294wrq.254.1629321901481; 
 Wed, 18 Aug 2021 14:25:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c2sm919669wrs.60.2021.08.18.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:25:00 -0700 (PDT)
Subject: Re: [PATCH v3 64/66] tcg: Canonicalize alignment flags in MemOp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-65-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ba91b16-1aac-9812-37bf-82dffa60a28a@amsat.org>
Date: Wed, 18 Aug 2021 23:24:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-65-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:19 PM, Richard Henderson wrote:
> Having observed e.g. al8+leq in dumps, canonicalize to al+leq.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

