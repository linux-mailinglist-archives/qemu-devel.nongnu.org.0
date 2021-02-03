Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CE30E0DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:23:58 +0100 (CET)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Lsj-0007f9-NQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Lmd-0001e2-9R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:17:39 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Lmb-0003E9-Ba
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:17:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u11so204311plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3dzmFVV6AK0Gvq8ojsIyTC5rI294pCEvIhGJ1CHBz8A=;
 b=MzoaEPk9Q+UjabKIrky9Xlm5X2MmcY9CFbsCpPsl0KOZ5Zwa0koRhL1N7NjEwBYMrf
 ojm4uXex30q04gvIJC2FmPsrbVRC57QJqGVLx3nyJLBwYzwZKDi7nPEEApKxcaVpTgHh
 15/MXZaGAx5IY8vPXVApLT2KhcDyYbMtOIb4O1B13EL8T87a5bb9BFnKpU53xyEviyxu
 JotZxT4IZzsSHNu1DLxIdrsThhsXcuq6dEpyv4JMjvCHaP6HL2A0hYtiAB+vxNA8R0fi
 Q058OibesMRHb/ybXLtp/QZZjH/q8wQ215UqrNPiki0ACilbonuaC2abhBQoFc65YI5y
 oMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3dzmFVV6AK0Gvq8ojsIyTC5rI294pCEvIhGJ1CHBz8A=;
 b=Tw7VZebTD2/J0MUwCi53d35/xexbjtWiB7gnelv3/92Ts7a7k8Yh9pKq0HCqZgZzKv
 6GOVG4f0IBk45P7JoQwO3MTTge4Cbjr7a2p6QTzzfsW9r3oAqxfOFkyZHbdO8avnpXSC
 TQU8QxsercVmXcmU/RrPdqrv/fmdz4i0hao0NmbT/iZi2s5DKVRNApfghnUVQQ/lUz8y
 O5KF734DMEEMP9266GwkeSkkcwCS4ec6PiofcKPle+BzpgMJN3DDt9Uv0vAxWMsX3uM9
 728QCu6Weo9IxVfRR1smHBNlHJgVNuCjrL0ItgdRapoPjogC9d/xEWzMQ20GRN6ZZPWo
 3EhA==
X-Gm-Message-State: AOAM533p0TrmRwp+OKfKsUVpP/Ztxq8dxHQ4IoIQQIG9I4zUOkpFYdpF
 iNn458JzGSBun05VW7ghdqmwuA==
X-Google-Smtp-Source: ABdhPJxDtbkWTTNTZ2jzC/nW/mO3yeXUjacYqRUV4ZEkX5aTvr4u9uKDCN29cLp2VF3Slh2N4b0Tgw==
X-Received: by 2002:a17:902:9f8b:b029:e0:a90:b62 with SMTP id
 g11-20020a1709029f8bb02900e00a900b62mr4074882plq.70.1612372655481; 
 Wed, 03 Feb 2021 09:17:35 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id t15sm2577284pjy.37.2021.02.03.09.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:17:34 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210203045816.10953-1-rebecca@nuviainc.com>
 <20210203045816.10953-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42e9640c-9798-2515-1e7d-131609078833@linaro.org>
Date: Wed, 3 Feb 2021 07:17:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203045816.10953-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 6:58 PM, Rebecca Cran wrote:
>          if (!arm_singlestep_active(env)) {
> -            env->uncached_cpsr &= ~PSTATE_SS;
> +            env->pstate &= ~PSTATE_SS;
> +        } else {
> +            env->pstate |= PSTATE_SS;
>          }

Where did this addition come from?


r~

