Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7E3FBEA8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:01:26 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpLJ-0004xB-6I
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpHW-0002qo-Uy
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:57:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpHV-0005hN-Gg
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:57:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id g18so16944855wrc.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J64s7XOMbMjyM3NCUIUSZvs8G/eQjIN8TPYm/AQewdc=;
 b=qkivoIFOhg/YNYmzmH3AczFtROMXNLwkw6HoYl/BawY9yabWyiRurBrR9fLwqJ2Ea0
 +Lzcfxlei138qGhSPB6HWbT7ztIcomPPfuXaWEZwnUbIpqPFQLnicR4CMtYjxhfxko6Y
 Lc6Z7RC7qNaA2r2ThL9Kn3+EB29AMzAdzzBi0O2g20hFhXrGwKWL7rb9chxKbERVWSB/
 GZ3lvi4ORM4fe2EhAW+gqNGclAu+ZwIVQtqAKxvSFGwirUWlqSJmXsGRLRK7egHZwX60
 mfWd8K9ZQP4uxCROrtsvhlS1ByI7/uhXe0hFyxkegnkofSl6jtP5fLD1QBc0xn2XRC53
 lOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J64s7XOMbMjyM3NCUIUSZvs8G/eQjIN8TPYm/AQewdc=;
 b=jyBQtjNeFnHmWwGvAttv80WSdZFHQ7J7d7B3L3w2cnt5+yopTGtdnapjQg4G+JIjJz
 YxnIlPtG690qWIwgRkIAu2AO6ymjoATuCEL4W+R4FhwXQ75O9QmAXc/UN5LaSLdIWi1V
 1aobIXnBjxIU9vTl8xtwD5vUH2+US0wZRy+ahfIO8+pbhWlVv+xdTBkrvwi8BGhcHGED
 NpQcR+fHQROgv9MGCGAeNIVTxhoKad7f7OhsZcD9FCjIZEjQQbi/awsnt+pjse1xw/6F
 qC1JIQVPaykMfbicugirVvxr7aF/OUbRx6Dx5uEmiLfndsLGT/raFizjCMgU0Sd3GU+Z
 RldA==
X-Gm-Message-State: AOAM531gpFEtvKZ0qsK0XDFp0s6Bns3cmtWEnhp7j3vcrSi1aJYtKmgN
 2fcA98v70+vCBfJHeIcsxm2efgsUQe0=
X-Google-Smtp-Source: ABdhPJyVXs1HGzDa1oYZFRhXi4SMO/NkcVUJtaV+K7qYqTz8wjC9A25C2GqIj9VgMPLmksJIHbkEpQ==
X-Received: by 2002:a5d:4c89:: with SMTP id z9mr28358783wrs.290.1630360647016; 
 Mon, 30 Aug 2021 14:57:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w29sm17282293wra.88.2021.08.30.14.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:57:26 -0700 (PDT)
Subject: Re: [PATCH 29/48] tcg/optimize: Split out fold_mov
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1f85a7e-4a07-2258-a05c-2777de601d66@amsat.org>
Date: Mon, 30 Aug 2021 23:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> This is the final entry in the main switch that was in a
> different form.  After this, we have the option to convert
> the switch into a function dispatch table.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

