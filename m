Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD536DBC95
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:16:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plE2O-0007kg-GX; Sat, 08 Apr 2023 15:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE2L-0007k9-IL
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:15:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE2J-0004rc-UL
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:15:45 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso10077950pjc.1
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tgbl4+mOHh+fBaNlvF/iGh5ZJyDPrDUKY85Ht2AqUXw=;
 b=uR3QaMudSD3194bwFzFpHqgCFrDfiIBS2eortpnwDkj5nLwPs5cQgcXo7va8qfptqS
 7LgVEHvpXwM5sC7Kq+Rmsa8uuucow6KeEqjbbEiTJ9RHXOwAk91GB+oCne25m1S+fY+o
 DLfDCAV5/nlCL1jGEzbSVDALon7/b5099sgANCrsEKje72Lx817DmF/1sJB8rFPYWh2C
 UL5Ql8h+8MyFcu1vJxDnvnTi1lyDQrPZ0ApqlYQgY/LTt7I1M/nHEeXWdHEMdIyTn8gm
 TcExDwUX7YVc3+sxaF1yXQXytqOp4Z7hTzNQRF858a3KUs26bAbP0F+QqObDnyCvbcmr
 9Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tgbl4+mOHh+fBaNlvF/iGh5ZJyDPrDUKY85Ht2AqUXw=;
 b=hEVAJu1nFc8ASGHhNKnUXB0Ud2ivfn1fzyltXH3xohQMD43vFedMx9bB9CbtuMXiBu
 twujaCfd2Z1ZNIQeAusK8uwlqQZWHL7/GL6MKYhLXITl9vDqUlzzVAxnuMB77kr6em9Y
 ISQAS7ddtIx4oa/fDrH0jBNvf4+aMj75wiu/KTEqOPhyDZ6HcMHjvrwoR02XNQe4WCO7
 fLwc6fXq21QfByJynu7ESftiEe6o2ipvqomf9p1cgvIJcHNiPJDtkia5i9tnlWUPGf2r
 DmTqpmHpEndszSc7zv2jBZufPApn2jk3jOidqb9xHhcCfn3JzRGAz5caqQVOu6AMzgM4
 Q/bg==
X-Gm-Message-State: AAQBX9dnrMvZuF25Wg29D1YfuFs21E0R0ED4ougmd1om5mN8k44CtXEI
 Z+ZLtMagXNjmQoEVY3i9X+YBig==
X-Google-Smtp-Source: AKy350bM10pEWdEX3e6iEzJUyTKv+F7yMcx/0QCaVnpHs3m3OAyNbpnCUhg8V6lUb82FeTigINCJRw==
X-Received: by 2002:a05:6a20:1a89:b0:d9:e6a9:d3e2 with SMTP id
 ci9-20020a056a201a8900b000d9e6a9d3e2mr5750503pzb.3.1680981342251; 
 Sat, 08 Apr 2023 12:15:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa78111000000b005825b8e0540sm5054909pfi.204.2023.04.08.12.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:15:41 -0700 (PDT)
Message-ID: <e2ba5c00-1d13-3df9-240c-1ac231ddded7@linaro.org>
Date: Sat, 8 Apr 2023 12:15:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 15/16] bsd-user: Add SIGSYS to core dump signals.
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-16-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> SIGSYS creates a core by default if uncaught. Follow that here. Sort
> with the same order as is in the kernel.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

