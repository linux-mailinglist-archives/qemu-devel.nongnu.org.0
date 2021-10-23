Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F7438588
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:26:22 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOWz-00070F-KC
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOVS-0005wL-3C
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:24:46 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOVQ-0003ht-36
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:24:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id s136so6796420pgs.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d5ilpV4MWEuB5Ux+mSUHgH4bHug0UH1IGsysTdYg+vE=;
 b=Q8Dwbk6lYV+nwZrzpz4frSWtTH9B6DcsSeR3ScETa4o0SCBwdB364i+KUdaQiaDYhd
 XUGNmNeryXdZComqoxpH8sSJvqnNR6vCrnZu7ryEUok0wHg9z0k6cPMLjGlycxCh5lrI
 IRvGmUuJnV0s5G4as0JS0nzOMbCdQA6SHIcipFjNwZGURF96+PXtyR6QTJOEtziV3tsw
 p+UmcqKIFxYRCOCM6fwciIU2UJYhWBuo3aBBrd8xEU1ADT7j6j+pGQ4ZoVjKO43sZozY
 sn9APRGzFrtws3oY2vCFax/IR5ySYsVx3/OYnMHEGlA0CWr+BdBHRARarj/T0g84lpHS
 eqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5ilpV4MWEuB5Ux+mSUHgH4bHug0UH1IGsysTdYg+vE=;
 b=NxWcuiPMo9K6ct+gxa+63jvoidYPh0tZ0xy/EwdhEVxJEW+axXyG0vsCNCA38nH3Jb
 L/UMVo35Ft32uXWXXdT7tiDcBUn+Cbkl2GNSzOGqCLeMrH33pEHUWuW1xrk6AUX2MhQ3
 R8Go1RMpqN/LZuOROvn5Nm56Fu8kunOgMOvU7ijR/MDvXaC47zQMZw5KwExYUFId7JnN
 +H98yKDOPkXDrCQRdQ+9x5Auvz2t9puHQb79C8kZDWBkdbkMoI8JN72YuuQb0g7hQ1x3
 j6X1VbDDzWjJX6XyY1vxfAR6q4kanwq1hd0qr2JkZOeeWUN0riuNmCu1EJk65atxARCI
 ATQg==
X-Gm-Message-State: AOAM533wMoKLGiMRr72mP0/XwgUlVXwB1YxYLO5VuSLZhZNwWzrowRMQ
 9KZWZcx184WNDLtloOh4Tm94QQ==
X-Google-Smtp-Source: ABdhPJxQT6Nbrpo15qeRy+j1LR3SG6BpRL7Ihc5iuh85e2HkINwyB8qMj2Cplp0DYgn9un0T682xzA==
X-Received: by 2002:a05:6a00:1781:b0:44d:faef:f2c0 with SMTP id
 s1-20020a056a00178100b0044dfaeff2c0mr8493946pfg.68.1635024282434; 
 Sat, 23 Oct 2021 14:24:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id mp16sm13790082pjb.1.2021.10.23.14.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:24:42 -0700 (PDT)
Subject: Re: [PATCH 32/33] target/ppc: Implement
 xxblendvb/xxblendvh/xxblendvw/xxblendvd instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-33-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcfe84b5-fb8d-588a-9363-e9378c60ebbe@linaro.org>
Date: Sat, 23 Oct 2021 14:24:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-33-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, Bruno Larsen <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +++
>   target/ppc/insn64.decode            | 19 ++++++++++
>   target/ppc/int_helper.c             | 15 ++++++++
>   target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

