Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04442CC325
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:13:24 +0100 (CET)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVgx-0007XQ-PF
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkVeW-0004Lh-FH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:10:52 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkVeU-0005hr-Tf
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:10:52 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so5500589ejj.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AHb7z2tSbzOAr8SnhxB6WbGm90v+uZd5gBTQvGXluow=;
 b=qBrtPLCK96saPxYfmdsnmCB5V3NuQnJjviNdBfiY4DErdJ9XfoNAIGVScEGxCS+/rX
 KNBshj2sTU+6eBr5QFimy9WPLjQF7H/gholyzIxTImwSU/nHibteflVrd2U+v84e18Ie
 7TN9gJjSQmctDM2N4hR+TXd7/meTibS2I2x7mmwLU4E22mxwNWJCqDiQo/9DDj59Ppxb
 tQBbxJ4wk95uqfPI3qNAK/7hngNIlU3ExkGk8PBF6ZM8HcgklzjxUUA7s5jdCfwBeqDr
 dR6XqCxSDfhxyGHuJ01x/hyQbLi8zzsOK6k9zuOyPlqfu0XPK7YEWE8lsLl4ByiKYp1f
 TmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHb7z2tSbzOAr8SnhxB6WbGm90v+uZd5gBTQvGXluow=;
 b=NZL/Z9PU0zfiHoiXU25fF+Iy0AHSoveD8R23jnGfF7NugrWBK57N4YYLYCe9JzdKjY
 K0gNqJ1tzqHbNrIvetPOGKjqG4YH/DAW7zfT8eNbT1KuaUhIAG9HMHBMjnry9DP2+vdD
 7qT7A39lSqiJU/6eVARLRz7SGJizG4um997mwM3SwttjXKJuUNzRcv3z5z6CWp4R8m/x
 4Am4OwYZ93ZXd4v7J7CGbCyxXj7qpk097dK+JNkR8n7yVD03Sareg30jcvifMfxqTY44
 KO3EhGMz4tVf5qVsNukfq4HaWL4AVK9qcM/oKiCK729LOjUNoU3GCJHQM2oubRJBJTmX
 kKJw==
X-Gm-Message-State: AOAM530Ese4oq+nV303LRL1hriGhz6UBi4gdH6x53ujDEXAoln9oxSvH
 ECQyUdJRZlSKYrr0VSagaoY=
X-Google-Smtp-Source: ABdhPJz5PHF9KrIx8SLC/qzIj0czVh7+sfHpRlc2BAqJtVkmf86LdzfXW3AziTN0gSgGb3+LR3H4gA==
X-Received: by 2002:a17:906:bc9b:: with SMTP id
 lv27mr672961ejb.505.1606929048913; 
 Wed, 02 Dec 2020 09:10:48 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id gl2sm328222ejb.29.2020.12.02.09.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 09:10:48 -0800 (PST)
Subject: Re: [PATCH-for 5.2?] hw/core/ressetable: fix reset count decrement
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20201202164055.30864-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6a34f2be-3467-b81a-956b-4472860e4d0b@amsat.org>
Date: Wed, 2 Dec 2020 18:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202164055.30864-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Michael Peter <michael.peter@hensoldt-cyber.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 5:40 PM, Damien Hedde wrote:
> The reset count was only decremented if the device was in a single
> reset.
> 
> Also move the decrement before calling the exit phase method to fix
> problem of reset state evaluation during that call. Update the doc
> accordingly.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Fixes: 1905297 ("Zynq7000 UART clock reset initialization", 2020-11-23)

$ git show 1905297
fatal: ambiguous argument '1905297': unknown revision or path not in the
working tree.

Beside, typo ressetable -> resettable in subject.

> Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
> --
> 
> Hi all,
> 
> While looking at the bug reported by Michael and his patch. I found another
> bug. Apparently I forgot to decrement the reset count if there was several
> reset at the same time.
> 
> This patch fixes that.
> 
> I also moved the place of the decrement: before calling the exit phase method.
> it globally fixes Michael's reported bug, as I think it will avoid some boiler
> plate code in every exit phase method we do.
> 
> Only other place where the reset state is checked is in the
> hw/char/cadence-uart.c so it does not have high impact.
> 
> I'm not sure if this meets the condition for 5.2 as it changes a documented
> feature. In that case we can just accept Michael solution and I'll fix the
> rest later.
> 
> Here's the pointer for the bug and michael's patch.
> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05786.html
> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06105.html
> 
> Damien

