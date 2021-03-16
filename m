Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC533E1C8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:58:47 +0100 (CET)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIeE-0005zg-HY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIcP-0005GK-0D
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:56:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIcN-0000GA-Em
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:56:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id g8so400315wmd.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZKp+GBuizDstphViDDUiVbxYszXRnNoJB2ZxhIVW21M=;
 b=YrE22lrlmy7eVmKEaPG/zg09tB9iLPm3jILfpW5RtQWdVMqZc8crItLgivGgfgx1sj
 FVN04H5ifK+rjeJw1+v1PwCa2zw+JiutfehTVhXmYMKQx3/4rCMbszOaMfe2atJn18/4
 iu55LsvHSBy70YihPf+ZXhe19GHJ8czXRbIs8HnAv6oYzdu7ep2E0WdZZkasjN+vWTu8
 p1socneuepkHJUwb4TeRLMRD6CBL81pbPtCuZBe9kVaBNNEZ2/Io3cLJi8uDwzAUcKmN
 /67uybZ+IszVhqoL4cJg6TkA6fBb0PO9EHDdl7JAfo2Cl7Ie5qHJZW1lhWgXkt1XsoRO
 vZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZKp+GBuizDstphViDDUiVbxYszXRnNoJB2ZxhIVW21M=;
 b=Plr7pbCkw78SJ0foH9DbszkLq65DskfIhpcRFkxhLg2GYgfAM0DxcWuBcNKJmlln19
 12x9Og/zVogF3xBUaDemvoE1sOqDKp+8v5wXB8SWTyH7DIFQnbQ48UG/4RuoD3PdKY8n
 VvsdKixns9yodOTIGKgipzJiLcX1+ANfOa4BNO+Vvr7JYLx154IBi6XXJ8fUoEd0BDJF
 n4BkBlOcD7fYfN3whuFhtQ1SozkOyeBSIfCg+6ciXqsmSIg7cfjfZg0oTwN/aaqNhkG8
 3M6Evc9Eu5I7ZyHZSn5FzsqiLt5S12E+R7d6TvCAM0RjnIt0kZSESe7/GqXKSXUKElQs
 /wDQ==
X-Gm-Message-State: AOAM5339AgeSqk+Ut8j7OzMVPZ+urDoycHt7+PhSUqQVQjn7Ogy2Uiw5
 e3l9YFgafRBnb5CY7XksUDQ=
X-Google-Smtp-Source: ABdhPJxoh8M/m1GCwYv15yvpBmkC2in4j5+YuUDa78Yx/sKINC5Jkkft979MCkIP3yiXbBWkwCuwWw==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr887860wmi.151.1615935409958;
 Tue, 16 Mar 2021 15:56:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm448618wrw.51.2021.03.16.15.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:56:49 -0700 (PDT)
Subject: Re: [PATCH v5 07/57] tcg/tci: Split out tci_args_l
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e7fa2d0c-c925-c34d-3c0c-85c302577c7e@amsat.org>
Date: Tue, 16 Mar 2021 23:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/tci.c b/tcg/tci.c
> index bdd2127ec8..6e9d482885 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -184,6 +184,11 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
>   *   s = signed ldst offset

Again, can you mention 'l -> label' here please?

>   */
>  
> +static void tci_args_l(const uint8_t **tb_ptr, void **l0)
> +{
> +    *l0 = (void *)tci_read_label(tb_ptr);
> +}

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

