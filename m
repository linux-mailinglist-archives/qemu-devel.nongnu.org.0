Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418163111C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 22:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owVL7-0008DE-Fq; Sat, 19 Nov 2022 16:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1owVL4-0008CW-Vt
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 16:25:27 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1owVL1-0005u5-OF
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 16:25:26 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 4so7481514pli.0
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 13:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XnwfrRU2aVKsa7ZroPdrsTXdhfiHc9JNbuHnZa/YJ10=;
 b=SnmD6Qs7iQhOMKEyCT8HIPNCsyWfT6dxct6Vl5kYVLIBX89rG5cVn3w9SdtpAWMlKw
 iYxGiYqh+gxWQ9fVmuHlhBglsJ8mDlbwoDRi47Vxe4wsOtYJepvUVOGqUnNGIhXJo6c/
 9W8+Ff66gDSWdc/GwuNeEugWjIC2Cs43fBqSOQUiwO27K891RPAw7WzeOgUFec8mdFG2
 0XZUx4EsRH9lROh82sdPahldw1tDFRGt25tQHWrz++0HJP3vO71WbRY6j8jcUNGvwFam
 Fghvm3/sglYD7gAXFFyquI8PEN+XGjUNq+r22Hl9LmMTlU1okYpVk7MPKK7sEtcq+bQH
 F9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XnwfrRU2aVKsa7ZroPdrsTXdhfiHc9JNbuHnZa/YJ10=;
 b=k//LoFwwXfj5r1DYE1b2qKmw9wqztfloxNSyB30K7oiWZWomVU6POSBWZ/591BUsDX
 bejThQ/lshdco4n3rL629UCd7FmN6stZcrToSqYdOShOWvLfEKlTuleNO+CzHR8BXf5M
 y/baW6mRpbnQYGJI6owWP187Qriqwy8f3S3ZvXCNGbEiclIuD5YlCBBU8/g4fneteTYR
 /ZrNXD3u0q+qFRG1KADEQNX3RZZDig4U3bzELpgbs6wjiUJMo/D/gc/1O5Md/TDYwlnq
 t9gK67BoxwfhaHsyj/Ohwef9Kqw5IA3Nu3dH45JjMJHDK7wVrKbYUU0nnw/Cll84ijmw
 oM0A==
X-Gm-Message-State: ANoB5plEHzvoazrNDcMcJXSHqHq/M+olp33tsdlBb1gczqoi9Eeb7vgW
 9JKXrZ9pOYs9ugXV4rSIzQTthQ==
X-Google-Smtp-Source: AA0mqf5CC1xcSafPSEQWquRv+bRmviYCbNDILShsGMR8LMGmCQAnXuQGcM/5Lx3nEL9uHZHvJUtvlg==
X-Received: by 2002:a17:902:bb84:b0:184:e4db:e3e with SMTP id
 m4-20020a170902bb8400b00184e4db0e3emr5250862pls.47.1668893121638; 
 Sat, 19 Nov 2022 13:25:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:f672:736d:3dcb:29bc?
 ([2602:47:d48a:1201:f672:736d:3dcb:29bc])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b00176b63535adsm6217292plh.260.2022.11.19.13.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Nov 2022 13:25:20 -0800 (PST)
Message-ID: <120b85db-4c05-6ea6-2f82-1281d633f8e9@linaro.org>
Date: Sat, 19 Nov 2022 13:25:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Instruction concurrent modification issue of direct jump in
 AArch64
To: hev <r@hev.cc>, Richard Henderson <rth@twiddle.net>,
 Pranith Kumar <bobby.prani@gmail.com>, Qi Hu <huqi@loongson.cn>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <CAHirt9id_Q8K33D4+2iF07e-BhUsjUBBhby9k+BZU2dYg=KToA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAHirt9id_Q8K33D4+2iF07e-BhUsjUBBhby9k+BZU2dYg=KToA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/19/22 00:19, hev wrote:
> Hello,
> 
> I talked with Hu Qi about the risk of instruction concurrent
> modification in TCG direct jump for LoongArch, and the conclusion is
> that the implementation is correct.
> 
> Similarly, the AArch64 implementation doesn't seem to be quite
> correct. IIUC, multiple instructions paired with an atomic write does
> not guarantee atomic effects on the execution side.
> 
> For example, the issue in AArch64 is:
> 
> Instruction concurrent modification:
> 
> * Before:
>    adrp
>    addi
>    br
> 
> * After
>    b
>    nop
>    br
> 
> * May actually execution:
>    adrp
>    nop
>    br
> 
> That will cause the jump to an unexpected address to execute, What do you think?

Yes, I agree this is a possible execution that I hadn't considered.  I *think* that it 
requires that the thread be interrupted after the adrp, to resume with the refreshed 
cacheline.  But an interrupt is certainly a valid sequence of events.

Perhaps a better construction would be

Before:
	ldr	x30, [pc, -XXX]
	br	x30

After:
	br	YYY
	br	x30

so that we only update 1 insn, and it goes between either a direct branch, or a 
pc-relative load of the branch address from the TranslationBlock structure (which sits 
right before the code, and we have a 1MB range on LDR (literal)).

Although at the moment the backend hook doesn't have enough information to recreate the 
LDR offset, so the quick fix would have to go between BR and NOP, and leave the LDR to follow.


r~

