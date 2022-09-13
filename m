Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67225B6989
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:27:05 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY1G4-0000bs-Fv
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY16p-0002ZL-HD
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:17:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY16n-0001vz-Pj
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:17:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bq9so19500271wrb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=o8heCAAGFmngXAFNEm2Vq565UFQF73sCaIrrE6hijIg=;
 b=hOYofjRq3qHKc2VsJOIOS4x3xrouQLXfG+d33JL+qQSZZeNWdFpvAKQtotTrkrL8n7
 2oL6SqDkvx9NU0zqPNP4lc30jhYTeqFeQisA2gbul3QPztw4tRFqH3CfjWJtC1NCzSer
 J9k5PA2A+CzFViW8sj4IkYQnZ3AhEHNOsSlep23N3UKmLWgNaIuoHM3AkO+aCF0Pf3Oc
 5RP1SRr5KiA44grxfWttBLcJlReacSIjm6Dt7TnluvggWveAY3TdrigUW11IrZvnxxj0
 DerkmiTurIyX8srUSV5WAdMY8pLT2dtDBAwGXqmVBgumoEpjIdK6QF4yYg3OFNHjK5SB
 FN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=o8heCAAGFmngXAFNEm2Vq565UFQF73sCaIrrE6hijIg=;
 b=TMtTGKOBvrQ0W6NaeaUXP4YMXw7nH0X/5M7SeItYMjf7pqKQsi+XDlFvybZLzprajJ
 u0a8W2NEAscsgzD98ePA1F0pkiV8E3W/hMmf6/OEfRcd3+AGBMxyBEV/W+CO1hORk7D6
 HbSP7D463cZfi70bnkRfsUozC6SF1lAIDAeb2bzANncDdFnpB+CRGMq9wMzU2sjLQ1Bp
 74r0XhGFzmmc5ZMFe4t0hvCH4R/wmoakDWypjdNupLsumdDLS/DYB2sZmVNUr78G1H35
 SQF32y0Zdwczw7QUtWRMvs5k9v5UT5tY2OXgPWZh6GZEnlZBhTdbpHx24n2Nz3KV+EUn
 H2aA==
X-Gm-Message-State: ACgBeo0US5TlsaAdYWY2a6kNRTZvi4+76k6oJcm97lMVhYlve5MG7MWN
 +9iRRQWiONCgmA/1R1BjfCDjXQ==
X-Google-Smtp-Source: AA6agR5Ud+ErlfZwMz68j3qn8UGRDWz+P+2tqFmaxWyce0UkbmMQlVLdE1SV/nxHBiofzeZBQV9agg==
X-Received: by 2002:a5d:64ab:0:b0:226:d997:ad5c with SMTP id
 m11-20020a5d64ab000000b00226d997ad5cmr16852419wrp.602.1663057048111; 
 Tue, 13 Sep 2022 01:17:28 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600010ca00b00224f7c1328dsm9628431wrx.67.2022.09.13.01.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:17:27 -0700 (PDT)
Message-ID: <f7c21765-083c-4548-6d82-4fb855cd0f22@linaro.org>
Date: Tue, 13 Sep 2022 09:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 24/24] disas/nanomips: Rename nanomips.cpp to nanomips.c
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-25-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-25-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> Now that everything has been converted to C code the nanomips.cpp file
> has been renamed. Therefore, meson.build file is also changed.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/meson.build                  | 2 +-
>   disas/{nanomips.cpp => nanomips.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename disas/{nanomips.cpp => nanomips.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

