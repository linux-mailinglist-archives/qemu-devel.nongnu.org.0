Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F06D651E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:21:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhWF-0001XQ-Ri; Tue, 04 Apr 2023 10:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjhWD-0001X1-6n
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:20:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjhW9-0006EF-TX
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:20:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id p34so19127404wms.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680618012;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IoZf8QFh2RyHinUwmccdry+SAgdJYmBRD+5dvOG466I=;
 b=YG3QxEXgHQBiLM/Ean2mBxDNO+rDcvKXyep/O2y8kkLE2DtK54zFrxSJy2QPldLvJk
 u2naMTba3qzanacIrpzIDRCS1k8/lfpgdioEmPfSTVxCzBv9G224Ttwo09jhxgoBlhYE
 wDwe9CdVbw8QMBiyQK377VMipKOO2fFcf76I1r5Zjn1YI5FfOI1vzu1xi9A/9RKJsQRi
 jtBbpUDMuxdVP52F59eLY13qYsC5HgD+4oqD5+xj8Ekj4+lpxO6m49U7yz/JYga78n+D
 yK2KmrNwUrlWGcYZoD6ZPZbaSl1+xA7EZPL4BlzAbmQsVIMCAvedO/73DHFTDPDkoHAR
 IKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618012;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IoZf8QFh2RyHinUwmccdry+SAgdJYmBRD+5dvOG466I=;
 b=xSAE/hGzdsS+KRcSRUKKQRa2emvF4v+gzeDeF75JIkAGvS/JIsvQExL73u2KJ9hnSe
 LdGTqAuheoTGpJlM7PuJTfukinYIvP2dSo0VIj198lg3GjeAue4vN6WIa4nn1OhkeEGX
 jV+oBEIIBls32L/j8e+wVt6ImDCvifolHcoaLNlbD0jFyeQYk2pQ8XzjhElWLsArSCqb
 TxyJU63xvXkNlzHJQvDd7ov4a2Qpb1NuJXjTP/sLK59kmn9zpezTCMqSm8STAgB4qpq7
 yw+LWOhZpye0hbcABNVyKkG81Dux8kEjHrRGE/A5F7FeuqxqP7BpY/xfIzik101IwGmR
 cKRA==
X-Gm-Message-State: AAQBX9c11TdwQ8t3iDo1fH0lQdXKZZtElK8RbUebMdTRpvQKia1DJPq0
 /CtG+p/seCDdDSiL+TyteuuvFw==
X-Google-Smtp-Source: AKy350Y1UZIdJgPsyXBYzMB7uJiCr0BiS6w9UUXJwaRxRyDePoaQsnnppkImqfSd+oRg4gkuFbI9Ww==
X-Received: by 2002:a05:600c:291:b0:3f0:310c:158 with SMTP id
 17-20020a05600c029100b003f0310c0158mr2332250wmk.6.1680618011729; 
 Tue, 04 Apr 2023 07:20:11 -0700 (PDT)
Received: from [192.168.69.115] (gra94-h02-176-184-53-13.dsl.sta.abo.bbox.fr.
 [176.184.53.13]) by smtp.gmail.com with ESMTPSA id
 x4-20020a1c7c04000000b003dc522dd25esm15273911wmc.30.2023.04.04.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:20:11 -0700 (PDT)
Message-ID: <3eaf309e-8629-4e1a-b713-cf6aa8c8991d@linaro.org>
Date: Tue, 4 Apr 2023 16:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] hw/intc: don't use target_ulong for LoongArch ipi
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>
References: <20230404132711.2563638-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230404132711.2563638-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 4/4/23 15:27, Alex Bennée wrote:
> The calling function is already working with hwaddr and uint64_t so
> lets avoid bringing target_ulong in if we don't need to.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/loongarch_ipi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


