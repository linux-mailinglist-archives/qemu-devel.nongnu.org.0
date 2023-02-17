Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D826D69B223
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:59:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT50a-0008Rx-CT; Fri, 17 Feb 2023 12:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT50Y-0008QH-Da
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:58:54 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT50W-00035h-SF
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:58:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 fh15-20020a17090b034f00b0023127b2d602so2142583pjb.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0AVDKGqUneVwaX617wmIgTEGGcv3X1RxiQPvq0Gql40=;
 b=mqTE/wG25k6dR7TDqwAVZgKkvSDWT810sqYOyht6E49eq905uNLkjaX7gbfrc2ew2d
 +/iBt6VRX0CRQuu6TnV6XCgmw0MZUb03R/c8bP8eBdOxFqPWEsKUXbbJs8M/ixPMnNdN
 WXu+mXxgzts1V70083uoAKnLYeha5BP1+t9sksGXksKhHihxdvItMFJ/pIs/3XMbmYsS
 8u4MU6t5LULLBXh2DOOvBri1MOcbIwCSa7rcalyX2OjYC70RL5RJ4s0lK5wLVT5iHQvi
 85oz3sXLBoRLCx1NXFxfXUGofVCC6jGsNVDYclhsXRNDCGCV/H0zjwsKocUkRrZ+F81W
 3iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0AVDKGqUneVwaX617wmIgTEGGcv3X1RxiQPvq0Gql40=;
 b=mMA/aCLfjhuL2VZseoPktBrqr3fiq9lArWyLoJyz9aQWjsSRUM6utigXwEdaCg5PZG
 IRq2gJfHctQZP3xfUSl1FVioocyKjp9JQFm/eyH9vkNdM8Exxa5Ae1egzHuf3uylAPV/
 sJLlfhl3AWx7XCY01lGTCbMaIClJLMO4qFF25cBd0f+NozxiG2ydvy8APYecUrBQNnvX
 bhxnwelibJmSDyDKXgs2rw7CuZ4efFsWRK2CwyNpypSoAKYXWgO8a0FPDP4T5/b8qRhG
 +w0Vd4CNszxqV8C0rlrRJ3xei5VMRM/8bCyODztaSz4Jyr0rewLExGp4ZSppleF9nyfy
 5qCA==
X-Gm-Message-State: AO0yUKXTDrNU1T/JQ382nVD6/+XvzBxsSYDVIgNg8P7mRQCIt6GUuGas
 XCoDvnUTOXUMBcIKM50Z71zIYQ==
X-Google-Smtp-Source: AK7set/gZZ9e4KOQNsWL4QxysNe06bgw6nhZOXpNDDeCjQ15E2ZQ5xbw9Z6LP3nO2wy46vPRdpiKMA==
X-Received: by 2002:a17:902:e84e:b0:19a:7758:e5e6 with SMTP id
 t14-20020a170902e84e00b0019a7758e5e6mr650946plg.48.1676656731219; 
 Fri, 17 Feb 2023 09:58:51 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 j10-20020a170902c3ca00b0019a777ff433sm3438358plj.17.2023.02.17.09.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:58:50 -0800 (PST)
Message-ID: <609eead8-8e51-ee43-f50a-eedabc72b72a@linaro.org>
Date: Fri, 17 Feb 2023 07:58:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217141832.24777-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 04:18, Philippe Mathieu-Daudé wrote:
> "hw/ptimer.h" API is mostly used by timer / watchdog device
> models. Since the SoC / machines only access the ptimer via
> reference, they don't need its definition: the declartion is
> enough.
> 
> On order to reduce the inclusion on the source files,
> forward-declare 'ptimer_state' in "qemu/typedefs.h".
> Use the typedef in few place instead of the structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> "30 files changed"... but since this is trivial, there is
> no point in splitting per subsystem IMO.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

