Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA7660727
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsPY-0002tO-Oj; Fri, 06 Jan 2023 14:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsPT-0002sy-UR
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:29:50 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsPP-0003MQ-LW
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:29:46 -0500
Received: by mail-pg1-x534.google.com with SMTP id 78so1798872pgb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35sNj5qat2kr3iMcMkqnrLNYU/fDQewnjcxWPyXqCw4=;
 b=NAGbJbD7vUJg5/IdrmYFDVRgv3oPPwuZbbtM9kxvL/NaQz3xLLyiT+vAOiJSosI8A7
 TrVYjCUqKXrnjhmAv819wIFmkPP6I4/tHCivWfn2/8wXM+MgcQo+Uaufbr5BouJiyfd9
 64v6Gb1jEwqKWic6WL2+Xx0CtvLjnAzN1LL8jV57cvuK0auZZdhz+K61yhLXTugEXrC1
 GoYPCLiHd2m6CJ7s0fyYS7vbMzNq17S7XG4w5/4LSnc50O7n73pAyXUdbomSrA/A6hQZ
 qipcLkvEDBZwPuKfipTdqssOMfWKVfLuGCLjLoWxOapKtKS4Xc/0DYWjPPHFH3bq7L0C
 XqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35sNj5qat2kr3iMcMkqnrLNYU/fDQewnjcxWPyXqCw4=;
 b=XB3706GeS6tNpq0oYEaucjRLdt6Oo8lq3f0EW0rk7ggx+Vvpfwyrac8wZKihVuhgDs
 MriSnXDkLbX01vPpfzsfed8kOBqPzUYYN6p6gEGIBdvxIjAjJu0fqjdr3nJ89Q+7zczX
 DXpObyOX8NcIJLK2QMCoFEX7fzAQ4otlxd+Cw6LLsSNagcZcisxDxAyKj9cRLJcas/H3
 CLCAtWcZvRvTxp/2a8QNO617cfKBgha8lsetL8hwpGOMPLh/bvwEzX8DrwBffGsjNm4q
 jullWVltMSuO+auE2xYKxe7eTJrSZYwbFO3RRCuM+iLJ+77LqM5oDWESrLEJpmA7J+Ka
 HS9g==
X-Gm-Message-State: AFqh2kqqa+QnerDOX49901NarvxFxAwD1g/DfHuebaLghuGIXGFxc4dC
 Qvstzc1pfcWaHCkxGt18oxc7GQ==
X-Google-Smtp-Source: AMrXdXtaulDro+PAxH3Iymt0wIOauchEEs7yIz+Vw/KsvgsJ4+BLb0EEWRDfoorpZy9FDQ7/LPCqCA==
X-Received: by 2002:a05:6a00:a1d:b0:581:73c4:f0bb with SMTP id
 p29-20020a056a000a1d00b0058173c4f0bbmr47385994pfh.2.1673033381829; 
 Fri, 06 Jan 2023 11:29:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 e188-20020a621ec5000000b0058200ef9caesm1481889pfe.39.2023.01.06.11.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 11:29:41 -0800 (PST)
Message-ID: <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
Date: Fri, 6 Jan 2023 11:29:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com,
 alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/6/23 11:12, Peter Maydell wrote:
> The trouble with this idea is that not all instances of the same
> class are actually necessarily the same. For instance, if you
> have a system with both (a) a Cortex-A53 with a PMU, and
> (b) a Cortex-A53 without a PMU, then they're both instances of
> the same class, but they shouldn't be sharing the coprocessor
> register hashtable because they don't have an identical set of
> system registers.
> 
> This kind of same-CPU-type-heterogenous-configuration system is
> not something we're currently using on A-profile, but we do have
> it for M-profile (the sse200 has a dual-core setup where only one
> of the CPUs has an FPU), so it's not totally outlandish.

Yes, I know.  See patch 29 where I moved the vfp and dsp properties off of the m-profile 
cpus and created new cpu classes instead, specifically for the sse220.

It's not scalable, I'll grant you, but it's hard to design for something we're not using. 
What we use now, apart from the sse200, are common properties set on the command-line.

If we were presented with the class properties early enough, we could create sub-classes 
with the desired properties before instantiating the objects that go with.

Anyway, it seems like we ought to have some solution that does not involve repeating the 
same id register finalization + cpregs hash table construction per cpu -- especially for 
user-only.


r~

