Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8B606B24
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:20:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldtO-0002zH-Iq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:19:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldrC-00088u-5x
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldr3-0007kJ-I0
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:17:33 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldqF-00063m-LV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:16:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id y4so607531plb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4NxBC1AkCUZmnexajYR6QseGbJneQGw4SIzZ1Uf3I2I=;
 b=f7xK0hVCvovhEFiazTz3HnOO3xUi+YrDkX4giGDWV4Cfdu6WGU2eGDBpb387YDcYzN
 gW5VTtHQRnI8fWa8LftO2fRRzXav4dt5mabylD4l33sF9lHVAJZlkZ8iSNGkhULHptIb
 slRn1ztfY20hG9JT7+3bjYRC2Gp1TSnHiAvB+nJ219ySsz3br/cgs4m6MfvQOR/CHNDG
 xmopvnl2S39wKKeF80HQDFDoMQmcNVwl1T/+llptpRiP8/XxTA0kHmGXj2fe3NnwMWLZ
 D3o2dqR/cnK1tYUGyIqtUQA2A4KhboIfM7lJxL4WmUGY/3uCpc8+8OOD7rNJNHv674xd
 hJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4NxBC1AkCUZmnexajYR6QseGbJneQGw4SIzZ1Uf3I2I=;
 b=ucTKbXun/l+erx/qOzYuxsiPnXBtojSrkdE5BhfmNIXkjL8gImxbVqgtRyG0Jz3bJg
 MeuMKmi63xPjKL+/CkPFJjikPuDhrD+rgx4U8J14o54IybaquIDsI2txEsp6+ImZfcnk
 0orKcAxIi8YoY++a02iCvR9HpqIS94ePPbwkbqe2lVhOm9kiZg4B3eD4VKdce/0xUm+O
 HAiCNL087B3uDuexPWl+w6pOtHcDt8Xr/Lhq8E7ycknRHmcBETZEMCDCjrNh07Qrznul
 JpEUyFjCreNOXn0P45Nh+NVNo0aum2t5nHrmExbqr2aOIuBA2AiIk1JvPewMmnW1k3n2
 UF3g==
X-Gm-Message-State: ACrzQf0xpu0LG6udhQZyZyysMQQgkwrVLivB6Tq2VvsmAsaAAf4Vn8FL
 BqpKEmi945j482+5cBaUGfOfZA==
X-Google-Smtp-Source: AMsMyM5W8XnZqH/0Sq0l1ldZ43yd7sivbRNBeCXE7K5YLcCxgwmgQn0zWHA7Jfl18qgqLXOUPYgn4A==
X-Received: by 2002:a17:903:2311:b0:183:a88a:7d1 with SMTP id
 d17-20020a170903231100b00183a88a07d1mr15840256plh.10.1666304202050; 
 Thu, 20 Oct 2022 15:16:42 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0053e62b6fd22sm13707677pfh.126.2022.10.20.15.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:16:41 -0700 (PDT)
Message-ID: <e6436664-1aea-4ab3-82ac-c315b1314b5a@linaro.org>
Date: Fri, 21 Oct 2022 08:16:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 16/26] MAINTAINERS: add features_to_c.sh to gdbstub
 files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a6f4d62bd..0f4c50e8eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2693,6 +2693,7 @@ F: gdbstub/*
>   F: include/exec/gdbstub.h
>   F: gdb-xml/
>   F: tests/tcg/multiarch/gdbstub/
> +F: scripts/feature_to_c.sh
>   
>   Memory API
>   M: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

