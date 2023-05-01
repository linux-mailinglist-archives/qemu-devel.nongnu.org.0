Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AB6F35EE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:40:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYRI-0001F7-IL; Mon, 01 May 2023 14:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYR9-0001Eg-PI
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:39:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYR7-0000eh-BR
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:39:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso1623326f8f.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966383; x=1685558383;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZChYr+elY1v35LiGQPu2J+PGJ8wH210vrtb5M90ioos=;
 b=lyQVmaWEDGWsOXwNv7ONKWFyHU2+5Rw+shsH4rvPOsnG9lywxfilkmHWoY43nu39na
 Sgn2xu80bTS9K+HvxKdDi950CbaCZHRztAo9NG+u1B1CAqClDLprAsR+Zm0wRAsmQ0Qj
 L/9fIOW+xvGJEepVcsmSWTC+6bE6pvqq34KHglHZN1anFHccjW73PZeiijojI6l1s4/7
 D5IplFt6n3WQkbmP4C1SsNh6LgBUju6emowldUVhdWzUhrUs3EvOOGGa12zjtQxU5RzX
 ZP89Epzz3OC7F5PX9B6w9UGrSiyeC25uM7qY3cFGn+r71gEVZpRjykG57OczZ32rMyrM
 yIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966383; x=1685558383;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZChYr+elY1v35LiGQPu2J+PGJ8wH210vrtb5M90ioos=;
 b=FUcbrYY84WI+07arUmnfHFH+stk5wY0Ps1IarWoiuiRm+vsYWxh5qlfz1aBjaR2i08
 Bt3Hy5pXXhzlHo0Qb8qlk1gojzV9UJAAtdpcqnJYjJBg7YpA7ayv75BBCVzsU1vm+wv1
 etbgQH2HbZMAcnxvzcEygQZoHxsBYZT3a5BjBEmDecngL6jO7kfYl9tdDMQkQkBkEhdY
 dHb6yBO9Mecfm4RRZZNulMEE71ygKduBpBVzAE20IsRhCZ/GPQe2y3XYPYlmeMoGvrBJ
 FMbkvGvbOvZ7DFQTgekpzjp04gAkHA64/1XmijlTw76RIwrmteNcOvuIccdrejYph80h
 slmA==
X-Gm-Message-State: AC+VfDzoLs2h2PPJZSjvVLNVbhqZkXM/XjfJRRUxJ36Y5/w4jf7wFSuF
 mOleYZcTtFnTb/n7NF0o13JK5vHs/qOkJnEQLrURbA==
X-Google-Smtp-Source: ACHHUZ7X4PXQhz25go7diEqEWQiV35OkJu3yM1bbzbwknNCeuSsjWUZEg5ntnPjOBcYapbbGAFeEKw==
X-Received: by 2002:a5d:61c4:0:b0:2f4:9f46:6865 with SMTP id
 q4-20020a5d61c4000000b002f49f466865mr8286879wrv.30.1682966383452; 
 Mon, 01 May 2023 11:39:43 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c3ac300b003f19b3d89e9sm26847525wms.33.2023.05.01.11.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:39:43 -0700 (PDT)
Message-ID: <70e0b5d1-e4ff-88a0-1b84-92cb8115b1ea@linaro.org>
Date: Mon, 1 May 2023 19:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 37/44] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-38-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-38-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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

On 4/25/23 08:02, Song Gao wrote:
> This patch includes:
> - VBITSEL.V;
> - VBITSELI.B;
> - VSET{EQZ/NEZ}.V;
> - VSETANYEQZ.{B/H/W/D};
> - VSETALLNEZ.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 20 ++++++
>   target/loongarch/helper.h                   | 11 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 74 +++++++++++++++++++++
>   target/loongarch/insns.decode               | 17 +++++
>   target/loongarch/lsx_helper.c               | 52 +++++++++++++++
>   5 files changed, 174 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

