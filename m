Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366476F42DC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoEq-0003e5-MS; Tue, 02 May 2023 07:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptoEo-0003dh-P1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:32:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptoEn-0001dP-7I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:32:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso23517205e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683027123; x=1685619123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2udM7iT2FK/xKY6scpis0aY8W3CKijk9hrNehfmY+b4=;
 b=L9a/845RNZ2P2uXDb8WOfz8tVd6yv5Dm30DdAUrJhu6BHhzKZwvCYG62LOmtItibWF
 RibVP8DTjxxr2aoY8B5atIXi1D0oPmU4DKuJSWlo31xlwYAkD8zPSs+QmVWFbqOyZ9lv
 PWCyPANioCDBO4ur1DWdeYy5Gd1vR2aD6Hu7/COf2H8JsCmo6f19bWbeRekEbpIj8GbI
 cSx3p3VT+XNBECm+4PwGcSNq3ifRze6UAQSYaG3aloHzGmjvb0o0HZz9+LetVQ9wvdhj
 kqIa5GBxMSuw2gW8TQCxhPjGgzMz8DeB1StwP0qrdly+K7TElLCsrBaZ57X/2JZlH77d
 cmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683027123; x=1685619123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2udM7iT2FK/xKY6scpis0aY8W3CKijk9hrNehfmY+b4=;
 b=kd6VKvdLL48KLwtbsz8kMvU1khzOuUxJoX1EOMTP5hcWRj2Gs8A7gjhUYdRY3C0fKZ
 jzAvKbUhFO+DwTpAM92ixnWJW+C2hc1AQnCLvVbbU/K1ZSFVKQBoRLMUb6IEAnpkY/o0
 c3T9qrFep/eJLysyrDu49e59gsZMC8t/gjZDr77X9Fea2wMoppANd3m5DzA5kb2jhW+k
 Tozkfm1S8S1wg7qr7wRVvJ+10HpJu7nZry5bWZM2LIId1+dp3O5R9Yuqq5BGG7Ftyjkk
 rRMu1tRM36V6z8jkUYSQfA+80iO10a2VCr+R/jDEysHsByJJRiC72/Fiv29moSZWrkQk
 N/Bw==
X-Gm-Message-State: AC+VfDyN3PMdZcFPL6IqyiGN6/bdn1iMbGoTrTDdSAtD1Ye1cHEqkyk5
 3tP5wo5l+JXBuSHWrfj1Ds2NBg==
X-Google-Smtp-Source: ACHHUZ5pkhxlg/Qm4klnh5IieNsEmho/mBWndSGXjRzounKuhmZ0DSuLs/MARrcYAWz28eLgK7S+sg==
X-Received: by 2002:a05:6000:136f:b0:2f0:e287:1fbc with SMTP id
 q15-20020a056000136f00b002f0e2871fbcmr12300259wrz.11.1683027123438; 
 Tue, 02 May 2023 04:32:03 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfee81000000b002ca864b807csm31087589wro.0.2023.05.02.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:32:03 -0700 (PDT)
Message-ID: <b06d5e5f-468e-f923-2184-b3776d3892be@linaro.org>
Date: Tue, 2 May 2023 12:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 6/9] target/loongarch: Implement kvm_arch_init_vcpu
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-7-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-7-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/27/23 08:26, Tianrui Zhao wrote:
> +static void kvm_loongarch_vm_stage_change(void *opaque, bool running,

Typo:                           state

> +    uint64_t counter_value;

I know naming is hard, but this is so generic it is difficult to determine what it does. 
Perhaps kvm_state_counter?  A comment would also be helpful, even with a renaming.


r~

