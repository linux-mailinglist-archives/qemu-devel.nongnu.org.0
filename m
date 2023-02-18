Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8869B92F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 10:53:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTJse-0001C2-2P; Sat, 18 Feb 2023 04:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pTJsZ-0001BI-Uk
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 04:51:39 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pTJsY-0007IW-Dy
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 04:51:39 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-171a987211aso580920fac.6
 for <qemu-devel@nongnu.org>; Sat, 18 Feb 2023 01:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KJGljKpAzZ9pDnQYAaiKP6bVlTNvctCi0/Ntbbm3dS8=;
 b=dmV8tLMlDHO3hd7yeL2Ll2uLAGWYax8J8fFCrX4IXQE++Iz/WgQIBHDPhJfV3503u3
 GWBJaxMjiquaQ2957VQdGNV/uyqwRJjOW5Rbyok3iuuGn9hqSet+2AQA6+EtGRQZc76o
 ICLcpvB0kceEW8cJONPVfLIXUx3Lo3S+lyPRAPrPyOQuzeo6lrH0fZvZ4yCG4RZ5OaWk
 VpMOvzSvfXqXH3iw8xBGlUf8WBoHOys8PZHYGCmi01STA/vl2cP1bfr+2kjSgMqYqQ4l
 sVyvkteALJsyaVLvoTet6otqcXxoktl5qQcKggWi11uSwRYBp0/l2FMGVOO267D4wS9K
 rrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KJGljKpAzZ9pDnQYAaiKP6bVlTNvctCi0/Ntbbm3dS8=;
 b=Il3Xq+2Zu92/wI8SiKHKa5kU3WaWeY7PR5ccHQ8ZxrquYctYXUhj4WgsuZCo70Tx4f
 NS+wzmi6gzuCCCIf9XAaZBA4k8dYQDxWO1mon/dezp1sI4vmM3QRl9SCpzoLJHoiM95E
 dYefifS1DS2Q7psR0R2OgcpPfIO0aIVIWZCBBNeTWDi9PbU/mV3XJLc7lUBEvsfeI44u
 DVKAuPQgAXjfzpceGD4qwudelKUscq1DbgP48hERIPMeki3sv0UPQ1mi91Bo6TQYKLD+
 eKCTi1FPvuHNM55wcPUpAZ4XOw73Ww8Yr2Gw20D3x6EtB+zQ0PLCW9cO4rsHyvavzOK+
 TRBQ==
X-Gm-Message-State: AO0yUKXnG3wXsvxbu88T8pyJbQNsaVEjrLAFNIXBGBsRbc3LM6Z1izsx
 MvRjUnOxmHkCs7VB26lzLgQzSA==
X-Google-Smtp-Source: AK7set9g7jkV/RGlEm3cbkDkHu35/gt/SeBP9BX/aIw0DLlkGEI7xXD3Zto826I5UByGeQBVfj3TRg==
X-Received: by 2002:a05:6870:ac27:b0:16d:e7d4:4180 with SMTP id
 kw39-20020a056870ac2700b0016de7d44180mr2300113oab.29.1676713895756; 
 Sat, 18 Feb 2023 01:51:35 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a4adccc000000b0051a669290e8sm2825165oou.5.2023.02.18.01.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 01:51:35 -0800 (PST)
Message-ID: <2e2a5291-9613-e332-bcb9-65e5ad1c377d@ventanamicro.com>
Date: Sat, 18 Feb 2023 06:51:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
 <20230215205911.695745-4-dbarboza@ventanamicro.com>
 <80575b72-65f7-e5ea-c6e1-558efbe4052a@linaro.org>
 <8cd954be-7ac3-57f7-f9e8-8d4bd02a07de@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <8cd954be-7ac3-57f7-f9e8-8d4bd02a07de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/15/23 19:18, Richard Henderson wrote:
> On 2/15/23 12:13, Richard Henderson wrote:
>>      ret = probe_access_flags(env, address, MMU_DATA_LOAD, mmu_idx, true, &phost, ra);
>>      if (ret != TLB_INVALID_MASK) {
>>          /* Success: readable */
>>          return;
>>      }
> ...
>> At which point the new probe_acccess_range_flags is not needed.
> 
> Oh, I get it, the range is required for PMP, for sub-page range checks.
> 
> I wonder how tedious it would be to adjust all callers, rather than inventing yet another interface...

I took a look at the amount of tediousness involved. It's feasible to do if we
want to add a 'size' param in probe_access_flags() - existing callers would
use size = 0, RISC-V can use the appropriate size.


I'll see if I can pull it off and send it as an alternative in the next
version.


Thanks,


Daniel

> 
> 
> r~

