Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEE348475
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:19:38 +0100 (CET)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBqi-0006zr-Rg
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBpF-0006OQ-NV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:18:05 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBpE-0001ri-23
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:18:05 -0400
Received: by mail-oi1-x236.google.com with SMTP id d12so47292oiw.12
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o4a9ygKxT9TDars5VPHDBOtSaV3BQ+nY8mMbftjyttA=;
 b=sBTQSyaSoRzbZEjcFQxAsyM2cv/xoM4c75XYUEFFVsowt5z0Kw20o8snKdb99a4i4/
 OSg9np/BYn2KeFk1Cqkt9RJ/nkiLE66Aj5guuWVDmHNevW4f47/xjrmPqwrlUJ/UByJG
 xgCWswofFh2/gn8wNrgTfkJ2PxXj+XTc8JFPACucy9VwQCNtmvaeqy40sbSOQ8oGZTCf
 mp3L26hO7fjtxy+2rLMbEteQsETxtXZFf7urIVEEuKXC17r7WdCmObPRGpeQ3ZM+XRzn
 iGkhSN95flfJ8u1ti+eiWuwzC8FuiVj3bXXcjX9Q4wORE7kFjHRHRR79y0MTpCRVMQx1
 31hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o4a9ygKxT9TDars5VPHDBOtSaV3BQ+nY8mMbftjyttA=;
 b=WZrNEI9lmbIG5Sbx1OjnjYoH9ApqArnLg1RYbjxZ1UDa6Hg+ytvTp/rU1wQ3y5czDH
 7wvRQLHpZXCttbiu81bkyQMmh5i2q41G2kPwukG68boOa6q7E6QUY8oP38AMF1brQ/hp
 fAlVzcEXtg8zsGF3HoJMWF8qRrfFzKdv3RxWlyj0dhvAwwA+nNY2d6ea45XxVupy3XBS
 hSDFoSKpqkaATbNJoZ4BLd3P+AGq8Ks3Jn+DXDX+YdB9RW5hC/y+K5tRGPYKP3hqK4TN
 tmw1z7XIdotC/GKZ84HB3JtkMcZ8pcJAD1anHcnb8yVXYVDPdn6ES3o1e3dW/pXfE++W
 8BAA==
X-Gm-Message-State: AOAM532gTLgf5zWd8ufT/Q1KoEy35lEbKXZ0lBHN3oAnLeWI5AG6E72n
 0sKov3a+LYXsFROu7sjXjtoX7A==
X-Google-Smtp-Source: ABdhPJytdlCT0p761wHkJ1D5XlVRAVSV4kYmwuhRXSpStTzVDwqZGLQQ904/SuBIJc0xbX3urnYrqg==
X-Received: by 2002:aca:7543:: with SMTP id q64mr3875853oic.100.1616624282719; 
 Wed, 24 Mar 2021 15:18:02 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c26sm835335otm.51.2021.03.24.15.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:18:02 -0700 (PDT)
Subject: Re: [RFC v11 26/55] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-19-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49cc1fe8-b990-e11f-8bf9-479ac9e25b57@linaro.org>
Date: Wed, 24 Mar 2021 16:17:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-19-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> -static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    int i;
> -
> -    if (is_a64(env)) {
> -        aarch64_cpu_dump_state(cs, f, flags);
> -        return;
> -    }

You've lost this bit.

Somewhere there needs to be a check of the current cpu state, and one of the 
two functions must be called.


> @@ -823,6 +951,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_num_core_regs = 34;
>      cc->gdb_core_xml_file = "aarch64-core.xml";
>      cc->gdb_arch_name = aarch64_gdb_arch_name;
> +    cc->dump_state = aarch64_cpu_dump_state;

I suggest this continue to set arm_cpu_dump_state, like so,

static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
{
     if (is_a64(env)) {
         aarch64_cpu_dump_state(cs, f, flags);
     } else {
         aarch32_cpu_dump_state(cs, f, flags);
     }
}


r~

