Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD933A0DF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:05:02 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAVR-0008So-H9
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAMG-0005zk-VT
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:55:33 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAMF-0001B8-9R
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:55:32 -0500
Received: by mail-qt1-x82a.google.com with SMTP id m7so6499367qtq.11
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0zapGXtdVt5GT5xJvWKl2fbUqx4QNTSzZ5F3mHdH5c=;
 b=FmtCjuoxZo8pGXppGBJYnsWLsw42QDbRDcmCgvypKx8bpbXihAX+jjXz2kbnXE7nGS
 NL8okBLkK2g6PFNSVe+tjIF7sIoWE8xV5bFCf62s4wIzKO+4bzMBhswAjvt9w/aBtjIW
 hWCCYeJ+7790WMgEXJKrLWfRhLLp757biIiDfXJSU+hlf5NDMO7bc7JlqZNyI4gHvbNN
 tZ7RIrq4oB+DBfZfB5HJ/fBVY1RYdJ7TC/0NFoMN6pV55Bt4B+5kkJpjOV2J4CYlCxMM
 PKqVcrDxmNWhxQK+gXwwqvP3F2/qKzgDcuRlK9/zm6o0GQm6Ruoc6Y8mMy+gHCFDK13i
 Z9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g0zapGXtdVt5GT5xJvWKl2fbUqx4QNTSzZ5F3mHdH5c=;
 b=KiTJ4qBHqraoemxY4gyeiHdQItpWYEGqIggBi4PgFsgFP4BOaDUSqzrPn3LygaZQgZ
 6Zm39h/20BUH+3EV6xvdOtZHqd7M1dAMiSjDjxkFIUc6Dbh4W+COINi1chtKHahDx5tp
 DZoQUaP6rX35t+0gYWFRro9CZi9HS1nvoguCLEnmgGfNSsBz7fLE1fq/wa72Nw5bmhk4
 IkLWsEtFa4NOyZXui+SlmaxWR04Dk4OwAhGCy9nQDG6zZSAiq99fi1WkFWaA4Qou9FFU
 DlR+04Qn1oHP6arNVy9u8FJ86SEIaJ/v/MArxwkl9oTgO0HJfasLlr/RmPREDfqQU+sA
 tpqA==
X-Gm-Message-State: AOAM533TEHgoZJS0xY2tRxX86dwLJlMsUgLXBVw82u3B8vvk2kMitF1J
 XVSZYTLNW/uDWmDwbrjzhjuzvVQt/WBWu26u
X-Google-Smtp-Source: ABdhPJztfgL/8A+gnsGh8UTnRILdni0FX24PUMqXKidG0bJIKjVqbPEZBG+iyQmeo9J58D8/QcbMnA==
X-Received: by 2002:ac8:d85:: with SMTP id s5mr17165539qti.390.1615665330150; 
 Sat, 13 Mar 2021 11:55:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 124sm7356301qkn.121.2021.03.13.11.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:55:29 -0800 (PST)
Subject: Re: [PATCH 03/11] hw/avr: Add limited support for avr gpio registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5a4c759-8b19-2f25-c5b4-ad523aa5152d@linaro.org>
Date: Sat, 13 Mar 2021 13:55:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>, Heecheol Yang <heecheol.yang@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> +#define AVR_GPIO_COUNT 8
> +
> +struct AVRGPIOState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +
> +    struct {
> +        uint8_t pin;
> +        uint8_t ddr;
> +        uint8_t port;
> +    } reg;
> +
> +    /* PORTx data changed IRQs */
> +    qemu_irq out[8u];

AVR_GPIO_COUNT?

Can we drop all the useless 'u' suffixes from all over?

> +    gpio->reg.pin = 0u;
> +    gpio->reg.ddr = 0u;
> +    gpio->reg.port = 0u;
...
> +        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
> +        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
> +        uint8_t new_port_pin_val = value & 0x01u;
...
> +        cur_port_val >>= 1u;
> +        cur_ddr_val >>= 1u;
> +        value >>= 1u;

etc.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

