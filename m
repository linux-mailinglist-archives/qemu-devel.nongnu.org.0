Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775A6CAC65
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:55:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgr2j-0004TT-Jb; Mon, 27 Mar 2023 13:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgr2g-0004TD-8n
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:54:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgr2e-0000OD-J9
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:54:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id x15so8409325pjk.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679939635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jB+Fi+uESsobjFWv6EH/BpI/wg0l+X1FO8+LJpv6DW8=;
 b=CxTFdfx3tE+vAIz+ej5CZO0ycBe9XDV+j3H7ZgDt64UZgdgxzKm3YlVm2vCeWFccge
 qbQIZ++XTcqQP5ertKCdri6H8tXlpWd8nWH3rceHIeH3mJiXbNCteEZWyp3BcJSBW6/9
 PJ/K09L0CZAVfq1L32ZT5j+eJ8l1SSdmEZNAo9dyHpmcKIfCUOjQzJV5jmtcaSGk1Cl6
 rXTImkSp5PC0w9iCnf8mqWp/DP9dOd3mHHuWElfNV46TzAbEhKA3m9onwR/jn/C6TBPg
 Zb+Z64PatTBCBkXLeFkbBtyYnN9vCdfeiQUyxJEMcnmpYPNFcwxmyzM1hvoHvsubDCb6
 WUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679939635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jB+Fi+uESsobjFWv6EH/BpI/wg0l+X1FO8+LJpv6DW8=;
 b=vbqbBcNwcJaReMzwS/SyujKHkq85GHG/yOjDZ4qdhbJM3qb6oQ4+MNZ+VRSgvTnsI/
 JEoF94OjUb/cJ7aT6vF4NSWfzqWOi5y1l1oQ+Pu5iEb655/wjqO64f4omf7tSEg3v5S+
 NvEGJ9IkA+keqmM4hKtJzWMUW2a248Fj5kGZxqkkm1XaUTqfFxXM5V6IdNBbWymxmH0f
 mqyo6mt0bod5xCFxSC5SKReCaKOaPRIz38Xwu6euhO4Mp00QXk3bkRFGTD7JsfjkXN/q
 V4TkFBep1RCJ7FktgDs37EtGQVcmPAFfOYY6aA0t8dKR3KG0iDdEehkQMaWHnIzc7Rjj
 agmg==
X-Gm-Message-State: AO0yUKX6axoIlFPi//mTkgPoAfhw00YxNXUDVPZ8c7ADJf+Cb5evJjNI
 FzXLUkanSM5zRzsa7jozh0nq8Q==
X-Google-Smtp-Source: AK7set/IKYLoiNRwxYK2s1x/DqhuEMzXlj0fjcewRoVWPUDZMWgDBLgrIwDKOyXQ4eEa9BxC32F3+g==
X-Received: by 2002:a05:6a20:671f:b0:d8:f312:b3b with SMTP id
 q31-20020a056a20671f00b000d8f3120b3bmr11011164pzh.3.1679939635264; 
 Mon, 27 Mar 2023 10:53:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a62e503000000b0062d1b2fd5e4sm4236614pff.12.2023.03.27.10.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 10:53:54 -0700 (PDT)
Message-ID: <e9800fd5-d822-66c6-e336-02b2dabdb0ed@linaro.org>
Date: Mon, 27 Mar 2023 10:53:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] linux-user/mips: Use P5600 as default CPU to run
 NaN2008 ELF binaries
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: YunQiang Su <yunqiang.su@cipunited.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jue Wang
 <jue.wang@oss.cipunited.com>, Laurent Vivier <laurent@vivier.eu>
References: <20230327162444.388-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327162444.388-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/27/23 09:24, Philippe Mathieu-Daudé wrote:
> Per the release 6.06 revision history:
> 
>   5.03 August 21, 2013
> 
>   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
>     Descriptions” were optional in release 3 and could be R/W,
>     but as of release 5 are required, read-only, and preset by
>     hardware.
> 
> The P5600 core implements the release 5, and has the ABS2008
> and NAN2008 bits set in CP1_fcr31. Therefore it is able to run
> ELF binaries compiled with EF_MIPS_NAN2008, such the CIP United
> Debian NaN2008 distribution:
> http://repo.oss.cipunited.com/mipsel-nan2008/README.txt
> 
> In order to run such compiled binaries, select by default the
> P5600 core when the ELF 'MIPS_NAN2008' flag is set.
> 
> Reported-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   linux-user/mips/target_elf.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

