Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657043AEA55
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:49:22 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKIj-0007sj-Ff
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKHQ-0006ru-5y
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:48:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKHM-0007vc-Eo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:47:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id 69so8590828plc.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aknpEFx2/DOmI+TX3Jl8yx5RCqgfBO/RaBGjb4D4VTA=;
 b=fIVmS4RGjms228fqFg5sI+tACoDBcEci+/8ZnXHszVWoUahVic0uI/t2Fhigq1OrMw
 +tPACSuwHaHGXv1VhulHyMCVvdtBpXsiXxJRxbzJXOgbCHVs5EpIGznpyZveheqhEiRd
 qAnYknEvHMLlMfPIeWPSH3mhZecIW4f/7rRjmFSxPE5QhgvF4lhm6+/xdzPJ3QnZrNmI
 PoomrAPIxTnN8JRkha8W4bXp593148WbigE1xP/dY6Y9uZ3zrfX/fvIayMDBj/lCCHwk
 mJDOIuXuj4NWMADHRDKJlXu+AqGHDGefMALK0a0ijxG257PqpidBsNfZyvO8f4Nu+WjZ
 vI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aknpEFx2/DOmI+TX3Jl8yx5RCqgfBO/RaBGjb4D4VTA=;
 b=LoFw9yBkHUxfEbAgV7S+V1noXWHG5xuJstxawd/83stkYLhHwgLwZpspoztVpO4TEg
 JaW3BQka6xkMHJ0lOJl5RUVOCjXN7rrczkwFa3pKH039zsrQRKQTcrI+gDyOL7ob2/5m
 U/0WsjOZb/zeb3/gU98LNKi756dpRZ3ggA45DrdhtHHFkQRHVz/aq2Dx4zgAoaDJadzu
 TQ5B0j697E4aGw/hut8xpD95iwQ/zk9jynyPD1H2h5Atyfp+GvjPY3Un1X9z4S4nzcM5
 pVWdcQ4I/+RuphdvlscSE1V+dGVCTBib8+4c9MgzT7czV/gZHqf4Yme3yGfJeGFiCasw
 +jlQ==
X-Gm-Message-State: AOAM530tfOD8BJwI/IZYwZknQYIZ7HE7m4VoQpjoki6vUb+3But9nhSg
 OIT00yWGjErxSRaNvqReR2P50w==
X-Google-Smtp-Source: ABdhPJzeK24tIg7fvggxtI71jSLHsPCoff2Q9L4Qp+haIzxCCIislSeeN2vqBghCeFZGavxHm1XkbA==
X-Received: by 2002:a17:90a:5d92:: with SMTP id
 t18mr23700827pji.186.1624283274799; 
 Mon, 21 Jun 2021 06:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v69sm10024288pfc.18.2021.06.21.06.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 06:47:54 -0700 (PDT)
Subject: Re: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-2-richard.henderson@linaro.org>
 <d0f44918-da3f-60a2-d07c-1fde60b445d5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b8a349b-35ec-ee63-175f-6182ae8d58d1@linaro.org>
Date: Mon, 21 Jun 2021 06:47:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d0f44918-da3f-60a2-d07c-1fde60b445d5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 5:50 AM, Philippe Mathieu-Daudé wrote:
> I notice various targets do:
> 
> #ifdef CONFIG_USER_ONLY
>         return true;
> #else
> 
>> +    /* Check for the dest on the same page as the start of the TB.  */
>> +    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
> #endif
> 
>> +}
> Is that OK to remove this case? If so, it might be worth a comment
> somewhere.

I mentioned it in the cover letter.


r~

