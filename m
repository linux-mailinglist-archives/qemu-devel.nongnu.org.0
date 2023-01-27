Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368AB67F17A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXav-0003zC-Dm; Fri, 27 Jan 2023 17:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXas-0003yh-RC
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:53:14 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXaq-0002MV-KM
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:53:14 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso6082987pjp.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cWDQ+EvdrIVmHeJgZi1GXJGCd+8N/juTDQ8k0ptQDdU=;
 b=tGlT934AHy+KavrWH2RGh77Q+okIaw0pKKVaiaVs7Kg8uZYYvkirfF8k/5VnvIZeKG
 uBRN/Z52CU9EITG0tH4BJQmP2IXHSgm9dmy2Oxf78MJQHWb9eZfdAYV51rUC/EgXaMFb
 eu+v9xkN9qRKxVo6KK+Cz5Lb74YStpqpA3sj9/gT42SbgysARgQfJe3dTgeH66NeCrG5
 oTmBL1O8VQycLMPOv1gM05SlJQ1WLJdHyRasmV2d29GYYNitEN6pjw2BuqJ9bN7Z0QW0
 gdT0g/SrrqQjWlDHR1qQv9/jsQk072DLodqaaO4QQdc2jdu1VVeBAEqR0J7lghUrjXhE
 7mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWDQ+EvdrIVmHeJgZi1GXJGCd+8N/juTDQ8k0ptQDdU=;
 b=OFAv9eaBS2xfdprcJn4jPmPycEIWhxLZyPaOztNhdO+S0CVTJVGuCHrgE6wPIylGwx
 cmbB7D1xGa9LcN2ObfTib9WFqZWEgcVD4XQUNRGRX1xvi2sDM+sbAQDFZXMpl6FjUMVL
 J3OaRb0GLHKq36VDtYsOxCkBHDXRc1TDg77NlY4C8KWBt6axpOVqXj3O73zhwEiynz7V
 Z+B+4V+0UI24kPD1R36DEXcoSnkirRi/QKr6IEUGYWurDTmV3o215nOnXwF9BGbmqMNV
 LaDY9+qhsNZnvuBcn2WVNi3ogECGbhzrV/QbnHXUoa7nlgqutVdVaO8vmQxzDeZJZ2/Q
 K/FQ==
X-Gm-Message-State: AO0yUKWQC52VOXPh9Ry//50Z9iNRClycgJ9rOLk9BPimfD1Go4Hbp4S5
 S7BzluwmcbuVf/AbfzWcMxs3FQ==
X-Google-Smtp-Source: AK7set93MTiiNrvEDbgRKj0xfUw8nlEkHeUm81azqmhPr/6YAbGNgNF+Vy92pQcvYRo3FkuVcFjumQ==
X-Received: by 2002:a17:90a:31c:b0:22c:5f4f:48f with SMTP id
 28-20020a17090a031c00b0022c5f4f048fmr1439662pje.13.1674859990792; 
 Fri, 27 Jan 2023 14:53:10 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l11-20020a17090a384b00b00226369149cesm5516527pjf.21.2023.01.27.14.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:53:09 -0800 (PST)
Message-ID: <26fe8c13-2615-b894-d2ea-674b10076870@linaro.org>
Date: Fri, 27 Jan 2023 12:53:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] linux-user: Fix /proc/cpuinfo output for hppa
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <Y6ywbxuxqQ/cGPJW@p100>
 <b645585a-1093-fb97-60a1-5acc40b17271@vivier.eu> <Y9QvyRSq1I1k5/JW@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9QvyRSq1I1k5/JW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 10:10, Helge Deller wrote:
> The hppa architectures provides an own output for the emulated
> /proc/cpuinfo file.
> 
> Some userspace applications count (even if that's not the recommended
> way) the number of lines which start with "processor:" and assume that
> this number then reflects the number of online CPUs. Since those 3
> architectures don't provide any such line, applications may assume "0"
> CPUs.  One such issue can be seen in debian bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653
> 
> Avoid such issues by adding a "processor:" line for each of the online
> CPUs.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

