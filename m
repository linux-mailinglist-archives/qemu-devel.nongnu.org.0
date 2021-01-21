Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103092FF72B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:35 +0100 (CET)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2hUL-00062I-MH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hRP-0003sN-VI; Thu, 21 Jan 2021 16:24:32 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hRJ-0008Lw-1e; Thu, 21 Jan 2021 16:24:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id f1so4181787edr.12;
 Thu, 21 Jan 2021 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ktvptkmbOc3LIbss4D7YnGlDoURR3Z5R/uvzj8wLRmo=;
 b=RaXIuUyGFX5Gw1vsS1n+9F0BLKVyZd2K67doAEPdhZTrD+J7PuA+iBXpCRkPhcMP8b
 h21r8F3/+wz2vdqBGwtXP5ss2XVNURIFOiem8FBPTQ1Mz8dDHb8hi4qY3cRU9gqT1ujQ
 1ij1Sid8MtU+GcU3axeTMbxiUi+IN+I2GjQK0IQEg7qCgiyaNSskYRFaPrdZvmwb2SWs
 bhvwiIhhItDdLJQlJwIpoJyeH7GH49uSB0S1jtpf34NPbTHvFuhKQUxXeCzLe/ZhMxVj
 L6GvaNzOctrlsetOFgMd2fCFKMqjuvzXqByb+6LE3IyC7wALCDQmQblUlHUpX7/mtXS8
 EQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ktvptkmbOc3LIbss4D7YnGlDoURR3Z5R/uvzj8wLRmo=;
 b=qzCvmB9IrQN+hJfEwYv35rrYeVRiOUZlMrflf2Mu49m1lJhtVX4wy6KmlyLZ/qosov
 3oGW6B23Fwit9ZpbBEyimrz45FymfLLW9urLv/2S+POyzMt73ldYfXXbIpFa8FJP76hW
 GOfXXsoTXYMRUS9c7xre6MSSmy10hDgxR8Oi0fPEvZkHKSTYIHAzPyqd67CO9grOHiub
 er3jGra4g7yKzFTEivYRCk+rcCgEeftRnLvZmTtwCy81stB/iRL6yTu+jk5V8BMixqSQ
 231ShPdC4LqUw+Wn/TbKJ1lTsvGOY5cWzlawS/BM8sigahmz0cT7aGG1jM81b29tk1EN
 Qllg==
X-Gm-Message-State: AOAM5315obWrDBdB6QnrdyUEcIHEMRlfpXlM5B6yV1a6JGrH/hjv8wOL
 2l7UFZJDI9nLkl+jY6IlxGM=
X-Google-Smtp-Source: ABdhPJwOJweMjI7v8tg5UlASyVHqf/ik0blB6ehVwLDQ9dFRDpxSXOOcXPl3Im6YToVyPNvZkRq6qg==
X-Received: by 2002:aa7:d148:: with SMTP id r8mr857092edo.127.1611264261523;
 Thu, 21 Jan 2021 13:24:21 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w4sm3460329eds.40.2021.01.21.13.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:24:20 -0800 (PST)
Subject: Re: [PATCH 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ded564bc-71f4-c12e-ed66-481a2f2bdda3@amsat.org>
Date: Thu, 21 Jan 2021 22:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create a fixed-frequency Clock object to be the SYSCLK, and wire it
> up to the devices that require it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

