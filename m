Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701C6D50A7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:34:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjP08-0001k6-9Y; Mon, 03 Apr 2023 14:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjP06-0001jx-OG
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:33:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjP05-0001GS-A3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:33:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so33564585pjp.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680546831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBrrRBfsjnQfLWl1sHT4UVy+OjRL2+1GO5AOTu2/yeA=;
 b=Ylyc6h1iJhNu4D53Xk+R5YYJQCqNln2zPblnCXbrn2Q8ASthyPw6BQPT3yej84Jdvw
 poABIsUUe4NHSCy9q1q9IvbnCaZ0+4vOGuUIXHYkU2s6sQldGIldlNUOTRQZJtBdmFwc
 xJaN77J/oFZRLOIA3IbWM4sT2je1AlUtNsNJzuqOrWm9RiDI4yM0+6duULHunjyt3+JT
 DIvPuj0g9oMgsu3jzu+za14fMbk+YcyFpf9uQTY/xvWnO0CNFn9JdCvg622FK2ddbIlM
 AlO814QqZCWW7DwTTrdITYGYvRPANO+zLLPZ+gUg7+vJLM/jow2VJ8ny9aWMMO1WleT8
 CSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBrrRBfsjnQfLWl1sHT4UVy+OjRL2+1GO5AOTu2/yeA=;
 b=WxbTxni+HRJgBnPeat4gFw0no0H70HB5uoX/FjhODzkV4Ct2nEzxuU0xfCGXOnSHEU
 RpoWJNHGox1OreaX4jrWz6EHQpKSog4u2Y8Px91Vpw/w709M5Z/XQshH+FGf323T8tPF
 EpIYUweijt2E/gmhucfg1e0juTdhDr98F6tUden7frcHFlmPfHLPkesMxkr/XX60GsaH
 /hGNzZrLQ3BgJfEvbMjN6K8j3N0I2ZJMuoVSZF+V8R7B1i/GuIRHwzi+OrAurq5zAT1Y
 bRdY2AlCgeqBYe+Es4C1BL3w2eHwffFQYG5hSpi/Jj/N3C89p3X2I9aqdMdnEu2PLVVC
 6xDw==
X-Gm-Message-State: AAQBX9cuDIbLN6clbCdk7u1YnU2p1tZdY2jfYd8oFrCvLnuW0KAFJFBE
 GGRQEoYd+RLGrb2JsGVyEQfL/g==
X-Google-Smtp-Source: AKy350ZqPlcKvAYpDKLrHlwjLI+Brt/iP5B7LqZQdFxTSuvfZppRC9tCnyA6u3fbErHo0RwqUPp7yw==
X-Received: by 2002:a17:903:1c9:b0:1a2:8626:6a21 with SMTP id
 e9-20020a17090301c900b001a286266a21mr20608571plh.58.1680546831369; 
 Mon, 03 Apr 2023 11:33:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a170902a5c900b001a04d27ee92sm6909722plq.241.2023.04.03.11.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:33:50 -0700 (PDT)
Message-ID: <db294649-0b72-914e-d6eb-328a996912f7@linaro.org>
Date: Mon, 3 Apr 2023 11:33:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 03/10] tcg: Use one-insn-per-tb accelerator property in
 curr_cflags()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
>   uint32_t curr_cflags(CPUState *cpu)
>   {
>       uint32_t cflags = cpu->tcg_cflags;
> +    TCGState *tcgstate = TCG_STATE(current_accel());

As mentioned against the cover, this is a very hot path.

We should try for something less expensive.  Perhaps as simple as

     return cpu->tcg_cflags | tcg_cflags_global;

where cpu->tcg_cflags is updated with cpu->singlestep_enabled.


r~

