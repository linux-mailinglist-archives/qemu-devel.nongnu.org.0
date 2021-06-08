Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E217039ED41
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:01:05 +0200 (CEST)
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqSvH-0001CB-Rn
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSu1-0000Ir-Hm
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:59:45 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqStz-0002cO-5x
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:59:45 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p13so5139201pfw.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yT5VkZ9B439MEbMUNDiEraAdMAVseIiFiuMwJ2J1mxo=;
 b=h06HXTq/VWR8EcXdSWThQ5P4BcC1CR/F6Cqkn4AMxP9qrF7EPrQWtYAL9nZPi4/6Yt
 mok4OxtpKP+CvbPeMiDw6Nz9R13RQDcIqXIrK5x8FZ5/n7Lv/Kyu2G43RMYtVVXieAV8
 FA8NJU46B/u24QFfZr5ANTt726QEUl3NooUZ6tvXe1P6TZzKARGMAwMZnD7v9LCniejb
 LqhTuR+qD/B6cxdY6z+eWYOpbKeAv5ey7x9eI9Pm8igZtwQ+mS0z6rXJkfCIOg63YSwt
 1PNuscW/faS6Pio1RI9OOL4XoGWnUyrGxlsjs1M+HyMsiIoXKqJYb4DNsSznqkw6tcTz
 zu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT5VkZ9B439MEbMUNDiEraAdMAVseIiFiuMwJ2J1mxo=;
 b=s+uEPDs2K4ZOHv6jinbshi3KwxqAjhMrB9VGAOnkdwST8g1GKq8qOyW8F74dgw36hz
 ALUEcptmFI6p6CnFb74AJ0cn8e2DqESrrbg7ZSh00n8Q6dRih/WQ1fwN/aWVfClkfeaN
 F0boQJq9VaM4F71UxYXWBEFCimmEmKlNn37fU4AOYDPAKd6aaxSTG5tZIMLzHn1nV+0g
 ysqn6/IJZSlM1GQRYtk5MMcCuFA+ScomrOiKqiTcGQBNOEYjk1MiW36rdTRP2yoH/gok
 vM9q0n09rBHi5/7fFzKr811aGB7lZu3kcJex8zlYyU15k/nhIe4PcvPiVUIR0W1YKKCY
 e1kQ==
X-Gm-Message-State: AOAM532iKjD6vpZ/45lxVdGfZU0WyTOnprDB7ttS0a8EWixZUNMuSEyO
 B9dxb7L7r8x6xvg++rrui9knj8zc6+8ipg==
X-Google-Smtp-Source: ABdhPJywrOQAiEL/7pKNVXiUuqX1eCuuJUJFp29fN3IwjcHoD3pjV44ZvYaFaaryLYgz3n8zoAmqww==
X-Received: by 2002:a05:6a00:2307:b029:2f0:206a:ee13 with SMTP id
 h7-20020a056a002307b02902f0206aee13mr8421515pfh.79.1623124781096; 
 Mon, 07 Jun 2021 20:59:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q12sm926433pgc.25.2021.06.07.20.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 20:59:40 -0700 (PDT)
Subject: Re: [PATCH 10/55] target/arm: Add framework for MVE decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fd2cf91-e3e7-6a02-8395-8a2407a7793f@linaro.org>
Date: Mon, 7 Jun 2021 20:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Add the framework for decoding MVE insns, with the necessary new
> files and the meson.build rules, but no actual content yet.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  1 +
>   target/arm/mve.decode      | 20 ++++++++++++++++++++
>   target/arm/translate-mve.c | 29 +++++++++++++++++++++++++++++
>   target/arm/translate.c     |  1 +
>   target/arm/meson.build     |  2 ++
>   5 files changed, 53 insertions(+)
>   create mode 100644 target/arm/mve.decode
>   create mode 100644 target/arm/translate-mve.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

