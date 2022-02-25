Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8BD4C51C0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:52:34 +0100 (CET)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjRx-0005qy-TK
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNip0-0002bC-90
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:12:18 -0500
Received: from [2607:f8b0:4864:20::436] (port=46696
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNioy-0000rn-BR
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:12:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id i21so5828308pfd.13
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b3YEqVuWzZT7FCn1i+7j0oplcs+aEQINaLSV0wdGUnE=;
 b=KwhDqB7QyLPsY5FUzOeyejaLNR+DAOUIrnrYeC/xwegYaibBxNCB5RLkQkbw1reBYC
 DM9BmZBuJ3Cu9N7it4Gfnk6VnFEQIxarhvSV+NaRciJUFpUP7ehQ2UeSK7AEbQkD8cAz
 7sbwv6hzGA7BAvyE8cm6eqHmPWGnRtGG2R8TG6j98KWbxU9BgwS6VTZoO9xwsWcyrnqW
 tYwFrj2VO8JJWiZEsH612UoaDc64ZZtFZU00V5TnznJWtxKX0lOhOTQDbVTFn1+J6qd/
 LxuaMi0FztHRaIvKb33lRnEwl+VFIrHBC6ZgIiy9K5GdMQLDq60A5+OQWklZNBASjVBA
 zuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b3YEqVuWzZT7FCn1i+7j0oplcs+aEQINaLSV0wdGUnE=;
 b=1bwFLx/3m3ySisnhoWHsSi9kYAHxVh27P/kkLxXrk5p0u+y8+e+sdGqt28XcKXT8go
 liqhpby1mLqxRqBZLrtfgFDUEhz3jKvthp5HvveBDT96o9Ayy/HP7J+h96z/aANjR7Jc
 q1mt8IVtKxgViRUjiedag2hAGtkd4cjv0B0u3tTfCI0HHKFLK1n1hUMZka49v7NgL+xW
 yVQ5oMOFhWRLmjZ2cxo0G7tIZJlUB8Cs6LmlP611W7gIX3SEV+CrcLOZyJADIk4fyAzL
 u1p0TnTj/m5UkXpamvZTLUvG4U+RFrHeSNcc6Fz1YPFDguyvJvclIZ6Coxvqicr2ANVp
 qOkQ==
X-Gm-Message-State: AOAM533/GdZTbKV9KQR8EickrkOc5CxCsfY3oT4UjxtwjUrREN9oTiPD
 SC0ICWMn3rUsy0Haew5FM+0Esg==
X-Google-Smtp-Source: ABdhPJzpruOen4xReW3DV54CPYeKIgbG3RPOx4smarfqyeeRfm1KpIwJG2vIAuF7xGCXpR6bEUeDWA==
X-Received: by 2002:a63:707:0:b0:373:9e4f:f56b with SMTP id
 7-20020a630707000000b003739e4ff56bmr7669371pgh.565.1645827135057; 
 Fri, 25 Feb 2022 14:12:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f0fea7d3c8sm4603255pfk.26.2022.02.25.14.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:12:14 -0800 (PST)
Message-ID: <7e6f4b54-ca0a-593a-efdb-478dfc313950@linaro.org>
Date: Fri, 25 Feb 2022 12:12:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 45/49] target/ppc: Implement xs{max,min}cqp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-46-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-46-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> changes for v5:
> - Update the helper macro call with the new parameters added to
>    VSX_MAX_MINC
> ---
>   target/ppc/fpu_helper.c             | 2 ++
>   target/ppc/helper.h                 | 2 ++
>   target/ppc/insn32.decode            | 3 +++
>   target/ppc/translate/vsx-impl.c.inc | 2 ++
>   4 files changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

