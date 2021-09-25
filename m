Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45C41828A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:14:01 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8RE-00011U-NE
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8QG-0000Kr-KR
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:13:01 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8QF-000742-3X
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:13:00 -0400
Received: by mail-qt1-x832.google.com with SMTP id t2so5758222qtx.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wmz6v2q0Bt1Kw5MIWs8YpmXzsWr13gJ9jZv5QZyC9e0=;
 b=amWn5TlzqiNFLaJ8XoiuZLLu5tYZ+8RwjTqVQGaGe8Y5qCeRn93UrXCp05RXEu6dC+
 F1fM+612rhYkr1uBEuXI9ZtWoDXQYynKrA3cAmcxLVmOjqzwun3z6yh2eBqK1q14X5aN
 TMJXvcjQtbvt9ZeqxkxjKNBwcRKNePo/BQz9foEnZqBHoRpykFuiDDvMxiKWSt4F+V9E
 dNJzDiJEzOJDJbWc+G9YnienVGegzklMjViMSAHkEfhbkFwSIDqMCen7Y7GeFlaz/iOH
 QwkYyG3wH0etH42CLUFejOyt47qt8Wx1CUm0ZDokMNMUXXbv0heFXb7kAYWK5PdEBsXG
 oPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wmz6v2q0Bt1Kw5MIWs8YpmXzsWr13gJ9jZv5QZyC9e0=;
 b=Dy9ZHuESJcdn5R8WNJb5LMd9RcBwGCm5Krsnz24BtlgcW8Ye5RTN6MKMT2bqVQ68Pu
 EU/8lNNB3aKHb9J5FqYnmEaB+cJH++75Y6irpcPfMmpkehKs8NmQquIbfZzfJ9ncLF79
 OdpXQWv/sn9R1nqlCO8Q3xSQKN2Mpa8yxGMWlafz7dK1gb2ClEvDlcYa5lN+Sh4fwGO9
 47FUJb/PSWdDeA6TNbAeHAinL/4KOIk13TYGCpjWkXBlOEzi2dHxwPjKH2UCGWOFticI
 iM4/MRphEAjuSH+EQRp77wW3AJj2BFqoTfbgcl/8rrzu9eaHNG8m+hrdyj6tUo1LUGjo
 U+lA==
X-Gm-Message-State: AOAM532JWZLTG02d9Ruf4vST5pDACChhJZKlAE1cqmsPO45LRe79kaHb
 TrRh6gHFWnrAckaoAingUnEcMQ==
X-Google-Smtp-Source: ABdhPJxWsAFqXrUsam7lMWOIhPPJp1btJcChxj19scIPynn7JMkGMxqjrYU1+Kl9IJMdSIuuEFKZmQ==
X-Received: by 2002:ac8:1e81:: with SMTP id c1mr9812076qtm.80.1632579177943;
 Sat, 25 Sep 2021 07:12:57 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id g12sm8330833qkm.112.2021.09.25.07.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:12:57 -0700 (PDT)
Subject: Re: [PATCH v5 19/30] tcg/loongarch64: Implement br/brcond ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-20-git@xen0n.name>
 <cab5c9aa-3371-783c-1b4d-c4e265a272f2@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93a52a0d-1f8f-3a74-e878-8da771f9fa22@linaro.org>
Date: Sat, 25 Sep 2021 10:12:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cab5c9aa-3371-783c-1b4d-c4e265a272f2@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 6:13 AM, Philippe Mathieu-Daudé wrote:
>> +static const struct {
>> +    LoongArchInsn op;
>> +    bool swap;
>> +} tcg_brcond_to_loongarch[] = {
> 
> Richard, TCGCond is 4-bit, shouldn't we explicit this array
> size to 16, and even better define TCG_COND_COUNT = 16 in
> "tcg/tcg-cond.h"?

Perhaps.  Not in this patch though.  None of the other instances in tcg/host/ do that, so 
I'd want to fix them all at once.


r~

