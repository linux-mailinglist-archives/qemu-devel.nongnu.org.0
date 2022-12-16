Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB064F215
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Gug-0004jW-AF; Fri, 16 Dec 2022 15:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Gua-0004er-Ug
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:02:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6GuZ-0002F7-Eh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:02:28 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso3456424pjh.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PEr1wgt3a4EQ/ZPVjKRDQGBKo4taa7Md5C5Wjb+gh2Q=;
 b=BnMN4ZuPo/UK3pUuBekliG6P8MYkGh7eFi6H+lasQ3RJocoisKMW0rFpcjsk/Yhcpv
 XvtHxKfpu0pocNQPeCAZA2tR9AZpiJXBcBFyDWzgis/QL/G/7dJSnXKq7RA0gpupXcop
 HstifL0/JVZRczf/l+OFdyhCOtYlHa72npfO904wk0MSUHkmjMwbmjgePw5mtOP5gmfy
 41X+CAqzOSsxCZqEjNXxlv+OYpcj7l/iUE8SweFuZ3nshxLfZMxbhhFEA4GCq03Nhrha
 DREMdxUyuWi7EDFexvb3wYBW2uMUp0Ki6FZP9iJf8trcBQAvVXaxBVvjVaV6qWvuOwGV
 u4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PEr1wgt3a4EQ/ZPVjKRDQGBKo4taa7Md5C5Wjb+gh2Q=;
 b=e+1vUPI3GG5dxdSCWlh8WfoXjHWfFX6pUxbqMISPiyJNw/zuLuoNEJx8cGFQxlIyfu
 kZBU1ymNswY1hyIIoQbjtAL2oO3WKSX3WBb4eI2mMsmR9VvWA6dTcXQdF/N9srr8EnJu
 CI2qtCqalHN1N01Ip3la+NihHH6GWNSOiJHEH6nO7qg80EWuZxDna1mF9k/aWGCyfeW7
 WpIAGTq1Rtap3HKaaAWRThf2a8fv1FK3wOhUF0l22cIPdij7AfkkjwPAx3sgORdpYngG
 ckdazwulY0S0W9dVlvbgpm2BUfUC63o2ticdlT39Icruq2IEsAtdniJKoH/s0D//Qq5u
 arbQ==
X-Gm-Message-State: ANoB5pk+E5k/KOl3j0bE/codB0mhxCrfIh6Anml8B94oRZgKQ1tmiasp
 fV+vo3a6OEPvK07Zbe++FmaxYQ==
X-Google-Smtp-Source: AA0mqf5bcQ1giVLh78x5+nguT21nLZOjX1m+E4xBxrNxS8E0wGBU4rZ+W3IdzzOO2bgclSM2XmVclA==
X-Received: by 2002:a05:6a20:1b18:b0:ac:29b4:11bc with SMTP id
 ch24-20020a056a201b1800b000ac29b411bcmr41257256pzb.21.1671220945050; 
 Fri, 16 Dec 2022 12:02:25 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a6558cd000000b004768ce9e4fasm1858544pgu.59.2022.12.16.12.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:02:24 -0800 (PST)
Message-ID: <6ab83d61-de28-090a-5317-976a6b3215eb@linaro.org>
Date: Fri, 16 Dec 2022 12:02:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 05/10] gdbstub: move GDBState to shared internals header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 12/16/22 03:22, Alex Bennée wrote:
> We are about to split softmmu and user mode helpers into different
> files. To facilitate this we will need to share access to the GDBState
> between those files.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 53 +++++++++++++++++++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c   | 47 ++--------------------------------------
>   2 files changed, 55 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

