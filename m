Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE61D201D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 22:21:31 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYxsg-0005E6-D9
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 16:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxrV-00041M-A5
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:20:17 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxrS-0003Of-16
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:20:17 -0400
Received: by mail-pg1-x542.google.com with SMTP id p21so225811pgm.13
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w+YXX14kevu9UFtDYvimw8YqpZbmhLFgJ74/9C4T/x4=;
 b=BXRLbLhpjdAEpounCYugUhudY7Db8hBuJtFMVYpYMrCdh2XfwkdHL1x/lyBO9c4RoD
 nPnAGR/cqBIayj+ed8IL4u59opwot4sAMy9IH8VYTN0LUALr0aMDz1uX3HbJ2N0EGi+Q
 XDzUMVeD+FywczY1/js0RTK6wfLtlXddV//3yYesBeGOzrq7Bt9yhfybYpxPPFiGFaxf
 Vki93ZVKAupQ9n89hnfAmFRhX2RQPRBOr9LTpIJocME7biD+E6GMCfSsFNOFWf1+jk5F
 Sq/7ONeIyKbaKquvsWoR6xQQZlxvlAK3H5e3YOTBCKgQc1tvid+CWcrxf+zh014OowJC
 HvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+YXX14kevu9UFtDYvimw8YqpZbmhLFgJ74/9C4T/x4=;
 b=VYGG1ri1gKCTIr5C/oGAB8ubUEpk1KX+uZMSb3OqCMbwbsJdvkqh+iRvTjm09Fdghe
 +a6n0oUtpPKjUll9/9B6YK4ur+zGDuJiwVv7xUe3oyFXZ6dhWEyjMBDxl+aLczxbuLQt
 I8BAe8RpZCk2wMOnBu/Yb7sO7PovUREimehOEYhGNkkX32YJdO0brTgycUFX8Un+7dIF
 R3xulaQhpK/J6ZoBjSsVKAiZ3l7GbkafB9QUxmleD1iIr55vFd6oZMH2GForDiUxSXIL
 Ohlg/2BC9nOPmLJfuwh39Ynra1V+XrCrgwwg1qlM2PdXt44jULsCEOozzOHVIZv+SDoB
 DyMg==
X-Gm-Message-State: AOAM532LfJDoqZQ4hUGAgGaI5Ut3KguH2OB/ierR6d0wmXoddOJmhnOG
 LqJoiQZX6tF3A+xymuTD0YmkSfqP01s=
X-Google-Smtp-Source: ABdhPJwGmsuz/8bGboh842Y+HnTWDEzAWD9MiT+odsU4RywzxA1JvpEmZx3eCVbhV64/FfedNvGafg==
X-Received: by 2002:a63:d013:: with SMTP id z19mr950004pgf.202.1589401212317; 
 Wed, 13 May 2020 13:20:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m43sm2743425pje.16.2020.05.13.13.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 13:20:11 -0700 (PDT)
Subject: Re: [PATCH v2 16/17] target/arm: Convert Neon fp
 VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8d22afc-75cb-8459-12b9-fb6938b46953@linaro.org>
Date: Wed, 13 May 2020 13:20:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/12/20 9:39 AM, Peter Maydell wrote:
> Convert the Neon fp VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS 3-reg-same
> insns to decodetree. (These are all the remaining non-accumulation
> instructions in this group.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  6 +++
>  target/arm/translate-neon.inc.c | 70 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 42 +-------------------
>  3 files changed, 78 insertions(+), 40 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static bool trans_VMAXNM_fp_3s(DisasContext *s, arg_3same *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            return false;
> +    }

Indentation is off.

> +static bool trans_VMINNM_fp_3s(DisasContext *s, arg_3same *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            return false;
> +    }

Likewise.


r~

