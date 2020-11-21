Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E52BC1EF
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:10:55 +0100 (CET)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZDj-0004g6-0F
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZCM-0003rF-9w
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:09:30 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZCK-0004q5-MI
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:09:30 -0500
Received: by mail-pf1-x443.google.com with SMTP id w6so11188117pfu.1
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FiksJ0NtazC+dMSPsesnVn9fDJTOrd9LMHgw4rP63JM=;
 b=gYjQ+VU1HDqjEyEKMT19TKEChKypwIosv7Hm3oew/ZMWS12OECtcKpMDhOazPvkK7s
 U7/W6uXsIgr6hne7S5nfYJNuuDETV0O58f5OKRWEqeodN/Sk5qaVX05dmIx43Upuor3A
 X7Qf/99Y7CssKcJaTEVO1yvHT+SSzz5dXODKVgLN6GjXgNN1BAgzef4p96KYdH0r3RYe
 JfXEL5VKpeFrwO/hhFiaUZVLGA7aNnGQ4Wum0TtChYcDAY1E1eiXarc8BWNRXTpswB2O
 EvTrtZ3F5vJIT90W+lEcOpdL09ozix2tyZSF7rIJV5b7nprpJ2IqozjAP8h0Td6vO5Lt
 7W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FiksJ0NtazC+dMSPsesnVn9fDJTOrd9LMHgw4rP63JM=;
 b=IuEf8E/iDHlUVt35rvFKe65MkKPiEqAN67Lm+2gQleAlt/vavt3c6C47GmmbgI4w9D
 nwcrMd4tDLWaULREPe3KVVV0JW/GV8YvOhlqF96zkIPc/L7t+MEdseIrp1a7EANy/hfE
 O1ukxfyMzUitCzyG0Lt34olsT0ciKaPOj/AAAzj65EUU3MlPUQ3OdEyxc467d0n3DH3P
 6iZebyES3enz17O2C7rk2H9Ju2Ta6tmkEVJgtBVJFkns2Zg+4XBRxJblK+34Sll4Zisc
 2aToS7G5Ruo9E2Mo44uP6SyW03t/ik7taijuh5dVMNL3bfiN0mN6aovIC7PQVciUlK89
 UOFg==
X-Gm-Message-State: AOAM5327OhBUZgIvUBPDNOPBBnFwNVLdweIHrY6dTaT/umKRl3U1xpZe
 +uhrWlz9meP7hDuxNtit5JfbTQ==
X-Google-Smtp-Source: ABdhPJxQoyM7eKc2qgEmXKs90ca8SAqa1tZu21dfMhIDwW0XirUF1UKBrVQrs1sKVki2DO6KI9T5ZA==
X-Received: by 2002:a17:90a:ea05:: with SMTP id
 w5mr3187896pjy.204.1605989367499; 
 Sat, 21 Nov 2020 12:09:27 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 17sm7898096pfu.180.2020.11.21.12.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:09:26 -0800 (PST)
Subject: Re: [PATCH 18/26] target/mips: Extract Loongson SIMD translation
 routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-19-f4bug@amsat.org>
 <2aa2dd99-fb46-0466-bd13-3ea8aacdc697@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74d2995f-c04f-3531-a5e0-2f02fc19da0f@linaro.org>
Date: Sat, 21 Nov 2020 12:09:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2aa2dd99-fb46-0466-bd13-3ea8aacdc697@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 6:30 AM, Philippe Mathieu-Daudé wrote:
>> -/* Godson integer instructions */
>> -static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
>> -                                 int rd, int rs, int rt)
>> -{
> 
> This isn't part of the LoongSIMD ...
> 
> [...]
>> -}
>> -
>> -/* Loongson multimedia instructions */
>> -static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>> -{
> [...]
> 
> ... but this part is.
> 

With gen_loongson_integer not moved,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


