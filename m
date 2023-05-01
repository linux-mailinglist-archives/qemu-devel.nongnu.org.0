Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F213D6F2F80
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 11:00:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptPMk-0004aL-Hn; Mon, 01 May 2023 04:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPMb-0004Zo-Bl
 for qemu-devel@nongnu.org; Mon, 01 May 2023 04:58:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPMY-00046Q-QX
 for qemu-devel@nongnu.org; Mon, 01 May 2023 04:58:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so22272395e9.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682931504; x=1685523504;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=19qxnz/fvFx2UMOxE5DWV6rEgEWOd5ICFm10kY6789E=;
 b=wTAckIVUmhWPQF8T5tIZYRglBjGDsghnREFRirPHkvsegKA8JXKyl/+LtqWYm9tAj4
 +8I29daP3TjbfZv84GpVAYW/rqPSZnc3AuGwpymuM2oENiPvLp9M3APTnQ/vZJ5TfJVq
 /Od/g7aSxP5Wiu8x+0j4hGRIaGjpzxiGvBIAGhGYwVv/A7PAOTXpLd9Ko0fFfG42Dc/m
 rmS6MZxjpNmcyoz+EjZvlhN0S7Y3Gk595vyqJ9FtTByqm8c2K13lnCimQEHSmrn7qzQe
 HHjPzaokIFrIyrc3cQY7b17vUg3mUtZY/wPxidg9yw8OVWH6RPLa/6zLtRJuNmECMRvR
 GtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682931504; x=1685523504;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=19qxnz/fvFx2UMOxE5DWV6rEgEWOd5ICFm10kY6789E=;
 b=Zb4rY/Rz/ejSPVIMfVg9yw7DzbJsz9UA2wguNBlCptBRdgeeGx7r5TLbrd37CqwIsg
 q2W2El1fsksp4Xh1bogOnaUwsG2Ll/X0/XJsrhVtZ1mUblsBpxz5nY0lkPyJppsXnMgc
 41E5yri/th4U8HdfhWLBLCVDHji/QkOjPh5WzOULQ4ymtxpFqnqmhZCSosn1ZEqG9c/V
 HjMtfQxRJc/vtI2TnsShKGdVrsL62jDp4DE11qqua3yEN2kNtm2JxoGX0tyYWFsFiOiJ
 JdpVb59a43W3yhM2MGep9QNRW2/lp8woSzZn8X56bq8hiYAAJ3KEdZfx1HUgYoNIxLb0
 kmsQ==
X-Gm-Message-State: AC+VfDxxacoL8nTozAh2xe0dprnd9YpniRjaMRIpxamloo43mfTBNL6z
 EqxCUb8z3nUXQBi9QKkHX+U9Tg==
X-Google-Smtp-Source: ACHHUZ7W9cSOFEUUzkz1rA0PyafTtg4ZVt0IhjwzyTtY01Su2xmlo0ggGjdTNqMwNgsQ52IfFgDLGw==
X-Received: by 2002:a7b:c047:0:b0:3f1:979f:a734 with SMTP id
 u7-20020a7bc047000000b003f1979fa734mr9370112wmc.11.1682931504423; 
 Mon, 01 May 2023 01:58:24 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003f17e79d74asm32308834wmc.7.2023.05.01.01.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 01:58:24 -0700 (PDT)
Message-ID: <435ed0ff-e8d2-b5cd-4ce7-032a5e750c34@linaro.org>
Date: Mon, 1 May 2023 09:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] tb-maint: do not use mb_read/mb_set
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230430112557.240261-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230430112557.240261-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/30/23 12:25, Paolo Bonzini wrote:
> The load side can use a relaxed load, which will surely happen before
> the work item is run by async_safe_run_on_cpu() or before double-checking
> under mmap_lock.  The store side can use an atomic RMW operation.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   accel/tcg/tb-maint.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

