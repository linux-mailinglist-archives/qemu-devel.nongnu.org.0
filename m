Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903406B50FE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiVB-0006ar-GQ; Fri, 10 Mar 2023 14:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiV9-0006UR-8h
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:03 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiV7-0000fb-HP
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:02 -0500
Received: by mail-pg1-x52c.google.com with SMTP id q189so3674972pga.9
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y96SmPhO7LauU3S3N9B7Gu9lgFOMNBASDhPfhz/P0+Q=;
 b=SlAnmSqQEeGTBOdxjSIa8tAkKGOE0Q9uRwhHoeXSyLD9CpT5dbFwOIaE4gh1Thw+p9
 gVJuZ1PzJHqYrozt2/QEguhpip8PwcxoOQBxkcN0CQ4MfH+3fgoPz6LS3YEpsvTxZjEd
 o1BOcfEBCrA95Kzl0sNW5iuCPU00D8VutWnUHbTRFokVICYTxdbfbyaHdEjMRqFnI6BA
 xOxMmCtGicP3JtKpSLqBstcIYdUfqQmaNlFNkZH+3VXxd09mqHwTdQTX5exgnqGpGVAZ
 praHZUy5dMnJ77Od47UK9h45xNx3F6L2BTmnGz4o90qXkVJuQLNbs7l+OhZMG0sVmfxl
 ZyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y96SmPhO7LauU3S3N9B7Gu9lgFOMNBASDhPfhz/P0+Q=;
 b=hlpMNlG6/r+aexu+BRM1WSK6Ov0VETq8w/xnH2oV5WAEQ7rmms9jlvdd0MBmA6DwN3
 LwWwjXyFwPhObaxZCtU9tTpQ3tOk3XX6ZM5jLInztKI21OtBeCJjoEbneado03+Mt/w2
 Utt6QjUwarMkvYnZYqHpF87bJ16v4//KM9Is4efjquwvxHdMzvb+NplHqDsmlXZ2UbTS
 Vg3eRDrk+Xbm1rDEeEJE1NgdzndILfB4PNE+iRST0q8v3ov8oxLA74y6YvDNn8JwX9af
 V0QGzLfjgfbemw/Y2c3dvKz9xzxnWv2im3chLd23jvBUrBSOAFL/fzD/wpZSTto9vj0L
 HQ6A==
X-Gm-Message-State: AO0yUKVKybBS1YO7s/f+Xk0Oy0IUAu4abZEoNqnGk6FnxsCYdbxd8QGw
 0IdgZvV63Z35iw0ICR7IrB01FQ==
X-Google-Smtp-Source: AK7set/Jbm+v/CxvMuZ0tiODW2VCx9QJfiW6X7Lh0207IXsOig15rW/x2U16ohG8Oq1YALBY71MFqA==
X-Received: by 2002:a62:1e05:0:b0:5a0:c4b6:edd6 with SMTP id
 e5-20020a621e05000000b005a0c4b6edd6mr22588497pfe.0.1678476839978; 
 Fri, 10 Mar 2023 11:33:59 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 v24-20020aa78098000000b005a8b4dcd213sm178497pff.78.2023.03.10.11.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:33:59 -0800 (PST)
Message-ID: <d3158bb2-7aea-f332-6e7e-644c9eb64c0a@linaro.org>
Date: Fri, 10 Mar 2023 11:33:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/12] target/s390x: Handle STRL to non-aligned addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-10-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-10-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 12 ++++++------
>   target/s390x/tcg/translate.c     |  3 ++-
>   2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

