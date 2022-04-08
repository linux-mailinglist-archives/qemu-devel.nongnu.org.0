Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE84FA050
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:57:34 +0200 (CEST)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyTt-0003hf-IO
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncySV-000299-7k
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:56:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncySP-0001nW-Oc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:56:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso13256911pjb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rvj7yn3E+3Z4gN1K9DYCOb3LutSsLjcM92NczOTDcdw=;
 b=dKOG6y07a7QFSU7JLyuf6sSyMlghRo4fP7JKW9XzzP6GzAsL1GQU1/TLXWCs0zbVtN
 /d7hnnuAIu+wZcL3BgEKeWbsf4FMv1gQ2fBCoZaSznoGqYG7C7YQ51cRVmcLITxC3ms+
 xW40Acyp1qUwrB6sBqnEsERqi+FhntBkgorwha1WyBh0L98hl/yQIGxF2J/kg5ekpNhq
 KqEVpI1u3fm2jSu077XgQhejEYKJjsoiN+xOmqSNTu6fnYx6E9E0N15I3j4g1rnsG6X+
 gx6IXDt48Ls4tUsECqxWqxaBzVXJJaTU2dPCFRnr0IdalomHXVyxzjziVcdOrQTqdfYb
 US1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rvj7yn3E+3Z4gN1K9DYCOb3LutSsLjcM92NczOTDcdw=;
 b=U7caMKiM0j3/HCaqhy2VrY29TTNu3X8RVjurSQYCWjU6B0ml9sPASN/3f3eGlaKsVc
 n4J77YM5VWjLvME9xPq/+ALRJqWI0YHx1nFug/VlnxXSplbUBEx8tTmShnoibtJw3wnQ
 bPxqn1Q80pR842zDUYavOszGJzvhkROTJrF1xDDYAEod1dwTa6SnjHxNDH5y/ZYilVeW
 EdWvWzCOr1MsuyYWzUZvuFrqB2URmyZSRg3UyjCR0HstwIw2b78fkgX98wzwa3gxtjqg
 ryHTqTniM1x/yDvMSLDsjK6zCu2cW29cci8dG6dit/IK9JWFZ/XditdrpxdwokLP6mzh
 Pi1Q==
X-Gm-Message-State: AOAM533MC2+P+N+vWJbdkc5sa0Btqn7lntbKYQCc1gMb+E6uAdGDz+++
 NoUKElfACeqZQ32uZEC03wTX7w==
X-Google-Smtp-Source: ABdhPJyH5hoEzygX53lYhPF6ReYTrdSj6Iwz4I6ECd7qDaH/x/A4ZLmferWK5uXrvX3WVZ56yR445A==
X-Received: by 2002:a17:903:32c9:b0:154:3a2d:fa89 with SMTP id
 i9-20020a17090332c900b001543a2dfa89mr21493910plr.3.1649462160160; 
 Fri, 08 Apr 2022 16:56:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm14480641pjb.57.2022.04.08.16.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:55:59 -0700 (PDT)
Message-ID: <a218c739-e6da-ba5f-07f0-5f0a9af4dfad@linaro.org>
Date: Fri, 8 Apr 2022 16:55:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/41] hw/intc/arm_gicv3_its: Implement GITS_BASER2 for
 GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The GICv4 defines a new in-guest-memory table for the ITS: this is
> the vPE table.  Implement the new GITS_BASER2 register which the
> guest uses to tell the ITS where the vPE table is located, including
> the decode of the register fields into the TableDesc structure which
> we do for the GITS_BASER<n> when the guest enables the ITS.
> 
> We guard provision of the new register with the its_feature_virtual()
> function, which does a check of the GITS_TYPER.Virtual bit which
> indicates presence of ITS support for virtual LPIs.  Since this bit
> is currently always zero, GICv4-specific features will not be
> accessible to the guest yet.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h               | 16 ++++++++++++++++
>   include/hw/intc/arm_gicv3_its_common.h |  1 +
>   hw/intc/arm_gicv3_its.c                | 25 +++++++++++++++++++++++++
>   3 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

