Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE630EAA0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:06:40 +0100 (CET)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uyd-0000Eh-UC
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UbN-0003cs-K2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:39 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UbI-000496-MG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:42:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d13so971888plg.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2stxClLfUHOMlo7FUTnx8oGJTYWIwPVmcmVQHfYXupY=;
 b=UGEiHY3Rv9l2z+u//TS4FmbWHfPkEI67Afz9vG2eZDxx1TB31LUK/1W4/RbVt7iZYr
 FXaXuiAgnw26Nl2v7UiPEZUJk2vDgKYXJh8Oz1f8ryWa9WfUN037moyQ27sn/mwO/zX/
 +74ZzEj3QIoYZFFpZ9jDOKaGACcbOOKNaX3Jwjdc3Xx+H5LbAhGig0iMe4r+JzpiLFKO
 4EjDwpj6HObc6dHmFurquUhX1QHHKAbfpL6ccCrsPN4xzw/r3SVWEGMbLja7orNZM9ri
 Fke4AbiVrtxUv9ltUC3tUHFv02t9QHXBiIb8ahgajw9dYI/5214ne4fz1tLxzR4oLbvZ
 QB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2stxClLfUHOMlo7FUTnx8oGJTYWIwPVmcmVQHfYXupY=;
 b=Jw99EQEGJWhtb++ZA0lL1oDNqYc0opqVo5n708wEM3nRioyMmMD2pWqF2n+JU4CF80
 w6JWzim/nCteWeOVZ6v/fYhiNqeWV1Ln1I9XfYSdtWeFQ2dsCd198lgH2CZUY8Il13bk
 R266tcE8RahuAt6N1w0SfVKLOHGBlDMUjBJJFhcHMaEVt+OAw99l1gZbQxLvZSM2Lq4b
 Zzsjjs195Nbdv/ceFT50ZyC+PGbzmIlCsid+slaVWV+djAfCKtBqzg34S2yYnWDYpDu8
 QxDWio08SQP96Kw1E2KAwgRqm6wLeLCzGmrtTQSQ4y0lTIm11teb9crEi6IMGS83ndyr
 94WA==
X-Gm-Message-State: AOAM532PBNSjM7bUbwk8lPA8YQ0k3+j1Jr4uQGpTmeuO3Mr0+j8PVmoa
 N7qn/PLeuxY5tXTu3KTTPQ5jNA==
X-Google-Smtp-Source: ABdhPJxJSlrP2lOplMThIieFK0YVtFtmroDm/X3C/+rVz7okF1J4CpqdPJpaOY8Mr25JwP7ZwKa7FA==
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr6021201pjv.173.1612406551289; 
 Wed, 03 Feb 2021 18:42:31 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h70sm2502538pfe.70.2021.02.03.18.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:42:30 -0800 (PST)
Subject: Re: [PATCH 4/5] target/sh4: Let get_physical_address() use
 MMUAccessType access_type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127232151.3523581-1-f4bug@amsat.org>
 <20210127232151.3523581-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83cb4b99-701b-8bf0-8ab7-578da31f1e2a@linaro.org>
Date: Wed, 3 Feb 2021 16:42:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127232151.3523581-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:21 PM, Philippe Mathieu-Daudé wrote:
> superh_cpu_tlb_fill() already provides a access_type variable of
> type MMUAccessType, and it is passed along, but casted as integer
> and renamed 'rw'.
> Simply replace 'int rw' by 'MMUAccessType access_type'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


