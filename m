Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC074D21BA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:37:54 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfeb-0000Jd-7l
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfbg-0006PF-Pc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:34:52 -0500
Received: from [2607:f8b0:4864:20::52f] (port=36652
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfbf-0006kz-CO
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:34:52 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t14so29492pgr.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fANlWj/7rRhyU6UOQJzy6TpoM9fV5yllIVTZcI4Oo7k=;
 b=A0/SyJPae7pqZkuTgX3EmLI49jj1nQ6eqSRPNszaPawn+00CmGtqg0H28rXJJLPhTp
 fzDm3K+cu/LNnlfbUGPrRa6woDl4ghmpkH+sf+72gTmAKU6kB6XD34zlCXPCJnBclN+c
 bSLKfo0mDS3cqyiPSYdsugthGGJFPBAu9HnR0etsKWtAWUNQC3JYedfiyngC2SjJBj8G
 ec5D5kJkIBo6DJ2gFz4q8Pe7FQFX7vflKnoteTwUxCeRspADCftsVKQbOTsZHeNm8wbm
 9tViOCekWhIqJ+pCE6ESNq9xVbUZjeO7XxqLcVLimRyk/YY88IGCp8PT5mFE13KNInYJ
 snCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fANlWj/7rRhyU6UOQJzy6TpoM9fV5yllIVTZcI4Oo7k=;
 b=aGVC41z0iHDtHy5dUxe71t0vQAlhaGptiYugaRKGbVnl0ZR4UwNR81GAjy/CogBMmH
 FAO3L42p+MLq4HiIrNGmqUVxlanTxycTym6W+k6x8GdbJP6QKNCgUqpDz61gVgvIWDDQ
 Z8OfvHnVMQ80UFlnNtblj+OiKAiYZU1u4i74Mre6mhFT23WSVYk2DQC5woanNMHJzt6s
 C81tYedvFk26D/7hOI7qPe7nHM/uDgn8uJDFRbv5/+W3TUJ+W4+SsZMQcqLkA3ojyUtr
 JaE/wQfgljF3ON4EISOGiBxjWIPhRBDDgS5edXGMcmnIk6WPzXs541qBQF/oHIDPEGm0
 LPGg==
X-Gm-Message-State: AOAM5328Nx8NODTVoxuVGrNArDIuV/6ILcYG/7SngskwyXDlEjIk8wtN
 WyGWmmfeCX3ACIAYyuB1BWm9UBqMNTJkaQ==
X-Google-Smtp-Source: ABdhPJwA25OSNQUVMRbmwyHs9ltIdEsm9frHmwmOxxiW0Q6yQdRXUXir+xd0G+prsDZXSt6EZFk8tA==
X-Received: by 2002:aa7:8432:0:b0:4f6:6dcd:4f19 with SMTP id
 q18-20020aa78432000000b004f66dcd4f19mr19885651pfn.53.1646768090047; 
 Tue, 08 Mar 2022 11:34:50 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f140564a00sm21952885pfc.203.2022.03.08.11.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:34:49 -0800 (PST)
Message-ID: <3888b768-c922-a495-8fd1-4d98282079f5@linaro.org>
Date: Tue, 8 Mar 2022 09:34:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/33] target/nios2: Use hw/registerfields.h for
 CR_STATUS fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-12-richard.henderson@linaro.org>
 <CAFEAcA_f0PWGrxGBMSK-jr9MTCk7D1OM5XJ=zYy8eB1HyZitWQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_f0PWGrxGBMSK-jr9MTCk7D1OM5XJ=zYy8eB1HyZitWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 00:08, Peter Maydell wrote:
>> +#define CR_STATUS_RSIE (1u << R_CR_STATUS_RSIE_SHIFT)
> 
> Since these are all 1 bit fields you can use
> #define CR_STATUS_PIE R_CR_STATUS_PIE_MASK
> etc rather than manually shifting by the shift count.

Quite right, thanks.

r~


