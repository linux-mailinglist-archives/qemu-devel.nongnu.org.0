Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A94D2031
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:24:46 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReVp-0005hj-TH
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:24:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReRZ-0006AG-Qk
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:20:21 -0500
Received: from [2607:f8b0:4864:20::534] (port=39560
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReRY-0003C8-9K
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:20:21 -0500
Received: by mail-pg1-x534.google.com with SMTP id q19so4557362pgm.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vxep9lt0yDteo3B3+ML3+Vkv7d6SUwsE/pr4mhToDKw=;
 b=BNK+NyZxm3CtUtWCjW5qql3sIgYSo2FilKZipam/Bd8x3fZxnYfw3S+VMsqOwUlY5m
 kts3gYnNp7nCH2eXnn8w+x0J1F6adNsrTzZ33hrNisP2KceByXCvq4ynGhxQcvIGn0IE
 eRMTb3zv7ml+5yyGKS8NZsItTFhtbwEK/WpTSqE4UtlfxbjOiLVrcOXlGCHba3QzT3RG
 F8StRxPWDc9jtvX0BbtWH0GPg/LpbrmloEciQsj0V+qUnDVMLRNB+zRlWnPrWxmwRML7
 NFQNZCqo1jU4t8gGoDz0WCxCq1LZkV14Q+sHR3kJWsPE1gzYr6SqiwnloxbhGr+FxOyL
 kaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vxep9lt0yDteo3B3+ML3+Vkv7d6SUwsE/pr4mhToDKw=;
 b=INUuQQOzyguY9+XhEvHg7ZOFMa79xdc3NQLBCH7PwzwZjotQ7TELwtDzTTfZrj4XyT
 M8rHOfgXziYYYN9NFE1B2MrkwKC4eA5aDQr+cKQoKetPV2W3aR2TDXj0hgNrrL2jMZyy
 spFLALN4f4oYNnNdQYNxbIXiPMYRcs+BkbFDN/XhHWqbZIYeXS0XWX4GHgYBsbxQYkoH
 5m9iQVdp8QEmjrbsqwJ/qY4twFzgnMIXtRJTfd4AmJpvoOXhSxKEJhQBvn9p0lSy3XrX
 kEc/f4DnfjMwRuuX7gXDv/0mYpRf+9xcp9QVixvWbqrhefZ1HWrDKhdsm4/8Yl81Z7vw
 bKFg==
X-Gm-Message-State: AOAM531K8+x08fEOzicEgwmQZsAnz2R4rLiIghbUKqoBIubC1OSPwmC1
 iA1V6X+Q5b1sYJenu6MEZV256w==
X-Google-Smtp-Source: ABdhPJwVF5gO7acfPp2IY2D+AYo4gDs5YPvR/D8xQWDFzsY5GxzRE3Y/JcraumpBt/t8v6n2fs1CDQ==
X-Received: by 2002:a65:4143:0:b0:375:89f4:b46a with SMTP id
 x3-20020a654143000000b0037589f4b46amr15055480pgp.335.1646763618900; 
 Tue, 08 Mar 2022 10:20:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 f20-20020a056a00229400b004f74434eae4sm599434pfe.153.2022.03.08.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:20:18 -0800 (PST)
Message-ID: <2e806091-ac71-25cd-3941-c2746ebb6773@linaro.org>
Date: Tue, 8 Mar 2022 08:20:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/13] hw/isa/piix4: Pass PIIX4State as opaque parameter
 for piix4_set_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-5-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-5-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> Passing PIIX4State rather than just the qemu_irq allows for resolving
> the global piix4_dev variable.
> 
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin<mst@redhat.com>
> Message-Id:<20220217101924.15347-5-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/piix4.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

