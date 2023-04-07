Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1496DB6E9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:09:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvD9-0008C8-3c; Fri, 07 Apr 2023 19:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvD6-0008Bx-WE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:09:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvD5-00012D-Hp
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:09:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-517bd9b1589so21405a12.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XvSIGGl7kyzrRPKD+1h4YAIP7+IU0OISKySWyKHO+jg=;
 b=iv6gr2hKVqwKYI+iTQN+8od7y6Vm/m73ky9/2diyxBhZPqEorU219WD2XJzyvYDYRT
 EQnhzs/V9uvYpJLy4VBiCLJDPSSyy/mk7kdUnBMVS5pdIZkqIfGf52EThRLsFjAEdEsI
 75R64mVKrvYX9fSs1K2fFq6b2G/rdvEnYm5oV115etWVrXcUd06SIATm2soLvb5zJ2rS
 aLj36ZCRtc9CMFkr4v9c3m54c5MWwJYwceHUVQL+Hc3QAWiaTznLDbwG3uZRQ1o+xHSV
 QewZOhFy9l4j9VEGUvSVoAuQtIMQ9HwTJxUwxMmvV2wdOiXGWIwjq9EvrUIb00tY50Wg
 1WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XvSIGGl7kyzrRPKD+1h4YAIP7+IU0OISKySWyKHO+jg=;
 b=ZVFHjxGawgjay2z6QubOam5nAoIlRuAkpPMDI57dDsI3dtWxkzuckL0F12k09JCm8q
 lErNtJmzaErPSscFSPmgppbT1AHn7hqmGHKAIHLBst4nKLgz1aFqcsJ0kaf8Dwj3sUUx
 izPdIt0a78zBS7SilR2NdiLbaeOzQUcp3zvAdXbIpgQpPQXVsvrtpG8voHD2a+Fm/fO6
 nbdqAptc/3PKkH9s8eou3Zc4oSf5ukUb5vEuLTS7gT8UbaNOX1SqauyZt2NEI3iveuJN
 11NQOaTT8RxsuuWpqCuthqzCkQWkbEV/gLxnfPuZ2NkhfjaAcqrSCd5z+PCvcGIA4FCN
 K2qA==
X-Gm-Message-State: AAQBX9dQClTKtnpx56kVeo1SEABloqEDvk8/XIjSaQpzZR/J2Gr40UwV
 tUDn0Rfh/qQL/bh1Ukvug3iByQ==
X-Google-Smtp-Source: AKy350Yqp9FrNOy78lp7BrA74JA2K1IJ9euoV6m53eCZnb3f4VQZGuFjTlRtLSsG6RBgf5M2spk2Qw==
X-Received: by 2002:aa7:8bd1:0:b0:62a:9d6f:98dc with SMTP id
 s17-20020aa78bd1000000b0062a9d6f98dcmr3877311pfd.11.1680908974132; 
 Fri, 07 Apr 2023 16:09:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 f3-20020aa78b03000000b005aa60d8545esm3564626pfd.61.2023.04.07.16.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:09:33 -0700 (PDT)
Message-ID: <48b9e338-e20e-95f9-c611-3878b24ccec0@linaro.org>
Date: Fri, 7 Apr 2023 16:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/14] accel: Rename struct hax_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> +struct AccelvCPUState;

Missing typedef?


r~

