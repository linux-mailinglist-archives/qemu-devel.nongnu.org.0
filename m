Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2457F2BF
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 05:30:13 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFSJo-0002DV-9t
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 23:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFSHg-0000Al-TQ
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 23:28:01 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFSHf-0000FJ-AB
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 23:28:00 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i3so3176206pld.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H6lco4jhGFhwqw3XfklIzk09+ko0OG+sy0UqH/+VW44=;
 b=rOocERWSI8JVoOww6mQ58I5r6LVEE+RS2QriTqA+HWzH7dwsimh/JiyJ/lP/BE6Oqr
 jkUoIiOU8LqP6w5CBKeX2wTxw6lupdVLT487imvYOQZfnBHeIF5IJW2UM6PfC7a1KAw8
 WJrzoN4Iayy5dAN16hqDqjga7qWlGmjdqs3iN/vTg/1rqXfqCIyCsqwPCysfwFh2V085
 RbGkToig5izwIB3IBHPZcbH+XJI5scAhf2ax/4Q2br5OgVJEjb9TjzpSXT9j0vrCNpvo
 2vkLsZJS/AphfG3XCbUJR4+sUFR1MFoU47YJMndwCCaJC5xpbtX2o5jtdgbWq7pssyIQ
 7VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H6lco4jhGFhwqw3XfklIzk09+ko0OG+sy0UqH/+VW44=;
 b=RRz8SACgAhMx9zt1T91gUbtY7/IjhwsB/obpmADV97xYEBU0eUjxHEIzFNgXQQZkeZ
 WI6USQbRylqPRkUM7Thn1IEKK0Lodcf+W++F4mLqDw5bYKoF4MJA0AEPq8nb2P1wOK76
 ojGxDCKu1VwyPZBKfIHhA6+kbdq5uoTmcZtVABleAIHw7x1wB5dAcEIiDc78GLH//QsV
 bZWjE8tGQf36EpvJ2BQ78qslmgyVK6P2Clun2GDuxX0wQJg0Vwe4HZtBYDipWyH0tKzM
 zO/cmRr3DvEqjTM7Afm+zSjajwFe/w8VSeE+5NGHYhjlOtHZztBwci//Bmh9aJuZrlEh
 69Ew==
X-Gm-Message-State: AJIora/anjz7NVEvf6EYD9CXqsL6d6a4KmNB7Qpi3nRMLUsybgjq6M1F
 aHfrOOgLl47bliNJw4NmT4QizQ==
X-Google-Smtp-Source: AGRyM1sunG+AObPO35qrxv7o+u7nGFD5u4Zp7JkSLPWrnfbqdLxTiNtnmnjUBUd5gLg67uJKMDk7/g==
X-Received: by 2002:a17:90a:4e87:b0:1f2:1c52:4082 with SMTP id
 o7-20020a17090a4e8700b001f21c524082mr7708225pjh.237.1658633277537; 
 Sat, 23 Jul 2022 20:27:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:f4b6:8b1e:fb15:2af6?
 ([2602:ae:1549:801:f4b6:8b1e:fb15:2af6])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090322d000b0016c4fb6e0b2sm6468011plg.55.2022.07.23.20.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 20:27:56 -0700 (PDT)
Message-ID: <18a9da7a-9a11-2e2a-01e8-04b2504a2de9@linaro.org>
Date: Sat, 23 Jul 2022 20:27:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/loongarch: remove acpi-build.c unused variable
 'aml_len'
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn
References: <20220721040046.3985609-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220721040046.3985609-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/21/22 09:30, Song Gao wrote:
> Fix a compiler warning on openbsd:
> ../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
> set but not used [-Wunused-but-set-variable]
>      size_t aml_len = 0;
>             ^
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

