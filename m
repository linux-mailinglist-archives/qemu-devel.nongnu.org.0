Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1031B91C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:25:10 +0100 (CET)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcw9-0002VG-Py
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcbo-0006kY-VI; Mon, 15 Feb 2021 07:04:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcbn-0000PV-Em; Mon, 15 Feb 2021 07:04:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a16so4162039wmm.0;
 Mon, 15 Feb 2021 04:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwbLtj3VUQ0qqMg2i/fx1xZ9o3PmMX3bpIRHaYIIRvI=;
 b=pKf/S86Qju/GXmEaNteI4/96esc6igZJdhHm+UiBMovkPQL8eoqtg7jCoXDYUIRHpN
 EyBuLYQ0CJ1Tz72a6WcbURSGA/iiy0F+M3D2wza1mUC7U3LPTcYEHzEdL2LtkH+HuzNL
 UOLM3o/II+7hKdC3+XYZXkc7nAQq2N4v7TIAM1DB3cl+WOEA1Lo5UNMofVovGAYQ8s7Z
 EL5rs1/BYFGHp1c1tTELuqFDoyWQtnZOq3j3BJCBhivJuHeUKUey3zxzVWobUP9jVglx
 Vz9utkO9KchrhlzXVa/5IThskhgmvUiXF2p2Wqn1zpqmH52PRlI0TWlwpsvLUCblpYNt
 Lrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwbLtj3VUQ0qqMg2i/fx1xZ9o3PmMX3bpIRHaYIIRvI=;
 b=hww26yIRf6hgl1t2mP51OyYu6rN0gEN7FgRPGJt2l2iPdjIZlpY5OwYB/FchOG9Kyf
 5/D3kolXWDUtNtmIiMDhQQ6HpuExoGUh/1/RI5eciBigQlwpDMabtGIm+5CAO+/XejeZ
 H9kh9O1rPyx34O82BMeEnLMkVH6Ghr3pqx+9VNle5Ik1AZOB5QpL8LOSG9QFPuO1aeWk
 QFo6QG36HpB9KDoJ0Y2XgOZ5dJD+Z4c/9dYn1P3ivcbNZDXuhH1Fkcx0bGp//s/p7DxD
 aGF11r0kBiGUZazlcHgLYWtQIY+ZCm5xmUDeEmTh4uH14atKAstI0IcPZTIi6FxXZRwy
 vfsw==
X-Gm-Message-State: AOAM530jteYnirwYj+k337kdZrFnl/gIshVIJb+J6aD9Q2GXxQjK8nOu
 mcK1B167h4OxfmEkjAjbgC27kG/wmZ8=
X-Google-Smtp-Source: ABdhPJwy46LkGJg7aseBBf+/eu6JI/LNCFGzsqd6swyk1rtAHU6Twp4aMSd+2rUgKUTHSpPg70pHpg==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr13932442wml.5.1613390645404; 
 Mon, 15 Feb 2021 04:04:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm22185080wrr.19.2021.02.15.04.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 04:04:04 -0800 (PST)
Subject: Re: [PATCH v2 08/24] hw/arm/mps2-tz: Condition IRQ splitting on
 number of CPUs, not board type
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <efea2756-62a8-43c7-ecb2-9ebcf066836a@amsat.org>
Date: Mon, 15 Feb 2021 13:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 12:51 PM, Peter Maydell wrote:
> In the mps2-tz board code, we handle devices whose interrupt lines
> must be wired to all CPUs by creating IRQ splitter devices for the
> AN521, because it has 2 CPUs, but wiring the device IRQ directly to
> the SSE/IoTKit input for the AN505, which has only 1 CPU.
> 
> We can avoid making an explicit check on the board type constant by
> instead creating and using the IRQ splitters for any board with more
> than 1 CPU.  This avoids having to add extra cases to the
> conditionals every time we add new boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> This removes the only current user of mmc->fpga_type, but we're
> going to want it again later in the series.
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

