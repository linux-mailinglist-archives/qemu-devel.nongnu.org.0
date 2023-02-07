Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998368E43A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:10:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX6S-0002eR-Ec; Tue, 07 Feb 2023 18:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX6M-0002bN-Lb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:10:14 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX6K-0006VW-OH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:10:14 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w5so7299236plg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yW7AlBISalG9B0unzR7dsrdlUidqD5I857xFsauACZo=;
 b=YH3SOWuoPQQxl40uThnOxCZiTOirbUfoa/egAwFP2dB/qYCxUWbLp3k6Axm0wpNm/D
 LjS0KHKe1uBylOJzDJhQVddqIzLts6CoTg4kTjWpJxVlC4Enz5+YmguBUmqOPVWYFj9x
 WLSulu0GkkiLMuiW5o7Xlz9l8HUbVwdqsv2BxDImwSLdXZ0I3y7r+5vWMZtAPG4+ko3+
 njavsbPEUxfsKBMBC/yk9nsMg5drCysMh7HFLvA3YB0Ln8X59XZLbQGXifnFJhuGrtuc
 ++XUyqKMacdUEpuxbN45XqpueFccSe2OrJ2bQ6cxJRpJ0Pe+ozkYSMLwTnX0BAy6odBu
 e1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yW7AlBISalG9B0unzR7dsrdlUidqD5I857xFsauACZo=;
 b=ivE+KBk5l5eTddFgxm2ohivU9RGcMaSzAdVGrxVQmO+gW1G9bHb2Tpv8DhU8QbtJgh
 6cyU2oxsBDLwwj4PISWgI8/G1S1QVd2aqX4BGqIE7checf3E4M07M+o37kzglUycvUqU
 Ul2uYLpIHJtVXrTHQjta8YGu1rIltY0CFmw4XedgJE2clDuA3jmOvJ8DUS8EhFg1zAmi
 nLF1ijUesHCZOeZHDstfx+K+Xz/7CwHdDbM7ratpgmiNWNmRdxRYWGsNbb+7aknr15JG
 vCTfy5xGDfga158Ak2PiuG4+O02FQw7+3hyFhaA/DlLJ9RPAvpuHr1erN9GuE4wikWX+
 g26A==
X-Gm-Message-State: AO0yUKUn9/xBbEByLZ0Jl2P/PtziDbFwqhL8ZoRKTrpfifqFugORT5yV
 LqkG8BUlzY5zNzHbovDY90y63w==
X-Google-Smtp-Source: AK7set9Wwr4DFVHonStXvP/IwarILiQ8mLIjl+BpuAvd9TK8dKyRkO9u9S0B8ayvE8Gtbk49QjqsPA==
X-Received: by 2002:a17:90a:1901:b0:230:b976:42cc with SMTP id
 1-20020a17090a190100b00230b97642ccmr5978417pjg.16.1675811411283; 
 Tue, 07 Feb 2023 15:10:11 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q43-20020a17090a17ae00b0022be7a9e196sm95370pja.1.2023.02.07.15.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:10:10 -0800 (PST)
Message-ID: <9e40464b-9349-d9bf-7347-bc1bdf06ca93@linaro.org>
Date: Tue, 7 Feb 2023 13:10:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/11] target/arm: Restrict CPUARMState::nvic to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 12:35, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

