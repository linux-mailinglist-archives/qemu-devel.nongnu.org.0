Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78DA2CA403
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:41:56 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5ul-0004ac-QB
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5tA-0003YC-9W
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:40:16 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5t8-00020a-HW
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:40:16 -0500
Received: by mail-oi1-x243.google.com with SMTP id x16so1763410oic.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G/ptSAaY3XZJ2aosnjTtTSy/4gOV9yDdfEjmAvdYVe0=;
 b=TMnxGIjFB7HPQVGS/FQmsf7pvtfFcuEr1i6rJZ9TIM+pMhbgY5VT0Pc7OFc/BtABf6
 pwnx/uAMREv0OCivazsXSCyEgX5FgcFsZ3U8KZq/CeKPwJLb4VLy1DYL097t4Ex2bhg8
 54I/APw1s6H4pPKQtrlMDBg12iSwAcSwFmTKJ7N9F3VZkQaoccZD9jsUwhUx9CnW3Aoo
 AwinmaxiRYKhkd/uF/VgWl2PpxinHCIbe805TICo08VEnNUAsoT2FouJ0AFjR/jReCpP
 lREp9w5wz8WAvcONXFsBbiqSMRXhCMOfH8SaxM3zsQ9LSkiwzZUixok4wpBcCMNUgZ6n
 w1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G/ptSAaY3XZJ2aosnjTtTSy/4gOV9yDdfEjmAvdYVe0=;
 b=eT1pN+JT1JA2su9kf7gPlhltD0/S6DPyWyuL4kEQanHWw0gw/sstM+dXw1rdGtW4Wv
 fBFvRGueoestCQZvZXOY+EOwKOHOVdQ9EVQL+A7jniezy7VwAsOTVA9v7cyFhjOZ0aGN
 9Ma3YGsckDqXCtN1fzQFXeqkqL9QrcewTo/HAnxvtKGD05X05hPwsBwnXDt7z6x8vQwJ
 PFxGhM2cOhN8/WQip/74Uszjk+8B7lhwO56M12JMQ4or0kYkvccbrqppGAM7Y2oqMivd
 dBizBhX8wCUuIV5rgY0DhHFcp2zANFxZ5YGa7FfyJKA/FjdvPrdHe7kkU75ZZhc6ffTU
 ARsg==
X-Gm-Message-State: AOAM531W8pn4ZEAlqF4qiWkAVe7aV8M1oY2UVNiCyz0mf44ncSCa933P
 ddVGcRyqOGoBmU8KhaI9tEjErajM4Ef1xVOt
X-Google-Smtp-Source: ABdhPJzBjmD5h+dkiWvj03vacok47kiTdmIMOHQ9zNUkvMH/q/AQmHmwbcdgwbWyShMBcuKd4eQdPw==
X-Received: by 2002:aca:496:: with SMTP id 144mr1691460oie.136.1606830012797; 
 Tue, 01 Dec 2020 05:40:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c1sm366276ots.68.2020.12.01.05.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:40:12 -0800 (PST)
Subject: Re: [PATCH v2 13/28] target/arm: Implement FPCXT_S fp system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7e1b95a-4616-a83a-c20a-3e1933ad4c54@linaro.org>
Date: Tue, 1 Dec 2020 07:40:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Implement the new-in-v8.1M FPCXT_S floating point system register.
> This is for saving and restoring the secure floating point context,
> and it reads and writes bits [27:0] from the FPSCR and the
> CONTROL.SFPA bit in bit [31].
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

