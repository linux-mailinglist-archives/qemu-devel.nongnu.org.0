Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A406DB6C0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkv5U-0003b3-KS; Fri, 07 Apr 2023 19:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv5R-0003an-DT
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv5P-0006nJ-SN
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso44385482pjb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TyPr1D+jmxon9z6cKE0o6xLl1ClF9NGYyNAHslJg3cw=;
 b=qw2wYpt5HKJz5r2a7OsRAzIXXkpT+qRLgdZ/nuCwMrIJrOzNH3fD9ex8LmkqgpG98t
 P7PSjtCmHjdONgfStzQ+Ft1yGw+mfPAJthFu3pkWjLS+Cx48M7Vchp8/VYXnCx8F0Q2l
 rMqzBqzxBQ+l/wpnRRrS/rTAmA759a2Cy1DvVHxMSI3cQ01dOcepbymKuIRh7i5+Rj3y
 2E5GOExso1G5XPyhGSXfoim2hbUkG2QTnQTTe8bwyEhXxDoEojVOcZO2EHhYS1wbqqGZ
 YjJzG7gBuAZ1vZfTsQ5mtob4797mWInf+aP3yIRHgPoJedv7oF+XRHI69l3pt0FE3cNd
 WV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyPr1D+jmxon9z6cKE0o6xLl1ClF9NGYyNAHslJg3cw=;
 b=tvYo6dQ6r00CzmNP2W3ljWE6QRbF794Qam0sbXOppnyb66X/kU/nFq2Azd7hdwCgjc
 5HWOkM2YeeliOYvkBqqm+toYyk3FbRSPyE+9dnJ5opervHGoIXzVzDa8FGJ+q+ndn04d
 8RxJxqalVBTnpOZqPTwYxj7tzB4B1GVt7HunBm4Q8HlaQaCYdj60MSGw88MeTX0I4Xzv
 90g3j9DoplzaPkn1TX3gzfkhyU1Z4uCY1iuqlnzQkWrYyohd0YXc8roOHqdZOTN13ArQ
 a8IS+XzD9CydREDdYOaMu4CjCkhWujUazxRIJzQpYxjdkB/nAqGhhEtwgUurnK46bj8c
 shRQ==
X-Gm-Message-State: AAQBX9e2j665ulfYJlWziJI+X9EsesLgt9D9e7CyqpBWh+UEVvbdCZw4
 dfhglGflOOHCEr+dMjrOAVfErg==
X-Google-Smtp-Source: AKy350ZQLIgsGvtQbrBz25NftlqZ9SOXyQK0RAxFlNjlFwKEYf49WMV87F8ttHZLtHbQzsn5rLkPTA==
X-Received: by 2002:a17:90a:34c2:b0:246:6b3e:38dc with SMTP id
 m2-20020a17090a34c200b002466b3e38dcmr1539291pjf.10.1680908498904; 
 Fri, 07 Apr 2023 16:01:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090aec0200b0023fda235bb5sm3162546pjy.33.2023.04.07.16.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:38 -0700 (PDT)
Message-ID: <ba69b6b3-1b4f-6cc0-34a6-4c19fa3dbb8d@linaro.org>
Date: Fri, 7 Apr 2023 16:01:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/14] accel: Fix a leak on Windows HAX
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> hThread is only used on the error path in hax_kick_vcpu_thread().
> 
> Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/hax/hax-all.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

