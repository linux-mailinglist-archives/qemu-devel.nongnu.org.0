Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69D6CCADE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:43:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFDH-0001vl-Eh; Tue, 28 Mar 2023 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFDE-0001vU-Tw
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:42:33 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFDD-0006Tp-Fl
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:42:32 -0400
Received: by mail-pj1-x1036.google.com with SMTP id j13so11913863pjd.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680032550;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7C1U6qOqDF9TDLoccfCthQFpAipusfSMUXMqM1TGl4=;
 b=VH9zcOq1JzzXfYvn9dR+BecjnO9/nRwZ/rkg2pcb1vyHgKmVbf+yverrwDyLgQLsH5
 0533SH8c1lavR6zp6QTU++SalwylQrV03z0kGNGNSitoGcomJT5IvO5/fxpAbLt7Uyt1
 x0PX0lRXXkGS36aQWvS6Xjr1tuQRls+9UnL6WCsxM/hAVEQ4qmsTWhd/6z/CxsjrhYZL
 Moq12ESuFKY4iPQEX0r9vrQiLuGwCJ4RuvRIqQAFUHdFhDiXcL2DbKlvP6cLB0ZMyHgi
 F2Fxfk9T55kKbfnitz0qe5pLYovs4AwnHZYjqQmb4A11j1LcdL4pfzr3Xy62DlpSSp0U
 ovxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680032550;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7C1U6qOqDF9TDLoccfCthQFpAipusfSMUXMqM1TGl4=;
 b=CfUXA0nE/jP+sbS7E2kKzya+M0iYwc19L+GLkQ8/odIup9HVYw52/P520ecYT2sGM9
 430VMqhz5ohuAFiDevTOYZzwMaH96i3vmFeG23DROhWInvZQuvf6Svpjjc0OaREf5/St
 R5smOOmYH41YS7O3Q0to7QzlyNo8STBLYKQImHCwDRGYqYgvww7f9RqAjkyvOANbWGPP
 ZP2VKyqOG1tsf6JKI/fnx26gDkdg6zRrskQ/LCxd1NfwzZKY3SZcba6k9sdqn4M0pLsR
 Lqlv9Ja03HY7PmTlsdgVzNCpywzG/7/GpdlZ2QeR0RrnTlBPRAbwj/wM3qL8du2ofb8z
 GEhA==
X-Gm-Message-State: AAQBX9d+mSLv24mfbGbIYP3pCBzuQuaCaajjS2mHRtK2Dkydhaa1NyUL
 isEuc253BOsbTIIKOlDsHS0qtg==
X-Google-Smtp-Source: AKy350aa5Vf1n2uZ8UhQheJ6gyDhBPYvJGT8eJuAW7h87dzJnS6mwoG/O+Yyd6zbaagHw3dnRIWKMQ==
X-Received: by 2002:a17:902:f545:b0:1a1:7da3:ef5b with SMTP id
 h5-20020a170902f54500b001a17da3ef5bmr16010186plf.7.1680032549948; 
 Tue, 28 Mar 2023 12:42:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1709028c9400b001a04b92ddffsm21470304plo.140.2023.03.28.12.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:42:29 -0700 (PDT)
Message-ID: <5b71083d-cd21-32c3-dd7f-f4baae6afc09@linaro.org>
Date: Tue, 28 Mar 2023 12:42:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 04/44] target/loongarch: Add CHECK_SXE maccro for
 check LSX enable
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-5-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -52,6 +52,7 @@ static const char * const excp_names[] = {
>       [EXCCODE_FPE] = "Floating Point Exception",
>       [EXCCODE_DBP] = "Debug breakpoint",
>       [EXCCODE_BCE] = "Bound Check Exception",
> +    [EXCCODE_SXD] = "128 bit vector instructions Disable exception",
>   };
>   
>   const char *loongarch_exception_name(int32_t exception)
> @@ -187,6 +188,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>       case EXCCODE_FPD:
>       case EXCCODE_FPE:
>       case EXCCODE_BCE:
> +    case EXCCODE_ASXD:

SXD?

 From what little documentation is present in Volume 1, ASXD appears to be for a 256-bit 
vector extension?


r~

