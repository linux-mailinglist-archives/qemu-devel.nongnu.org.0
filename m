Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C93C95A7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 03:35:36 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3qHn-0001D1-EP
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 21:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qGw-0000La-DK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:34:42 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qGu-000120-GO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:34:42 -0400
Received: by mail-pf1-x434.google.com with SMTP id m83so3659786pfd.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ut1jTfE4OFqm/Gf5IKrUbK6hewQf/kqpytKlUm1g2j8=;
 b=JIOYnFn9Yc6Y31f8nCIibRBER/geBG5vGC9CGZ693DHvUZe4WAI29+xyM/MoBoNwHa
 VVpUhz132sB93X/v8U0o2lKC+1BoE/+0BuHLIyBisLq6Fa6JshS640EkqY1nJ3TY+0JX
 4afIV89PASA1obYxzeRfIN+Jg2pJ+CYX8LQ6wee0iPDURc1KQoNT+VWA32np8UlrrlXw
 mNCFCyxzHvCSL+hQlDBeZ94eXR9uXFxI8/610uHPrgAL3/aJxgPKuwGULUD/CFA3kL2+
 +dGn+1pjhsMlm0icljqvj6x5tKtGhZt/Snp1nHhv/8sC8IGs3MP/WE4lnOVLKjV53IGC
 Nx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ut1jTfE4OFqm/Gf5IKrUbK6hewQf/kqpytKlUm1g2j8=;
 b=EsB/QOeWibjrso98U51YsWwODzO8KfDhUZRC19XLqwRQ8BCqZzZ2jelGH1vcGSnPqb
 MY6ACLmja+iMmXnhJnn+L6VRO29X3kqLe/dKROouE66CmdyK2QR4BPIb8syU6VR8PESF
 zzOhOpWHL1/ZvfxvSRdqfNJ9DRyBM2QXvUtaIMxzqQ/jk/QEhssm9TaGyHaIbqqakmsQ
 nlLdUmR6Xq5b/EeRSs5fXcTiWqhQSGJkZs+Bk8WD3l1UQLtJ0OPLY0n/ffY/4POKTaHQ
 wS+q0G5+8qTZg1eLkMNB287RkJpwTlp+b9LDrTWgoMwBAakH3IuOfSwQ3vzelyVmDlFT
 lECA==
X-Gm-Message-State: AOAM531tIn390CbApT+WGMZrOKsjqkLcU+9KYrg3U69PxVgYNAM4WEjC
 amMdSCBheIjv+Pt8AK7m+9PBALyaN6Pikw==
X-Google-Smtp-Source: ABdhPJweXEDwz4tF8VTId+OzZTH8uoV20n37NWnusNIZAmNX6G44FH9iLi7yAzI8deTlbhyUyg7IhQ==
X-Received: by 2002:a63:1960:: with SMTP id 32mr1149745pgz.86.1626312878832;
 Wed, 14 Jul 2021 18:34:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b17sm2147164pfm.54.2021.07.14.18.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 18:34:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 02/34] target/arm: Print MVE VPR in CPU dumps
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17e60d79-773e-0c46-5069-165fff17a15c@linaro.org>
Date: Wed, 14 Jul 2021 18:34:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:36 AM, Peter Maydell wrote:
> Include the MVE VPR register value in the CPU dumps produced by
> arm_cpu_dump_state() if we are printing FPU information. This
> makes it easier to interpret debug logs when predication is
> active.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

