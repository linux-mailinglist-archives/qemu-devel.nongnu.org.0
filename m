Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866A686E9C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIP8-0007X9-Oy; Wed, 01 Feb 2023 14:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNIOw-0007WW-1N
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:04:10 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNIOu-0005Iv-Do
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:04:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id be8so19431333plb.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GRAxWz0MZIU+kaN2JYH4Qn6dTJjOa3Oqs7Mdv/P75Xg=;
 b=iMWg+2psDxxlUPPczjTtQsxRAQ9oBdW6xlYkCKWhToS+T8z0A9ILHPTCz3FNE+BY6Y
 BxHnJ6klhLut1FCodHsVpOAjAZNkfwGh45R70rzcXPkdT7VtwmJ2siMrnLiHfO0GdtFd
 a3MjqJCzh8nCzETinoigjMJu5ktOSWG+32Kb2u2efXfe5yyrJMGs8CoXV5EBLVijBODW
 SsFq7sCzTatKjRk4ddKuwNnIxRDiNUUCb7CQvs90Bsgz07yIuUaOo7wVMxTdU8cqFPe/
 vgfYD/34hr2/jSglwmxSWVh7+cj0cbj8NCStqMOP2PqDjdaRP/E9LFlVgVCjfq6JIzKG
 V3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GRAxWz0MZIU+kaN2JYH4Qn6dTJjOa3Oqs7Mdv/P75Xg=;
 b=lH3Gk8VMFNCvP7UcvwOaI50xMuAHn+TkYdsohMeTz5C3n/5zRRUL1hNQeKvMgZqJZW
 EPbnETiuEgWhLIZEAt+CwefrpDZPHPH3k+GNdSCaFhyoTPcKtsUFKGt6AauoJrgn+YcE
 n2c5IQYK0MnTnJHUNtnirPdZJag+Mu5EHBrLMcBhDrnlSP/ts0d+zHGvYeZtLZ9KeKeQ
 flY8DZKHwbUXdd2Y88QUrumpX2acvHpvMdjdMVVs2YUl032mP2p9eSruFvYem97II2Ee
 p+QoU9VK45G6QeNn5im9ZvMsWXXVp8U0txY+u7lAmPJOrrquwBSId31am+AjYRx6I1vx
 ds8Q==
X-Gm-Message-State: AO0yUKVsSyJ1XmtTKccJpte7sLxSKuADr5Sh3q/PB00Oa+yN8v4jJor7
 5K4AalGS9rvmnlnBk2z41Q7lSA==
X-Google-Smtp-Source: AK7set+PGDy6YPq6+rggKyNypiGJnnFnxfUmji2VHvrv2I3W+iUVkTmXSH1a1dGVMmWnTuRPD1/FNw==
X-Received: by 2002:a17:902:e205:b0:194:98ef:db00 with SMTP id
 u5-20020a170902e20500b0019498efdb00mr3342121plb.19.1675278237200; 
 Wed, 01 Feb 2023 11:03:57 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g8-20020a1709026b4800b0017fe9b038fdsm12070807plt.14.2023.02.01.11.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:03:56 -0800 (PST)
Message-ID: <ff52f5bc-9072-7db7-d5f0-e4cfee0cb527@linaro.org>
Date: Wed, 1 Feb 2023 09:03:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 15/36] tcg: Add guest load/store primitives for
 TCGv_i128
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-16-richard.henderson@linaro.org>
 <874js5u2pu.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <874js5u2pu.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 23:52, Alex Bennée wrote:
>> +    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_LE|MO_128));
> 
> Why not use validate_memop for this like elsewhere in cputlb?

validate_memop is going away; this patch was pulled forward from that.

> I'm confused because the TCG ops in this patch are still using i64  and
> the atomic use hasn't come in yet. Worth splitting the patch?

I'm confused about what sort of split you're suggesting.
The non-atomic use comes in with the very next patch in this series...


r~

