Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4006EB49A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:21:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppz7W-0007US-4c; Fri, 21 Apr 2023 18:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz7T-0007R9-Kn
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:20:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz7P-0004Q2-UQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:20:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso2057522f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115638; x=1684707638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N4KBfFKyXWN+4n6J4KJGwagFWEnUQe052+YZdKB53do=;
 b=Y5sudt2FuMwIrLzVd7qpkU0KDKhAyCleNN1PtjE6DSdmwSaNRwg7qLsVVKKmtcaypx
 gXuDNRsn1hkIsRuk3wKL4mQ7k71OwwLpLXQgIVUQEEgjMBgt0dvWwJWOjJEi3QH/UR+D
 8CIICBxQCxTpOd9oSjKb1JAFtKP4/TGrgfcfo/IFYTTpCzvM/k4+QDH8EfDqz6QQb2BZ
 JzKHmVRemkHm4/u+h1aT6sUptcTnXIM/gap0tFackTfwi3X8a2pW5g3VaXyBg2Dj8hXk
 XpLJLbMxXno/dyh1lfPMiG/RUQAS58mt2KkDsmdJUOz0JjguHTDW9NXbtgNCwrzELV7u
 cYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115638; x=1684707638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4KBfFKyXWN+4n6J4KJGwagFWEnUQe052+YZdKB53do=;
 b=Gr6iUFbN9X22pSUfiCnuG7DYw5gTXWCR+ZFoiOhm7MMT/VS7lb5eIrWRTIh2T/ezbe
 cLLb9kRjtij1G6yjoXEcQL6n8NuSaaWZpAaRAeKLXAVJJzSn2oCkPQ53DJXYvNRoe2+E
 kv99xvEO/nQGPMnLIWroVQxgNxpt1g9Vx68sxcMsSBYZeOdPz6llWYCxnLemn3Ih8G0x
 2GHj8HflwYHOeP+k1mznqmDE7kB0B48mTl2yj5ZZgaWEsUou7FSn9lkH6A/0uRRVoPiG
 EVZ4VZwnI1RlqlcbVNO/LTR4nV40OE23cHmugFy3VXYmjY/mVrVBxra+Rus/FW6CRDkD
 gj+g==
X-Gm-Message-State: AAQBX9dVx5EJahnfozJSXv5LmB7+DZymVWUd+SsAgW6waRoXIQbne16p
 BlzsnhQBfY5xPuEbK1EuNclryaHz3JN+0Q3oesg=
X-Google-Smtp-Source: AKy350Yn8r0EO4xKc41AGRWQauKtFBchcchK9Do3E9fH+47CizM1DrTAKGfr28ggn9waAEI/lnPo8A==
X-Received: by 2002:adf:f14c:0:b0:2ff:f37:9d1a with SMTP id
 y12-20020adff14c000000b002ff0f379d1amr4846614wro.62.1682115638357; 
 Fri, 21 Apr 2023 15:20:38 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c9bd71fsm5266927wrw.93.2023.04.21.15.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:20:38 -0700 (PDT)
Message-ID: <b6a4380b-bbe6-999f-7c35-d16628491493@linaro.org>
Date: Sat, 22 Apr 2023 00:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 19/54] tcg: Clear TCGLabelQemuLdst on allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-ldst.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


