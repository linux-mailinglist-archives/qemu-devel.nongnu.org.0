Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6516B50F8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:33:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiUU-0004rR-9l; Fri, 10 Mar 2023 14:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiUK-0004g5-8y
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:33:12 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiUI-0000Oi-Jp
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:33:11 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a9so6722718plh.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SrJmqy3JuFtSwM3AuBPCcPMjryuehQBYZGOUCVEsl58=;
 b=Qr2avbCZDTxDCyfncX0XdlVlUbkpCjYAkFpUkx5ufYci8Ghnpyi8lZaCH7oTYLhy77
 xlfL0XeEeWLj3OdHPMKv5al3/q6cqOtAm7nvPgu5O2/54H8byI2O2yM1wzZrI0KE33Sm
 bR1kkyJiw2CmqpIlUrL2avuat4YeLPdaquq10jOPGmfJTVcrHzUHs3K4x2oJiFukiAPt
 38jSWpZMEFCY1fXIpvVbKPtZVmkfwP8TwIrIUwNtkL1hmcRleXZkoQ0bt1aUjCAAAZb2
 6+tDvXHn3usqsFUBLZ/YAUrVzvoqQmXQWIO4ityuOlpBzFKmKDzonKXhWuDthqScqjol
 78Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SrJmqy3JuFtSwM3AuBPCcPMjryuehQBYZGOUCVEsl58=;
 b=d+NzTwXGC+UmgE9360yQPretV/TZaMX6GxxTRJ300FRn26zrd4k2ujML6Rd5lB9qjP
 QvIxcRFRsvuGC4SgLwxTo1HC54xEpnRySUP3+OGFAII5JNjiRUugq4gvHTbgL9P07MPr
 9Px8+LF5HkX8/Q2VXAdB3deGn/fb9NOOPpAKx6TwftFGgGhOKgazU2CXlRd51/Cy1eTS
 zQNcnteQyISr9X6srw3QYUA4yu1d6YJ3xaIy6tWik86ZDDOqGFRsgzV6WwI4C0/pMHnu
 tGA0euoWCsA8XyldGBGnwPbY1hi2FR4BRgDmxlma8g6jZJuRxVgl0V4504vnVPx7Ar4P
 93CQ==
X-Gm-Message-State: AO0yUKUTD8WX+wM1jPsNutcNOZ1aSFHzgYfVL5FyEBFf2CrdBIb4JyQG
 XjCaB21J4uh3nQWnCVoKSQRKxd2ZqsBwZyo/sRc=
X-Google-Smtp-Source: AK7set9Ftb8pqJJI+/Zltl21wCJfiOFK57O3DWFqB65JMTpF54bH4EYzGiPNN11WUIJ/JDY9RUq3pA==
X-Received: by 2002:a05:6a20:656:b0:cb:a22e:d33b with SMTP id
 22-20020a056a20065600b000cba22ed33bmr20490161pzm.42.1678476789787; 
 Fri, 10 Mar 2023 11:33:09 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa791d6000000b005a79596c795sm188009pfa.29.2023.03.10.11.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:33:09 -0800 (PST)
Message-ID: <a5c899bc-0a9a-0b8e-32f9-17b88a6b1dcf@linaro.org>
Date: Fri, 10 Mar 2023 11:33:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/12] target/s390x: Handle CLRL and CLGFRL with
 non-aligned addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-9-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-9-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/translate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

