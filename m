Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E766C507988
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:59:27 +0200 (CEST)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngt4P-0004T1-K1
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsyK-0005RN-Lp
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:53:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsyG-0003z8-V9
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:53:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id q3so16674394plg.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jOtZbivsRzdxyRjC+77W+3mA4JKVaVFDMiHNSTd2Z5I=;
 b=HLsMINqXS02q4ID7RFs3g5iygKgFQwryrFiZx/+SlLbAfFPsIKVUircAl4g9aAA4Ub
 bP0jGRIsaoCLzO9X/3GMeUomGOSoQhfZrJg3/NTCmreyWQnT5v8ZNHEasm4Mod9t4fAq
 BSdD9RKq8HYT99iGcDoRaOoV3TPNHyGKTrMI4QPZpcln9OH+HaXNgMmbQwqSaVbA3bo/
 R5IlQ/qVsfL8XRQ1UHtB+9EgYogfYdgTQNnV1rAca5jVYa1lQZ18r+8k5td5Wq8WKk3X
 vjZjCjJLtWEDQRt4wzdCrA3Ak6G+Q2H8VWNlQsE13G+N3Osr1oEk+EKbljfEf2SA3V5R
 Lcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOtZbivsRzdxyRjC+77W+3mA4JKVaVFDMiHNSTd2Z5I=;
 b=o6OxZgXc1AefbKHPVCDO4tDKerbdGbkoA6Uk2W8/IWiKf267DjvM6QFv7EAbDxdztY
 /SNKlX6btJk+mkbH0T3R7HWpyG8sR4GWf3wiDH+Z/4cFDlCZuSpIRbhv68c5vQyAJlye
 ybShGFDJ+4l4JLVXrW5BYDzbn/urkke9OevvkGCwqSRGwPhyuMwHez3gslmoDS+j01+H
 pZYu/CqCAU+Vq8gDaFfnZxuob+HPpdNdxEsowZgp6c1ryizZP8/qR/UxuAVdN8msqgEP
 82s/w3XHeVgyhZ4kpfajXYulTzFc6x8MEqfWA22R4veV/5q1OxAvefJoGgm2qKL17fNM
 wqmA==
X-Gm-Message-State: AOAM533y7Cp/LxW6XjyZ1jy/nkVtLp6C4EELX3MMepJsvJbnyj0NF6kI
 R6CCdIspO63gxMy7YV1HEZ6Yow==
X-Google-Smtp-Source: ABdhPJyIX1YOZaJjrHm+OMzUMM4nDG8LujsySEPg6++S9W1OeKs3GsDGR52f9n6wNSS1Ke8Pb/RxPw==
X-Received: by 2002:a17:903:1105:b0:156:3e9d:bb7b with SMTP id
 n5-20020a170903110500b001563e9dbb7bmr16933594plh.136.1650394383528; 
 Tue, 19 Apr 2022 11:53:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a624e43000000b005081ec7d679sm16998536pfb.1.2022.04.19.11.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:53:03 -0700 (PDT)
Message-ID: <b1d98aa0-108c-8d73-da57-f2eded63c704@linaro.org>
Date: Tue, 19 Apr 2022 11:53:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 14/25] tests/tcg: remove CONFIG_USER_ONLY from
 config-target.mak
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Just check the target name instead.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-12-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target |  8 ++++----
>   tests/tcg/configure.sh    | 12 +++---------
>   2 files changed, 7 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

