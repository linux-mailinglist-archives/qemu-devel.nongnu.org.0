Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063432EF64
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:53:02 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIClA-0000jh-R0
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lICYn-0005uM-Ge
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:40:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lICYb-0004e0-Ow
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:40:08 -0500
Received: by mail-pj1-x1029.google.com with SMTP id jx13so2084537pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jLqDEbj96a8v8DVEdBHUUJgC/PotIjYjDO17JK0TuFw=;
 b=zp8B42YhnhDj/iGKKb7vS5I/QrMfs2fyzPr7FI2DFfz8KtI1zXitARm2oOkKDmwKXX
 Cfvd9aJpZQvJiUfrJUM54SCQhrxSuVbAAeKdZlBIT7DkrXY3leh3PMc6Ij5bVFTQFzly
 Wy6tQaB/NwBr1X1EoI2BoYdakQs9XFCdsk6XJof3Cnk7TO2kSPIzcgtq0G0Ofx+7/JvQ
 ud23tNcrNJV8ByQRd47gwdkMFcuUaE/9rQ3KjgwGCkUYxEtTFQ9CuSjPkUS7tL1MYYRH
 b0z04Z7UXlR4Fmqg35p7SHGxjuskiPBxGtMZSwO78uKRcn614L80auRy+lK/wPbf7G11
 leYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jLqDEbj96a8v8DVEdBHUUJgC/PotIjYjDO17JK0TuFw=;
 b=bbeb0snvnUEAmGFOdekjq3tcv0kjcOWUSzBOCqcBcYdd0lmbFbwMaFVtGqeCCPL/Jl
 2YZIr5PBfETv7/dpn2Ogjm4+W0Z8znStKEHgBm6H6Lao+NMs3BFt9xKS2Z/z3BZZ4h+c
 v88iL+2tPHz9AdFGNyLQKWrzfFj2fHokM4nZMxFJT9v8XitEqPTE+Tv7ZQQLew/jretR
 mGbadnCXl6aFAmATXZTrMPR0IbrROm4oXZhcg4b8RVJgNtHOLXgVvU9yvu2hVjjyd0Jz
 5vzVMGeJ53nVu+bi0y8okFFYq3ULFAjF7tLr1lnzj6CW9W8+TqUuSTJxwmkGKbnhMoCh
 s1zg==
X-Gm-Message-State: AOAM532Kvzc35N6Uhvs9uKb5byWePPCPsfxoMDHrMpTyjCdPfwZBjv5Q
 7Z7j72AO/4gekjon60grf8e66w==
X-Google-Smtp-Source: ABdhPJzBJ3lJCRV6B4Bkguao0kjrvjp8SoDtUiSn8NxcSURbcDPpwQKEV27qYc3HHBxU0SS1ke51eA==
X-Received: by 2002:a17:90b:3783:: with SMTP id
 mz3mr11372326pjb.88.1614958798369; 
 Fri, 05 Mar 2021 07:39:58 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v1sm2801167pjt.1.2021.03.05.07.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 07:39:57 -0800 (PST)
Subject: Re: [PATCH] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
To: "Ivan A. Melnikov" <iv@altlinux.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
 <87eegtg05n.fsf@linaro.org>
 <20210305150603.5dgwt27l6agqtacn@titan.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40afa5f1-667c-9db6-fcce-016b3c27cdc2@linaro.org>
Date: Fri, 5 Mar 2021 07:39:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305150603.5dgwt27l6agqtacn@titan.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 7:06 AM, Ivan A. Melnikov wrote:
> Especially since, as far
> as I remeber, comparing unsigned value with -1 (which is int)
> is UB.

It is certainly not undefined behaviour.  The defined behaviour is to promote 
to the common type, which will do exactly what we want.


r~

