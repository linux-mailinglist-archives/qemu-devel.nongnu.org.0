Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8F6A1442
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLoI-0002r0-EW; Thu, 23 Feb 2023 19:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLoG-0002oA-8L
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:19:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLoE-0006V4-A1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:19:35 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i10so6100087plr.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7JRiclnGqGAdrNbsBR7z4ezjVJSG0UWXLx2KM2/FAw=;
 b=hb5U6Vu6S3R+PTwdKfBl0u6r6Pj6vgsZJ3yqYaKin/m52erFGbz5yL2tHs9gB4rW7Z
 9FydpALnKkQTAHNCzKpX37gWdMdVKffvi47BUx35ekkaRccMhIRWPbnNdBVRqPYoYqKR
 0ajC15OpjNjPzR499R5Vi/nhd4vuBAHHKKTTD8MB8KnTT5dGAB+e8Crm56lCEEv5Jvus
 +9oaoQOzAPQo5/+NyRR7ZRUQw25KCK0oZn6WD4jXbbJFl1mgYO/wO4Ok76mbW3aPzqlc
 r0VeEyctWzcXbBCf4U6QFuk4QviUk2hwhRxGZYuhuGYghtsVua+fRrsNP5ZMGK2c1yrP
 FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7JRiclnGqGAdrNbsBR7z4ezjVJSG0UWXLx2KM2/FAw=;
 b=x61XfRF6FEDV2pWuWrE83kB0l6yC4pzxzcuGYR2MbDeEO74qlajdOwJeTPhdD/cos/
 qvNfSAp0XUhOnrthCCHuxcu3GCNleiG4pqyJnHhjRKPkW10KU9agUIAS08CfvJcoPyJU
 E4Kb7YkqoMoWxwFR0jf753dF3MsuzpqjClSMvWUvuEcPaRSRqbVsUNkVirF9/4qelkVI
 OdhbmeQJoFfYTvTLj/6T/9DQZRCb0w3jBLe0w2LkQve39//IBdGdTY94tOW2+beWH2rN
 b9he9elqbMyI+2EZil9qMP9YbQRUT6+V4rz+3i3SAHUMS8JmZRQ9Oes42h8Zz1OKzXw3
 wThw==
X-Gm-Message-State: AO0yUKUHACwb14BXwTxMsFnsjZYePXby/DSyxzkOLPX01dSF/XFN1AbR
 oJqK8HenjLE3FVOFeT5ovBvdOQ==
X-Google-Smtp-Source: AK7set9v5az8rWqZ03hfnmVZSrqO9eW6Fq8FGZw69ez9lb5H02xcd92L2YlPwfWKtIjhkWi/yt/1JA==
X-Received: by 2002:a17:903:2344:b0:19b:98ce:490e with SMTP id
 c4-20020a170903234400b0019b98ce490emr16843595plh.45.1677197972636; 
 Thu, 23 Feb 2023 16:19:32 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170902821800b001947222676csm8174226pln.249.2023.02.23.16.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:19:32 -0800 (PST)
Message-ID: <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
Date: Thu, 23 Feb 2023 14:19:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> +    if (unlikely(flags & TLB_NOTDIRTY)) {
> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);

That '1' should be 'size'.  Fixed locally.


r~

