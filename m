Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426F69843E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNEZ-0004CB-Gl; Wed, 15 Feb 2023 14:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNEX-00042o-1I
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:14:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNEV-00020t-8t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:14:24 -0500
Received: by mail-pf1-x42c.google.com with SMTP id bt14so6571357pfb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JzlTGdLINq0yOvGPVenTzXexsCw/1F4EU8ud8g2TaGA=;
 b=yir0pVCZ/4QHS4sCc6N/ldFIXcPyxBR8URC4DqjsKmZODGX9zB7CW1JlSxAZU/0wlv
 k1qGZF0l4xZc8uagmfWHWNwe6+KIBr1iI4kTXjTypKHFSgystpRgE0WgTG4+eDyPvrk7
 d79PC6PjgrQuGIGXp6b3iI+AAFaqiETRcKVKMlIOwBzUJMeJfHD4ywDDa06OQFbneug7
 UQpnEobTytY4jWYQ3kVEtTLSTAdCG2zYgDeXExqz4YbwdTxD5sSRXuXkdukHnySyFrIG
 22hA9igWyBnTYYffX1Ygn3FL0a3jkg0kbGNav6i5azLkpujHCVPe2TaIQnDN46xLMrJQ
 22pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JzlTGdLINq0yOvGPVenTzXexsCw/1F4EU8ud8g2TaGA=;
 b=N5L0mWQPstlTFpr50JSYzbLCqs0aZB90HmFsx5/nVX6Vyrwrgcvf4PbPEbx3BGkCgK
 Eq+fnKRzkDkM2KJ2V9DAR+UbsRh0BW9s1rwW6myv1GSJKEv1b/T5P46lr+VmESzcV/Wz
 O7BFqjB0wTCrrTxzopKs5iVoZyTppboz+np8Ga8Q2NjRtIaRKcqyfEsLWTiGR3vEsCED
 RjO/PaKoEJogMhFe/ZcRdHOqzxiKb2xrR3P5t2E8EKOQNkPypEJUVQmwfbvhceUREQY/
 JnVvxpfh/d3xlYt0ZF6r9mqjBKvT/ktDIxwsTULfMzF8kaeUm1HzP+yBRboQ5ZlaAliS
 hPWg==
X-Gm-Message-State: AO0yUKXvAzhF70BabGfMWEALSzoHS/O0ddvqkKwxE0rB1tmOYk+tC+et
 FzSNkgpbYvvQZdnxbjzMP3kASA==
X-Google-Smtp-Source: AK7set8Imu6ZD2UAhTxnjLQhZDAIbdE+80yhNKM2OiwO7BJusX3qlzkJ6CtDK6GNY2kLQVkDKjcllA==
X-Received: by 2002:aa7:9f82:0:b0:5a8:58b5:bfa8 with SMTP id
 z2-20020aa79f82000000b005a858b5bfa8mr2476733pfr.12.1676488461783; 
 Wed, 15 Feb 2023 11:14:21 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 c10-20020aa78e0a000000b005898fcb7c1bsm12448560pfr.177.2023.02.15.11.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:14:21 -0800 (PST)
Message-ID: <5a547c81-1b89-b833-cbf2-a9f689cf29fc@linaro.org>
Date: Wed, 15 Feb 2023 09:14:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 13/20] hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-14-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> ide_exec_cmd() operates on a IDEBus; rename it as
> ide_bus_exec_cmd() to emphasize its first argument
> is a IDEBus.
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_exec_cmd/ide_bus_exec_cmd/g' \
>          $(git grep -wl ide_exec_cmd)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ahci.c             | 2 +-
>   hw/ide/core.c             | 6 +++---
>   hw/ide/trace-events       | 2 +-
>   include/hw/ide/internal.h | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

