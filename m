Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E32CA39B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:21:44 +0100 (CET)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5bD-0007SD-49
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5WV-0005Ei-Jk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:16:53 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:43233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5WS-0002Uf-2H
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:16:50 -0500
Received: by mail-oo1-xc44.google.com with SMTP id h10so374677ooi.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZiiuBPgcjlod4RwMqICcQL/4qDdWbaMDBe5y+v2z9xo=;
 b=R4tBJnup7YgFV8lN8kEnQ2FIH91zcrH5JKFuII8u4QK9ykxUEAdqCET+hX0W19cnUb
 yY0HoRABJRD8zy4OrgPKWE1aIrqHzlWXcHSQv8Fmn5O7gTKKYF5vdgZn7fYig11wIRha
 A5b1jDUi9ujMRmUrXPh7DYchk+OBYtDTJ0OIAgTbVkP1Ry7jKc/qFPrJ7vREbk+OH9uj
 lMmB+EvgDj823C1DedBduM6yr7vTJadDAG0f18lZHIv3cQ4cawfe8U0V199ztQCiEzdk
 5dKfj06x7ezGxrAHnuaDxsacZYmZVtRvISPQhwU1OSGpRlFBwKKJ9EA1PrMFOvUc9rvw
 /gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZiiuBPgcjlod4RwMqICcQL/4qDdWbaMDBe5y+v2z9xo=;
 b=ge8sHLK8Bg6l5w+A0yiC7VRUqQIOfsBdzv9PavDudLmU/I0fSyMwDDOJK3fZBJgaNk
 clDfbIjKULifb7dAC8IsObkITMfJ8EFaUkYSRzcfRrK2OU9iEibyz2St0m3QfOIHCZnj
 5fHeoh/W6mWYWn7a/WXNmKaTQvDWwJMb+DWzixpCzH9rMmVX7UHSyKd8bjfueoDL54oc
 BrHK0zCIlx3XhgAaDzj2qD+zrWrtJ/QX3M9cizCN8huKbg0TUi3DqgifS0zhbtX/tc02
 gKn4j7ccXjPcz36n+86JQjs8wop9C6WEOpzu/z2P4JjyveOyt+v/q2pdeQmgGXVZbqi3
 H7bQ==
X-Gm-Message-State: AOAM533H4tbq214AX6PUw/JpNJC9RJPr8ASwFfR2jK+YVl/RcO52K0w8
 //nLzjcc0gHVWxi2Q0/hsWZMYYHEZdm/xhph
X-Google-Smtp-Source: ABdhPJxjCl4Q2t5m7pbB4ahxIT9Zx2CsovSdOvSJNBZFllasA5ytA9G/cA7X5OKYqiUCSdbgG0JtLw==
X-Received: by 2002:a4a:be81:: with SMTP id o1mr1781228oop.25.1606828605897;
 Tue, 01 Dec 2020 05:16:45 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z77sm357524ooa.37.2020.12.01.05.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:16:45 -0800 (PST)
Subject: Re: [PATCH v2 10/28] target/arm: Implement M-profile FPSCR_nzcvqc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcc11945-91a7-af1c-a6f4-a6d2c0444b29@linaro.org>
Date: Tue, 1 Dec 2020 07:16:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:55 PM, Peter Maydell wrote:
> v8.1M defines a new FP system register FPSCR_nzcvqc; this behaves
> like the existing FPSCR, except that it reads and writes only bits
> [31:27] of the FPSCR (the N, Z, C, V and QC flag bits).  (Unlike the
> FPSCR, the special case for Rt=15 of writing the CPSR.NZCV is not
> permitted.)
> 
> Implement the register.  Since we don't yet implement MVE, we handle
> the QC bit as RES0, with todo comments for where we will need to add
> support later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h               | 13 +++++++++++++
>  target/arm/translate-vfp.c.inc | 27 +++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

