Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162016AB6D3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:15:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ53r-0002Ll-Sp; Mon, 06 Mar 2023 02:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ53g-0002KP-Fb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:14:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ53e-0006Bo-Vx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:14:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so4565159wmq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678086892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w5xU/bX6l5z0/Oz1Ce1zQckYIzWKHu8C2uSJPMbuml0=;
 b=naw8Rsi1aJS8t2O1dQ78WY2wT2ZLpMqsiEYr1x2XJUxmTBsf5ptyKCpXM0T1bzu1Kd
 3Z5R/3+ieOukLnGDYgj+OwP1pIq7RgGarQLx/uAnpGOucHEcb+SDKGxm08Xa/YcEopgL
 NPrIhhjh7fY4PDfJQTGYc6oljL1L2Ziq15Ge2ESpJWg1O/c4lc0JKdoJBIenlvidKy2P
 IYz4oqEeYiErGjC4zVI57dVdX5YrhAq/9aa52nE6bOMpLwrOs7KxE86HuViMlfkE/Exh
 R/qmGXoS1/+3vguUBbj+ZYI+NLHM0iblKmKC2th1Gwu6JhhWO0bXfcnIoRqDYTKL6ZnJ
 cD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678086892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w5xU/bX6l5z0/Oz1Ce1zQckYIzWKHu8C2uSJPMbuml0=;
 b=eIRJa5t83G0raklU5z5EdGFAdpdcVglUYj/lYiFigdeSMZeYrpuMwi0FRef8Gzj2f2
 3lG5aRLG154D505LbgCttcf700EyMocpSSn6cpEqNIIqDzAVLUKbuCHwJy9Z0GreCpfs
 KBSGu6033wwIrNV8sl10hD919x3RV0+IXZoflHpesCQVBIVQhtTBOf4bVJFCURLjuTj+
 0tSDEDVa1u7I8f/xm4ZLtQE9Sa4vbBeayHtCPtJv7uSLOV9nkkRd08vesg2U5bnUbbtk
 BF4dPX4qkmHkEl2IrH+jUoJRdkolUbbzDrILIDkz0vZdM+LeZ3gPATasatLFYsPxPll3
 puhw==
X-Gm-Message-State: AO0yUKVwjgALJcpQU0Y+mKZqggPrQvP5daixVqVrnrBB9mggmcN5nT9S
 QULwbcL0+Aq72/qkNnLsBsdfI4ImhzC6YQkx4DU=
X-Google-Smtp-Source: AK7set+HfYFjiDENqtyxXvDcufj9BKTAsMz27mzYc9dRf0UcvWFLtQIR/+JijDfiC0p27Pl8MUGmEw==
X-Received: by 2002:a05:600c:4f4a:b0:3dc:4042:5c21 with SMTP id
 m10-20020a05600c4f4a00b003dc40425c21mr8459201wmq.6.1678086892444; 
 Sun, 05 Mar 2023 23:14:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003ea57808179sm13037303wmj.38.2023.03.05.23.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:14:52 -0800 (PST)
Message-ID: <4e19a337-9613-8158-426e-ed0cfb4a186e@linaro.org>
Date: Mon, 6 Mar 2023 08:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/5] tcg: Create tcg_req_mo
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
 <20230306015710.1868853-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306015710.1868853-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/3/23 02:57, Richard Henderson wrote:
> Split out the logic to emit a host memory barrier in response to
> a guest memory operation.  Do not provide a true default for
> TCG_GUEST_DEFAULT_MO because the defined() check will still be
> useful for determining if a guest has been updated for MTTCG.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h   | 20 ++++++++++++++++++++
>   accel/tcg/tcg-all.c |  6 +-----
>   tcg/tcg-op.c        |  8 +-------
>   3 files changed, 22 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


