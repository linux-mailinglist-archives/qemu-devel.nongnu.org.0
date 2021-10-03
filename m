Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E341B4201CB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:52:20 +0200 (CEST)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX1ue-0003vi-0c
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1sn-0002QA-BP
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:50:27 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1sl-0004lY-SV
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:50:25 -0400
Received: by mail-qv1-xf34.google.com with SMTP id k3so3871591qve.10
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2pGvgVFzyjmU9RyW+GDQqG6kVEMpC5WFycWFr0uKkEE=;
 b=q9ryXYb8ZD/mwHMs6qzDGUMV1jrFSa+PyNqC10tfI3scIC0ZA3xignvaEBIfGBih3i
 1Sny7hsjDCXZnJtuBK8hfSrptqB4eEfPkG/3imK1XrPzCUJS3oa6lv6KVGt9DsICEpRb
 qRYmdRdj/PGaKOhcBvSv/JBS9PpZfNum/Hn9COS1OrCQAi0FdgYtYzq/4taYTx3Wizjp
 YWRU54y/clV8GKoymOAoG1B558xo3AM7R6W68k75vmTxVtAmAUec5t+EMp3UrbXcTzW7
 Ry5hAFRrC6peDt/kJigpp4odp8rZpyZ6EN7L8q7oxlHilLKtiLwXK7YaVBR49+tuRB82
 Z7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2pGvgVFzyjmU9RyW+GDQqG6kVEMpC5WFycWFr0uKkEE=;
 b=AYjiJU6AiTeudfBnMUeCQ0xWq4TZ0vI9p7UOGPSdDDRi5m3ifT+IfPdDZApiYvEqbk
 QFSg+vi8VdtG3veuOkbrHhHmT7JMMSjodBFmZjSGE/YFSMMbDyg9hK5xBJmH+lG7mjMI
 xKu++wgY3C7LZsFdp94MR78n1qB4ybqSV1ILXVdZjmroWc2EDX+915uP+YkZIxfWAsXC
 1/itjs5PbQySzel8w7kbXwfAsO1oBMFYQ5foS/aA9q2vqswJ78EC4eLXUFUDdLnN68Cq
 XQ32bBaMI58K6MO54jA5UP3KrQkDO30IPycPHo1CnV+/Sh3o6k2mD/eeW+riKtCW17SJ
 u1xQ==
X-Gm-Message-State: AOAM532lLP0U5a7jkTcaBygYDPlXIiHqKedTsBQmfrDT72aQYJIJZRsI
 LQ46051Yrjbgk8sEADcuDdvibg==
X-Google-Smtp-Source: ABdhPJyi1OZhLPp5aln53KTGQLTWLA4os2FctHf/netdTFOBVzBUAffz9LZUY0BznpJD3iCsfpnn9Q==
X-Received: by 2002:a0c:85e6:: with SMTP id o93mr18296871qva.16.1633269023055; 
 Sun, 03 Oct 2021 06:50:23 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x3sm6023349qkl.107.2021.10.03.06.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:50:22 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/nios2: Use DisasContext::zero constant instead
 of temporary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002233054.3575646-1-f4bug@amsat.org>
 <20211002233054.3575646-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e475b6b6-082c-dd11-05b8-83461d632b93@linaro.org>
Date: Sun, 3 Oct 2021 09:50:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002233054.3575646-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 7:30 PM, Philippe Mathieu-Daudé wrote:
> We already have a register holding the zero value in the constant
> pool, use it instead of a temporary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/nios2/translate.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

