Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B296FDB4E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:06:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwggq-0001Et-Ly; Wed, 10 May 2023 06:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwggo-0001Ek-A5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:04:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwggm-00037V-Oa
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:04:54 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso12007775e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683713091; x=1686305091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wfTH8pVSwH8cWRabU/mOSBiFKrwC0kGSb7pkW1gnftY=;
 b=vDBILHozDud4Dzf4ddcFTU7ajJumRNpO32NTakj1mz0DoJtpX8tFQXpekdy2umPsCC
 DDcx51Zbk1+wHkTxo51bpOF1lFWfQLCxxj+xR84pkqJk5eEBay0Egqsf00cqExmoJDfq
 JAwX8ZyWO1P6FxffnNExIYaVE5fMwV/iCZPV2xg8tdGnvp58zmQDMUUJyg2f/ifIjYHd
 m4sMSxlKkCr9farpnBd9cM5gCZZERoOgCIJP4mxwn7KaTLJEFdOhOyz7DEjfJrY3EKpp
 z/V7Br3fpoD8J9jHr8P7FSOWxdrtSkONmT2ZNkI7aYLdpri4IupSRqGm8xLeakQ4RVnw
 UjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713091; x=1686305091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wfTH8pVSwH8cWRabU/mOSBiFKrwC0kGSb7pkW1gnftY=;
 b=NfcMDhZU2dTwMFg2z+Vt8E5m6aYCttCzb2P8/SCO+bd6+MFiJzsCo5aiqTLfkLMreR
 daYhwj4I9R3wSHhPxxNbhMf2AfZEAzuuqJspNLJvXQuqJZki1Irn5UahNEnDSEvHw9Zd
 gWNBi7U/q8/Hz77aBOflz8NJnfjDvwazX7EPbHF3SdLJl/lawY7S+ep2XKEg3Qm+xbal
 SdATnq4BQbNdHPPLUsaxIMTgY/C81FUDE+RBX+ZdY30cC+kMI6+cy7o83lCRJC3GAJHy
 UqH9d94CCDgO7FBTnKLKlsz8w0mkME6EglnGZvqHyMLikLo2S96kW6v/cgf3s2btMDm5
 ZgBw==
X-Gm-Message-State: AC+VfDxrsQxjjbP7VoKSP6lv1BwJsBf0CzSYgki8DRWNkY5yXnFwPcbF
 A+N+Zl5xnlmnMVLT6/oDaP7sbFfAOGTnwyWSjox47Q==
X-Google-Smtp-Source: ACHHUZ7wjVPxz6FncUZbA4ElYBoUQNzNvrwLLuc3XzF2hHvVcdri203PKxnPSwWJxj/E0A5Hav+t6A==
X-Received: by 2002:adf:cf0b:0:b0:306:3c04:e4df with SMTP id
 o11-20020adfcf0b000000b003063c04e4dfmr10796557wrj.58.1683713090897; 
 Wed, 10 May 2023 03:04:50 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adfe387000000b003064088a94fsm16756353wrm.16.2023.05.10.03.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:04:50 -0700 (PDT)
Message-ID: <e94c7c48-6bb9-e30d-275f-a5dcbbce8ab2@linaro.org>
Date: Wed, 10 May 2023 11:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 11/12] accel/tcg: Replace target_ulong with vaddr in
 page_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-12-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-12-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:14, Anton Johansson wrote:
> Use vaddr for guest virtual addresses for functions dealing with page
> flags.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/user-exec.c        | 44 +++++++++++++++++-------------------
>   include/exec/cpu-all.h       | 10 ++++----
>   include/exec/translate-all.h |  2 +-
>   3 files changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

