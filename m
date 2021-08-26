Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9013F8AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:20:33 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHBA-0007qU-Lg
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJH8U-00049O-Kl; Thu, 26 Aug 2021 11:17:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJH8S-0002z9-TL; Thu, 26 Aug 2021 11:17:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id v10so5664156wrd.4;
 Thu, 26 Aug 2021 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3qczTlkYNnEfE7JU4pFoGNjRSeW46UIvjnt5HK+Ow2E=;
 b=d19micpkMCf9NSpDrKuVaEOeUrcZnniYOW0Upht4Kr9B1EcpiNhMb5mf1LplZXdwqZ
 +hQq87LCHWsY8LRsjGC0kUO98hgVdPh2meqPvfWEoiQQyOKxDsreZ+PCuJApOQN4RZpB
 cjqtHOzYiv+a/8jdouXRJhOCB2DwNMV/CN1rOYKX3bRB1QpdUPSb2vNKo+rrnT99XvJs
 oDmTcClWN58PMVZfGKIaOuRsoQlcUno7hOrZ3p0CCNFvSYkJ9xDxb3CNl1FMqrmgweYr
 Bd0phcu4+zg9L+vfZ068Q5QFrZXafyu7c9czx9SZhjll9UWsD2u5HVcbsq5zqRWffLXI
 EdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3qczTlkYNnEfE7JU4pFoGNjRSeW46UIvjnt5HK+Ow2E=;
 b=tR4C1qSZwyMJASK/JwPftPQotHnt1GFMHYXZbqIIqozgw0IIze3NsyzJ55yZ+uEhBz
 7z8kJtfhuPFFSI2mnCrXnPUHF5q3ar3tOquJzpeOKYukzwRWascs1/GGm+zL4aZBL6j+
 5c6IR9XmDZ28mvpyG6+QIpQmhbC4ARcY2AJbNiuXBCV2nH9XbDurIoIgr4awpJT9TjH/
 8RGRdHc/fOM1+d4Ba+Y/YQ4Fo4ZbY+qal6fRoK3tIadoysdXBhaSIKennZO/rIrXwsKY
 AOasqjXvR/GRKiS0862+bsMtO+CKWV/RoXSxryqEdEX8YSjczN+vfVQxl0QH/ri5rDZn
 dm2w==
X-Gm-Message-State: AOAM531mmb/mFjHiAfSbMV9P38tf8r/2bJ/egctDHHklTqqczYmU17K5
 uLyl95QPUmrPcPpcq83zpV8=
X-Google-Smtp-Source: ABdhPJx1tOkv0D+8QBatmsIWi3tXyace8B676R9TAxLLpZzJBCwt8S9p5YK5WZAVRwe6dsZhq8CzsA==
X-Received: by 2002:a5d:6e0c:: with SMTP id h12mr4745896wrz.334.1629991062016; 
 Thu, 26 Aug 2021 08:17:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u5sm3387509wrr.94.2021.08.26.08.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 08:17:41 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] target/ppc: fix vector registers access in gdbstub
 for little-endian
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
 <20210826145656.2507213-3-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bd79093e-1566-8d9e-fe59-26f0ef5ab258@amsat.org>
Date: Thu, 26 Aug 2021 17:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826145656.2507213-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 4:56 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> As vector registers are stored in host endianness, we shouldn't swap its
> 64-bit elements in user mode. Add a 16-byte case in
> ppc_maybe_bswap_register to handle the reordering of elements in softmmu
> and remove avr_need_swap which is now unused.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> The fix of the order of Int128 fields is in the based-on patchset.
> ---
>  target/ppc/gdbstub.c | 32 +++++++-------------------------
>  1 file changed, 7 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

