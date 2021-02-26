Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698B325FAB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:11:47 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZ9z-0006OA-9y
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZ8N-0005Im-BS
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:10:03 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZ8L-0006wa-7G
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:10:03 -0500
Received: by mail-ed1-x533.google.com with SMTP id p2so10020193edm.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+tzFv/3QmbVnd211fjWRcjwYcmwCV5SQK708+irMAMI=;
 b=rFzPe7TERgbIlAlQ85MwUOGSJufLfpiBvmfkQr1bEPOxN2tA2FKdOhI/WClJPl6HTt
 9fWawfRQO5cgBpGYZmEwCTvjDMFnbVt893ZXZaVAkAReQ2T645KbVnERCcPI1rDSrkzD
 xVS1jDTjWt/upSGa3BQnecyg+8927ZlhGzYeDVHBVu1kDHkgNR6QoYvVfTMZvOkUEiNy
 2AlrPGAFqikQXGtgLGb0PGxLY0hphzUgWIYduGg5AmGC5sMQBjPeiMpC2hJBiOZAUw7m
 S0+Yq95TzjSg4EfwmQ60ug13FlpyCVI6UwBQjX7I2GiaUVx/nk8fgducQ1W0PM3fYj7v
 /NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+tzFv/3QmbVnd211fjWRcjwYcmwCV5SQK708+irMAMI=;
 b=SunxkGHzWgkx6JRsFqVnzK53nHBPnNa1fQBaAnnN4FNC83bTUDYurcXYh/KN+chDyT
 eewQ0uvGG09KQ5aTECgNBNnt9LcHE8ZHcaWh/ZuCZMEkSUEP0k0HiHvWnvWXdsakzHKj
 G5E0yeIav3GahBwZj+EtQwjYJSyazxYdo9952fFNLxIrs4W6zwwflXnghYvaOS8vNXiX
 XeWzNqHuGuThsqRD684z/Rpeu2X8LTUyu9uVmvxSoENpscrsv/zS7S8usDcxb4wcWXTh
 KreycH6qE+LzNFGCU6lMPcEvTm17y/WRJPk10V0brVYseXgbf4WgsdBGRxGEawd/C2pf
 KayA==
X-Gm-Message-State: AOAM533cxRx5qaOaMMumT1QVmoDoRwuBtcLsMnKdIsE63hqXGNNy21L6
 vgZZMATcnY1NQuv5XjHWm8E=
X-Google-Smtp-Source: ABdhPJzLm0/2vx/57Da5HLbCsLgcynUJ7jJtX3wa6bSJC841RItcPU7P+S6F8LBBLFoYsHHzMpJX7Q==
X-Received: by 2002:a05:6402:ca2:: with SMTP id
 cn2mr2210524edb.73.1614330599647; 
 Fri, 26 Feb 2021 01:09:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm4750195eji.49.2021.02.26.01.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:09:59 -0800 (PST)
Subject: Re: [PATCH v3 05/10] target/mips: Extract decode_ase_mxu() from
 decode_opc_mxu()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-6-f4bug@amsat.org>
 <dbda3d40-667e-5687-304e-8981deb146c8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e39f648-2a53-28e4-e557-d06b3657730f@amsat.org>
Date: Fri, 26 Feb 2021 10:09:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dbda3d40-667e-5687-304e-8981deb146c8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.435,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 2:25 AM, Richard Henderson wrote:
> On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
>> To easily convert MXU code to decodetree, extract decode_ase_mxu()
>> from decode_opc_mxu(), making it return a boolean.
>> We will keep decode_opc_mxu() in the translate.c unit because it
>> calls gen_arith().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
>>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> I guess the split is fine until you can just call gen_mul() from a trans() from
> the mxu decodetree.

I expect mxu decodetree to not cover MUL and return false, so it is
handled in the base ISA decoder.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks :)

