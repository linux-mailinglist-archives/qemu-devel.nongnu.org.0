Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06D6740EC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZeL-0005eJ-Lf; Thu, 19 Jan 2023 13:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZeF-0005dq-Qg
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:28:27 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZeE-0002sG-BP
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:28:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id z20so1120143plc.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReG+uWmDCUfa4tZA6C5fcK6lZETwy8zrtD3BuqeDPL8=;
 b=F3yhPETs4G0Gf8oX9SVsfCY/bScFCRFjZsE/7HxIWo8FAyCV05TlnWQPwNYSG3/xPG
 ng4n9wGSZDoo8uVri9Vt3ylpdd6KaAcD/momRLk0xih9ikKNKXo/2zN5O1dYdsP6XaOf
 M0/xVpoD0QWujq2NjqDS1iR8F24Rdx7+TKmpYwLs+z/T53KE0suo6gQ/UMGgl88DmPos
 NLsXY/n/Jln9jrcEkzAYtOfOJ1V5Aj9VOY1tlOcTjekXyT8rU5aW7Tzrg+riOyIEkOap
 if5d4ouE6b0CbWAwrcY1N4bT2Nxe4Y/Kwn0xj187udnIU9A5Hz7hspagpHZHFCDRaz7j
 nH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReG+uWmDCUfa4tZA6C5fcK6lZETwy8zrtD3BuqeDPL8=;
 b=3snzWfaoLZ9jerDx8Y9Gqlc/bZKr3Rav9KNOYT9dIegAxYIAh/4A2sHXOEkOVecPXe
 w1atgymsPDDK+ktFPU6d5V8diyXo4gGZWMmFgLjyAUOjODQ7QWDQWVTxb0LIGJfRqhJE
 EXaonY3tp+ZNguGqwo3zJnTDdnHLCfa31/68zj8DBA9UEgsZyP0sO8/SUw5/DCIzS4mw
 cdJ6pwHw+XWF4DazAZXxC03ckiF6EN8xnp6YsqodTbB66Di9Lia3TmliYTWYyWnjTXjI
 ffttXFYTb4RtASARLrJrl/RUzAJgkFy+TccCU0JfrU6g1O/tScdnDxWg6/OIEPrIZZkX
 xQwQ==
X-Gm-Message-State: AFqh2ko8RZOghaTxCaO52pxRW9XLjPGsCyJU5xuPuG3oqVxoX1qW4Q7T
 SV8D/pomJJ1MU7UUBpKiKO3JLQ16jkU4RaU9
X-Google-Smtp-Source: AMrXdXvhwQOYiqzpIG2BN9ywshV7wubCFzVYrh7gkmoGqvrR02CWHojXgi21NMyyuPXZZVjdciJuMA==
X-Received: by 2002:a17:902:7787:b0:194:5d26:11cc with SMTP id
 o7-20020a170902778700b001945d2611ccmr11810929pll.6.1674152904295; 
 Thu, 19 Jan 2023 10:28:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j14-20020a170903024e00b0019101215f63sm25542843plh.93.2023.01.19.10.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:28:23 -0800 (PST)
Message-ID: <43e793f5-cfe7-ea9b-192e-9c843ff84941@linaro.org>
Date: Thu, 19 Jan 2023 08:28:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] target/avr: enable icount mode
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, philmd@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412019026.3110454.15241120845845520583.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167412019026.3110454.15241120845845520583.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/18/23 23:23, Pavel Dovgalyuk wrote:
> Icount mode requires correct can_do_io flag management for checking
> that IO operations are performed only in the last TB instruction.
> This patch sets this flag before every helper which can lead to
> virtual hardware access. It enables deterministic execution
> in icount mode for AVR.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/avr/translate.c |   30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

