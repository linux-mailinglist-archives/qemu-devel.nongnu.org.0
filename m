Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0116FDEB5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:39:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk0i-0001MM-Ic; Wed, 10 May 2023 09:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwk0g-0001LK-0L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:37:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwk0a-0007Qt-Tr
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:37:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso6649485e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683725850; x=1686317850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oummakdpvRbRyfvxuVd+/yvTXrzODgYe196B5bKJgP4=;
 b=l/mctf37bGAY7HIAoXnUrOrbD6jJsiYE3Mc6QvgT/uNRUfz/8J0Fo6gYrN8odnX8ln
 qjl1zxOBkVfs6C5nIhQ1kOW2qwAE14aaRiA1N9vx8Z/bouvIHlvGgm8l7HteJHgraEB2
 BOKPGORfYTDcZaQ0/TzFFU+gInDZiOzFoydEDQcAXahduodxRo2cUrLX39RiQkd0jpc7
 ssO7zhOUPMfboA44PfFXc4UjLhDojIodN06xJYg59Z8SEuSiYQG4ciFWMI5htRzu4XpF
 YQiLeL1SYkijR/sCwNA5w4ewdUmEL5p63zFDBfPvDsKBWKB+q1P4cuYznQ6GpLtmR2MP
 mFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683725850; x=1686317850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oummakdpvRbRyfvxuVd+/yvTXrzODgYe196B5bKJgP4=;
 b=ONNfwOO8qRuvxP8ik9hM0cddiH3Px+PzwFVDCHxRLTsGuyGYSY0tZi+iLBgVWMosOg
 r0w2OJr3R/tFze8a1ijzLsqlgynKkodziX0PFmjaQxd0Q3uhsWR7IA5AwCmykuxEsKaf
 b5c+aBsSXlKWMcjFUVNPZBKW0Psds6/LSK0n0x21yTNmOhwZyDGM2QwODbEhnUBM0ItU
 gzqeQZLMMQ7ClOzah3Zm1eKmpHIEbp3QJMmese31v4ugu8TXUSJXf5Qo9Ask5DsbeDKa
 7omcSs0EzPHcFPiS5g/RDVmqA0IDcdqhYtCBgZfdmCJ4yh6r/dlQT9h4+cn8s/aLh6++
 bgKg==
X-Gm-Message-State: AC+VfDwSuS+ghes8X8ozc9w2CKqEywupd7hsCUCYyHNvRwRUS9PNjQa/
 EtijgmA8DAf5zzg0rsvntsDrhw==
X-Google-Smtp-Source: ACHHUZ4hvjMmWd8nfegIpHaLrJEPQ3IkakBTIWpo+3RT/ABFvKKd4tXrEc5dYlrBsAa6RFpAFQCMEw==
X-Received: by 2002:a7b:cbda:0:b0:3f4:2415:617c with SMTP id
 n26-20020a7bcbda000000b003f42415617cmr7367599wmi.6.1683725850616; 
 Wed, 10 May 2023 06:37:30 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003e91b9a92c9sm22802307wmc.24.2023.05.10.06.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 06:37:30 -0700 (PDT)
Message-ID: <e50854fa-ff07-8b35-6caf-1edc6f165cbc@linaro.org>
Date: Wed, 10 May 2023 15:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 08/16] target/mips: Use MO_ALIGN instead of 0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230502160846.1289975-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/5/23 18:08, Richard Henderson wrote:
> The opposite of MO_UNALN is MO_ALIGN.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


