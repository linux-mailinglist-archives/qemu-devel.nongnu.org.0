Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0773A4DE4
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 11:25:21 +0200 (CEST)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrztH-0001Tj-GG
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 05:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzsB-0000pH-2w
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:24:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrzs9-0007wl-Je
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:24:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so6851308wms.3
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wc1r13pWj24nNdwxxeR3yDJDAkVKHi8UzyqYI+qtEME=;
 b=vhvRc2oI3XfQR/s2Hw9y7ooM6iGi+jhtLmELrr15PxIHGcW8F31BjhFRtExpaz9ewC
 bzWOk0wrz5CPEm8tDKdO1vwZ/ZPxx9Lu+lSoL/wv0R8xgM7D3wAOhj1MJz3r6XGZGWDK
 ad1DAg1yPdXzVuRFTKBGej8cxZIfy6fV8wvQnLaI3BPdNveI7DkXDRowAS3/H8ZVqtCu
 IK642tgk1WlZtUF2PUm+unQtFhJlxq1eWf/U9u0n982KvzuTeLCfqtoFyAIkaxb8dU/t
 zMc3VVq/4qrB5oklKDM6shlAtd4uhWI0z+FZDuo02OjlNMMpubFiT5aP+WpwLPWx0kZ7
 SB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wc1r13pWj24nNdwxxeR3yDJDAkVKHi8UzyqYI+qtEME=;
 b=pOW9Y9c28cT5u7A/OU+tGcrUHtYXP1RkkNoOFtZ6ww6z0Qs5E6TPl+qVqIBpDctop2
 t+l/wDfm5+rTA9Tjypy1JxTRz+vrpNSV9NVTNNll/B4fndl9qWzs/twC1E4G5eti3zVT
 YQwEjFh+2hAHreEA98IoGwdqfFGYAwV2FNE9x1pAwMydPOr4vN0GCkhVgWjXuZU/ikhH
 M4V08fGO7XHY+1HAFtZQflrEuzHilkZd1UQdFf8sqZeWQdvrstNRxNdDm/ZlxnTo2MFk
 b3xaACgakfZ65DwHOw3qUN/OQFFXftGZHByQPcheI2yTTvetsQxf9d2o2jyAoqYjxL2+
 etQA==
X-Gm-Message-State: AOAM530C9Aiw+mY81J3YudHynJvxmn+r4mLfZ8NXgJRihGmDAurjHnQp
 cQzACD1RylxMXqJrcvoy2beoB2ZuW9lVrQ==
X-Google-Smtp-Source: ABdhPJwiywaaf+6DoDW1GILjCFs+hREB766YncohMLDec2WV1A5JoJZCoPqO6zKj0CDt/hXASi95Og==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr24512512wmg.152.1623489847054; 
 Sat, 12 Jun 2021 02:24:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id w13sm10871198wrc.31.2021.06.12.02.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:24:06 -0700 (PDT)
Subject: Re: [PATCH v7 26/27] tcg/tci: Use {set,clear}_helper_retaddr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e5b7e7c-5b9f-b786-7e60-a57a85891320@amsat.org>
Date: Sat, 12 Jun 2021 11:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 6/1/21 5:01 PM, Richard Henderson wrote:
> Wrap guest memory operations for tci like we do for cpu_ld*_data.
> 
> We cannot actually use the cpu_ldst.h interface without duplicating
> the memory trace operations performed within, which will already
> have been expanded into the tcg opcode stream.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

