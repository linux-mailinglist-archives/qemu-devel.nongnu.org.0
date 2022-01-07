Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35B486E98
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:20:17 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5czQ-0008KT-BB
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cxH-0006jS-Qk
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:18:03 -0500
Received: from [2607:f8b0:4864:20::536] (port=46636
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cxG-00046G-Ae
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:18:03 -0500
Received: by mail-pg1-x536.google.com with SMTP id i8so3974445pgt.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/4otum0EcPD7/zXhHyUY7QmwN9HdtAwjzyk3tG4GLqk=;
 b=wu1+Zhqxr60dusNkKUMKVgUeT/2zMYiofU7rSXGJ9Wn59Ynro/Q1QoDASstLXBOSq6
 Lxmg+qMA0PI7vB0xJ0cm3VlLWMqOkLcYuaVDz1oqKCh4VdTmdVhAKySf6LLAfofAvzZ/
 dTBgFtBQuiwUg7XSfJnygv8VVQgLsoVEs7ET8upNSevmMRuvDb1Z/12LafspYLOcGzET
 cMii5jrVsCWXgHPFeSmvTRjRJ4xwWeJh5ubcQInxsSlT7Z+Yq9Ehj71lypo9uo5AZjHh
 zyFHWcpyZDA7IIuYlYORoGrJdlkTkLHwHf+tLYPwz+7WqjFhB3czfRL6rsuYq3Ra1bty
 Gr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/4otum0EcPD7/zXhHyUY7QmwN9HdtAwjzyk3tG4GLqk=;
 b=vQKntTfV6SGDKcv9eaF1mGverZIQ1AdJnXF31SnNV74f7fSbvGoxQUJo/6nRTpVF1u
 NSz7sepaR6iAGUTe8sWi9tyHP21QlyEAv27G8+KcjVwqdbZA7saVjVQgTUYuBMoJfcpO
 Fy8FOkPi31LJPbYJ5iNQ3PVeMMeke+q+NSv6imEhwX7qDuft2X/Ljp2tDwZ8Z+ZixP6W
 iOprr8qD1J4TF0C9RSbG57/aLFNAqahoo3NwPISrYADRIPgQ78Seqokq5RnyrLUpFGvT
 WH5hXzF69+7RnVKyFg74EA5DNSB1LQSw6ztC+o8gpOVs3UcBcm6xzpGMZz0JTosmPXxR
 dynw==
X-Gm-Message-State: AOAM532MmCrvjR/Y/kFe5dUQdSo9Z1Eb7TNOwFJWX4MDpCSGTmICBZv3
 KtbXguTt8YN9MzAoGW0y45U/bw==
X-Google-Smtp-Source: ABdhPJw3yzxTYJ8q/Fmngmzi8L3HQBV2w5on4Jyy4oRDTb62ZOAcOf+dvrUPMT1UytvzE0/O+cscEQ==
X-Received: by 2002:a63:da17:: with SMTP id c23mr55737713pgh.622.1641514680716; 
 Thu, 06 Jan 2022 16:18:00 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nk13sm3359646pjb.36.2022.01.06.16.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:18:00 -0800 (PST)
Subject: Re: [PATCH v2 1/9] hw/nvram: Restrict stub to sysemu and tools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62eee9e9-62bf-039d-8bc5-c12c0d8468b6@linaro.org>
Date: Thu, 6 Jan 2022 16:17:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> +if have_system or have_tools
...
>   if have_system
> +  stub_ss.add(files('fw_cfg.c'))

Disconnect in tests?


r~

