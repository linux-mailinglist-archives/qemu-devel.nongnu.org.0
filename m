Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A906E45ECBC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:35:00 +0100 (CET)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZVL-00037i-Dy
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZUQ-0002MP-Sl
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:34:02 -0500
Received: from [2a00:1450:4864:20::436] (port=38856
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZUP-0004Q8-FT
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:34:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id u18so17978787wrg.5
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 03:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dC0SNsEJG4l0DyToYMaI6r7Kwjn1uoWFJ8AMkKO6juM=;
 b=DBspQZ9/ZMUnCjKx0g5CPahBR8B0DW+1gg3UF/XWUfYyxtZEU6xZ77kHLVWSvCf3kI
 B2KmLb5JrJ1ryAVMa6k+ZDiEjjKuiylXx5L33MD05VLUWxzVXKdiJqRKDdItnece4y9P
 1+TdcXVvyt+YJH7fbA3gkA86wyvzRpjZUBjdaDqMoG56xq/A53khpWjHltBZwJMb5ChS
 VDfSBIzsi4yhVNRZE5TxaolU1GzNssJewMIqbsYVpzFrJ+wFFQEajf1lAt9L1Lym/cUT
 OA53SpSZLpKjcX8aAscCysjxHgrN+R/D5yUs2NOha3r5u1fCWrvdwUg7xXwWToNjmoLE
 r/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dC0SNsEJG4l0DyToYMaI6r7Kwjn1uoWFJ8AMkKO6juM=;
 b=I0jzywv8D3Gwi6BZ6ycAT8evIN7hjQmXwNLJENIbKt7+KbOYKfL4r++bhAqAKqS3xA
 Oc/Mz6GVHDZVl+XsVDoutFjF2fu/EztbZodySRbS9EEoL9Lv38lHKt8UkFseGKrSu9jX
 t097Z8kPsFk8Cd9tLFC0NfLkJvQumPkjg49T5nKu68MbY5Kn/qzTEFODyABQ9yCxWQAE
 oYxjBnuRkapgY7lEV975oJUqE+2me9aG1sVIAxBpYlGYBE3L7T34J5ueNs5cJW9727tV
 oGaFNN+PelZWe5Zn7Qeh/7CrwASorEBCS+IG13cHw7xdN0vZdaTtsDWJiqx8xqXbqPbw
 9oYw==
X-Gm-Message-State: AOAM533K3QdlwfXfvlDqBOoUVFda0mfo1ek9dADc19ZZQVHCvU6YrF5y
 eHm+RpTfcTE4xAbcRNcGHGi5x5xGFmMW/cfkunU=
X-Google-Smtp-Source: ABdhPJwQi5KLkkupYir4j6r8WVXtVsoVHdimpC6kh7yBHbu8ZkTSnEM7TK1aV0yx2PEcYE7xnEQjbg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr13577560wrm.284.1637926439973; 
 Fri, 26 Nov 2021 03:33:59 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id y12sm5359243wrn.73.2021.11.26.03.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:33:59 -0800 (PST)
Subject: Re: [PATCH v5 20/22] target/riscv: Adjust vector address with mask
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-21-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25c85dc9-3798-9cb8-6fea-6b5bd49e8530@linaro.org>
Date: Fri, 26 Nov 2021 12:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-21-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> The mask comes from the pointer masking extension, or the max value
> corresponding to XLEN bits.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> Acked-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/vector_helper.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

