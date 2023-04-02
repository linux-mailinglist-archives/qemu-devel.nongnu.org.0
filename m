Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9096D3565
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 05:34:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pioTu-0000Zs-Mb; Sat, 01 Apr 2023 23:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioTt-0000Zj-6V
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:34:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioTr-0000qn-OG
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:34:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso11542446pjf.0
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 20:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680406450;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5BfKGKMjVQPevJDjca6lHCuHc4hwZXRrzlsCgCxn7w4=;
 b=C24stcYAsKZl3sNafWISoD13XD3XxbX9IXcQDpB/89paj3pQMKmHOd5eXg5g7Mse4s
 ttI9BiKD8TjLqCX079mmA/cem6uJ9Efd4OOmkLDvWLOiwT/qNpP80ldUzOuGc9Zz0EU6
 hIiHyN/Wvemm+Ollsucw2Sh/dlaygZW9tJiMD+0x1bPVuqTCtj3goLV1+F43OI1EQl9F
 VfIM4vUl8pFp3i1I0ZDrD93PN2Bs863J0YR8qdL23M2/KOJ2/eZf9UD9R/g37ckjPJDN
 lgOF1AhFog0zgEyVnJSzquNTY9/9h94woOGELFIuskGULFpijCyAG124hhC8FE7d8DC6
 lifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680406450;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BfKGKMjVQPevJDjca6lHCuHc4hwZXRrzlsCgCxn7w4=;
 b=DqMBiQFe460FfDc0uY+Yq1+yDq+u6nUREe4jYYfNtB2l0EHkPK3TgyTVxs5I05dVij
 aep0pTeR/zbxjRPPGEjtBrvpVSeU34OcBYyxtB7Khw8X99s+OJSwBLg/K38cM+tZm8Cl
 wAvoREr7aNdDWhjRw4j/kPrcpEo3Ktfqa9a3nfRkAVsSAGSxwL/8zUMZnNRAaV7NoOeU
 wB4EoMt5E1IOaNIYNQcSmIPBbGtmzNOOcIxMbSNILXzFAxc47845Ymy11jJY3XqXz2eA
 OTIGFieOhj7RE4R3tXNvnAc4M7S6L60xmT5f+MbIdM3DWpv/Z+J+jnTKLpLS2eoVvEeC
 2ELg==
X-Gm-Message-State: AAQBX9eUZL8uzyIQ9t/AvYFrNdv2ctfh4qGxE3jUCtxoKuziOi9Ix5re
 hYTSo3QYBaZNugFO7kIwR2w82w==
X-Google-Smtp-Source: AKy350ZRhSoFslYXhwyYWYqMSBD/M9aUcOM+gSGrhL/eRk8WCxm0sPDov5Y+yNAmaduRq6D2aT5AFQ==
X-Received: by 2002:a17:903:120a:b0:1a2:9dd0:1f74 with SMTP id
 l10-20020a170903120a00b001a29dd01f74mr9403554plh.54.1680406450134; 
 Sat, 01 Apr 2023 20:34:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c08400b001a06eb43880sm4058338pld.153.2023.04.01.20.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 20:34:09 -0700 (PDT)
Message-ID: <d81762ea-f939-ac48-018c-826c581e5fad@linaro.org>
Date: Sat, 1 Apr 2023 20:34:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 30/44] target/loongarch: Implement vclo vclz
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-31-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-31-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> +#define DO_CLO_B(N)  (clz32((uint8_t)~N) - 24)
> +#define DO_CLO_H(N)  (clz32((uint16_t)~N) - 16)

I think this is wrong.  You *want* the high bits to be set, so that they are ones, and 
included in the count, which you then subtract off.  You want the "real" count to start 
after the 24th leading 1.


r~

