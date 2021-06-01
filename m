Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3DB397B94
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:10:24 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBeY-0003CB-Sc
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBdf-0002NW-D1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:09:27 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBdd-0004ih-Iz
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:09:27 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z26so493165pfj.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qGiqPG6aVsSmLckOtOOzH+d5U8z5aSgQDYCuEBsRtEw=;
 b=OJ5ikj27He7v00kUu6nukh723+UswDVl29sIhh68mssdJpUxeKDcnLoxhzr8lHvFbm
 4OXkUQob7psObDmD7aeBEZFM153Mljve64qhFrS2EP6y0dHu1PTeuSAK8drJRN/rtaN/
 4dPcwcgLh79wCYoWL1v2WPYxnkt4Tm1kqU69bI58/PQn7aT/ACcmmGjjE2KPORz9Kjky
 Srfgm5XZc+lQbCZH2db7+eeBTgIi/Av9r6xEqA49BflIARazD9WNK8R5EKice7//IBXM
 qDTYMMnKgLRmrtc3PWCa3nb7VlEpZuj4xd24hU/jNa8+VDjgD+DjCACXAuaPCHN6XD5P
 xMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qGiqPG6aVsSmLckOtOOzH+d5U8z5aSgQDYCuEBsRtEw=;
 b=p46jvqMCqT7+4mgtUGRtIuhOxQSArw3a7xsTre4li8Iw/dnEBZbnNvELUw3pqz/hME
 P1Cl0SqfY4Zw2sIkHhiMqJosMHeclq7sT+zxzb8bA3KZRLQ//lmQz0jPnjM7yliV1I4f
 QS788fzOQizhNQkWP9U9lPoM8luaQmRrgUpDxI0M/1FOzqi1Bjw6Q//IsRkkp+EB3hS4
 mhxu3sIvtaqlQev4PTyWFGlX2IjmXfy44q7AWZ70i2sTlRDoy2hF6KjyxVGvB9OmXxBt
 +nNpuXfY/iamRXMcgD+O9osl94/OhB5hbB7ztd0ICVtl0BtHynyTfdP2njULfCd5rgkY
 PkEQ==
X-Gm-Message-State: AOAM531bR1zUlgt6zV778KVg55BKdfO6lLvI2Pd0fkF7dGtKOtzJTD3D
 bmV43kRvNx0AKJGXoTIBqMLwcQ==
X-Google-Smtp-Source: ABdhPJx4u0ckVv3lWeVvcr6qxRYXOQFfOubKFh+t2/RimT6gI0ZK0fdK9pNNEDTnnZukgJPy0puTrw==
X-Received: by 2002:aa7:84c8:0:b029:2e1:d6b7:8c65 with SMTP id
 x8-20020aa784c80000b02902e1d6b78c65mr24164765pfn.54.1622581764012; 
 Tue, 01 Jun 2021 14:09:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b23sm13846002pfi.34.2021.06.01.14.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 14:09:23 -0700 (PDT)
Subject: Re: [PATCH v6 12/14] target/ppc: Implement vcfuged instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
 <20210601193528.2533031-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65c93c35-b956-1ce2-76ff-e72c3c989f71@linaro.org>
Date: Tue, 1 Jun 2021 14:09:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601193528.2533031-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: groug@kaod.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 12:35 PM, matheus.ferst@eldorado.org.br wrote:
> +++ b/target/ppc/translate/vector-impl.c.inc
> @@ -0,0 +1,56 @@
> +/*
> + * Power ISA decode for Vector Facility instructions
> + *
> + * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ALTIVEC(CTX) \
> +    do {                                                \
> +        if (unlikely(!(CTX)->altivec_enabled)) {        \
> +            gen_exception((CTX), POWERPC_EXCP_VPU);     \
> +            return true;                                \
> +        }                                               \
> +    } while (0)

I think it would be better to name this REQUIRE_VECTOR, to match the 
Vector_Unavailable() pseudo-code in the current manual.

Also, I think you should place this in translate.c, because you will also need 
this for VSX.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

