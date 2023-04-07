Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137F6DB6F3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvEc-0000SW-78; Fri, 07 Apr 2023 19:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvEZ-0000SA-Nf
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:11:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvEW-0002Fu-2m
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:11:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so100506pjb.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680909062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8sjrQkKmFa0fDEbK0ByEbj8xRVyyoXwt3mONWUrCjg=;
 b=fu0fc9kQ3M2sfVtK3t68zTbYFucNlj5oFSUSteqUYRu6VDv3uTItwTOkzCaPFNHOei
 Df/jKMmHFnnEBVa21r/eZ50XSQaDi0Hdouvc5bo4bnXn3NaTSvMg4uk2qfa5HE0KEHPK
 G/hnmvZSmlnUfmxSrzAzCG2somHL6hF+eFvhEfvqMO4TRTM4MdDjEbP4M3dgQLLmAJUt
 NQ70V3GEiNeBy6LgXX+ZifscCDpUsnjTSs3RYovPOLuMKgkROChad5HQjq9TyjzVOy/W
 ikj4D19qkBrRoB4IJxSKljZsM9kEwp6vq/D91lh+Kurhgan8M73NHLiK5l1wy/jRVm4c
 8CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8sjrQkKmFa0fDEbK0ByEbj8xRVyyoXwt3mONWUrCjg=;
 b=BWZK7BfaWbrBlwRNLXkyt/V2I2MqtjhnMYvfWJ/f36rjOtbkGPtuz/MFCadH2hzF0s
 40aCxQpPmBp1+x46WU8Wo3/6I2QBglyIOdtjCtNL3vh6SpWEP7wNO5inx8sLRGYP4tX9
 MGH4Js6c20grKGw/rrlZwVaLyDEtgqC9xesKRtp/3Rucf2myPX1yE2spVWR4sTEZ0ng6
 70Hd+ABTBryW7pOOUzhwVBNClGJuHTc8XWgF2AE95RVFV8VtJ3MZGyJrRXXBbhhv+/gI
 MFIUAUnlCrooJaG9OlkYM63vWgE1x7wTFrpmgv07ggNHpUhrSeErWlQcnk7zxI1LXrps
 Takw==
X-Gm-Message-State: AAQBX9eHP9y1P6wyLQLuqDJmqD2blJw17vcUHcqO7sSu0V3gVL5pCwLZ
 vKe9HODWhL6gZliffNkhlh/U9w==
X-Google-Smtp-Source: AKy350Z01RjDdvFrn3SDcNSR06u3kONrO463lNJW2mYVi5QEQlyqB2hcRXm9iVwIpLBrSzeEsGCq9A==
X-Received: by 2002:a17:903:3093:b0:1a2:ca:c6cd with SMTP id
 u19-20020a170903309300b001a200cac6cdmr3648934plc.43.1680909062629; 
 Fri, 07 Apr 2023 16:11:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 ik23-20020a170902ab1700b001967580f60fsm3360481plb.260.2023.04.07.16.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:11:02 -0700 (PDT)
Message-ID: <e37bd0f9-b577-dbf4-6d34-a17a9d5cfbaf@linaro.org>
Date: Fri, 7 Apr 2023 16:11:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/14] accel: Rename NVMM struct qemu_vcpu -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> -    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
> +    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);

With the typedef in hw/core/cpu.h, you can drop the 'struct' at the same time.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -    qcpu = g_try_malloc0(sizeof(*qcpu));
> +    qcpu = g_try_new0(struct AccelvCPUState, 1);

Another 'try' to clean up.  :-)


r~

