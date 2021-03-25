Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A334917D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:05:00 +0100 (CET)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOjT-0000cB-Gc
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOhB-00078f-0d
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:02:37 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOh9-0000bw-Ae
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:02:36 -0400
Received: by mail-oi1-x22a.google.com with SMTP id f9so1852572oiw.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cz9z3YvzUkJAzokvKgD1nOinS3xsyxBDk/7kfynd01g=;
 b=Of7WneL2/+TpC6vP3BMXcvpr7I7Gl4kHBhoJfF6iBjbiTGH2oCFB604rQDP+tmUsvr
 z+FKywuG8RLD5kyndv1Jg/iA5FM6DL1HFyCI53bhVhY5GWvVA7LPycshGtd5cRyNVx1A
 VSAi5D0I4yX0HuFgJv42MGM7I3IDy38F43TVjsnq+DHSiZ+ex+Ct5Grp7ab549gNZtGZ
 Mu5uknMenDHZ3y3DMHf1E8Qr4mm3Qhy9J9qOVJd7cEyHty7kzt3bbRojqJWSqAliFUgi
 4oPENBg2oi6zpOlZCKPXu6HpbIz+aqtpRGoD/uVslYPLvD4bpwRp44WTS6R0Zcz60XD/
 x5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cz9z3YvzUkJAzokvKgD1nOinS3xsyxBDk/7kfynd01g=;
 b=ZxBYG+m6jqpIvOdUzebcAYD4DMBqOTx58/hldFp5/QfohT11TQAj0Fzv0DfPEGZYxB
 F5KYzZ7oCWrBX1yjkbMMVRwB9U/Wc7KEgpsyGCvB7BC/HXPzc5Wu5G3M6L9BpIZ5B16e
 R1eStNN/oWJ6vpoCdOA+avzDwWcz0hb417WGhhy0MLd8Lo5ha3BUAk7o+5pnbsvziNSj
 Y7/mVowBhwL7Un5KUpSuw3PqNotKEXNQPdU/u56pZ5NiDdJkFa7lFi1vrj4bWXS0tDzb
 dbfCufYXbmRaGO1BmdhKIyK1+nf5xfF2R8G0rkZ3QfwtKPhhtzZ033TJrOpH8QKEy27H
 B1vg==
X-Gm-Message-State: AOAM5325QWNFAAM30mrhSxd+7uvmKynkL3XqlpXTbCYH2D0/v7ZwsnS7
 b8iPFCGCa1hVJ+wYpsDDGcf8Zg==
X-Google-Smtp-Source: ABdhPJw8FCVqhUItm7utg+VEeRnFTWO8Q1IWkN61WPLJeQfIj+zbb/hPFfFxxYXtg0V3UgRjxcmGvg==
X-Received: by 2002:a05:6808:8c8:: with SMTP id
 k8mr5772417oij.140.1616673754006; 
 Thu, 25 Mar 2021 05:02:34 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id f2sm1214980oos.16.2021.03.25.05.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:02:33 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] hw/isa/piix4: Use qdev_get_gpio_in_named() to get
 ISA IRQ
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324182902.692419-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded65ff6-04ee-e1a4-614f-629d904c6510@linaro.org>
Date: Thu, 25 Mar 2021 06:02:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324182902.692419-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> Since commit 078778c5a55 ("piix4: Add an i8259 Interrupt Controller")
> the TYPE_PIIX4_PCI_DEVICE exposes the ISA input IRQs as "isa" alias.
> 
> Use this alias to get IRQ for the power management PCI function.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/piix4.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

