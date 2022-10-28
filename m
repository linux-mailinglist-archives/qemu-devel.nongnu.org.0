Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC027611AF3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:37:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooV9E-0006Vg-Rz; Fri, 28 Oct 2022 15:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV91-0006Us-QH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:36:03 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV90-00064K-9W
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:35:55 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m6so5648567pfb.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3wxcOd4OzDjMiOD5bHmw5ld6INm3ORzb+ri+P+2t8YI=;
 b=EcJPgJyLz71jC7pLD6RDQFubE/YAVDypDILVZgHWCd7poxyW6LLKzC60SUirq3Q31q
 vOXtNfZZpJlHMuFGYoSz4oCnD737P8CjY4RO9fg0FHUcJVS3aa1oNzS6KAQ4xHkWgfK/
 DiBzEsKDbLbTAidgCIEMlxtoYqgYnucr9+AOm6TTfLQrhvvOmxDfsmsMFKV8k2PXUdMi
 HrS/a2QZNVmaI+Vm7rHAKlwAUF/5n6k7XMPoCvmPxw6oWxBWxGaTQlHwgmsOW1hhWGZd
 HSRGP6SN2iZCx8dEUWtRFYgJO63A8lYwlEVu+pF3AG8mtiqubY1nwyyIruacoRr4yUWS
 If2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wxcOd4OzDjMiOD5bHmw5ld6INm3ORzb+ri+P+2t8YI=;
 b=mkKzsXwqMqxbDvXbOay5dn/cdpn4QhcLPzyAzZKNO85HS8ryr2GvfcMc250m2B8w1v
 0cXu/6Y2KxqeQHKD7ssXlu+1HgkYeDE7zTmwmi/ikQ96XdjSiHW3AY+nm/n1bHB0rhjB
 Nfb/3JQC5fkJ/cXhBEm0gSlVBF+O0gfNlvQfVFmv8lhyRMDFN3cxjBvZB5zBC6cZIDM5
 Tq6oNMbW1ffZ4erhHkOeOdkEHqC3AJ3roRaUzPPJxj2FP6vvA24kQrZNrgMkzt/0hVyd
 t/YboXjX0e3V1YlTLd9H/QR6lDmPzaZTtp6cDCTQcUyL5jkvzKhktDAePm3bV4aK/PdF
 OriA==
X-Gm-Message-State: ACrzQf2vPMZtOep1TTLW9l6Ap8ygA00DRvxQCah8y6pLB1oPwU0pNzsy
 3iUpyoMB2Wf2MCdcuUI/6hzUjg==
X-Google-Smtp-Source: AMsMyM6rXBf5dSBtE6KbZjYJIklpnVoF0lFaWcJ+UxlaaOEaSX0U5zNStWf6owlccTZvt3BWUBF/DQ==
X-Received: by 2002:a05:6a00:1349:b0:563:654d:ce3f with SMTP id
 k9-20020a056a00134900b00563654dce3fmr745378pfu.32.1666985750923; 
 Fri, 28 Oct 2022 12:35:50 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 ls4-20020a17090b350400b001df264610c4sm13525539pjb.0.2022.10.28.12.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:35:49 -0700 (PDT)
Message-ID: <33814036-bcfb-857b-dac8-ae1b66d6638b@linaro.org>
Date: Sat, 29 Oct 2022 06:35:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/7] target/arm: Allow relevant HCR bits to be written for
 FEAT_EVT
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 00:39, Peter Maydell wrote:
> +    if (cpu_isar_feature(any_half_evt, cpu)) {
> +        valid_mask |= HCR_TICAB | HCR_TOCU | HCR_TID4;
> +    }
> +    if (cpu_isar_feature(any_evt, cpu)) {
> +        valid_mask |= HCR_TTLBIS | HCR_TTLBOS | HCR_TICAB | HCR_TOCU | HCR_TID4;
> +    }

You don't need to set bits twice.  Either

   if (any_evt) {
   } else if (any_half_evt) {
   }

or remove the half bits from the second if.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

