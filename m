Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551A5B694A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:15:47 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY157-0000wf-LZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0tR-00031Y-Gc
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:03:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0tP-0008G6-Ud
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:03:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso8940318wmr.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NRKOVGVZhvnD/0zqzBarvNlDs28XMqSbMS42rOayAu4=;
 b=pqhf8Ttg282Ow+H3nXzZSk/VwZxAjKWmJf6KOtDygC1iX3yRUmrzAEW9YD/Rvas5GI
 +ze9mkmSQdU0aTC9fssgy9hHHDNbnA4JNOdbfMshGDxz8DS2m5stPSdJgJkv8uO/9fcV
 0Z7kGYbuXYpe4mky8fpb0Y0JGWTEqfSrKkGL2TXKYbbNFIMSq/fck941gdElTbsRxsPT
 2ZFTqvMMmciJjb0IkrS1tJ3awpVpNNI6n21NjskCBabG83upsoIJS3YFiiXNmSr+J8hM
 PRZj7wP4to9IO/zdrPlLN+MmjsRfoy9aOcgG77XT2HvrOvssNN0M7NNu4L8YXm2dLd/X
 S1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NRKOVGVZhvnD/0zqzBarvNlDs28XMqSbMS42rOayAu4=;
 b=eyF/Pd9c1702JDjcQVcfSLLW5eq2gOQnPqhQSr3pRLLjWsajPOhxJoSx8fx92KLntf
 oOUnq1q9i0Q7lPHTYWRUQuc57QlCrf7YtLngyUkPX/rzrvpULPjxl4IUuWJVrt6jUjlT
 zP8AY/lZnz3CukYwUKd0u0S/zcxffvQx3C6CeSPykkZKKkubQe79ANvDKcmQTM/v16C9
 Qz8qKx2l7z0Ekb5MZ6lcgcr5Ta9c5nMJmiN1pRL8/T6dgTBRt4gUPurTLT7Y4fyRBI+W
 7mPJs1OfXetWG+i70dGv2yLu96sPrBJlbdppKy3Zd/9HHc5JaSjHs8I0+55tm2qnlhi+
 KaLQ==
X-Gm-Message-State: ACgBeo0kgg/Z76eNfLpuLKxVA1MNbNrpT3yMv+ban5/cu9QuqPdYY4Pn
 iabZ8H/LR1Oo2MbGm1jmTyuKOw==
X-Google-Smtp-Source: AA6agR4J+LmcsFRUIgEi7WMSNvAYR4yBKfv0Wz/ZLYU882BeaWbfPutv2Qe26PWMI+ccKhCrCJvCCw==
X-Received: by 2002:a05:600c:2904:b0:3b4:951f:7303 with SMTP id
 i4-20020a05600c290400b003b4951f7303mr1383089wmd.119.1663056218268; 
 Tue, 13 Sep 2022 01:03:38 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5009000000b00226f39d1a3esm8763585wrt.73.2022.09.13.01.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:03:37 -0700 (PDT)
Message-ID: <210513f4-e5db-e5f9-f8e8-f21308e7764e@linaro.org>
Date: Tue, 13 Sep 2022 09:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 16/24] disas/nanomips: Remove IMMEDIATE functions
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-17-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-17-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
> Both versions of IMMEDIATE functions have been removed.
> 
> Before this patch, we'd been calling img_format twice, the first time
> through the IMMEDIATE to get an appropriate string and the second time
> to print that string. There's no more need for that. Therefore, calls to
> IMMEDIATE are removed, and now we're directly printing the integer
> values instead.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 756 ++++++++++++++++-----------------------------
>   1 file changed, 265 insertions(+), 491 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

