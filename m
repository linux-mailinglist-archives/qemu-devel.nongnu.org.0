Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D8252A953
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:35:03 +0200 (CEST)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr15w-0001WB-Lt
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr14M-0008Le-2j
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:33:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr14J-0004rw-FE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:33:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso2883414pjb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tnIKiJDqg6bwxxL+nLqgLByCf7qg1b1/l7pdNqKh9HU=;
 b=EKkyiGO16itbWOzfEG2ECPzKZtedeiQThjflGQ3ufV8bRGMa9EV2zuqyF5peTXROmb
 q/W7HBTIJ161uc6dun+WsB9C2wKmz2b0sRvHJJ1EizSbuckn3jnC49V2nPtQragIGRc6
 A/3TgyJ/cRI8DMcQAhf4Px1C2eCkC/SoeE2K0kdR7e5wocsnmeP0sy//9Xfp514dHy9o
 ftojsi9ekHfMZep8Mjwn+lGDbra1z7KcGVRlqZKBPVKwweyZ7l+SLrrL6Z0U9v3JouOR
 zXc4nTS6w6lMjN2zlvZ++k2/S+z4J+QYqLxsGyeySY85FH7h7IWxY5svgjvNC/nAKZIl
 Bi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tnIKiJDqg6bwxxL+nLqgLByCf7qg1b1/l7pdNqKh9HU=;
 b=UeDX9JgOLqqKVMne5ryTofKsbmn8KfGIkhE6aT+89xnXA1PzmABaIGCD4xuF2gruqt
 Ik/IUe8HEtM/BB2DQB/Tm0vnFN9yb3ERuPV08jIbPwPLzBGH+9HQNnoSQ51U1D+9qgRV
 CE93n0bdLlwL2NX4Exsm5BFT7DrcG8nxAPGcpg+dZ9lvahOP1jx6a8cpP8ZEyXvuknu2
 lOVVVEAca5CWWVrPM9qHN3wV8Yul8u2YNgl5QT+V5kJ2lDiS58kPsgVfoh/92+u+ZSwH
 A5sP7itTjsYjduNIY6PzxnICUJlI+ihXKnMqsLpJ9A1gNpDfrcHwocZMKg2KCcE4cNcQ
 RGbg==
X-Gm-Message-State: AOAM532o87tISXmd3weIIbrqHmZzOdXP9fkzW/1UR9yacM8SKd/jHYUQ
 c2M+Exl1eWVcNebIJb+nW4TJ0w==
X-Google-Smtp-Source: ABdhPJyvQbIWOz5IOKweJ9MukR1Dq09b3LfLknQBDk3w7Ik7VV0epwBI1ht68Zsk7mpPEtrUU7f/Kw==
X-Received: by 2002:a17:90b:4f8d:b0:1dc:6cca:1d96 with SMTP id
 qe13-20020a17090b4f8d00b001dc6cca1d96mr37566353pjb.135.1652808790074; 
 Tue, 17 May 2022 10:33:10 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170902cec200b0015e8d4eb2dasm9492703plg.292.2022.05.17.10.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:33:09 -0700 (PDT)
Message-ID: <ee08c2ce-0059-c66f-b098-8790648048fd@linaro.org>
Date: Tue, 17 May 2022 10:33:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/12] target/ppc: introduce do_va_helper
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-10-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-10-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 32 +++++------------------------
>   1 file changed, 5 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

