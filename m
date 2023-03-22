Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C06C4149
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:50:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepTu-0002nF-GD; Tue, 21 Mar 2023 23:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepTs-0002mw-DV
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:49:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepTq-0002GT-Ky
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:49:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso172203pjc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679456981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5d69GtTMVS+cZe/uwfPN/3VbnW3PM5V5GZDNlTJQjUM=;
 b=scwU+YW+MCEk/I0CnYu/pU7e5Ozix6fC6pwOgMvdypmV7xVEH6um/40qM+k1SxpGU2
 1Q1dJ0jfQiiTXmN45LW48rSGqBkvRbySc+tURqnVdaf5B6OAZWFijuenyEG+gBGacS/p
 Qp/t+xcqHRdFiSN4DUFf8iuNteU6m+8YBcAJ0v8UgcXaBepWM7l6J8sJIRvhp4KK/zpW
 VNEs57h8Q/0M1CcTKKoPbYD9AGAs+40oUKhua1QIkCmBjEvR+ZlOOO92LmTZsz18qwi2
 WSdFHI6Co6sSEOVBBudqJl6+yMrUKlmCIB28NTfVltI/lKhSwS6Wc8wrlgXSMUyCAAPX
 AFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679456981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5d69GtTMVS+cZe/uwfPN/3VbnW3PM5V5GZDNlTJQjUM=;
 b=QJ8XSHujmw9FZxJxH2RBk2HhULubftQvb+7OtEcuZTR5MnGXZk+f9RevnY+qMkb5nW
 DZR9p36ls2xBQix6RonlIY4CSG6mYXzlidl5AuSTsAk8tMrPDX20aUXY01n/i8nrdwta
 zh61EABf9WtZ/kWP/hlg53883QDVNYGiYOEiVrU8aO1NhIjXW6ojTaFcTxjpHch/bydu
 9L3DJO1TKN7BTZqHJPWd5O8Cl6+6vdPNyQbz7Qo2Hw0uhyhFUDC0oMaUJix+kZvevc+a
 wYy3Al5qCYO22cmocuhFj7cd1OBWE999d0PimV/GOlNP127FqMVubnTlzEc+xUiZTPnK
 pgFw==
X-Gm-Message-State: AO0yUKWw4KEc7HJGvXJWV7RrVm0wiv9hNvNSSSAHpcaqCudhOtDo2LoM
 2pGtzHqBxMKeeO7rKkyg8kV03RDojgyS9gTqVNo=
X-Google-Smtp-Source: AK7set8V+c5St5uw6B0muqaPAhy5zuymUjic8Q/ZemWq/X21K6j5pD3WEckHrwZSwBjLmEcOybBTlg==
X-Received: by 2002:a17:90a:359:b0:23c:fb54:95d5 with SMTP id
 25-20020a17090a035900b0023cfb5495d5mr1781405pjf.41.1679456981137; 
 Tue, 21 Mar 2023 20:49:41 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 u10-20020a170902a60a00b00192fe452e17sm9497935plq.162.2023.03.21.20.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 20:49:40 -0700 (PDT)
Message-ID: <5ee84a26-ddc7-2ecb-66f1-20adc34bd214@linaro.org>
Date: Tue, 21 Mar 2023 20:49:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 3/3] target/ppc: Fix helper_pminsn() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-4-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321083322.663561-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 3/21/23 01:33, Cédric Le Goater wrote:
> From: Cédric Le Goater<clg@redhat.com>
> 
> GCC13 reports an error:
> 
> ../target/ppc/excp_helper.c:2625:6: error: conflicting types for ‘helper_pminsn’ due to enum/integer mismatch; have ‘void(CPUPPCState *, powerpc_pm_insn_t)’ {aka ‘void(struct CPUArchState *, powerpc_pm_insn_t)’} [-Werror=enum-int-mismatch]
>   2625 | void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>        |      ^~~~~~~~~~~~~
> In file included from /home/legoater/work/qemu/qemu.git/include/qemu/osdep.h:49,
>                   from ../target/ppc/excp_helper.c:19:
> /home/legoater/work/qemu/qemu.git/include/exec/helper-head.h:23:27: note: previous declaration of ‘helper_pminsn’ with type ‘void(CPUArchState *, uint32_t)’ {aka ‘void(CPUArchState *, unsigned int)’}
>     23 | #define HELPER(name) glue(helper_, name)
>        |                           ^~~~~~~
> 
> Cc: Daniel Henrique Barboza<danielhb413@gmail.com>
> Fixes: 7778a575c7 ("ppc: Add P7/P8 Power Management instructions")
> Signed-off-by: Cédric Le Goater<clg@redhat.com>
> ---
>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

