Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059A6987B6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 23:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSQ7B-0000hV-4t; Wed, 15 Feb 2023 17:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ78-0000hA-CL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:18:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSQ73-0002pL-M7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:18:56 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso3821552pjn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 14:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQiMECK4t5yoNxHQU0hkX0hBljzToLdE58Mqu/YTQy0=;
 b=KxEsuePV2NfTXPoJgrhqWYtmBw4LP60LiuZ/Gp/AaUFVt1lDLeah7ouwLcsZVAjBnj
 Ak3FqgxwiasGnwBNPhR0l4kck1mvnx3CAoSnqaEMJL3t+4nx9+DTsGOX+ADmFgxl4bfc
 L9Oio/6VYX5rDVpatAfApM4NFNtXRWzMTENjXNyvFl44XCoS/TW7JS+OnEtfybQigGHl
 m0IvUDh1Gte+qc8mSONvIN2Lu5pEGOaYGpRxTMW3XcHUFclb+Q7YJlhd+/C4q2FgKkU0
 icAAgdbWAXgX5U6gnNAukuQTDPdXxaM9QjfHiLJq2sTdAMun+XjRvUCPrnjWAlhlY8zz
 DRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQiMECK4t5yoNxHQU0hkX0hBljzToLdE58Mqu/YTQy0=;
 b=X8dQWvIQB6TwGaQQ+5wnt/pYjKqVboMQ+P+VTgvC46ocT8+pU15UCKS6gLGUn6UN+6
 i+OY50WAwin1v+bMSDR2y7E1pNPAkxTWL3Fy+9PJow3PRQ12zospzXfhu9v0ZOv1TqY0
 lMJe9tev69UDO459iUG2cs9lj9LVTtgIkp1jzp83Z5+W2WCBaxfoDKfm+EY7Z3nSYQWt
 5V/TCAjDOjV2l0wpvQPiB+oLyhr5BK9T0w9HGW7AVHK/Bs4TGTNDU08K/eHCAt9mKBAE
 5dePY6etwezzURL/m4j0AotqQXkA1pu5AI3iIBTdOap9guM2bJs2XvprxGHxzDIh4wmk
 JDlQ==
X-Gm-Message-State: AO0yUKWg2PU1nm6g/BA44aQ/7MxoqncA1rmnpe8XCujevuUXTmfysAu/
 6f2V3/v9pllzkYdgOwVuDb3PNQ==
X-Google-Smtp-Source: AK7set8sJ+0jb7WIlVZaDKq7yS3Qz6J1a8Z2BUe7luPXxFfBK/KS8e7ZXkVYC8/KfRSkOXqPIyKguQ==
X-Received: by 2002:a17:902:b10b:b0:19a:e7d7:485b with SMTP id
 q11-20020a170902b10b00b0019ae7d7485bmr180260plr.34.1676499525564; 
 Wed, 15 Feb 2023 14:18:45 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jm15-20020a17090304cf00b001994a0f3380sm12588688plb.265.2023.02.15.14.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 14:18:45 -0800 (PST)
Message-ID: <8cd954be-7ac3-57f7-f9e8-8d4bd02a07de@linaro.org>
Date: Wed, 15 Feb 2023 12:18:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
 <20230215205911.695745-4-dbarboza@ventanamicro.com>
 <80575b72-65f7-e5ea-c6e1-558efbe4052a@linaro.org>
In-Reply-To: <80575b72-65f7-e5ea-c6e1-558efbe4052a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 12:13, Richard Henderson wrote:
>      ret = probe_access_flags(env, address, MMU_DATA_LOAD, mmu_idx, true, &phost, ra);
>      if (ret != TLB_INVALID_MASK) {
>          /* Success: readable */
>          return;
>      }
...
> At which point the new probe_acccess_range_flags is not needed.

Oh, I get it, the range is required for PMP, for sub-page range checks.

I wonder how tedious it would be to adjust all callers, rather than inventing yet another 
interface...


r~

