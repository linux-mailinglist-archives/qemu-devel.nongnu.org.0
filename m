Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E022167DACF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLCbn-00089g-5G; Thu, 26 Jan 2023 19:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCbk-00089A-Vh
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:28:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCbf-0004CM-EK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:28:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2343499wmq.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 16:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfpPtN/7SvtdOJ7T54E/0ir8OsVj0DPNn425A/+WzPs=;
 b=dbnqra4UdVj2kMxYOGNgUHEi/vfOm5+P0/pBGaXhDAsZQJSXWQsCWa1dYnIuQGWdSw
 Le6djH5mqgDH3s9pA40EkmgyBTa05WaCQjbKygr54h/7KyuWH3u9OJX0Ee2y38oJlvP1
 ye7p4RZ/L1TgH53LAWzeg6osAcA+vx/vAIXRyCS80CkurTByoVAKMFSs6YDS+iAyJkVF
 Tis9hDnJk/aCyU4W7xtOrwyRGiULd9Tx6eJMgEloKtdY9DkM4olarvLwsZKCOEhr8QRN
 oRgPVCthGbZRXCFzieTTV+RzSPp/FLm8ez4J+mKJg6XxVKlbgFCv194FwrneFg0tcUn+
 szmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfpPtN/7SvtdOJ7T54E/0ir8OsVj0DPNn425A/+WzPs=;
 b=MhT5/Mep7X4tKDQuyWAZAyGqGfGIN64J6FsoeNsgLI/MpfMOSTs7gH3WRg+4JARXF1
 ZMkO26G565uOz5v/EIxZAcRxyRXofcY0tCNaTWx/ZHAC56K67Cvhm1oSnRoFOEwcQbqq
 fwXk4LCV0DSOOgCol2XTiYC6QNAw6pzbKfVLZF8fd7/LmHjPK/SZ/Wv4xOEo0RpYRhdC
 cD9XQr6QhpRcYKTnv0uCS4ZhtUc5nhlATAKC1YNN8DC3ZlfKMSnkzT5HCaiwFNIUXxW5
 v1JoQ5bFkGEz7o1PNLpFdNz/yWuOi5YUfeM6OdPhhfYjvZ4L0eDGC3EvXWYFJHV1S8Fp
 jKZg==
X-Gm-Message-State: AO0yUKVWeYAUA6JdbJ8hFk4bdHek+VnX3+Wl7PBGu1nIG23O8D7MUC2k
 XBa7WVrrwJbNS496qF3Dr4XgNQ==
X-Google-Smtp-Source: AK7set9bQ5YZdFIs5fHKGImnT6FOCyDcS9A9Pb+9Cg0WuE02QIuFwbO9/zUxJ1du2QklBKZabRhrHA==
X-Received: by 2002:a05:600c:1c1f:b0:3dc:37d0:e9df with SMTP id
 j31-20020a05600c1c1f00b003dc37d0e9dfmr130560wms.14.1674779317836; 
 Thu, 26 Jan 2023 16:28:37 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003dc22ee5a2bsm3933201wmo.39.2023.01.26.16.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:28:37 -0800 (PST)
Message-ID: <67d5588e-af15-bbd3-affc-d504d396daf1@linaro.org>
Date: Fri, 27 Jan 2023 01:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Fix physical address resolution for Stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Sid Manning <sidneym@quicinc.com>
References: <20230126233134.103193-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126233134.103193-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 27/1/23 00:31, Richard Henderson wrote:
> Conversion to probe_access_full missed applying the page offset.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 57f3615a66..2b125fff44 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>           if (unlikely(flags & TLB_INVALID_MASK)) {
>               goto fail;
>           }
> -        ptw->out_phys = full->phys_addr;
> +        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
>           ptw->out_rw = full->prot & PAGE_WRITE;
>           pte_attrs = full->pte_attrs;
>           pte_secure = full->attrs.secure;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


