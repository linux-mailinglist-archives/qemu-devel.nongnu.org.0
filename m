Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D168F838
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:42:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqJS-0004mt-Kp; Wed, 08 Feb 2023 14:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqJP-0004l7-Ar
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:40:59 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqJN-0000JR-8l
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:40:58 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ki19-20020a17090ae91300b00232cba666bbso95505pjb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+HydBTkVjQBP/MhnWGNKafU+luccwAnnRnDRB51cXtI=;
 b=x/E1LuheJG0m4syI2oFv+IqGby2ovxKVUW9IgEwaO3T9p+NhmaWCC6qyNDIiozqdWX
 i3b2UJMWjHouN0wa1AriMlFa71kCDE57hVlXAJDGXCwg8hROEiLyNjvMyb7SdyMC+E7x
 XkZJYdmcLwJ4WI4JmTS+rzKPox95OR54auN+KRs8DkdqHChqXFZl1RiT0gZFPh0dRdkW
 T6TTJOnHf8/MM/m1zrghKCXwnVfUzL+cNqxZlRcN7Y71IbZux7Vy0LrafNbNtAHi++Bh
 M/LrpPKL4f2UNLmE2e1pNErYsaJmTXLHLQ/sLIH0nBfBlFfCEfweHr2jcNgg0YH4ByIZ
 SMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+HydBTkVjQBP/MhnWGNKafU+luccwAnnRnDRB51cXtI=;
 b=ftCBpxsBQhFuCPixEU2agPj9jPXWDeXSZ6JJOlCHjBx6uoQ18PQyXYH9PH97QwlJyi
 oDZQrPmazsJ+BksmThISoxCxmGm9IqjKgWjMy+7rZNtXgkh5JC5ogdtKB4UNL2IMOPif
 Fv5cnEGl6MPZNylAuWr2s2IQhnu2XsyTEhfYbADqPwhl9Rj/Bce//Vajqklfks2iTBoi
 C3CNL3BuJkg0RznqsDgIPLdEn2d+odBp35igjd3MqErHeh77QQKh4LPjEI6fZWmmSmiC
 oT48iafYGcfhuSqzRtN1W8UTZx7dPKv7DNIvx0O9E5pT+jAunoZs8jzsCiPLrPAoWbZ9
 QGgA==
X-Gm-Message-State: AO0yUKVHN6MV6O6I3CVaEH8rYw2VSlYdOY9Kf9pLKzI+23bIi5SvASC0
 uSERJnRaRT2dQdQ2EWnXfarF9Q==
X-Google-Smtp-Source: AK7set9eP0ZEnRGCKWneJ8zxv0AXCCIQLo+WYs9AqHOyWWL5eXvfuMT8uKvkPPxW3gUKfnh0flhMyA==
X-Received: by 2002:a17:902:ec90:b0:198:dae9:5f58 with SMTP id
 x16-20020a170902ec9000b00198dae95f58mr3297274plg.14.1675885255458; 
 Wed, 08 Feb 2023 11:40:55 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c24d00b00198e12c499dsm11200929plg.282.2023.02.08.11.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:40:54 -0800 (PST)
Message-ID: <e920cb2c-837c-67a8-a843-bcdafa2b14c1@linaro.org>
Date: Wed, 8 Feb 2023 09:40:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] hw/ide/piix: Remove dead code in pci_piix_init_ports()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230208000743.79415-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
> pci_piix_init_ports() always return '0' so can't fail.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/piix.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


