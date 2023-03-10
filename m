Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2536B50F7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiUE-0004be-P2; Fri, 10 Mar 2023 14:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiU8-0004aL-Kl
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:33:00 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiU7-0000Oi-5R
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:33:00 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a9so6722106plh.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pWq1v1CmlwVBDrl3DlvCR6F2tnxrPObyCplqKZLA1P4=;
 b=iWN/kXHNRvSvBG2pqU/baq/i0WkfUhUSmu+2hAu4oTVbGyl6JuWa/vB1e1kMN9Aj2c
 tlRzJpe7wisUH5dOv5O3gamUaCqYW5oZGJRqPiRcJsav1u5cuWoathkshpboQ8E2NcUO
 ESwtRrjwcWCRgcTd5BxWF8NpfSnBSh2tZqehte8FUssvGzbbJB2tKkoi/j4Ks+3rXT1Y
 dcwuvbUcUhHSD1w7h4hLVKhZ0OUy3XCAxykk/HPssJH8qIxF04bMyn9vJWf8AagONpr6
 /qfox6h2msyImR3ki0ap3lCeZz4Xgbq45pwTVGI+ah6EHkt4BS6t0xkELn6jG/4Xj+N5
 5nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pWq1v1CmlwVBDrl3DlvCR6F2tnxrPObyCplqKZLA1P4=;
 b=iIQvRufF3mBZF/BSmlVcFBAUr1yobE63h4kIrSzFMIIbC6et3PY25R2EP0wfduHstS
 RERvghY7PcxdxK8dfcNwHiB/496fgwOrJErV7oSBlrROo6TvWB8GD93RYSpIFiYA7F31
 EzMCFXLQIS7z7VlEfXIi0x1BKbOnTJa9zN1s6fNA4i4X3csCItsEUpmHIH7F2mRUDvlS
 X3xYaEEbAqmG7g/5LuW3YeSaIjSEjAQcqx1PB0TsV8T9Ped7AG8m9FWiXZPdipDN84dK
 YvmIRy5n6X1qsOulUkt6sCYXAuyOOrGLQeeKbsMRJjFKxklhQSCyckv+uU16C6B6KUbZ
 09Tw==
X-Gm-Message-State: AO0yUKVcTluGU3/S9p0mE7w4OwhlX4eBtqbkys1Tj1VrDjCA8F3TY1w3
 9BXgVX24FZiN2sSmRElVupyEpA==
X-Google-Smtp-Source: AK7set+dAsfhoVWUv+VQepz6zR/i2TE2CxDrAiAjSdIfpnCJfv5b4pBjKaxYeSOYHUvQQNPpdt1gaA==
X-Received: by 2002:a17:90b:4f4a:b0:237:1f17:6842 with SMTP id
 pj10-20020a17090b4f4a00b002371f176842mr27986936pjb.10.1678476777362; 
 Fri, 10 Mar 2023 11:32:57 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090add8200b00233b18e6fb3sm325201pjv.1.2023.03.10.11.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:32:56 -0800 (PST)
Message-ID: <118d4469-ced6-c129-2d5f-3a8cb77b574d@linaro.org>
Date: Fri, 10 Mar 2023 11:32:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/12] target/s390x: Handle CGRL and CLGRL with
 non-aligned addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-8-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-8-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_8 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/translate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

