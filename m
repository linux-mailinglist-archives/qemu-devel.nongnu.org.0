Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A33D9DB2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:34:51 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zd4-0003TP-U3
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zZx-0000px-Vz
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:31:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zZw-0006eR-Lr
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:31:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3238966wmp.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+MG7MLjQKYL9iUbY+OuAl5aL7NuFaDLLclgkPBS0Ugw=;
 b=T5qjRX8zeENT5XeUXQJIiJxZ1NAEXf4U5dzgrpTRJMEpuniYzwdh07GOXigAk31bgL
 OAJvhGCf7SagJQ97h2e4VkX7k2Dnu9n9Jf9mC30VbWub3Q99lHSklrWZyLRz648Np6vP
 GhDuVueswsFsxS6Ls+QA1PaiurQG5krm5lEwzHZeHEl/dtm+Wv/DbKaFSKeTygxfRjlk
 yRys5VQAsj5L0/iLxWG8Q3f2Q0BxF7tgdqPi25H0jscMNUg0dERELxmDUUrXGghoR5Lu
 OZ9p5b5LnqK8pbfxxe3I4LfIFX24KdSU4A+es3ezzxKNa5N2FTd8n5w9eFjs8zf3Smyo
 rDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+MG7MLjQKYL9iUbY+OuAl5aL7NuFaDLLclgkPBS0Ugw=;
 b=s2xomPX2YnFCF3RX84zOtKIGhJZliSxiiGa+ShGmTaNOfL9AgSI9a7P7hEc7FM0ugM
 waJQqPN5fNen1x3UpkA8AUt1tq24oFhSLWs+FdqNnDS8GUzVXNKa+8E5lwE3Toi8hmDE
 A5Ad1vuW+gpq27RTPdUbKMgcvxGZQQO6VF1ncMKGB/h4Bdy91tdZNv7XzVLWO5XMasm4
 0WiNmom8NzCjjETZwXpj4Uke4VgkxmEkxIJlHLRrMHcID0eT3B2ZLL7zxyl6hjjnVxay
 t7zlmG3L4dpBjmDMG/IJPjQIO6IaLaUHVZPp8ZIwIPihouEBK1mdteIEcShq8wBPVvmr
 qIjw==
X-Gm-Message-State: AOAM530ouPjH8MWi7+25urtmUbcx0YZaHh7CfhIb+9KcBV/v5kFJrILI
 Yf521RX2chXXNW6XQw99/rzjmdkynEyoTw==
X-Google-Smtp-Source: ABdhPJwdTZ3v4/8VVGwIxHZYezMy/Js/zcckZMe2bc3byWRmMAYezcfl+JRR0KTBpwXn1wZpQ1yV9w==
X-Received: by 2002:a7b:c094:: with SMTP id r20mr2976900wmh.107.1627540295049; 
 Wed, 28 Jul 2021 23:31:35 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h12sm2040745wrm.62.2021.07.28.23.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:31:34 -0700 (PDT)
Subject: Re: [PATCH for-6.2 24/43] accel/tcg: Pass MemOpIdx to
 atomic_trace_*_post
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6372f39-5b7a-dbce-2628-58faf06733df@amsat.org>
Date: Thu, 29 Jul 2021 08:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We will shortly use the MemOpIdx directly, but in the meantime
> re-compute the trace meminfo.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h   | 48 +++++++++++++++++------------------
>  accel/tcg/atomic_common.c.inc | 30 +++++++++++-----------
>  2 files changed, 39 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

