Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E53B4CE1
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:46:54 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx19Z-0005Hy-D3
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx18S-0004P9-Ak
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:45:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx18Q-00005j-Fe
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:45:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6792912pjp.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2V+WOPATmoG1vqMTyG70hqTINAX4P2A/4G1ZIaYwpNQ=;
 b=gTHRIqpHZpPUh+mxq44qRblrVd1kUuxFAZYH8bD5w/aY8s1phwR4vwqIvsLGHzkuAP
 uaGiAdkByuWOb4T0q8HTwgzeeTO+v7hjwPGwAS0zabbk16HHDCc12ZfugCCnbYs+jtl1
 RslQFdjNL/0PeozUSL3oZfKEN3MHAwNVEPe+1VvGlQ+rjw+gnOwuQkbaYOMJKsDpMFkO
 yTdJr4wO1pBGvdb+xmu6baySMNHKXyJlBIGVURFVPb41gHCe+yyxVda9QBkviYw6Ky+9
 RTkNmtmYz0IcoqcgS+9SJ76KpaWl11reRCvaLtK31UZpAsIaKHsuclQBso8rAlAMLZF6
 oquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2V+WOPATmoG1vqMTyG70hqTINAX4P2A/4G1ZIaYwpNQ=;
 b=r/Y73M2yb7H6vxZIbvrgDOmKoaiv5lY1i1zqewO1skjunSi0EE0dhsf0aN/54HIX70
 gXNslS7QoqNnT9reEgA+pGVwVHtIy6BEipulylImqFqW0A1jw2PVJCeE062hNKExiKNv
 OXZCLmihZYdUDtzC6Z90qu5D6X0rt19r04hSmNz4/0R5dCi52xkIsz7Q96BNXwkhw30O
 oQC1yHgqGjW7hYn4esCnliWWUKw5sFP+gtFWt5GIjkUMhgHX4azmuXj8I4wCyY+0MQtZ
 eIs+nR0c1ml2mFQic4jJC8fVdPF51/mnzZ4CnfWADLoHQYL4kXFHpg5/3U7MQSJblBtX
 vkBg==
X-Gm-Message-State: AOAM532h5LrwmQbOsiaStksrKpmGv8TWtdDFlx7fO2dxhZFlR/uneKr+
 aYTrYR+26QxWDBmUAtxGtLAPtA==
X-Google-Smtp-Source: ABdhPJxdZQLBjd+oVYgU8I+xKLhXYi67CEtwiUpYg2ukvLOEl4b4tjaJJAOJkKzPvhVpXPxSzxdq4w==
X-Received: by 2002:a17:90a:cd03:: with SMTP id
 d3mr14948999pju.31.1624686340879; 
 Fri, 25 Jun 2021 22:45:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y13sm7055520pgp.16.2021.06.25.22.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 22:45:40 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] target/ppc: changed ppc_hash64_xlate to use mmu_idx
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210624202131.108255-1-bruno.larsen@eldorado.org.br>
 <20210624202131.108255-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3404700e-8914-a2df-b45b-c4c225b35a09@linaro.org>
Date: Fri, 25 Jun 2021 22:45:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624202131.108255-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 1:21 PM, Bruno Larsen (billionai) wrote:
>   /* Check Basic Storage Protection */
> -static int ppc_hash64_pte_prot(PowerPCCPU *cpu,
> +static int ppc_hash64_pte_prot(PowerPCCPU *cpu, int mmu_idx,
>                                  ppc_slb_t *slb, ppc_hash_pte64_t pte)
>   {
> -    CPUPPCState *env = &cpu->env;
>       unsigned pp, key;

cpu argument is no longer used.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

