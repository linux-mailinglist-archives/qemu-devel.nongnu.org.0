Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CCD39C58A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 05:40:16 +0200 (CEST)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpNAV-0000Z2-FF
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 23:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpN9a-00087H-Bn
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 23:39:18 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpN9Y-00022E-Ol
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 23:39:18 -0400
Received: by mail-pg1-x52a.google.com with SMTP id o9so6537944pgd.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wfnaLuPEEPfaThVtUJBDi8gBMKeb4fLTPe3iiDSJSAU=;
 b=xGnWyKsECDHQD6m03UzkUsJy43RfYRgZnkh8Y2oBEXsTudz09EQd8DM6oxtydNJ6DR
 DENJleoTs+EIihgUCijtfitbqdni6cu/JqHiRNPifEbaTMUENN6kfPJRgHMySBCizHwB
 EmmgmVs2xvBqmvPyENAXEag47ef6eNxlc36BFkiz60vzEPdSX33SAbLABVEVPdpDBwCQ
 oDZZQHvQowaVEZiuOQ4c1nERDitntTwP0sJmaCTnk4sTFlb7Nso8m1gZKbNR+ZCay4C2
 41YRn5gHKv1na0uNuds7l02LZnjonRLvN7fpyzCGmYRyJ83g6+rBLnjepxSkVE2kCmRw
 oOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfnaLuPEEPfaThVtUJBDi8gBMKeb4fLTPe3iiDSJSAU=;
 b=spDVq9ylmivcMvMoY3P1OsrRXJ05quheQpGHbOwAuugcQUb/Yq5vciGXo8NKDx6IDz
 kKY0eXr6sSmPQpSlhzpf/ifFP1cTw+YxrQ/DJ7IhFknb6dMNoKapY0hHtZPnDwDqWxnr
 roRzvLLVa0F5Y/8klAIfZ/oWIZUXfwAMqtyMm2Bnd2M2uh6vKzyScnWmIVEaVyK1uIT+
 Anx4ll3NYRAwuuc/82vQ62ufqpEvsEGPgLiDH6eNX/JJAdRD2/1YD4Y5wOrL2oeiNEdA
 VbI11jwZqWoQn90akQhLVCcI4yPSUlfn5UubzveOOs2/fduPj3GOLPwX4YsF3abW1CRS
 tEBw==
X-Gm-Message-State: AOAM533nso1Hz/1P7Z1e1wiOIYzJ1igDSurNqwxmc0Tfdst64EaMfOGW
 aRMutcGmOzjYY8A6P9jPpOm99w==
X-Google-Smtp-Source: ABdhPJycUnc1Uom6Ne+pXT23ySe3KUidovqpYlGarLcNeFNRy+puxWF7wopEuP05iI8Fx3xlr6U9RQ==
X-Received: by 2002:a63:338c:: with SMTP id z134mr7965537pgz.167.1622864355076; 
 Fri, 04 Jun 2021 20:39:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s20sm5942589pjn.23.2021.06.04.20.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 20:39:14 -0700 (PDT)
Subject: Re: [PATCH v16 54/99] target/arm: move TCGCPUOps to tcg/tcg-cpu.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-55-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7d172e8-9602-e150-296f-1d760f5c6b38@linaro.org>
Date: Fri, 4 Jun 2021 20:39:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-55-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> move the TCGCPUOps interface to tcg/tcg-cpu.c
> in preparation for the addition of the TCG accel-cpu class.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h           |   1 -
>   target/arm/internals.h     |   5 -
>   target/arm/tcg/tcg-cpu.h   |   6 +
>   target/arm/cpu-sysemu.c    |   4 +
>   target/arm/cpu.c           | 210 +---------------------------------
>   target/arm/cpu_tcg.c       |   2 +-
>   target/arm/tcg/helper.c    |   1 +
>   target/arm/tcg/tcg-cpu.c   | 229 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |   1 +
>   9 files changed, 244 insertions(+), 215 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

