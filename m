Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A826AB1E1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:33:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYu6G-0000En-6S; Sun, 05 Mar 2023 14:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu6E-0000Ec-G0
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:32:50 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu6D-0002mM-2Z
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:32:50 -0500
Received: by mail-pf1-x431.google.com with SMTP id c10so4425966pfv.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678044767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ge9gunyc77sjkagUqKo2spAnt1NMXtTIbsDZYvzCwSw=;
 b=EPNLW2Sy5BnBPT2yn7T2AfQeMZaOyvqfxRWiyjxFy61mALASJIbzuzxsfMyMde51Td
 Hoc7DQOGsVNfr3J1kTJjqoD+5fhCPmbGnEPikCUoBjnkRuKiOdjkDf+eh0z50Kw+Da6o
 H2Dw/O++craGE8wCsPkP9AvM8OXnTEuDF4GRSKejnIIrvF+sdawwlEC4VDgVIVQyqxjP
 yg/y3A9UXjSWWzd5Scd47reboDZ9n/gt+xQU+k/dvLnxRUMrZ/Etj4f/wGkhucCjBY8d
 KiSW2yvPspu9yuYMHt9R8vgakpORh2oc6hEQj3sbUvq9ILcU6R5MOO24R/IPndKENhPH
 pYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678044767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ge9gunyc77sjkagUqKo2spAnt1NMXtTIbsDZYvzCwSw=;
 b=TzJ68rxLeaazGniguXtDDh+Fx2hTRvppzqeEHZBH7NvhT1qcdoZsgsa6lWw80ADCbA
 8ovwt9umbqbX645XlK1qeDk5V/FEP0zwNVX2QV6v/I0iyD0pu/BCpaUQ2FMOhmd9xoTF
 9P1Tpnp8iZLx/c0CSlOL+Yjxj6Bz/NBV8CG/OH94zY0yEMPLghdjZHFgr8KqAP3OoOdj
 PhS1ki1j0mq4yl5oY79uYQSlYtdL1Tp946fjfn2cgT+SPZlV/7ByIC5nRoPfTh71kzg+
 JNowVUIH8dUM8qy/pvT4YbPpWJxs35ulBozACxCZDnRMjaBximM1QL90mXSndgrpAv+X
 zIVA==
X-Gm-Message-State: AO0yUKVEIJl/AN3PICaQYJLjRvHRrUzyYWOoxP0I2Dz0RTbVOC/uJkfs
 /hbVS7BgsXVhjYhrPXN1Rfws1Q==
X-Google-Smtp-Source: AK7set9WOaMIZcALUJz/RWv2KbXkgf7zEk23hrEnrU6WxB2BBwlvn1RTU0oR9t4K7OjZz4fYGRl+Wg==
X-Received: by 2002:a62:7982:0:b0:5a9:d676:ae58 with SMTP id
 u124-20020a627982000000b005a9d676ae58mr10330171pfc.13.1678044766827; 
 Sun, 05 Mar 2023 11:32:46 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm5052909pfh.140.2023.03.05.11.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:32:46 -0800 (PST)
Message-ID: <e4fedfc2-9e72-dfe6-13ae-db9201c044cf@linaro.org>
Date: Sun, 5 Mar 2023 11:32:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/8] aio-wait: switch to smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 3/3/23 09:19, Paolo Bonzini wrote:
> The barrier comes after an atomic increment, so it is enough to use
> smp_mb__after_rmw(); this avoids a double barrier on x86 systems.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   include/block/aio-wait.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

